package com.frees.workdaily.service.impl;

import com.frees.workdaily.entity.Log;
import com.frees.workdaily.mapper.LogMapper;
import com.frees.workdaily.service.ILogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author frees
 * @since 2019-08-30
 */
@Service
public class LogServiceImpl extends ServiceImpl<LogMapper, Log> implements ILogService {

}
