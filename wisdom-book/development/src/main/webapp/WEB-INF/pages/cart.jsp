<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" ></script>
<title>电子书城</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
<script type="text/javascript">
	function decreaseOrAdd(cartId,number,total) {
	    if(number  <= 0){
            if(confirm("确定要删除吗？")){
				location.href = "${pageContext.request.contextPath}/order/updateCart.do?cartId="+cartId;
			}else {
				return;
			}
		}else if(number >= total){
			alert("库存不够！");
        }else {
            location.href = "${pageContext.request.contextPath}/order/updateCart.do?cartId="+cartId+"&bnum="+number;
        }

    }
    function updateBnum(bnum,cartId,total) {

	    //var number = document.getElementById("bnum").value;var  number = $("#bnum").val();
        var  number = bnum.value;
        if(number  <= 0){
            if(confirm("确定要删除吗？")){
                location.href = "${pageContext.request.contextPath}/order/updateCart.do?cartId="+cartId;
            }else {
                return;
            }
        }else if(number > total){
            bnum.value = total;
            alert("库存不够！");
            location.href = "${pageContext.request.contextPath}/order/updateCart.do?cartId="+cartId+"&bnum="+total;
        }else {
            location.href = "${pageContext.request.contextPath}/order/updateCart.do?cartId="+cartId+"&bnum="+number;
        }
    }
</script>

</head>

<body class="main">

	<jsp:include page="head.jsp" />

	<jsp:include page="menu_search.jsp" />


	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>

				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="/user/index.do">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;购物车
					</div>

					<table cellspacing="0" class="infocontent">
						<tr>
							<td><img src="${pageContext.request.contextPath}/ad/page_ad.jpg" width="666" height="89" />
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td><img src="${pageContext.request.contextPath}/images/buy1.gif" width="635" height="38" />
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="1" class="carttable">
												<tr>
													<td width="10%">序号</td>
													<td width="30%">商品名称</td>
													<td width="10%">价格</td>
													<td width="20%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量</td>
													<td width="10%">库存</td>
													<td width="10%">小计</td>
													<td width="10%">取消</td>
												</tr>
											</table>

												<table width="100%" border="0" cellspacing="0">
													<c:set var="sum" value="0" />
													<c:forEach items="${carts}" var="cart" varStatus="s">
														<tr>
															<td width="10%">${s.count}</td>
															<td width="30%">${cart.product.name}</td>

															<td width="10%">${cart.product.price}</td>
															<td width="20%">
															<input type="button" value='-'
																style="width:20px" onclick="decreaseOrAdd('${cart.cartId}',${cart.bnum-1},${cart.product.pnum})">

																<input name="text" id="bnum" type="text"  value=${cart.bnum}
																style="width:40px;text-align:center" onblur="updateBnum(this,'${cart.cartId}', ${cart.product.pnum})" /> <input
																type="button" value='+' style="width:20px"  onclick="decreaseOrAdd('${cart.cartId}',${cart.bnum+1},${cart.product.pnum})">
															</td>
															<td width="10%">${cart.product.pnum}</td>
															<td width="10%">${cart.priceTotal}</td>

															<td width="10%"><a href="javascript:void(0) " onclick="decreaseOrAdd('${cart.cartId}',0,${cart.product.pnum})"
																style="color:#FF0000; font-weight:bold">X</a></td>
														</tr>
														<c:set var="sum" value="${sum+cart.priceTotal}"/>
													</c:forEach>
												</table>


											<table cellspacing="1" class="carttable">
												<tr>
													<td style="text-align:right; padding-right:40px;"><font
														style="color:#FF6600; font-weight:bold">合计：&nbsp;&nbsp;${sum}元</font>
													</td>
												</tr>
											</table>
											<div style="text-align:right; margin-top:10px">
												<a
													href="${pageContext.request.contextPath}/product/productList.do?category=所有书籍"><img
													src="${pageContext.request.contextPath}/images/gwc_jx.gif" border="0" /> </a>
												&nbsp;&nbsp;&nbsp;&nbsp;<a
													href="${pageContext.request.contextPath}/order/order.do"><img
													src="${pageContext.request.contextPath}/images/gwc_buy.gif" border="0" /> </a>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>



	<jsp:include page="foot.jsp" />


</body>
</html>
