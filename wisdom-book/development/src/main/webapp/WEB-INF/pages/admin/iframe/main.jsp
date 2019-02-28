<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="${pageContext.request.contextPath}/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="${pageContext.request.contextPath}/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="${pageContext.request.contextPath}/images/Common.js"></SCRIPT>
<STYLE type=text/css>BODY {
    MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
</STYLE>
<META content="MSHTML 6.00.2900.3243" name=GENERATOR>
</HEAD>
<%--<%
    java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    java.util.Date currentTime = new java.util.Date();
    String time = simpleDateFormat.format(currentTime).toString();
%>--%>
<BODY  oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=${pageContext.request.contextPath}/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
    <TR>
        <TD vAlign=top height="50%">
            <TABLE class=topdashed cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD height=25>&nbsp;&nbsp;<FONT color=red></FONT>
                        您好[<FONT color=red>${admin.username}</FONT>]，欢迎进入网站后台管理系统！
                        您的身份：<FONT color=red>${admin.identity == 1 ? "超级管理员" : "普通管理员"}</FONT>
                        登录次数：${admin.loginNum}次
                        <%--<jsp:useBean id="time" class="java.util.Date"/>--%>
                        本次登录时间：${time}
                    </TD>
                </TR>
                </TBODY>
            </TABLE>
            <BR>
            <TABLE cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
                <TBODY>
                <TR>
                    <TD height=10>
                        <DIV align=center>
                            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                <TBODY>

                                <TR>
                                    <TD colspan="3" width=100%>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD colspan="3">
                                        <TABLE class=tablewidth cellSpacing=1 cellPadding=3 width="100%" border=0>
                                            <TBODY>
                                            <TR class=head>
                                                <TD colSpan=2 height=23>服 务 器 信 息</TD></TR>
                                            <TR bgColor=#ffffff>
                                                <TD id=map width="50%">服务器解译引擎： </TD>
                                                <TD id=map width="50%">服务器所在时间： </TD></TR>
                                            <TR bgColor=#ffffff>
                                                <TD id=map width="50%">JDK版本： </TD>
                                                <TD id=map width="50%">服务器名（IP）： </TD></TR>
                                            <TR bgColor=#ffffff>
                                                <TD id=map width="50%">JAVA虚拟机名称： </TD>
                                                <TD id=map width="50%">服务器端口:</TD></TR>
                                            <TR bgColor=#ffffff>
                                                <TD id=map width="50%">服务器操作系统： </TD>
                                                <TD id=map width="50%">网站所在磁盘物理位置： </TD></TR>
                                            <TR bgColor=#ffffff>
                                                <TD id=map width="50%">服务器时区: </TD>
                                                <TD id=map width="50%">当前文件: </TD></TR>
                                            <TR bgColor=#ffffff>
                                                <TD id=map width="50%">HTTP解译引擎: </TD>
                                                <TD id=map width="50%">你的IP：</TD></TR>
                                            <TR bgColor=#ffffff>
                                                <TD id=map width="50%">当前用户:</TD>
                                                <TD id=map width="50%">当前域名：</TD></TR></TBODY></TABLE></TD></TR>
                                <TR><TD colspan="3">
                                </TD></TR>
                                <TR><TD colspan="3">

                                </TD>
                                </TR>
                                </TBODY>
                            </TABLE>
                        </DIV>
                    </TD>
                </TR>
                </TBODY>
            </TABLE>
        </TD>
    </TR>
    </TBODY>
</TABLE>
</BODY>
</html>
