<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>Landing Page | Amaze UI Example</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <script src="assets/js/jquery.min.js"></script>
    <!-- 妹子UI相关资源 -->
    <link rel="alternate icon" type="image/png" href="assets/i/favicon.png">
    <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
    <script src="assets/js/amazeui.min.js"></script>
    <!-- UM相关资源 -->
    <link href="assets/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8" src="assets/umeditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="assets/umeditor/umeditor.min.js"></script>
    <script type="text/javascript" src="assets/umeditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
<header class="am-topbar am-topbar-fixed-top">
    <div class="am-container">
        <h1 class="am-topbar-brand">
            <a href="#">聊天室</a>
        </h1>
        <div class="am-collapse am-topbar-collapse" id="collapse-head">
            <ul class="am-nav am-nav-pills am-topbar-nav">
                <li class="am-active"><a href="#">首页</a></li>
                <li><a href="#">项目</a></li>
            </ul>
            <div class="am-topbar-right">
                <button class="am-btn am-btn-secondary am-topbar-btn am-btn-sm"><span class="am-icon-pencil"></span> 注册</button>
            </div>
            <div class="am-topbar-right">
                <button class="am-btn am-btn-primary am-topbar-btn am-btn-sm"><span class="am-icon-user"></span> 登录</button>
            </div>
        </div>
    </div>
</header>
<div id="main">
    <!-- 聊天内容展示区域 -->
    <div id="ChatBox" class="am-g am-g-fixed" >
        <div class="am-u-lg-12" style="height:400px;border:1px solid #999;overflow-y:scroll;">
            <ul id="chatContent" class="am-comments-list am-comments-list-flip">
                <li class="am-comment am-comment-success" style="margin-right:20%;">
                    <a href="">
                        <img class="am-comment-avatar" src="assets/images/other.jpg" alt=""/>
                    </a>
                    <div class="am-comment-main" >
                        <header class="am-comment-hd">
                            <div class="am-comment-meta">
                                <a href="#link-to-user" class="am-comment-author">某人</a>
                                <time datetime="" title="">2014-7-12 15:30</time>
                            </div>
                        </header>
                        <div class="am-comment-bd">此处是消息内容</div>
                    </div>
                </li>
                <li class="am-comment am-comment-flip am-comment-warning" style="margin-left:20%;">
                    <a href="">
                        <img class="am-comment-avatar" src="assets/images/xia.jpg" alt=""/>
                    </a>
                    <div class="am-comment-main" >
                        <header class="am-comment-hd">
                            <div class="am-comment-meta">
                                <a href="#link-to-user" class="am-comment-author">某人</a>
                                <time datetime="" title="">2014-7-12 15:30</time>
                            </div>
                        </header>
                        <div class="am-comment-bd">此处是消息内容</div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- 聊天内容发送区域 -->
    <div id="EditBox" class="am-g am-g-fixed">

        <script type="text/plain" id="myEditor" style="width:100%;height:140px;"></script>

        <button id="send" type="button" class="am-btn am-btn-primary am-btn-block">发送</button>
            </div>

        <script type="text/javascript">
            $(function(){
            $("#ChatBox div:eq(0)").height($(this).height()-290);

            $(window).resize(function(){
                $("#ChatBox div:eq(0)").height($(this).height()-290);
            });
            var um = UM.getEditor('myEditor',{
                initialContent:"请输入聊天信息...",
                autoHeightEnabled:false,
                toolbar:[
                    'source | undo redo | bold italic underline strikethrough | superscript subscript | forecolor backcolor | removeformat |',
                    'insertorderedlist insertunorderedlist | selectall cleardoc paragraph | fontfamily fontsize' ,
                    '| justifyleft justifycenter justifyright justifyjustify |',
                    'link unlink | emotion image video  | map'
                ]
            });});
        </script>
</body>
</html>