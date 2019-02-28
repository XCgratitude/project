<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>jquery版的网页倒计时效果</title>
    <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport" id="viewport">
    <meta name="format-detection" content="telephone=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <style type="text/css">
        .time-item strong {
            background: #C71C60;
            color: #fff;
            line-height: 49px;
            font-size: 36px;
            font-family: Arial;
            padding: 0 10px;
            margin-right: 10px;
            border-radius: 5px;
            box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
        }

        #day_show {
            float: left;
            line-height: 49px;
            color: #c71c60;
            font-size: 32px;
            margin: 0 10px;
            font-family: Arial, Helvetica, sans-serif;
        }

        .item-title .unit {
            background: none;
            line-height: 49px;
            font-size: 24px;
            padding: 0 10px;
            float: left;
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script type="text/javascript">
        $(function(){
            //活动倒计时
            countDown("#colockbox1");
        });

        //倒计时显示
        function countDown(id){
            var sys_scope = 111111111111;//活动时限-秒
            var sys_second = 111111111;//剩余时间-秒
            var activityIsStart = 1;
            if(!activityIsStart|| sys_second<=0){
                $("#gold_div").addClass('gray'); //<span style="font-family: Arial, Helvetica, sans-serif;">c背景置灰 </span>
                    $("#gold_btn").attr("disabled",true); //按钮失效
                $("#gold_ipu").attr("disabled",true);//输入框失效
            }
            var timer = setInterval(function(){
                if (sys_second > sys_scope) {
                    $(id).text("活动尚未开始");
                    sys_second -= 1;
                } else if(sys_second <= (sys_scope) && sys_second >=1 ){
                    $("#gold_div").removeClass('gray'); //背景置灰
                    $("#gold_btn").removeAttr("disabled");//按钮失效
                    $("#gold_ipu").removeAttr("disabled");//输入框失效
                    sys_second -= 1;
                    var hour = Math.floor((sys_second / 3600) % 24);
                    var minute = Math.floor((sys_second / 60) % 60);
                    var second = Math.floor(sys_second % 60);
                    var alertText = "";
                    if(hour>0){
                        alertText+=hour+"小时";
                    }
                    if(minute>0){
                        alertText+=minute+"分";
                    }
                    alertText+=second+"秒";
                    $(id).text(alertText);
                }else{
                    $("#gold_ipu").attr("disabled",true).val("");//清空输入框
                    $("#gold_div").addClass('gray'); //背景置灰
                    $("#gold_btn").attr("disabled",true); //按钮失效
                    $(id).text("活动已结束");//提示
                    clearInterval(timer);
                }
            }, 1000);
        }
    </script>
</head>

<body>
<div id="gold_div">
    <a href="javascript:void(0);"  onclick="secKill();" >
        <input type="button"  value="提交秒杀" id="gold_btn"/>
    </a>
</div>
<dl class="cf">
    <dt><span></span>剩余时间：</dt>
    <dd id="colockbox1"></dd>
</dl>
<!--倒计时模块-->
</body>

</html>