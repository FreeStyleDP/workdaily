package com.frees.workdaily.mapper;

import com.frees.workdaily.entity.LogDetail;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author frees
 * @since 2019-08-28
 */
@Service
public interface LogDetailMapper extends BaseMapper<LogDetail> {

    @Select("SELECT max(seq) FROM log_detail where log_id = #{logId}")
    Integer selectMaxSeq(String logId);
}
