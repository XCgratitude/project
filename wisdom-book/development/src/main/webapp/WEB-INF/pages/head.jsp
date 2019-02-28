 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="divhead">
	<table cellspacing="0" class="headtable">
		<tr>
			<td><a href="${pageContext.request.contextPath}/product/index.do"><img src="${pageContext.request.contextPath}/images/logo.png"
					width="95" height="30" border="0" /> </a></td>
			<td style="text-align:right"><img src="${pageContext.request.contextPath}/images/cart.gif"
				width="26" height="23" style="margin-bottom:-4px" />&nbsp;<a
				href="${pageContext.request.contextPath }/order/cart.do">购物车</a> | <a href="#">帮助中心</a> | <a href="${pageContext.request.contextPath }/user/myAccount.do">我的帐户</a>
				| <a href="${pageContext.request.contextPath}/user/register.do">新用户注册</a> | <a href="${pageContext.request.contextPath }/index.jsp">联系客户</a></td>
		</tr>
	</table>
</div>