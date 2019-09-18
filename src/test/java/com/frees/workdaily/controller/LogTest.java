package com.frees.workdaily.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.frees.workdaily.WorkdailyApplicationTests;
import com.frees.workdaily.entity.vo.LogVo;
import com.frees.workdaily.mapper.LogMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class LogTest extends WorkdailyApplicationTests {

    @Autowired
    private LogMapper logMapper;

    @Autowired
    private LogController logController;

    @Test
    public void test1() {
        QueryWrapper<Object> query = Wrappers.query();
        query.eq("log.project_id", "project.id");
        List<LogVo> logs = logMapper.getLogs(query);
        System.out.println(logs);

    }
    @Test
    public void test2(){
        com.frees.workdaily.entity.Log log = new com.frees.workdaily.entity.Log();
        log.setProjectId("3ba0013d293f05f70c684ef53d73d303") ;
        System.out.println(logController.workQueryLog(log));
    }

    @Test
    public void  test3(){
        System.out.println(logController.summaryDay());
    }
}
