package com.frees.workdaily.controller;

import com.frees.workdaily.error.BusinessException;
import com.frees.workdaily.error.EmCommonError;
import com.frees.workdaily.response.CommonReturnType;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.servlet.http.HttpServletRequest;

public class BaseController {
    @ResponseBody
    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.OK)
    public Object handlerException(HttpServletRequest httpServletRequest, Exception ex) {

        if (ex instanceof BusinessException) {
            return CommonReturnType.create(((BusinessException) ex).getErrCode(), ((BusinessException) ex).getErrMsg(), null);
        }
        ex.printStackTrace();
        return CommonReturnType.create(EmCommonError.UNKNOW_ERROR, null);
    }
}
