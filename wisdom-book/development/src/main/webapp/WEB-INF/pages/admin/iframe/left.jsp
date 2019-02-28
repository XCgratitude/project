<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<LINK href="${pageContext.request.contextPath}/images/Admin_Style.css" rel=stylesheet>
<SCRIPT language="JavaScript" type="text/JavaScript">
    <!--
    var array = new Array();//数字顺延
    array[0]=1;array[1]=2;array[2]=3;array[3]=4;
    function expand(id_value){
        var tmp;
        eval("tmp=document.getElementById('id_"+id_value+"').style.display");
        if(tmp==''){
            eval("document.getElementById('id_"+id_value+"').style.display='none'");
        }else{
            for(i=0;i<array.length;i++){
                eval("document.getElementById('id_"+array[i]+"').style.display='none'");
            }
            eval("document.getElementById('id_"+id_value+"').style.display=''");
        }
    }
    //-->
</SCRIPT>

<BODY  oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=${pageContext.request.contextPath}/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">
<TABLE bgColor=#eef8fe  class=HeaderTdStyle height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
    <TR>
        <TD vAlign=top align=middle>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD align=middle ><IMG height=17 src="${pageContext.request.contextPath}/images/sys.gif" width=21>
                        <a href="${pageContext.request.contextPath}/admin/main.do" target="MainFrame">管理首页</a>
                    </TD>
                </TR>
                </TBODY>
            </TABLE>
            <TABLE  bgColor=#eef8fe   height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD vAlign=top height="100%">
                        <DIV style="OVERFLOW: auto; WIDTH: 100%; HEIGHT: 96%" align=center>
                            <TABLE  bgColor=#eef8fe cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
                                <TBODY>
                                <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
                                    <TD noWrap width="35%">
                                        <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(1)>
                                            <TR>
                                                <TD height="31" background="${pageContext.request.contextPath}${pageContext.request.contextPath}/images/linkbg1.gif">&nbsp;</td>
                                                <TD background="${pageContext.request.contextPath}/images/linkbg1.gif" >&nbsp;<IMG src="${pageContext.request.contextPath}/images/menu.gif" align=absMiddle>管理员设置</TD></TR>
                                        </TABLE>
                                        <TABLE width="100%" border="0" align="center" id=id_1 style="display:none">
                                            <TR>
                                                <TD noWrap width="35%"><IMG src="${pageContext.request.contextPath}/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default">
                                <a href="${pageContext.request.contextPath}/admin/admin.do" target="MainFrame">管理员设置</a></SPAN></TD></TR>
                                            <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
                                                <TD noWrap width="35%"><IMG src="${pageContext.request.contextPath}/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default"> <a href="${pageContext.request.contextPath}/admin/loginLog.do" target="MainFrame">后台登录日志</a></SPAN></TD></TR>
                                        </TABLE>
                                    </TD>
                                </TR>

                                <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
                                    <TD noWrap width="35%">
                                        <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(2)>
                                            <TR>
                                                <TD height="31" background="${pageContext.request.contextPath}/images/linkbg1.gif">&nbsp;</td>
                                                <TD background="${pageContext.request.contextPath}/images/linkbg1.gif" >&nbsp;<IMG src="${pageContext.request.contextPath}/images/menu.gif" align=absMiddle>商品管理</TD></TR>
                                        </TABLE>
                                        <TABLE width="100%" border="0" align="center" id=id_2 style="display:none">
                                            <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
                                                <TD noWrap width="35%"><IMG src="${pageContext.request.contextPath}/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default"> <a href="${pageContext.request.contextPath}/product/adminProductList.do" target="MainFrame">商品列表</a></SPAN></TD></TR>
                                            <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
                                                <TD noWrap width="35%"><IMG src="${pageContext.request.contextPath}/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default"> <a href="${pageContext.request.contextPath}/product/adminProductAddPage.do" target="MainFrame">商品添加</a></SPAN></TD></TR>
                                        </TABLE>
                                    </TD>
                                </TR>
                                <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
                                    <TD noWrap width="35%">
                                        <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(3)>
                                            <TR>
                                                <TD height="31" background="${pageContext.request.contextPath}/images/linkbg1.gif">&nbsp;</td>
                                                <TD background="${pageContext.request.contextPath}/images/linkbg1.gif" >&nbsp;<IMG src="${pageContext.request.contextPath}/images/menu.gif" align=absMiddle>订单管理</TD></TR>
                                        </TABLE>
                                        <TABLE width="100%" border="0" align="center" id=id_3 style="display:none">
                                            <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
                                                <TD noWrap width="35%"><IMG src="${pageContext.request.contextPath}/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default"> <a href="${pageContext.request.contextPath}/order/adminOrderNoPay.do" target="MainFrame">待付款单</a></SPAN></TD></TR>
                                            <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
                                                <TD noWrap width="35%"><IMG src="${pageContext.request.contextPath}/images/bullet.gif"
                                                                            align=absMiddle><SPAN style="CURSOR: default"> <a href="${pageContext.request.contextPath}/order/adminOrderYesPay.do" target="MainFrame">已付款单</a></SPAN></TD></TR>
                                        </TABLE>
                                    </TD>
                                </TR>
                                <TR ParentID="SystemLastArticle" AllParentID="SystemLastArticle">
                                    <TD noWrap width="35%">
                                        <TABLE width="100%" border="0" align="center"style="cursor:hand" onclick=javascript:expand(4)>
                                            <TR>
                                                <TD height="31" background="${pageContext.request.contextPath}/images/linkbg1.gif">&nbsp;</td>
                                                <TD background="${pageContext.request.contextPath}/images/linkbg1.gif" >&nbsp;<IMG src="${pageContext.request.contextPath}/images/menu.gif" align=absMiddle>会话聊天</TD></TR>
                                        </TABLE>
                                        <TABLE width="100%" border="0" align="center" id=id_4 style="display:none">
                                            <TR ParentID="ConventionLastPic" AllParentID="ConventionLastPic">
                                                <TD noWrap width="35%"><IMG src="${pageContext.request.contextPath}/images/bullet.gif"align=absMiddle>
                                                    <SPAN style="CURSOR: default">
                                                        <a href="${pageContext.request.contextPath}/index1.jsp" target="MainFrame">会话聊天</a>
                                                    </SPAN>
                                                </TD>
                                            </TR>
                                        </TABLE>
                                    </TD>
                                </TR>
                                </TBODY>
                            </TABLE>
                        </DIV>

                    </TD>
                </TR>
                </TBODY>
            </TABLE>
        </TD></TR>
    </TBODY>
</TABLE>
</BODY>

</html>
