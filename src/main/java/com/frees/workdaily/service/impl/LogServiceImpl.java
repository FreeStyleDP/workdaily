package com.frees.workdaily.service.impl;

import com.frees.workdaily.entity.Log;
import com.frees.workdaily.mapper.LogMapper;
import com.frees.workdaily.service.ILogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author frees
 * @since 2019-08-30
 */
@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, Log> implements ILogService {

    @Autowired
    private LogMapper logMapper;

    @Override
    public void updateEndTime(String logId) {
        LocalDateTime now = LocalDateTime.now();
        Log log = new Log();
        log.setId(logId);
        log.setEndTime(now);
        int i = logMapper.updateById(log);
    }

}
