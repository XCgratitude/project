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
<body class="emp_body">
 <table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="topg"></td>
  </tr>
</table>

<table border="0" cellspacing="0" cellpadding="0"  class="wukuang"width="100%">
  <tr>
    <td width="1%"><img src="${pageContext.request.contextPath}/images/tleft.gif"/></td>
    <td width="44%" align="left">[添加/编辑正式学员]</td>
   
    <td width="52%"align="right">
       <a href="javascript:void(0)" onclick="document.forms[0].submit()"><img src="${pageContext.request.contextPath}/images/button/save.gif" /></a>
       <s:a href="javascript:void(0)" onclick="window.history.go(-1)"><img src="${pageContext.request.contextPath}/images/button/tuihui.gif" /></s:a>
    </td>
    <td width="3%" align="right"><img src="${pageContext.request.contextPath}/images/tright.gif"/></td>
  </tr>
</table>

<s:form namespace="/" action="studentAction_updateStudent">
	<s:hidden name="studentId" value="%{studentId}"></s:hidden>
	<table width="88%" class="emp_table">
	  <tr>
	    <td width="100px" align="left">姓名：</td>
	    <td width="200px" align="left"><s:textfield name="name"></s:textfield></td>
	    <td width="80px" align="left">性别：</td>
	    <td align="left">
	    	<s:radio list="{'男','女'}" name="gender"></s:radio>
	    </td>
	  </tr>
	  <tr>
	    <td align="left">应付学费：</td>
	    <td align="left"><s:textfield name="mustTuition"></s:textfield></td>
	    <td align="left">实付学费：</td>
	    <td align="left"><s:textfield name="actualTuition"></s:textfield></td>
	  </tr>
	  <tr>
	    <td align="left">身份证号：</td>
	    <td align="left"><s:textfield name="identity"></s:textfield></td>
	    <td align="left">手机号：</td>
	    <td align="left"><s:textfield name="telephone"/></td>
	  </tr>
	  <tr>
	    <td align="left">QQ号：</td>
	    <td align="left"><s:textfield name="qq"/></td>
	    <td align="left">邮箱：</td>
	    <td align="left"><s:textfield name="email"/></td>
	  </tr>
	  <tr>
	    <td align="left">院系专业班级：</td>
	    <td align="left" colspan="3">
	    	院系:<s:select list="departmentList" name="profession.department.departmentId"
	    		onchange="showProfession(this)"
	    		listKey="departmentId" listValue="name"
	    		headerKey="" headerValue="--选择院系--"
	    	>
	    	</s:select>
	    	专业:<s:select list="profession != null ? profession.department.professionSet :{}" name="profession.professionId"
	    		id="professionSelectId" onchange="showClasses(this)"
	    		listKey="professionId" listValue="name"
	    		headerKey="" headerValue="--选择专业--"
	    	></s:select>
	    	
	    	班 级:<s:textfield name="classes" id="professionSelectClasses" value="%{classes}"></s:textfield>
	    </td>
	  </tr>
	  <tr>
	  </tr>
	  <tr>
	    <td align="left">身份证地址：</td>
	    <td align="left" colspan="3"><s:textfield name="identityAddress" size="60"/></td>
	  </tr>
	  <tr>
	    <td align="left">在住地址：</td>
	    <td align="left" colspan="3"><s:textfield name="address" size="60"/></td>
	  </tr>
	  <tr>
	    <td align="left">学员描述：</td>
	    <td align="left" colspan="3"><s:textfield name="remark" size="60"/></td>
	  </tr>
	  <tr>
	    <td colspan="6"><br />出门在外，如果发生意外，我们将通过下面的信息跟学院的家长联系</td>
	    </tr>
	   <tr>
	    <td align="left">家庭联系电话：</td>
	    <td align="left"><s:textfield name="homeTelephone"/></td>
	    <td align="left">家庭联系人：</td>
	    <td align="left"><s:textfield name="homeContact"/></td>
	  </tr>
	</table>
</s:form>
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

<script type="text/javascript">
	function showClasses(obj){
			//1 获得选中部门id
			var professionId = obj.value;
			//2 发送ajax，通过部门查询职务
			//2.1 获得引擎
			var xmlhttp=null;
			if (window.XMLHttpRequest){
			  xmlhttp=new XMLHttpRequest();
			} else if (window.ActiveXObject) {
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			//2.2 设置回调函数
			xmlhttp.onreadystatechange = function(){
				//请求完成，正常响应
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					//获取数据
					var textData = xmlhttp.responseText;
					//将字符串装换成Json对象
					var jsonData = eval("("+textData+")");
					//获得select
					var professionSelectClasses = document.getElementById("professionSelectClasses");
					professionSelectClasses.innerHTML = "";
					var professionObj = jsonData[0];
					//获得专业id
					var professionId = professionObj.professionId;
					//获得专业班级
					var classes = professionObj.classes;
					//将数显示到select标签
					professionSelectClasses.value= classes;
				}
			};
			//2.3 创建连接
			var url = "${pageContext.request.contextPath}/professionAction_findClasses?professionId=" + professionId;
			xmlhttp.open("GET", url);
			//2.4 发送请求
			xmlhttp.send(null);
		}
</script>
</html>