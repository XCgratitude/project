<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
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
    <td width="39%" align="left">[员工管理]</td>
   
    <td width="57%"align="right">
    	<%--高级查询 --%>
		<a href="javascript:void(0)" onclick="document.forms[0].submit();"><img src="${pageContext.request.contextPath}/images/button/gaojichaxun.gif" /></a>
    	<%--员工注入 --%>
	  	<s:a namespace="/" action="teacherAction_addAddEdit">
	  		<img src="${pageContext.request.contextPath}/images/button/tianjia.gif" />
	  	</s:a>
      
    </td>
    <td width="3%" align="right"><img src="${pageContext.request.contextPath}/images/tright.gif"/></td>
  </tr>
</table>

<!-- 查询条件：马上查询 -->
<s:form namespace="/" action="teacherAction_findAll">
	<s:hidden id="currentPage" name="currentPage" value="1"></s:hidden>
	<table width="88%" border="0" style="margin: 20px;" >
	  <tr>
	    <td width="40px">院系：</td>
	    <td width="200px">	    	
	    	<s:select list="departmentList" name="department.departmentId"
	    	listKey="departmentId" listValue="name"
	    	headerKey="" headerValue="--请选择院系--">
			</s:select>
		</td>
	<td width="40px">职务：</td>
	    <td width="200px" >
	    	<s:select list="#teacherList" name="job" 
	    		listKey="job" listValue="job"
	    		headerKey="" headerValue="--请选择职业--">
			</s:select>
	    </td>
	    <td width="40px">姓名：</td>
	    <td width="200px" ><s:textfield name="name" size="12"></s:textfield></td>
	    <td ></td>
	  </tr>
	</table>
</s:form>


<table border="0" cellspacing="0" cellpadding="0" style="margin-top:5px;">
  <tr>
    <td ><img src="${pageContext.request.contextPath}/images/result.gif"/></td>
  </tr>
</table>

<table width="100%" border="1" >
  <tr class="henglan" style="font-weight:bold;">
    <td width="10%" align="center">老师姓名</td>
    <td width="6%" align="center">性别</td>
    <td width="12%" align="center">入职时间</td>
    <td width="15%" align="center">所属院系</td>
    <td width="10%" align="center">职务</td>
    <td width="10%" align="center">编辑</td>
  </tr>
  
    
    <s:iterator value="#pageBean.data" status="tl">
	  <tr class="tabtd2"> 
	    <td align="center"><s:property value="name"/></td>
	    <td align="center"><s:property value="gender"/></td>
	    <td align="center"><s:date name="comeDate" format="yyyy-MM-dd" /></td>
	    <td align="center"><s:property value="department.name"/></td>
	    <td align="center"><s:property value="job"/></td>
	  	<td width="7%" align="center">
	  		
	  		<s:a namespace="/" action="teacherAction_addAddEdit">
				<s:param name="teacherId" value="teacherId"></s:param>	  			
	  			<img src="${pageContext.request.contextPath}/images/button/modify.gif" class="img" /></s:a>	
	  	</td>
	  </tr>
	  </s:iterator>
</table>


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
