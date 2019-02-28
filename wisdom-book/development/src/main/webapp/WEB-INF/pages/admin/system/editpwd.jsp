<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>后台操作区</TITLE>
<META http-equiv=Content-Type content="text/html; charset=UTF-8">
<LINK href="${path}/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="${path}/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="${path}/images/Common.js"></SCRIPT>

<script type="text/javascript">

    function checkPWD11(password)
    {
        if(document.form1.oldpwd.value=="")
        {
            alert("请输入旧密码！");
            document.form1.oldpwd.focus();
            return false;
        }
        if(document.form1.newpwd.value=="")
        {
            alert("请输入新密码！");
            document.form1.newpwd.focus();
            return false;
        }
        if(document.form1.newpwd.value.length<6||document.form1.newpwd.value.length>16)
        {
            alert("密码为6-16位之间！");
            document.form1.newpwd.focus();
            return false;
        }
        if(document.form1.repwd.value=="")
        {
            alert("请确认密码！");
            document.form1.repwd.focus();
            return false;
        }
        if(password != document.form1.oldpwd.value){
            alert("旧密码不正确！");
            document.form1.oldpwd.focus();
            return false;
        }
        if(document.form1.repwd.value!=document.form1.newpwd.value)
        {
            alert("对不起，两次输入的密码不相同，请确认密码！");
            document.form1.repwd.focus();
            return false;
        }
        if(password == document.form1.newpwd.value)
        {
            alert("新密码不能与原密码相同！");
            document.form1.oldpwd.focus();
            return false;
        }
    }
</script>
<STYLE type=text/css>BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
</STYLE>
<META content="MSHTML 6.00.2900.3243" name=GENERATOR></HEAD>

<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 
background=${path}/images/MainBg.gif topMargin=0 scroll=no
marginheight="0" marginwidth="0"><br><br><br>
<TABLE align="center" height="100%" cellSpacing=0 cellPadding=0 width="40%" border=0>
  <TBODY>
  <TR>
    <TD vAlign=top height="50%">
	<form action="${path}/admin/editPwd.do" method="post" name="form1" onSubmit="return checkPWD11(${admin.password})" target="_top">
		 <TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
			<TBODY>
				<TR class=head>
				<TD colSpan=2 height=23>修改后台登录密码 当前用户：<FONT color=red>${admin.username}</FONT>&nbsp;&nbsp;（密码为6-16位之间）</TD></TR>
				<TR bgColor=#ffffff>
				<TD width="50%" align="right" id=map>旧 密 码：<input type="hidden" name="method" value="editpwd"/></TD>
				<TD width="50%" align="left" id=map><input type="password" name="oldpwd" size="20" maxlength=16  class=input onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
								  onkeyup="value=value.replace(/[\W]/g,'')"></TD></TR>
				<TR bgColor=#ffffff>
				<TD width="50%" align="right" id=map>新 密 码：</TD>
				<TD width="50%" align="left" id=map><input type="password" name="newpwd" size="20" maxlength=16 class=input onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
								  onkeyup="value=value.replace(/[\W]/g,'')"></TD>
				</TR>
				<TR bgColor=#ffffff>
				<TD width="50%" align="right" id=map>确认密码：</TD>
				<TD width="50%" align="left" id=map><input type="password" name="repwd" size="20" maxlength=16 class=input onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
								  onkeyup="value=value.replace(/[\W]/g,'')"></TD>
				</TR>
				<TR bgColor=#ffffff>
				<TD colspan="2" align="center" id=map><input type="submit" value="确定">&nbsp;&nbsp;<input type="reset" value="重填"></TD>
				</TR>
			</TBODY>
		</TABLE>
	</form>
   </TD></TR>
</TBODY></TABLE>
</BODY>
</HTML>
