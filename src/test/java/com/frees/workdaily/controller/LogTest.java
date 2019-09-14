package com.frees.workdaily.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.frees.workdaily.WorkdailyApplicationTests;
import com.frees.workdaily.entity.VO.LogVO;
import com.frees.workdaily.mapper.LogMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class LogTest extends WorkdailyApplicationTests {

    @Autowired
    private LogMapper logMapper;

    @Test
    public void test1(){
        QueryWrapper<Object> query = Wrappers.query();
        query.eq("log.project_id","project.id");
        List<LogVO> logs = logMapper.getLogs(query);
        System.out.println(logs);
    }
}
