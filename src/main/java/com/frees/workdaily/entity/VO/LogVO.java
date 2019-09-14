package com.frees.workdaily.entity.VO;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class LogVO {
    private String id;

    private String projectId;

    @ApiModelProperty(value = "重要等级 1-重要紧急 2-重要不紧急 3-紧急不重要 4-都不")
    private String level;

    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private LocalDate date;

    private String title;

    @ApiModelProperty(value = "类型 1-计划 2-突发 3-备忘 4-问题 5-总结 6-番茄钟 7-日结")
    private String type;

    @ApiModelProperty(value = "备注")
    private String remark;

    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private LocalDateTime startTime;

    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private LocalDateTime endTime;

    @ApiModelProperty(value = "状态 1-完成 2-未完成 3-搁置")
    private String status;

    @TableField(fill = FieldFill.UPDATE)
    private Double useTime;

    @ApiModelProperty(value = "项目名称")

    @TableField("name")
    private String name;
}
