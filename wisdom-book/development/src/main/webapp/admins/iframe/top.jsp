<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<STYLE type=text/css>BODY {
    SCROLLBAR-FACE-COLOR: #73a2d6; SCROLLBAR-HIGHLIGHT-COLOR: #73a2d6; SCROLLBAR-SHADOW-COLOR: #73a2d6; SCROLLBAR-3DLIGHT-COLOR: #73a2d6; SCROLLBAR-ARROW-COLOR: #ffffff; SCROLLBAR-TRACK-COLOR: #aabfec; SCROLLBAR-DARKSHADOW-COLOR: #73a2d6
}
.logo {
    FONT-WEIGHT: bold; FONT-SIZE: 36px; COLOR: #73a2d6; FONT-FAMILY: Georgia, "Times New Roman", Times, serif
}
.font_text {
    FONT-SIZE: 12px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
.font_nav_active {
    FONT-WEIGHT: bold; FONT-SIZE: 14px; BACKGROUND-IMAGE: url(images/topnav_active.jpg); COLOR: #ffffff; LINE-HEIGHT: 20px; HEIGHT: 31px; TEXT-DECORATION: none
}
.font_nav_unactive {
    BORDER-RIGHT: 0px solid; BORDER-TOP: #adbbc7 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 14px; BORDER-LEFT: 0px solid; CURSOR: hand; COLOR: #436e9d; LINE-HEIGHT: 20px; BORDER-BOTTOM: #5085c5 1px solid; HEIGHT: 27px; BACKGROUND-COLOR: #f6f8f9; TEXT-DECORATION: none
}
.br_nav {
    BORDER-RIGHT: 0px solid; BORDER-TOP: #adbbc7 1px solid; FONT-SIZE: 14px; BORDER-LEFT: 0px solid; CURSOR: hand; COLOR: #436e9d; LINE-HEIGHT: 20px; BORDER-BOTTOM: #5085c5 1px solid; HEIGHT: 27px; BACKGROUND-COLOR: #f6f8f9; TEXT-DECORATION: none
}
A.white:link {
    FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.white:active {
    FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.white:visited {
    FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.white:hover {
    FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
.button {
    BORDER-RIGHT: #436e9d 1px double; BORDER-TOP: #436e9d 1px double; FONT-SIZE: 12px; BACKGROUND-IMAGE: url(images/bg.gif); BORDER-LEFT: #436e9d 1px double; CURSOR: hand; COLOR: #333333; LINE-HEIGHT: 16px; BORDER-BOTTOM: #436e9d 1px double; TEXT-DECORATION: none
}
A:link {
    FONT-SIZE: 12px; COLOR: #666666; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A:active {
    FONT-SIZE: 12px; COLOR: #666666; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A:visited {
    FONT-SIZE: 12px; COLOR: #666666; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A:hover {
    FONT-SIZE: 12px; COLOR: #f29422; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:link {
    FONT-SIZE: 12px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:active {
    FONT-SIZE: 12px; COLOR: #73a2d6; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:visited {
    FONT-SIZE: 12px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:hover {
    FONT-SIZE: 12px; COLOR: #73a2d6; LINE-HEIGHT: 20px; TEXT-DECORATION: underline
}
</STYLE>
<SCRIPT language=javascript>
    function out(src){
        if(confirm("确定要退出吗？"))	{
            return true;
        }
        return false;
    }
</SCRIPT>
<SCRIPT language=JavaScript src="${pageContext.request.contextPath}/images/Common.js"></SCRIPT>
<SCRIPT language=JavaScript src="${pageContext.request.contextPath}/images/SetFocus.js"></SCRIPT>
</HEAD>
<BODY leftMargin=0 topMargin=0 scroll=no marginheight="0" marginwidth="0">
<TABLE cellSpacing=0 cellPadding=0 width="100%" bgColor=#3a6592 border=0>
    <TBODY>
    <TR>
        <TD height=25>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD><IMG src="${pageContext.request.contextPath}/images/Title.gif"></TD>
                    <TD>
                        <TABLE height="100%" width="100%" border=0>
                            <TBODY>
                            <TR>
                                <TD class=font_text width="40%">
                                    <SCRIPT language=JavaScript src="${pageContext.request.contextPath}/images/date.js"></SCRIPT>
                                </TD>
                                <TD class=font_text style="DISPLAY: none" align=right>
                                    <FONT color=#ffffff></FONT></TD>
                                <TD style="DISPLAY: none" width="40%"></TD>
                                <TD class=font_text align=right>
                                    [<A class=blue href="" target=_blank>网站首页</A>]
                                    [<A class=blue href="/system/editpwd.jsp" target="MainFrame">修改密码</A>]
                                    [<A class=blue onclick="return out(this)" href="/Admin.shtml?method=exit" target=_top>安全退出</A>]
                                </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<TABLE class=HeaderStyle height=30 cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
    <TR>
        <TD width=14 background=${pageContext.request.contextPath}/images/topnav_bg.jpg>&nbsp;</TD>
        <TD vAlign=bottom background=${pageContext.request.contextPath}/images/topnav_bg.jpg>
            <TABLE class=font_nav_active id=TDTT0  cellSpacing=0 cellPadding=0 width=150 border=0>
                <TBODY>
                <TR>
                    <TD >
                        <DIV align=center></DIV></TD></TR></TBODY></TABLE></TD>
    </TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%">
    <TBODY>
    <TR>
        <TD bgColor=#73a3d4 height=6></TD></TR></TBODY></TABLE></BODY>

</html>
