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

        var intDiff = parseInt(500000); //倒计时总秒数量

        function timer(intDiff) {
            window.setInterval(function() {
                var day = 0,
                    hour = 0,
                    minute = 0,
                    second = 0; //时间默认值
                if (intDiff > 0) {
                    day = Math.floor(intDiff / (60 * 60 * 24));
                    hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
                    minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
                    second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
                }
                if (minute <= 9) minute = '0' + minute;
                if (second <= 9) second = '0' + second;
                $('#day_show').html(day + "天");
                $('#hour_show').html('<s id="h"></s>' + hour + '时');
                $('#minute_show').html('<s></s>' + minute + '分');
                $('#second_show').html('<s></s>' + second + '秒');
                intDiff--;
            }, 1000);
        }

        $(function() {
            timer(intDiff);
        });
    </script>
</head>

<body>
<div class="time-item">
    <span id="day_show">0天</span>
    <strong id="hour_show">0时</strong>
    <strong id="minute_show">0分</strong>
    <strong id="second_show">0秒</strong>
</div>
<!--倒计时模块-->
</body>

</html>