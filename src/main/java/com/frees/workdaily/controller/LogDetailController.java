package com.frees.workdaily.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.frees.workdaily.entity.LogDetail;
import com.frees.workdaily.mapper.LogDetailMapper;
import com.frees.workdaily.response.CommonReturnType;
import com.frees.workdaily.service.ILogDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.frees.workdaily.controller.BaseController;

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
@RequestMapping("/workdaily/log-detail")
public class LogDetailController extends BaseController {

    @Autowired
    private ILogDetailService iLogDetailService;

    @Autowired
    private LogDetailMapper logDetailMapper;

    @PostMapping("add.do")
    public CommonReturnType addLogDetail(LogDetail logDetail){
        boolean save = iLogDetailService.save(logDetail);
        return CommonReturnType.create(null);
    }
    @PostMapping("delete.do")
    public CommonReturnType deleteLogDetail(LogDetail logDetail){
        boolean b = iLogDetailService.removeById(logDetail.getId());
        return CommonReturnType.create(null);
    }

    @PostMapping("update.do")
    public CommonReturnType updteLogDetail(LogDetail logDetail){
        boolean b = iLogDetailService.updateById(logDetail);
        return CommonReturnType.create(null);
    }

    @PostMapping("query.do")
    public CommonReturnType queryLogDetail(LogDetail logDetail){
        QueryWrapper<LogDetail> query = Wrappers.query();
        query.eq("log_id", logDetail.getLogId()).orderByAsc("seq");
        List<LogDetail> list = iLogDetailService.list(query);
        return CommonReturnType.create(list);
    }

    @PostMapping("getMaxSeq.do")
    public CommonReturnType getMaxSeq(LogDetail logDetail){
        Integer maxSeq = logDetailMapper.selectMaxSeq(logDetail.getLogId());
        if (maxSeq == null){
            maxSeq = 1;
        }else {
            maxSeq += 1;
        }
        return CommonReturnType.create(maxSeq);
    }
}
