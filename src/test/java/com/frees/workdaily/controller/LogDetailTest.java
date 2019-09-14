package com.frees.workdaily.controller;

import com.frees.workdaily.WorkdailyApplicationTests;
import com.frees.workdaily.entity.LogDetail;
import com.frees.workdaily.mapper.LogDetailMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class LogDetailTest extends WorkdailyApplicationTests {

    @Autowired
    private LogDetailController logDetailController;

    @Autowired
    private LogDetailMapper logDetailMapper;

    @Test
    public void test1(){
        LogDetail logDetail = new LogDetail();
        logDetail.setLogId("8c4c8253812359034299f2f8c12e7241");

        System.out.println(logDetailMapper.selectMaxSeq("8c4c8253812359034299f2f8c12e7241"));
        System.out.println(logDetailController.getMaxSeq(logDetail));
    }
}
