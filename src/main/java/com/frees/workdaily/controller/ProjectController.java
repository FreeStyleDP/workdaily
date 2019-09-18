package com.frees.workdaily.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.frees.workdaily.entity.Project;
import com.frees.workdaily.entity.User;
import com.frees.workdaily.entity.vo.ProjectVo;
import com.frees.workdaily.response.CommonReturnType;
import com.frees.workdaily.service.IProjectService;
import com.frees.workdaily.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author frees
 * @since 2019-08-30
 */
@RestController
@RequestMapping("/workdaily/project")
public class ProjectController extends BaseController {

    @Autowired
    private IProjectService iProjectService;

    @Autowired
    IUserService iUserService;

    @PostMapping("/add.do")
    public CommonReturnType addProject(Project project) {
        boolean save = iProjectService.save(project);
        return CommonReturnType.create(null);
    }

    @PostMapping("/delete.do")
    public CommonReturnType deleteProject(Project project) {
        boolean b = iProjectService.removeById(project.getId());
        return CommonReturnType.create(null);
    }

    @PostMapping("/update.do")
    public CommonReturnType updateProject(Project project) {
        boolean b = iProjectService.updateById(project);
        return CommonReturnType.create(null);
    }

    @PostMapping("/query.do")
    public CommonReturnType queryProject() {
        QueryWrapper<Project> query = Wrappers.query();
        List<Project> list = iProjectService.list(query.orderByAsc("seq"));
        
        // 默认使用 dengping 用户，有用户登录功能后再做优化
        User user = iUserService.getById("dengping");

        ArrayList<ProjectVo> projectVos = new ArrayList<>();
        for (Project project : list) {
            ProjectVo projectVo = new ProjectVo();
            projectVo.setId(project.getId());
            projectVo.setSeq(project.getSeq());
            projectVo.setName(project.getName());
            if (Objects.equals(project.getId(), user.getNowProject())) {
                projectVo.setSelected(true);
            }
            projectVos.add(projectVo);
        }
        
        return CommonReturnType.create(projectVos);
    }

}
