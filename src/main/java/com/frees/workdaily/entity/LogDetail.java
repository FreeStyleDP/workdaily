package com.frees.workdaily.entity;

    import java.io.Serializable;
    import java.time.LocalDateTime;

    import com.baomidou.mybatisplus.annotation.FieldFill;
    import com.baomidou.mybatisplus.annotation.TableField;
    import com.fasterxml.jackson.annotation.JsonFormat;
    import io.swagger.annotations.ApiModel;
    import io.swagger.annotations.ApiModelProperty;
    import lombok.Data;
    import lombok.EqualsAndHashCode;
    import lombok.experimental.Accessors;
    import org.springframework.format.annotation.DateTimeFormat;

/**
* <p>
    * 
    * </p>
*
* @author frees
* @since 2019-08-28
*/
    @Data
        @EqualsAndHashCode(callSuper = false)
    @Accessors(chain = true)
    @ApiModel(value="LogDetail对象", description="")
    public class LogDetail implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    private String logId;

            @ApiModelProperty(value = "内容")
    private String content;

            @ApiModelProperty(value = "状态 1-完成 2-未完成")
    private String status;

            @ApiModelProperty(value = "序号")
    private Integer seq;

    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private LocalDateTime startTime;

    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private LocalDateTime endTime;

    @TableField(fill = FieldFill.UPDATE)
    private Double useTime;
    private String remark;


}
