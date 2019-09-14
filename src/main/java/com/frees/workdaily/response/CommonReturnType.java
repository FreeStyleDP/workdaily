package com.frees.workdaily.response;

import com.frees.workdaily.error.CommonError;
import com.frees.workdaily.error.EmCommonError;
import lombok.Data;

@Data
public class CommonReturnType {
    private String rtnCode;
    private String rtnMsg;
    private Object data;

    public static CommonReturnType create(String errCode ,String errMsg , Object data){
        CommonReturnType commonReturnType = new CommonReturnType();
        commonReturnType.setRtnCode(errCode);
        commonReturnType.setRtnMsg(errMsg);
        commonReturnType.setData(data);
        return commonReturnType;
    }

    public static CommonReturnType create(CommonError commonError, Object data){
        CommonReturnType commonReturnType = new CommonReturnType();
        commonReturnType.setRtnCode(commonError.getErrCode());
        commonReturnType.setRtnMsg(commonError.getErrMsg());
        commonReturnType.setData(data);
        return commonReturnType;
    }

    public static CommonReturnType create(Object data){
        return CommonReturnType.create(EmCommonError.SUCCESS,data);

    }
}
