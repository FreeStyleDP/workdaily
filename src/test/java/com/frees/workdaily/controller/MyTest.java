package com.frees.workdaily.controller;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import org.junit.Test;

import java.time.LocalDateTime;

public class MyTest {

    @Test
    public void test2(){
        System.out.println(StringUtils.isEmpty("  "));
    }

    @Test
    public void  test3(){
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime of = LocalDateTime.of(now.getYear(), now.getMonth(), now.getDayOfMonth(), 0, 0);
        System.out.println(of);
    }
}
