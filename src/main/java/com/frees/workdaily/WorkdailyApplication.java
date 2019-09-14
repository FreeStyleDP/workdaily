package com.frees.workdaily;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.frees.workdaily.mapper")
public class WorkdailyApplication {

    public static void main(String[] args) {
        SpringApplication.run(WorkdailyApplication.class, args);
    }

}
