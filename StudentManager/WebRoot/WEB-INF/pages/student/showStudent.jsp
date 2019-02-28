<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/css/sys.css" type="text/css" rel="stylesheet" />
</head>

<body class="emp_body">
 <table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="topg"></td>
  </tr>
</table>

<table border="0" cellspacing="0" cellpadding="0"  class="wukuang"width="100%">
  <tr>
    <td width="1%"><img src="${pageContext.request.contextPath}/images/tleft.gif"/></td>
    <td width="44%" align="left">[查看正式学员]</td>
   
    <td width="52%"align="right">
    	<!--<a href="listLog.html"><img src="${pageContext.request.contextPath}/images/button/find.gif" class="img"/></a>
        <a href="addLog.html"><img src="${pageContext.request.contextPath}/images/button/add.gif" class="img"/></a>~-->
        
       <!-- <a href="#"><img src="${pageContext.request.contextPath}/images/button/close.gif" class="img"/></a>
       <a href="javascript:void(0)" onclick="document.forms[0].submit()"><img src="${pageContext.request.contextPath}/images/button/save.gif" /></a>
       -->
       <s:a href="javascript:void(0)" onclick="window.history.go(-1)">
       	<img src="${pageContext.request.contextPath}/images/button/tuihui.gif" />
       </s:a>
    </td>
    <td width="3%" align="right"><img src="${pageContext.request.contextPath}/images/tright.gif"/></td>
  </tr>
</table>


<table width="88%" class="emp_table">
	  <tr>
	    <td width="100px" align="left">姓名：</td>
	    <td width="200px" align="left"><s:property value="name"/></td>
	    <td width="80px" align="left">性别：</td>
	    <td align="left"><s:property value="gender"/></td>
	  </tr>
	  <tr>
	    <td align="left">应付学费：</td>
	    <td align="left"><s:property value="mustTuition"/></td>
	    <td align="left">实付学费：</td>
	    <td align="left"><s:property value="actualTuition"/></td>
	  </tr>
	  <tr>
	    <td align="left">身份证号：</td>
	    <td align="left"><s:property value="identity"/></td>
	    <td align="left">手机号：</td>
	    <td align="left"><s:property value="telephone"/></td>
	  </tr>
	  <tr>
	    <td align="left">QQ号：</td>
	    <td align="left"><s:property value="qq"/></td>
	    <td align="left">邮箱：</td>
	    <td align="left"><s:property value="email"/></td>
	  </tr>
	  <tr>
	    <td align="left">专业班级</td>
	    <td align="left">专业:<s:property value="profession.name"/></td>
	    <td align="left">班级:</td>
	    <td align="left"><s:property value="classes"/></td>
	  </tr>
	  <tr>
	  </tr>
	  <tr>
	    <td align="left">身份证地址：</td>
	    <td align="left" colspan="3"><s:property value="identityAddress"/></td>
	  </tr>
	  <tr>
	    <td align="left">在京地址：</td>
	    <td align="left" colspan="3"><s:property value="address"/></td>
	  </tr>
	  <tr>
	    <td align="left">学员描述：</td>
	    <td align="left" colspan="3"><s:property value="remark"/></td>
	  </tr>
	  <tr>
	    <td colspan="6"><br />出门在外，如果发生意外，我们将通过下面的信息跟学院的家长联系</td>
	    </tr>
	   <tr>
	    <td align="left">家庭联系电话：</td>
	    <td align="left"><s:property value="homeTelephone"/></td>
	    <td align="left">家庭联系人：</td>
	    <td align="left"><s:property value="homeContact"/></td>
	  </tr>
	</table>

</html>