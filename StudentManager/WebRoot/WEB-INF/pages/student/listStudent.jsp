<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
    <td width="39%" align="left">[在校学生管理]</td>
   
    <td width="57%"align="right">
    	<%--查询 --%>
		<a href="javascript:void(0)" onclick="document.forms[0].submit();"><img src="${pageContext.request.contextPath}/images/button/gaojichaxun.gif" /></a>
    	<%--添加 --%>
    	<s:a namespace="/" action="studentAction_addOrEdit">
    		<img src="${pageContext.request.contextPath}/images/button/tianjia.gif" />
    	</s:a>
    </td>
    <td width="3%" align="right"><img src="${pageContext.request.contextPath}/images/tright.gif"/></td>
  </tr>
</table>
<!-- 查询条件：添加或选择马上查询 -->
<s:form namespace="/" action="studentAction_selectPage">
	<s:hidden id="currentPage" name="currentPage" value="1"></s:hidden>
	<table width="88%" border="0" style="margin: 20px;" >
	  <tr>
	    <td width="80px">查询条件：</td>
	    <td width="300px"><s:textfield name="name" size="20"></s:textfield>（姓名|电话|QQ|性别）</td>
	    <td width="500px">
	    	院系：
	    	<s:select list="allDepartment" onchange="showProfession(this)"
	    		name="profession.department.departmentId" listKey="departmentId" listValue="name"
	    		headerKey="" headerValue="--选择院系--">
			</s:select>
			
	    	专业：<s:select list="allProfession" id="professionSelectId"
	    		name="profession.professionId" listKey="professionId" listValue="name"
	    		headerKey="" headerValue="--选择专业--">
			</s:select>
	    </td>
	    <td></td>
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

    <td width="10%" align="center">姓名</td>
    <td width="10%" align="center">学号</td>
    <td width="10%" align="center">班级</td>
    <td width="10%" align="center">性别</td>
    <td width="10%" align="center">QQ</td>
    <td width="10%" align="center">联系电话</td>
    <td width="10%" align="center">状态</td>  <!-- 新生、转班、升级、退费、毕业 -->
  	<td width="5%" align="center">编辑</td>
  	<td width="5%" align="center">查看</td>
  </tr>
  <s:iterator value="#pageBean.data" status="sl">
	   <tr class="tabtd1">
		<td align="center"><s:property value="name"/></td>
		<td align="center"><s:property value="studentId"/></td>
		<td align="center"><s:property value="classes"/> </td>
		<td align="center"><s:property value="gender"/></td>
		<td align="center"><s:property value="qq"/> </td>
		<td align="center"><s:property value="telephone"/></td>
		<td align="center">
			新生 
		</td>
		
	    <td align="center">
	    	<s:a namespace="/" action="studentAction_addOrEdit">
				<s:param name="studentId" value="studentId"></s:param><img src="${pageContext.request.contextPath}/images/button/modify.gif" class="img"/></s:a>
	    </td>
	    
    	<!-- 查询详情 -->
		<td align="center">
			<s:a namespace="/" action="studentAction_findById">
				<s:param name="studentId" value="studentId"></s:param>
			<img src="${pageContext.request.contextPath}/images/button/view.gif" class="img"/>
			</s:a>
		</td>
		
</s:iterator>
</table>


<table border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="right">
    	<span>第<s:property value="#pageBean.currentPage"/>/<s:property value="#pageBean.totalPage"/>页</span>
        <span>
        	<a href="javascript:void(0)" onclick="showPage(<s:property value="1" />, <s:property value="#pageBean.totalPage" />)">[首页]</a>&nbsp;&nbsp;
            <a href="javascript:void(0)" onclick="showPage(<s:property value="#pageBean.currentPage-1" />, <s:property value="#pageBean.totalPage" />)">[上一页]</a>&nbsp;&nbsp;
           	<s:iterator var="s" begin="#pageBean.start" end="#pageBean.end" step="1">
           		<a href="javascript:void(0)" onclick="showPage(<s:property value="#s"/>, <s:property value="#pageBean.totalPage" />)">[<s:property value="#s" />]</a>
           	</s:iterator>
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
<script type="text/javascript">
	function showProfession(obj){
			//1 获得选中部门
			var departmentId = obj.value;
			//2 发送ajax，通过部门查询职务
			//2.1 获得引擎
			var xmlhttp=null;
			if (window.XMLHttpRequest){// code for all new browsers
			  xmlhttp=new XMLHttpRequest();
			} else if (window.ActiveXObject) {// code for IE5 and IE6
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}

			//2.2 设置回调函数
			xmlhttp.onreadystatechange = function(){
				//请求完成，正常响应
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					//3 获得数据，并展示 ,手动ajax 获得 json数据 字符串
					var textData = xmlhttp.responseText;
					//3.1 将字符串 手动 转换 json对象
					var jsonData = eval("("+textData+")");
					// 获得select对象
				 	var professionSelectElement = document.getElementById("professionSelectId");
					professionSelectElement.innerHTML = "<option value=''>--选择专业--</option>";
					for(var i = 0; i < jsonData.length; i++){
						var professionObj = jsonData[i];
						//获得专业id
						var professionId = professionObj.professionId;
						//获得专业名称
						var name = professionObj.name;
						//将数显示到select标签
						professionSelectElement.innerHTML += "<option value='"+professionId+"'>"+name+"</option>"
					}
				}
			};
			//2.3 创建连接
			var url = "${pageContext.request.contextPath}/professionAction_findAllWithDepartment?department.departmentId=" + departmentId;
			xmlhttp.open("GET", url);
			//2.4 发送请求
			xmlhttp.send(null);
		}
</script>
</body>
</html>