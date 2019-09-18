package com.frees.workdaily.entity.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

/**
 * @author dengping
 * @date 2019/9/17 17:31
 */
@Data
public class LogDetailVo {

    private String logId;
//    @TableField("logTitle")
    private String logTitle;
//    @TableField("log.use_time")
    private String logUseTime;
//    @TableField("log_detail.content")
    private String logDetailContent;
//    @TableField("log_detail.use_time")
    private String logDetailUseTime;
}
