
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
    <title>Title</title>
</head>

<FRAMESET border=0 frameSpacing=0 rows=65,*,33 frameBorder=0>
    <FRAME name=FrameTop src="${pageContext.request.contextPath}/admins/iframe/top.jsp" frameBorder=no noResize scrolling=no />
    <FRAMESET border=0 name=FrameMain frameSpacing=0 frameBorder=0 cols=165,*>
        <FRAME name=LeftFrame marginWidth=0 marginHeight=0 src="${pageContext.request.contextPath}/admins/iframe/left.jsp" frameBorder=no scrolling=no />
        <FRAMESET border=0 frameSpacing=0 rows=*,26 frameBorder=0>
            <FRAME name=MainFrame marginWidth=0 marginHeight=0 src="${pageContext.request.contextPath}/admins/iframe/main.jsp" frameBorder=no noResize scrolling=yes />
            <FRAME name=BottomFrame marginWidth=0 marginHeight=0 src="${pageContext.request.contextPath}/admins/iframe/help.jsp" frameBorder=no scrolling=no />
        </FRAMESET>
    </FRAMESET>
    <FRAME name=FrameBottom marginWidth=0 marginHeight=0 src="${pageContext.request.contextPath}/admins/iframe/foot.jsp" frameBorder=no noResize scrolling=no />
</FRAMESET>
</html>
