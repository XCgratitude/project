<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<HTML><HEAD><TITLE>后台操作区</TITLE>
	<LINK href="${pageContext.request.contextPath}/images/Admin_Style.css" type=text/css rel=stylesheet>
	<LINK href="${pageContext.request.contextPath}/images/style.css" type=text/css rel=stylesheet>
	<LINK href="${pageContext.request.contextPath}/res/css/style.css" type=text/css rel=stylesheet />
	<SCRIPT language=JavaScript src="${pageContext.request.contextPath}/images/Common.js"></SCRIPT>
	<script language="javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" ></script>
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
</script>

<script type="text/javascript">
    $(function() {
        $("#checkedAll").click(function(){
            /*if(this.checked){
                $("input[name='checkbox_name']").attr('checked', true)
            }else{
                $("input[name='checkbox_name']").attr('checked', false)
            }*/
            if(this.checked){
                $("#list :checkbox").prop("checked", true);
            }else{
                $("#list :checkbox").prop("checked", false);
            }
        });
    });

    function del() {
        var arr = [];
        $("input[name='checkbox_name']:checked").each(function () {
            arr.push($(this).val());
        });
        if(arr.length == 0){
            alert("请选择要删除的项！");
        }else{
            if(confirm("您确定要删除？")){
                location.href = "${pageContext.request.contextPath}/product/delete.do?ids="+arr;
            }
        }
    }
</script>
<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0
	  background=${pageContext.request.contextPath}/images/MainBg.gif topMargin=0 scroll=yes
	  marginheight="0" marginwidth="0">
<div><div class="content">
	<div class="loc icon"><samp class="t12"></samp>当前位置：登录日志&nbsp;&raquo;&nbsp;<span class="gray"></span></div>

</div></div>
<div>
	<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0 id="list">
		<TBODY>
		<TR>
			<TD align="left" vAlign=top >
				<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
					<TR align="center" class=head>
						<TD height=23 align="center">序号</TD>
						<TD align="center" >管理员</TD>
						<TD align="center">密码</TD>
						<TD align="center">登录时间</TD>
						<TD align="center">登录IP</TD>
						<TD align="center">操作系统</TD>
						<TD align="center">结果</TD>
						<TD align="center">选择</TD>
					</TR>

					<%--   <script type="text/JavaScript">
                           function allch()
                           {
                               document.pageform.checkit(i).checked=document.pageform.checkall.checked;
                           }</script>--%>
					<c:forEach items="${productList}" var="products" varStatus="count">
						<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'" >
							<td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"></td>
							<td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"></td>
							<td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"></td>
							<td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"></td>
							<td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"></td>
							<td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"></td>
							<td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"></td>
							<td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><input type="checkbox" name="checkbox_name" value="${products.id}"></td>
						</tr>
					</c:forEach>
					<TR align="right" >
						<TD colspan="10" id=map>
							<input type="checkbox" name="checkedAll" id="checkedAll">&nbsp;全选&nbsp;&nbsp;&nbsp;&nbsp;
						</TD>
					</TR>
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
</div>

</BODY>
</html>
