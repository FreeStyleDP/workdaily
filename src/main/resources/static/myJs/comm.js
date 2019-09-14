
// 展示 响应结果
function showResult(data) {
    var code = data.rtnCode;
    var msg = data.rtnMsg;

    if (code != "000000"){// 失败
        $.messager.alert(
            "",msg,"error"
        );
        return false;
    } else {
        $.messager.show({
            title:'成功',
            msg:msg,
            showType:'show'
        });
        return true;
    }
}

function showResult(data , isShowSuccess) {
    var code = data.rtnCode;
    var msg = data.rtnMsg;

    if (code != "000000"){// 失败
        $.messager.alert(
            "",msg,"error"
        );
        return false;
    } else {
        if (isShowSuccess){
            $.messager.show({
                title:'成功',
                msg:msg,
                showType:'show'
            });
        }

        return true;
    }
}

function adjustIfHt(){
    var ht = $(window).height();//获取浏览器窗口的整体高度；
    var topHeader = 60;//获取头部高度，定义一个变量名为topHeader
    // $(".sidebar").height(ht);
    $("#detail").height(ht-topHeader);
}

