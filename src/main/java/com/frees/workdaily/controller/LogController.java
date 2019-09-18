package com.frees.workdaily.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.frees.workdaily.entity.Log;
import com.frees.workdaily.entity.LogDetail;
import com.frees.workdaily.entity.vo.LogDetailVo;
import com.frees.workdaily.entity.vo.LogVo;
import com.frees.workdaily.error.BusinessException;
import com.frees.workdaily.error.EmBusinessError;
import com.frees.workdaily.mapper.LogDetailMapper;
import com.frees.workdaily.mapper.LogMapper;
import com.frees.workdaily.response.CommonReturnType;
import com.frees.workdaily.service.ILogDetailService;
import com.frees.workdaily.service.ILogService;
import com.frees.workdaily.util.HtmlStyleUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author frees
 * @since 2019-08-28
 */
@RestController
@RequestMapping("/workdaily/log")
public class LogController extends BaseController {

    private static final String GENERATE_FLAG = "GENERATE";

    private static final int HOURS_MIN = 60;
    @Autowired
    private ILogService iLogService;

    @Autowired
    private ILogDetailService iLogDetailService;

    @Autowired
    private LogMapper logMapper;

    @Autowired
    private LogDetailMapper logDetailMapper;

    @Autowired LogDetailController logDetailController;

    @PostMapping("add.do")
    public CommonReturnType addLog(Log log) {
        log.setDate(LocalDate.now());
        boolean save = iLogService.save(log);
        return CommonReturnType.create(log);
    }

    @PostMapping("delete.do")
    public CommonReturnType deleteLog(Log log) {
        // 删除日志
        boolean b = iLogService.removeById(log.getId());

        // 删除日志明细
        QueryWrapper<LogDetail> queryLogDetails = Wrappers.query();
        queryLogDetails.eq("log_id", log.getId());
        List<LogDetail> listLogDetails = iLogDetailService.list(queryLogDetails);
        for (LogDetail listLogDetail : listLogDetails) {
            iLogDetailService.removeById(listLogDetail.getId());
        }

        return CommonReturnType.create(null);
    }

    @PostMapping("update.do")
    public CommonReturnType updateLog(Log log) {
        boolean b = iLogService.updateById(log);
        return CommonReturnType.create(null);
    }

    @PostMapping("query.do")
    public CommonReturnType queryLog(Log log) {
        QueryWrapper<Log> query = Wrappers.query();

        if (StringUtils.isNotEmpty(log.getProjectId())) {
            query.eq("project_id", log.getProjectId());
        }
        if (StringUtils.isNotEmpty(log.getLevel())) {
            query.eq("level", log.getLevel());
        }
        if (log.getDate() != null) {
            query.eq("date", log.getDate());
        }
        if (StringUtils.isNotEmpty(log.getTitle())) {
            query.eq("title", log.getTitle());
        }
        if (StringUtils.isNotEmpty(log.getType())) {
            query.eq("type", log.getType());
        }
        if (log.getStartTime() != null) {
            query.gt("start_time", log.getStartTime());
        }
        if (log.getEndTime() != null) {
            query.lt("end_time", log.getEndTime());

        }
        if (StringUtils.isNotEmpty(log.getStatus())) {
            query.eq("status", log.getStatus());

        }
        List<LogVo> list = logMapper.getLogs(query.orderByAsc("level").orderByAsc("date"));
        return CommonReturnType.create(list);

    }

    @PostMapping("workQuery.do")
    public CommonReturnType workQueryLog(Log log) {
        QueryWrapper<Log> query = Wrappers.query();

        if (StringUtils.isNotEmpty(log.getProjectId())) {
            query.eq("project_id", log.getProjectId());
        }

        LocalDateTime now = LocalDateTime.now();
        LocalDateTime begin = LocalDateTime.of(now.getYear(), now.getMonth(), now.getDayOfMonth(), 0, 0);

        query.and(wq -> wq.between("end_time", begin, begin.plusDays(1)).or().eq("status", "2"));
        List<LogVo> list = logMapper.getLogs(query.orderByAsc("level").orderByAsc("date"));
        return CommonReturnType.create(list);

    }

    @PostMapping("/summaryDay.do")
    public CommonReturnType summaryDay() {
        QueryWrapper<LogDetailVo> query = Wrappers.query();

        LocalDateTime now = LocalDateTime.now();
        LocalDateTime begin = LocalDateTime.of(now.getYear(), now.getMonth(), now.getDayOfMonth(), 0, 0);

        // 当天 最后处理,完成的,按完成项目id、时间排序
        query.ne("log.type", "7").and(wq1 -> wq1
            .and(wq -> wq.between("log.end_time", begin, begin.plusDays(1)).eq("log.status", "1"))
            .or(wq -> wq.between("log_detail.end_time", begin, begin.plusDays(1)).eq("log_detail.status", "1"))
        )
            .orderByAsc("log.id");
        List<LogDetailVo> logs = logMapper.getSummaryDayInfo(query);

        QueryWrapper<Log> query1 = Wrappers.query();
        query1.eq("type", "7").eq("date", LocalDate.now());
        List<Log> logs1 = logMapper.selectList(query1);
        Log log = new Log();
        if (logs1.size() > 1) {
            throw new BusinessException(EmBusinessError.RESULT_ERR, "当日已存在多条日结记录，当前只能处理已存在单条当日日结记录情况");
        } else if (logs1.size() == 1) {
            // 修改原有记录
            log = logs1.get(0);

            // 删除 log_detail 自动生成的项目，自动生成的条目，在对应的备注中，以“<u>GENERATE</u>”方式开始
            QueryWrapper<LogDetail> query2 = Wrappers.query();
            query2.eq("log_id", log.getId()).likeRight("remark", HtmlStyleUtil.underline(GENERATE_FLAG));
            int delete = logDetailMapper.delete(query2);
        } else {
            // 新建日结
            log.setDate(LocalDate.now());
            // 公共项目
            log.setProjectId("3ba0013d293f05f70c684ef53d73d303");
            log.setTitle(LocalDate.now().toString() + "日结");
            // 都不
            log.setLevel("4");
            // 完成
            log.setStatus("1");
            // 日结
            log.setType("7");
            boolean save = iLogService.save(log);
        }

        // 添加明细
        String lastLogId = null;
        StringBuilder content = new StringBuilder("");
        LogDetail logDetail = null;
        for (LogDetailVo logDetailVo : logs) {
            if (!Objects.equals(lastLogId, logDetailVo.getLogId())) {
                if (logDetail != null) {
                    logDetail.setContent(content.toString());
                    logDetailMapper.insert(logDetail);
                }
                content = new StringBuilder(HtmlStyleUtil.overstriking(logDetailVo.getLogTitle()));
                content.append(" - ").append(showTime(logDetailVo.getLogUseTime()));

                logDetail = new LogDetail();
            }

            logDetail.setRemark(HtmlStyleUtil.underline(GENERATE_FLAG));
            logDetail.setLogId(log.getId());
            logDetail.setStatus("1");
            Integer maxSeq = logDetailMapper.selectMaxSeq(logDetail.getLogId());
            if (maxSeq == null) {
                maxSeq = 1;
            } else {
                maxSeq += 1;
            }
            logDetail.setSeq(maxSeq);
            content.append(HtmlStyleUtil.BR).append(HtmlStyleUtil.BLANK).append(HtmlStyleUtil.BLANK)
                .append(HtmlStyleUtil.underline(logDetailVo.getLogDetailContent())).append(" - ")
                .append(showTime(logDetailVo.getLogDetailUseTime()));

            lastLogId = logDetailVo.getLogId();
        }
        if (logDetail != null) {
            logDetail.setContent(content.toString());
            logDetailMapper.insert(logDetail);
        }

        return CommonReturnType.create(null);
    }

    /**
     * 获取时间的展示样式
     * 
     * @param min 分钟数
     * @return 目标样式的时间格式
     */
    private String showTime(String min) {
        if (min == null || min.trim().isEmpty()) {
            return "";
        }

        Double integer = Double.valueOf(min);
        if (integer > HOURS_MIN) {
            DecimalFormat df = new DecimalFormat("0.0");
            return df.format(integer / HOURS_MIN) + " h";
        } else {
            return min + " min";
        }
    }
}
