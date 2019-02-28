<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>电子书城</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
</head>
<%
	String s = (String) request.getAttribute("spike");
	if (s == "1"){
		out.println("<script type=\"text/javascript\">");
		out.println("alert('已被抢购完！');");
		out.println("</script>");
	}
%>
<body class="main">
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath}/product/index.do">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="${pageContext.request.contextPath}/product/productList.do">&nbsp;计算机</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${product.name}
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<img src="${pageContext.request.contextPath}/ad/page_ad.jpg" width="645" height="84" />
								<table width="100%%" border="0" cellspacing="0">
									<tr>
										<td width="30%">
											<div class="divbookcover">
												<p>
													<img src="${pageContext.request.contextPath}${product.imgUrl}"
														width="213" height="269" border="0" />
												</p>
											</div>
											<div style="text-align:center; margin-top:25px">
												<a href="javascript:void(0);" onclick="successTime(${product.id})">
													<img src="${pageContext.request.contextPath}/images/qianggou.png" border="0"/>
												</a>
											</div></td>
										<td style="padding:20px 5px 5px 5px"><img
											src="${pageContext.request.contextPath}/images/miniicon3.gif" width="16" height="13" /><font
											class="bookname">&nbsp;&nbsp;${product.name}</font>

										<hr />售价：<font color="#FF0000">￥${product.price}</font>
										<hr /> 类别：${product.category}
										<hr />
										<p><b>内容简介：</b></p> ${product.description}
										<b/>
										<b/>
										<hr /><font color="#FF0000" size="5">秒杀倒计时：</font>
											<%--<jsp:include page="time.jsp" />--%>
											<%@include file="time.jsp"%>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

	<jsp:include page="foot.jsp" />

</body>
</html>
