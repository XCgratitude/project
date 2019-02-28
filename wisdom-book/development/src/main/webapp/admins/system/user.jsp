<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<HTML><HEAD><TITLE>后台操作区</TITLE>
    <LINK href="${pageContext.request.contextPath}/images/Admin_Style.css" type=text/css rel=stylesheet>
    <LINK href="${pageContext.request.contextPath}/images/style.css" type=text/css rel=stylesheet>
    <SCRIPT language=JavaScript src="${pageContext.request.contextPath}/images/Common.js"></SCRIPT>
    <STYLE type=text/css>
        BODY {
            MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
        }
        .STYLE1 {color: #ECE9D8}
    </STYLE>
</HEAD>
<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=${pageContext.request.contextPath}/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
    <TR>
        <TD align="left" vAlign=top >
            <form action="/Admin.shtml?method=manager" method="post" name="form1" onSubmit="return checkUser()">
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

                    <TR onClick=OnclikeTable(this) align="center" bgColor=#ffffff>
                        <TD width="30" id=map></TD>
                        <TD id=map></TD>
                        <TD id=map></TD>
                        <TD id=map></TD>
                        <TD id=map></TD>
                        <TD id=map><a href="Admin.shtml?method=delm&id=">删除</a></TD>
                    </TR>

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
                                <TD align="left" id=map><select name="isuse">
                                    <option value="">--请选择--</option>
                                    <option value="在用">在用</option>
                                    <option value="冻结">冻结</option>
                                </select></TD>
                            </TR>
                            <TR align="center" bgColor=#ffffff>
                                <TD align="right" id=map>操作类型：</TD>
                                <TD align="left" id=map><input type="radio" name="add" value="add" checked>增加&nbsp;<input type="radio" name="update" value="update"  disabled=true>修改</TD>
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
