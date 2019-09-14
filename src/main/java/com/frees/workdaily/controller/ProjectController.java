package com.frees.workdaily.controller;


import com.frees.workdaily.entity.Project;
import com.frees.workdaily.response.CommonReturnType;
import com.frees.workdaily.service.IProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.frees.workdaily.controller.BaseController;

import java.util.List;

/**
 * <p>
 *  前端控制器
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

    @PostMapping("/add.do")
    public CommonReturnType addProject(Project project){
        boolean save = iProjectService.save(project);
        return CommonReturnType.create(null);
    }

    @PostMapping("/delete.do")
    public CommonReturnType deleteProject(Project project){
        boolean b = iProjectService.removeById(project.getId());
        return CommonReturnType.create(null);
    }

    @PostMapping("/update.do")
    public CommonReturnType updateProject(Project project){
        boolean b = iProjectService.updateById(project);
        return CommonReturnType.create(null);
    }

    @PostMapping("/query.do")
    public CommonReturnType queryProject(){
        List<Project> list = iProjectService.list();
        return CommonReturnType.create(list);
    }

}
