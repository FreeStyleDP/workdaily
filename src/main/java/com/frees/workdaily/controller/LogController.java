package com.frees.workdaily.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.frees.workdaily.entity.Log;
import com.frees.workdaily.entity.LogDetail;
import com.frees.workdaily.entity.VO.LogVO;
import com.frees.workdaily.mapper.LogMapper;
import com.frees.workdaily.response.CommonReturnType;
import com.frees.workdaily.service.ILogDetailService;
import com.frees.workdaily.service.ILogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author frees
 * @since 2019-08-28
 */
@RestController
@RequestMapping("/workdaily/log")
public class LogController extends BaseController {

    @Autowired
    private ILogService iLogService;

    @Autowired
    private ILogDetailService iLogDetailService;

    @Autowired
    private LogMapper logMapper;

    @PostMapping("add.do")
    public CommonReturnType addLog(Log log){
        log.setDate(LocalDate.now());
        boolean save = iLogService.save(log);
        return CommonReturnType.create(log);
    }

    @PostMapping("delete.do")
    public CommonReturnType deleteLog(Log log){
        // 删除日志
        boolean b = iLogService.removeById(log.getId());

        // 删除日志明细
        QueryWrapper<LogDetail> queryLogDetails = Wrappers.query();
        queryLogDetails.eq("log_id",log.getId());
        List<LogDetail> listLogDetails = iLogDetailService.list(queryLogDetails);
        for (LogDetail listLogDetail : listLogDetails) {
            iLogDetailService.removeById(listLogDetail.getId());
        }

        return CommonReturnType.create(null);
    }

    @PostMapping("update.do")
    public CommonReturnType updateLog(Log log){
        boolean b = iLogService.updateById(log);
        return CommonReturnType.create(null);
    }

    @PostMapping("query.do")
    public CommonReturnType queryLog(Log log){
        System.out.println(log.toString());
        QueryWrapper<Log> query = Wrappers.query();

        if ( StringUtils.isNotEmpty(log.getProjectId())){
            query.eq("project_id",log.getProjectId());
        }
        if (StringUtils.isNotEmpty(log.getLevel())){
            query.eq("level",log.getLevel());
        }
        if (log.getDate() != null){
            query.eq("date",log.getDate());
        }
        if (StringUtils.isNotEmpty(log.getTitle())){
            query.eq("title",log.getTitle());
        }
        if (StringUtils.isNotEmpty(log.getType())){
            query.eq("type",log.getType());
        }
        if (log.getStartTime() != null){
            query.gt("start_time",log.getStartTime());
        }
        if (log.getEndTime() != null){
            query.lt("end_time",log.getEndTime());

        }
        if (StringUtils.isNotEmpty(log.getStatus())){
            query.eq("status",log.getStatus());

        }
        List<Log> list = iLogService.list(query.orderByAsc("level"));
        return CommonReturnType.create(list);

    }

    @PostMapping("workQuery.do")
    public CommonReturnType workQueryLog(Log log){
        QueryWrapper<Log> query = Wrappers.query();
        String time = LocalDate.now().toString(); //可以把日期转换转指定格式的字符串

        query.eq("project_id",log.getProjectId()).and(wq -> wq.apply("date_format(date,'%Y-%m-%d') = '"+time+"'").or().eq("status","2"));
        List<LogVO> list = logMapper.getLogs(query.orderByAsc("level"));
        return CommonReturnType.create(list);

    }
}
