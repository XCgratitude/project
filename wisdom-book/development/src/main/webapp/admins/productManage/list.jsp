
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<HTML><HEAD><TITLE>后台操作区</TITLE>
    <LINK href="${pageContext.request.contextPath}/images/Admin_Style.css" type=text/css rel=stylesheet>
    <LINK href="${pageContext.request.contextPath}/images/style.css" type=text/css rel=stylesheet>
    <LINK href="${pageContext.request.contextPath}/res/css/style.css" type=text/css rel=stylesheet />
    <SCRIPT language=JavaScript src="${pageContext.request.contextPath}/images/Common.js"></SCRIPT>
    <STYLE type=text/css>
        BODY {
            MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
        }
        .STYLE1 {color: #ECE9D8}
    </STYLE>
</HEAD>
<script  language="javascript" >
    function top(){
        form3.action="/news/index.jsp?page=1";
        form3.submit();
    }
    function last(){
        if(form3.pageCount.value==0){//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
            form3.action="/news/index.jsp?page=1";
            form3.submit();
        }else{
            form3.action="/news/index.jsp?page="+form3.pageCount.value;
            form3.submit();
        }
    }
    function pre(){
        var page=parseInt(form3.page.value);
        if(page<=1){
            alert("已至第一页");
        }else{
            form3.action="/news/index.jsp?page="+(page-1);
            form3.submit();
        }
    }

    function next(){
        var page=parseInt(form3.page.value);
        var pageCount=parseInt(form3.pageCount.value);
        if(page>=pageCount){
            alert("已至最后一页");
        }else{
            form3.action="/news/index.jsp?page="+(page+1);
            form3.submit();
        }
    }
    function bjump(){
        var pageCount=parseInt(form3.pageCount.value);
        if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
            alert("跳转文本框中只能输入数字!");
            form3.busjump.select();
            form3.busjump.focus();
            return false;
        }
        if(form3.busjump.value>pageCount){//如果跳转文本框中输入的页数超过最后一页的数，则跳到最后一页
            if(pageCount==0){
                form3.action="/news/index.jsp?page=1";
                form3.submit();
            }
            else{
                form3.action="/news/index.jsp?page="+pageCount;
                form3.submit();
            }
        }
        else if(form3.busjump.value<=pageCount){
            var page=parseInt(form3.busjump.value);
            if(page==0){
                page=1;//如果你输入的是0，那么就让它等于1
                form3.action="/news/index.jsp?page="+page;
                form3.submit();
            }else{
                form3.action="/news/index.jsp?page="+page;
                form3.submit();
            }

        }

    }
    //****判断是否是Number.
    function fIsNumber (sV,sR){
        var sTmp;
        if(sV.length==0){ return (false);}
        for (var i=0; i < sV.length; i++){
            sTmp= sV.substring (i, i+1);
            if (sR.indexOf (sTmp, 0)==-1) {return (false);}
        }
        return (true);
    }
    function del()
    {
        pageform.submit();
    }
</script>

<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0
      background=${pageContext.request.contextPath}/images/MainBg.gif topMargin=0 scroll=yes
      marginheight="0" marginwidth="0">
<div><div class="content">
    <div class="loc icon"><samp class="t12"></samp>当前位置：商品管理&nbsp;&raquo;&nbsp;<span class="gray">品牌管理</span></div>

    <div class="page_c">

        <span class="r inb_a">
            <a href="${path }/shop/item/addbrand.jsp" title="添加" class="btn80x20">添加</a>
        </span>
    </div>
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
    <TR>
        <TD align="left" vAlign=top >
            <table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
                <tr class="head">
                    <td width="5%" align="center">ID </td>
                    <td  align="center">标题</td>
                    <td  align="center">缩略图</td>
                    <td  align="center">发布时间</td>
                    <td  align="center">发布人</td>
                    <td  align="center">是否显示</td>
                    <td  align="center">点击率</td>
                    <td  align="center">修改</td>
                    <td  align="center">选择</td>
                </tr>

                <script type="text/JavaScript">
                    function allch()
                    {
                        document.pageform.checkit(i).checked=document.pageform.checkall.checked;
                    }
                </script>

                <form action="Common.shtml?method=DELNEWS" method="post" name="pageform">

                    <tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'">
                        <td width='5%' align="center" style="border-bottom:1px dotted #ccc;"></td><input type="hidden" name="id" value="" >
                        <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="newsinfo.jsp?id=" target="_blank"></a> </td>
                        <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="newsinfo.jsp?id=" target="_blank"></a> </td>
                        <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"></td>
                        <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"></td>
                        <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="Common.shtml?method=HIDENEWS&id="></a></td>
                        <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"></td>
                        <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="${pageContext.request.contextPath}/admins/productManage/addProduct.jsp" >修改</a> </td>
                        <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><input type="checkbox" name="checkit" value=""></td>
                    </tr>

                    <TR align="right" >
                        <TD colspan="10" id=map>
                            <input type="checkbox" name="checkall" onClick="allch()" >&nbsp;全选&nbsp;&nbsp;&nbsp;&nbsp;
                        </TD>
                    </TR>
                </form>
                </TBODY>
            </TABLE>
        </td>
    </tr>
    <tr bgcolor='#FFFFFF'>
        <td colspan='10' align='right'>
            <TABLE width="100%" border=0 align="right" cellPadding=0 cellSpacing=0>
                <TBODY>
                <TR align="right" >
                    <TD >
                        <form action="" method="post" name="form3">
                            <input type="hidden" name="pageCount" value="" /><!--//用于给上面javascript传值-->
                            <input type="hidden" name="page" value="" /><!--//用于给上面javascript传值-->
                            <a href="#" onClick="top()"><img src="${pageContext.request.contextPath}/images/first.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
                            <a href="#" onClick="pre()"><img src="${pageContext.request.contextPath}/images/pre.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
                            共100条记录,共计10页,当前第1页&nbsp;&nbsp;&nbsp;
                            <a href="#" onClick="next()"><img src="${pageContext.request.contextPath}/images/next.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
                            <a href="#" onClick="last()"><img src="${pageContext.request.contextPath}/images/last.gif" border="0" /></a>
                            第<input name="busjump" type="text" size="3" />页<a href="#" onClick="bjump()"><img src="${pageContext.request.contextPath}/images/jump.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
                        </form>
                    </TD>
                </TR>
            </table>
        </TD>
    </TR><TR>
        <TD align="center" vAlign=top >
            <TABLE  align="center" vAlign=top width="100%" border=0 align="center" cellPadding=3 cellSpacing=1>
                <TBODY>
                <TR align="center" class=head>
                    <TD >
                        <input type="button" name="button" value="删除" onClick="del()" >
                    </TD>
                </TR>
                </TBODY>
            </TABLE>
        </TD>
    </TR>
    </TBODY>
</TABLE>
</div></div>
</BODY>
</html>
