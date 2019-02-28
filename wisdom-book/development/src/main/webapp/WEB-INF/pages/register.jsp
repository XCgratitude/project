<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" ></script>
<script language="javascript" src="${pageContext.request.contextPath}/js/jquery.form.js" ></script>
<title>bookStore注册页面</title>
<%--导入css --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
<script type="text/javascript">
	function changeImage() {
		document.getElementById("img").src = "${pageContext.request.contextPath}/code/imageCode.do?time="
				+ new Date().getTime();
	}
</script>
<script type="text/javascript">

    $(function() {
        $("body").find("[reg1]").blur(function () {
            var val = $(this).val();
            var reg = $(this).attr("reg1");
            var tip1 = $(this).attr("tip1");
            var tip2 = $(this).attr("tip2");
            var regExp = new RegExp(reg);
            if(val == ""){
                $(this).parent().next().children("font").text(tip2).css("color", "red");
			}else{
                if (!regExp.test($.trim(val))) {
                    $(this).parent().next().children("font").text(tip1).css("color", "red");
                } else {
                    if($(this).attr("name") == "username"){
                        var result = validUserName(val);
                        if(result == "yes"){
                            $(this).parent().next().children("font").text("用户名已存在").css("color", "red");
                        }else {
                            $(this).parent().next().children("font").text("");
						}
                    }else{
                        $(this).parent().next().children("font").text("");
                    }
                }
			}
        });
    })

	$(function () {
	    $("#register1").click(function () {
            var isSubmit = true;
            $("#register").find("[reg1]").each(function () {
                var val = $(this).val();
                var reg = $(this).attr("reg1");
                var tip1 = $(this).attr("tip1");
                var tip2 = $(this).attr("tip2");
                var regExp = new RegExp(reg);

                if(val == ""){
                    isSubmit = false;
                    $(this).parent().next().children("font").text(tip2).css("color", "red");
                    return false;
                }else{
                    if (!regExp.test($.trim(val))) {
                        $(this).parent().next().children("font").text(tip1).css("color", "red");
                        isSubmit = false;
                        return false;
                    } else {
                        $(this).parent().next().children("font").text("");
                    }
                }
            });
            return isSubmit;
        })
    })

    function validUserName(val) {
        $.ajax({
            "url":"${pageContext.request.contextPath}/user/validUserName.do",
			"data":{
                userName:val
            },
			"type":"POST",
			"success":function (data) {
                result = data;
            },
			"error":function () {
				alert("服务器繁忙，请稍后重试");
            },
            "dataType":"text",
		});
        return result;
    }
</script>
</head>


<body class="main">
	<%@include file="head.jsp"%>
	<%--导入头 --%>
	<%@include file="menu_search.jsp"%><%--导入导航条与搜索 --%>

	<div id="divcontent">
		<form id="register" action="${pageContext.request.contextPath}/user/registerUser.do"
			method="post">
			<table width="850px" border="0" cellspacing="0">
				<tr>
					<td style="padding:30px">
						<h1>新会员注册</h1>
						
						<table width="70%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align:right; width:20%">会员邮箱：</td>
								<td style="width:40%">
								<input type="text" class="textinput"
									name="email" value="${hUser == null ? '': hUser.email}" reg1="^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$" tip1="邮箱格式不正确" tip2="邮箱不能为空"/></td>
								<td><font color="#999999"><c:if test="${hUser == null }">请输入有效的邮箱地址</c:if></font></td>
							</tr>
							<tr>
								<td style="text-align:right">会员名：</td>
								<td>
									<input type="text" class="textinput" name="username"
										   reg1="^.{6,}$" tip1="用户名少于6位" tip2="用户名不能为空"/>
								</td>
								<td><font color="#999999">用户名设置至少6位</font></td>
							</tr>
							<tr>
								<td style="text-align:right">密码：</td>
								<td><input type="password" class="textinput"
									name="password"  reg1="^.{6,}$" tip1="密码至少6位" tip2="密码不能为空"/></td>
								<td><font color="#999999">密码设置至少6位</font></td>
							</tr>
							<tr>
								<td style="text-align:right">重复密码：</td>
								<td><input type="password" class="textinput"
									name="repassword" /></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align:right">性别：</td>
								<td colspan="2">&nbsp;&nbsp;<input type="radio"
									name="gender" value="男" checked="checked" /> 男
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
									name="gender" value="女" /> 女</td>
							</tr>
							<tr>
								<td style="text-align:right">联系电话：</td>
								<td><input type="text" class="textinput"
									 name="telephone"  reg1="^1[3|4|5|8][0-9]\d{8}$" tip1="手机号格式不对" tip2="手机号不能为空"/></td>
								<td><font></font></td>
							</tr>
							<tr>
								<td style="text-align:right">个人介绍：</td>
								<td colspan="2"><textarea class="textarea" name="introduce" reg1="^(.|\n){0,300}$" tip="任意字符，长度0-300"></textarea>
								</td>
							</tr>

						</table>

						<h1>注册校验</h1>
						<table width="80%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align:right; width:20%">输入校验码：</td>
								<td style="width:50%"><input name="code" type="text" class="textinput" />
								</td>
								<td>&nbsp;<font color="#999999"></font></td>
							</tr>
							<tr>
								<td style="text-align:right;width:20%;">&nbsp;</td>
								<td colspan="2" style="width:50%"><img onclick="changeImage()"
									src="${pageContext.request.contextPath}/code/imageCode.do" width="180"
									height="30" class="textinput" style="height:30px;" id="img" />&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="changeImage()">看不清换一张</a>
								</td>
							</tr>
						</table>

						<table width="70%" border="0" cellspacing="0">
							<tr>
								<td style="padding-top:20px; text-align:center"><input id="register1"
									 type="image" src="${pageContext.request.contextPath}/images/signup.gif" name="submit" border="0">
								</td>
							</tr>
						</table></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="divfoot">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td rowspan="2" style="width:10%"><img
					src="${pageContext.request.contextPath}/images/bottomlogo.gif" width="195" height="50"
					style="margin-left:175px" /></td>
				<td style="padding-top:5px; padding-left:50px"><a href="#"><font
						color="#747556"><b>CONTACT US</b> </font> </a></td>
			</tr>
			<tr>
				<td style="padding-left:50px"><font color="#CCCCCC"><b>COPYRIGHT
							2008 &copy; eShop All Rights RESERVED.</b> </font></td>
			</tr>
		</table>
	</div>


</body>
</html>
