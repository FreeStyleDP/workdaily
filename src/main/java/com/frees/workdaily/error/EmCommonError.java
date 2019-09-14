package com.frees.workdaily.error;

public enum EmCommonError implements CommonError {

    SUCCESS("000000","交易成功"),
    UNKNOW_ERROR("000001","未知错误"),
    PARAMETER_VALIDATION_ERROR("000002","参数不合法");

    private EmCommonError(String errCode, String errMsg){
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
