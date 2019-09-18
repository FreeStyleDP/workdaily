package com.frees.workdaily.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.frees.workdaily.entity.User;
import com.frees.workdaily.error.BusinessException;
import com.frees.workdaily.error.EmBusinessError;
import com.frees.workdaily.response.CommonReturnType;
import com.frees.workdaily.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author frees
 * @since 2019-08-28
 */
@RestController
@RequestMapping("/workdaily/user")
public class UserController extends BaseController {

    @Autowired
    private IUserService iUserService;

    @RequestMapping("/add.do")
    @ResponseBody
    public CommonReturnType addUser(User user) {
        // 检查账号是否存在
        QueryWrapper<User> query = Wrappers.query();
        query.eq("id", user.getId());
        List<User> list = iUserService.list(query);
        if (list.size() > 0) {
            throw new BusinessException(EmBusinessError.USER_IS_EXSIT);
        }
        boolean b = iUserService.save(user);
        return CommonReturnType.create(null);
    }

    @RequestMapping("/delete.do")
    public CommonReturnType deleteUser(User user) {
        boolean b = iUserService.removeById(user.getId());
        return CommonReturnType.create(null);
    }

    @RequestMapping("/update.do")
    public CommonReturnType updateUser(User user) {
        iUserService.updateById(user);
        return CommonReturnType.create(null);
    }

    @PostMapping(value = "/queryUsers.do")
    public CommonReturnType queryUsers(User user, Page<User> page) {
        QueryWrapper<User> query = Wrappers.query();
        if (user.getId() != null) {
            query.eq("id", user.getId());
        }
        if (user.getName() != null) {
            query.like("name", user.getName());
        }
        if (user.getType() != null) {
            query.eq("type", user.getType());
        }
        if (user.getNowProject() != null) {
            query.eq("now_project", user.getNowProject());
        }
        IPage<User> page1 = iUserService.page(page, query);
        return CommonReturnType.create(page1);
    }

    @PostMapping(value = "/getUserById.do")
    public CommonReturnType queryUser(User user) {

        User getUser = iUserService.getById(user.getId());
        return CommonReturnType.create(getUser);
    }

    // @PostMapping(value = "/login.do")
    // public CommonReturnType login(User user ,HttpServletRequest request){
    // HttpSession session = request.getSession();
    // session.setMaxInactiveInterval(1000*60*60);
    //
    // if (session.getAttribute(user.getId()) == null){
    // session.setAttribute(user.getId(),session.getId());
    // }else {
    // //已登录
    // }
    // return CommonReturnType.create(null);
    // }
}
