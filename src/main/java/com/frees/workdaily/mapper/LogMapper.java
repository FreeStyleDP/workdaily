package com.frees.workdaily.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.frees.workdaily.entity.Log;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.frees.workdaily.entity.VO.LogVO;
import javafx.scene.control.Pagination;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author frees
 * @since 2019-08-30
 */
@Service
public interface LogMapper extends BaseMapper<Log> {

//    @Select("SELECT log.*,project.name FROM log,project")
    @Select("SELECT log.*,project.`name`  from log LEFT JOIN project on  log.project_id=project.id order by title")
    List<LogVO> getLogs(@Param(Constants.WRAPPER) Wrapper wrapper);
}
