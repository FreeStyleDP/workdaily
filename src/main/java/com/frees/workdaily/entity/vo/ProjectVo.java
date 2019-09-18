package com.frees.workdaily.entity.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 包含选中信息
 * @author dengping
 * @date 2019/9/16 15:42
 */
@Data
public class ProjectVo {
    private String id;

    @ApiModelProperty(value = "项目名称")
    private String name;

    private boolean selected;

    private Integer seq;
}
