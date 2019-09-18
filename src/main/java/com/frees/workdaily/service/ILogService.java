package com.frees.workdaily.service;

import com.frees.workdaily.entity.Log;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author frees
 * @since 2019-08-30
 */
public interface ILogService extends IService<Log> {

    /**
     * 修改日志的最新修改时间
     * 
     * @param logId
     */
    void updateEndTime(String logId);
}
