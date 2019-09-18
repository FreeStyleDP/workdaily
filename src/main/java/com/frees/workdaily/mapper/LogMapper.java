package com.frees.workdaily.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.frees.workdaily.entity.Log;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.frees.workdaily.entity.vo.LogDetailVo;
import com.frees.workdaily.entity.vo.LogVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author frees
 * @since 2019-08-30
 */
@Service
public interface LogMapper extends BaseMapper<Log> {

    @Select("SELECT log.*,project.`name`  from log LEFT JOIN project on  log.project_id=project.id  "
        + "${ew.customSqlSegment}")
    List<LogVo> getLogs(@Param(Constants.WRAPPER) Wrapper wrapper);


//    @Select(" SELECT log.*, log_detail.* FROM log_detail LEFT JOIN log ON log.id = log_detail.log_id "
    @Select("SELECT log.id as logId ,log.title as logTitle, log.use_time as  logUseTime, log_detail.content as logDetailContent, log_detail.use_time as logDetailUseTime "
        + "FROM log LEFT JOIN log_detail ON log.id = log_detail.log_id "
        + "${ew.customSqlSegment}")
    List<LogDetailVo> getSummaryDayInfo(@Param(Constants.WRAPPER) Wrapper wrapper);
}
