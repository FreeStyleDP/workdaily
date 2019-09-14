package com.frees.workdaily.service.impl;

import com.frees.workdaily.entity.Project;
import com.frees.workdaily.mapper.ProjectMapper;
import com.frees.workdaily.service.IProjectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author frees
 * @since 2019-08-30
 */
@Service
public class ProjectServiceImpl extends ServiceImpl<ProjectMapper, Project> implements IProjectService {

}
