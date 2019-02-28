<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<HTML><HEAD><TITLE>后台操作区</TITLE>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
    <LINK href="${pageContext.request.contextPath}/images/Admin_Style.css" type=text/css rel=stylesheet>
    <LINK href="${pageContext.request.contextPath}/images/style.css" type=text/css rel=stylesheet>
    <script language="javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" ></script>
    <%--<SCRIPT language=JavaScript type="text/javascript" src="${pageContext.request.contextPath}/images/Common.js"></SCRIPT>--%>
    <STYLE type=text/css>
        BODY {
            MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
        }
        .STYLE1 {color: #ECE9D8}
    </STYLE>
</HEAD>
<script type="text/javascript">
    function checkUser()
    {
        if(document.form1.add.checked)
        {
            if(document.form1.username.value=="")
            {
                alert("请输入管理员名！");
                document.form1.username.focus();
                return false;
            }
            if(document.form1.username.value.length<6||document.form1.username.value.length>10)
            {
                alert("管理员名在6-10位之间！");
                document.form1.username.focus();
                return false;
            }

            if(document.form1.password.value=="")
            {
                alert("请输入管理员登录密码！");
                document.form1.password.focus();
                return false;
            }
            if(document.form1.password.value.length<6||document.form1.password.value.length>16)
            {
                alert("密码在6-16位之间！");
                document.form1.password.focus();
                return false;
            }
            if(document.form1.adminStatus.value=="")
            {
                alert("请选择设定状态！");
                document.form1.adminStatus.focus();
                return false;
            }

            /*if(document.form1.username.value != ""){
                alert(1111);
                var val = document.form1.username.value;
                $.ajax({
                    "url":"${pageContext.request.contextPath}/admin/nameIfExist.do",
                    "data":{
                        adminName:val
                    },
                    "type":"POST",
                    "success":function (data) {
                        if(data){
                            alert("名字已存在！");
                            document.form1.username.focus();
                            return false;
                        }
                    },
                    "error":function () {
                        alert("服务器繁忙，请稍后重试");
                    },
                    "dataType":"text",
                });
            }*/
            document.form1.ra.value="add";
        }

        if(document.form1.update.checked)
        {
            if(document.form1.password.value!="")
            {
                if(document.form1.password.value.length<6||document.form1.password.value.length>16)
                {
                    alert("密码在6-16位之间！");
                    document.form1.password.focus();
                    return false;
                }
            }
            if(document.form1.adminStatus.value=="")
            {
                alert("请选择设定状态！");
                document.form1.adminStatus.focus();
                return false;
            }
            document.form1.ra.value="update";
        }
    }

    function deleteAdmin(identity, id)
    {
        if(identity == 1){
            if(confirm("确定要删除此管理员？")){
                location.href="${path}/admin/deleteAdmin.do?id="+id;
            }
        }else {
            alert("权限不够！需要超级管理员身份");
        }
    }


</script>
<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=${pageContext.request.contextPath}/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
    <TR>
        <TD align="left" vAlign=top >
            <form action="${path}/admin/addAdmin.do" method="post" name="form1" onSubmit="return checkUser()">
                <TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
                    <TBODY>
                    <TR align="center" class=head>
                        <TD height=23>序号</TD>
                        <TD>校方验证管理员名</TD>
                        <TD>创建时间</TD>
                        <TD>状态</TD>
                        <TD>登录次数</TD>
                        <TD>删除</TD>
                    </TR>

                    <c:forEach items="${admins}" var="admins" varStatus="count">
                        <TR onClick=OnclikeTable(this) align="center" bgColor=#ffffff>
                            <TD width="30" id=map>${count.count}</TD>
                            <TD id=map>${admins.username}</TD>
                            <TD id=map><fmt:formatDate value="${admins.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></TD>
                            <TD id=map>${admins.adminStatus}</TD>
                            <TD id=map>${admins.loginNum}</TD>
                            <TD id=map><a href="javaScript:void(0)" onclick="deleteAdmin(${admin.identity},${admins.id})">删除</a></TD>
                        </TR>
                    </c:forEach>
                    <TR align="center" bgColor=#ffffff>
                        <TD colspan=8 align=center id=map>当前还没有添加校方验证管理员</TD>
                    </TR>

                    </TBODY>
                </TABLE><br>
                <TABLE width="40%" border=0 align="center" cellPadding=3 cellSpacing=1>
                    <TR><TD>
                        <TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
                            <TBODY>
                            <TR align="center" class=head>
                                <TD height=23 colspan="2">增加/修改校方验证管理员</TD>
                            </TR>
                            <TR  align="center" bgColor=#ffffff>
                                <TD width="40%" align="right" id=map>管理员名：</TD><input type=hidden name=ra value="">
                                <TD width="60%" align="left" id=map><input type="text" name="username" value="<%=request.getAttribute("username")==null?"":request.getAttribute("username")%>" maxlength="10" size="18" class=input  onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                                                                           onkeyup="value=value.replace(/[\W]/g,'')"/>&nbsp;字母或数字6-10位</TD>
                            </TR>
                            <TR align="center" bgColor=#ffffff>
                                <TD align="right" id=map>登录密码：</TD>
                                <TD align="left" id=map><input type="text" name="password" maxlength="16" size="18" class=input  onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                                                               onkeyup="value=value.replace(/[\W]/g,'')"/>&nbsp;字母或数字6-16位</TD>
                            </TR>
                            <TR align="center" bgColor=#ffffff>
                                <TD align="right" id=map>当前状态：</TD>
                                <TD align="left" id=map><select name="adminStatus">
                                    <option value="">--请选择--</option>
                                    <option value="在用">在用</option>
                                    <option value="冻结">冻结</option>
                                </select></TD>
                            </TR>
                            <TR align="center" bgColor=#ffffff>
                                <TD align="right" id=map>操作类型：</TD>
                                <TD align="left" id=map><input type="radio" name="add" value="add"   >增加&nbsp;
                                    <input type="radio" name="update" value="update"  disabled=true>修改</TD>
                            </TR>
                            <TR align="center" bgColor=#ffffff>
                                <TD colspan="2" align="center" id=map><input type="submit" value="确定">&nbsp;&nbsp;<input type="reset" value="重填"></TD>
                            </TR>
                            </TBODY>
                        </TABLE>
                    </TD></TR></table><br>
                <TABLE align="center" width="80%" border="0">
                    <TR align="center" valign="top">
                        <TD align="left"><div align="left">注意：1、如增加校方验证管理员，请直接输入管理员名和登录密码，并选择管理级别和使用状态，选中“增加”按钮，确定即可。<br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、如修改校方验证管理员信息，请用鼠标点击管理员名，页面中部文本框会自动显示该管理员信息，修改后注意保持“修改”按钮为选中状态，确定即可。<br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3、如不修改登录密码，请保持密码框为空。<br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4、如想删除某校方验证管理员，直接用鼠标点击表格后的“删除”文字即可。	<br>
                        </div></TD>
                    </TR>
                </TABLE>
            </form>
        </TD>
    </TR>
    </TBODY>
</TABLE>
</BODY>
</html>
