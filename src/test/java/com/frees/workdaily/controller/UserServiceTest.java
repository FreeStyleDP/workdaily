package com.frees.workdaily.controller;

import com.frees.workdaily.WorkdailyApplicationTests;
import com.frees.workdaily.entity.User;
import com.frees.workdaily.service.IUserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class UserServiceTest extends WorkdailyApplicationTests {

    @Autowired
    private IUserService iUserService;

    @Test
    public void test(){
        User user = new User();
        user.setName("dp");
        user.setPassword("123");
        user.setNowProject("321");
        user.setType("2");

        boolean save = iUserService.save(user);
    }
}
