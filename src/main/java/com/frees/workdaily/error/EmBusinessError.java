package com.frees.workdaily.error;

public enum  EmBusinessError implements CommonError {

    USER_NOT_EXSIT("100001","用户不存在"),
    USER_IS_EXSIT("100002","用户已存在"),
    USER_OR_PWD_NOT_OK("100003","密码或账户不正确")
    ;

    private EmBusinessError(String errCode,String errMsg){
        this.errCode = errCode;
        this.errMsg = errMsg;
    }

    private String errCode;
    private String errMsg;


    @Override
    public String getErrCode() {
        return errCode;
    }

    @Override
    public String getErrMsg() {
        return errMsg;
    }

    @Override
    public CommonError setErrMsg(String errMsg) {
        this.errMsg = errMsg;
        return this;
    }
}
