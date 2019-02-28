<%@ page import="java.util.Random" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <%
    Random random = new Random();
    String code = "";
    for(int i = 0; i < 4; i++){
        code+= random.nextInt(10);
    }
  %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <script language="javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" ></script>
<title>网站后台管理登录</title>
<style type="text/css">
<!--
.font1 {  font-family: "宋体"; font-size: 12px; line-height: 130%}
a {  font-family: "宋体"; font-size: 12px}
a:link {  font-family: "宋体"; font-size: 12px; color: #CFD1E8; text-decoration: underline}
a:hover {  font-family: "宋体"; font-size: 12px; color: #FFCC00; text-decoration: none}
a:visited {  font-family: "宋体"; font-size: 12px; color: #CFD1E8; text-decoration: underline}
.input {  font-family: "宋体"; font-size: 12px; color: #FFFFFF; border: #4047A4; border-style: solid; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; background-color: #000077}
-->
</style>
</head>
<%
  String s = (String) request.getAttribute("login");
  if (s == "1"){
    out.println("<script type=\"text/javascript\">");
    out.println("alert('用户名或密码错误！');");
    out.println("</script>");
  } else if (s == "2") {
    out.println("<script type=\"text/javascript\">");
    out.println("alert('此号已被冻结，请联系超级管理员！手机号110');");
    out.println("</script>");
  } else if (s == "3") {
    out.println("<script type=\"text/javascript\">");
    out.println("alert('身份已过期，请重新登录!');");
    out.println("</script>");
  } else if (s == "4"){
    out.println("<script type=\"text/javascript\">");
    out.println("alert('请先登录!');");
    out.println("</script>");
  }
%>
<body bgcolor="#000077" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td background="${path}/images/bg.jpg" valign="middle" align="center">
      <table width="360" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td align="center"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"  codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="330" height="190" id=ShockwaveFlash1>
              <param name=movie value="${path}/images/admin_m.swf">
              <param name=quality value=high>
			   <param name="wmode" value="transparent">
              <embed src="${path}/images/admin_m.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="330" height="190">
              </embed> 
            </object></td>
        </tr>
      </table>
      <table width="280" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td height="30">&nbsp;</td>
        </tr>
        <tr>
          <td bgcolor="#4047A4" height="1"></td>
        </tr>
      </table>
      <table width="280" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td bgcolor="#4047A4" width="1"></td>
          <td> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="36">&nbsp;</td>
              </tr>
            </table>
            <table width="160" border="0" cellspacing="0" cellpadding="0" align="center">
		      <form action="${path}/admin/login.do" name="form1" method="post" onSubmit="return checkform()" autocomplete="off">
              <tr> 
                <td colspan="3" class="news" height="5"><input type=hidden name=method value="one" /></td>
              </tr>
			 
              <tr> 
                <td width="5" class="nwes" height="36"></td>
                <td width="56" class="font1" height="36"><font color="#CFD1E8">用户名</font></td>
                <td> 
		            <input type="text" id="username" name="username" size="15" class=input  onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                              onkeyup="value=value.replace(/[\W]/g,'')"/>
                </td>
              </tr>
              <tr> 
                <td class="nwes" height="36">&nbsp; </td>
                <td class="font1" height="36"><font color="#CFD1E8">密　码</font></td>
                <td> 
		            <input type="password" id="password" name="password" value="" size="15" class=input onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                              onkeyup="value=value.replace(/[\W]/g,'')">
                </td>
              </tr>
              <tr> 
                <td class="nwes" height="36">&nbsp; </td>
                <td class="font1" height="36"><font color="#CFD1E8">验证码</font></td>
                <td> 
		            <input type="text" id="yzm" name="yzm" value="" size="9" maxlength="4" class=input onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                              onkeyup="value=value.replace(/[\W]/g,'')"><%=code%>
                </td>
              </tr>
              <tr> 
                <td height="5" colspan="3"></td>
              </tr>
              <tr> 
                <td>&nbsp; </td>
                <td align="center">&nbsp; </td>
                <td> 
                  <input type="image" border="0" name="imageField" src="${path}/images/bt_login.gif" width="70" height="16">
                </td>
              </tr>
			  </form>	
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="36">&nbsp;</td>
              </tr>
            </table>
          </td>
          <td bgcolor="#4047A4" width="1"></td>
        </tr>
      </table>
      <table width="280" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td bgcolor="#4047A4" height="1"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>

<script type="text/javascript">

	function checkform()
	{
		var flag=true;
		if($("#username").val()==""){alert("请输入用户名!");return false};
		if($("#password").val()==""){alert("请输入口令!");return false};
		if($("#yzm").val()==""){alert("请输入验证码!");return false};
		if($("#yzm").val()!="<%=code%>"){alert("验证码错误!");return false};
		return flag;
	}

</script>
