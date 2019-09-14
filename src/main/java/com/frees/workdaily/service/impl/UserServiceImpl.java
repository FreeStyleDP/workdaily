package com.frees.workdaily.service.impl;

import com.frees.workdaily.entity.User;
import com.frees.workdaily.mapper.UserMapper;
import com.frees.workdaily.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author frees
 * @since 2019-08-28
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

}
