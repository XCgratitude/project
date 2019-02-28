<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<link href="${pageContext.request.contextPath}/css/sys.css" type="text/css" rel="stylesheet" />

</head>

<body >
 <table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="topg"></td>
  </tr>
</table>

<table border="0" cellspacing="0" cellpadding="0"  class="wukuang"width="100%">
  <tr>
    <td width="1%"><img src="${pageContext.request.contextPath}/images/tleft.gif"/></td>
    <td width="39%" align="left">[职务管理]</td>
   
    <td width="57%"align="right">
    	<%--添加专业 --%>
       <s:a namespace="/" action="professionAction_addAndEdit">
       	<img src="${pageContext.request.contextPath}/images/button/tianjia.gif" />
       </s:a>
      
    </td>
    <td width="3%" align="right"><img src="${pageContext.request.contextPath}/images/tright.gif"/></td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" style="margin-top:5px;">
  <tr>
    <td ><img src="${pageContext.request.contextPath}/images/result.gif"/></td>
  </tr>
</table>

<table width="100%" border="1" >
  
  <tr class="henglan" style="font-weight:bold;">
    <td width="6%" align="center">院系名称</td>
    <td width="6%" align="center">专业名称</td>
    <td width="7%" align="center">编辑</td>
  </tr>
  	<s:iterator value="#pageBean.data" status="profession">
  	<tr class="tabtd1">
	    <td align="center"><s:property value="department.name"/> </td>
	    <td align="center"><s:property value="name"/> </td>
	  	<td width="7%" align="center">
	  		<s:a namespace="/" action="professionAction_addAndEdit">
	  		<s:param name="professionId" value="professionId"></s:param>
	  		<img src="${pageContext.request.contextPath}/images/button/modify.gif" class="img" /></s:a>
	  	</td>
	  </tr>
  </s:iterator>
</table>

<s:form namespace="/" action="professionAction_findAll">
	<s:hidden id="currentPage" name="currentPage" value="1"></s:hidden>
</s:form>
<table border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="right">
    	<span>第<s:property value="#pageBean.currentPage"/>/<s:property value="#pageBean.totalPage"/>页</span>
        <span>
        	<a href="javascript:void(0)" onclick="showPage(<s:property value="1" />, <s:property value="#pageBean.totalPage" />)">[首页]</a>&nbsp;&nbsp;
            <a href="javascript:void(0)" onclick="showPage(<s:property value="#pageBean.currentPage-1" />, <s:property value="#pageBean.totalPage" />)">[上一页]</a>&nbsp;&nbsp;
            <a href="javascript:void(0)" onclick="showPage(<s:property value="#pageBean.currentPage+1" />, <s:property value="#pageBean.totalPage" />)">[下一页]</a>&nbsp;&nbsp;
            <a href="javascript:void(0)" onclick="showPage(<s:property value="#pageBean.totalPage" />, <s:property value="#pageBean.totalPage" />)">[尾页]</a>
        </span>
    </td>
  </tr>
</table>
<script type="text/javascript">
	function showPage(num,total){
		if(num>0 && num <= total){
			document.getElementById("currentPage").value = num;
			document.forms[0].submit();
		}
	}
</script>
</body>
</html>
