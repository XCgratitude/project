<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>bookStore列表</title>
<%--导入css --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
</head>

<body class="main">

	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>

				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath}/product/index.do">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${category}&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;图书列表
					</div>

					<table cellspacing="0" class="listcontent">
						<tr>
							<td>
								<h1>商品目录</h1>
								<hr />
								<h1>${category}</h1>&nbsp;&nbsp;&nbsp;&nbsp;共${pager.total}种商品
								<hr />
								<div style="margin-top:20px; margin-bottom:5px">
									<img src="${pageContext.request.contextPath}/images/productlist.gif" width="100%" height="38" />
								</div>
								<table cellspacing="0" class="booklist">
									<tr>
										<c:choose>
											<c:when test="${ !empty pager.list}">
											<c:forEach items="${pager.list}" var="p">
												<td>
													<div class="divbookpic">
														<p>
															<a href="${pageContext.request.contextPath}/product/productInfo.do?id=${p.id}"><img src="${pageContext.request.contextPath}${p.imgUrl}" width="115"
																height="129" border="0" /> </a>
														</p>
													</div>

													<div class="divlisttitle">
														<a href="${pageContext.request.contextPath}/product/productInfo.do?id=${p.id}">书名:${p.name}<br />售价:${p.price} </a>
													</div>
												</td>
											</c:forEach>
											</c:when>
											<c:otherwise>
												此类书已售完！尽请关注！
											</c:otherwise>
										</c:choose>
									</tr>
								</table>

								<div align="center">
									<div class="pagination">
										<ul>
											<li class="disablepage">
												<c:choose>
													<c:when test="${pager.isFirstPage}">
														上一页 &lt;&lt;
													</c:when>
													<c:otherwise>
														<a href="javascript:void(0)" onclick="changePage(${pager.prePage})">上一页 &lt;&lt;</a>
													</c:otherwise>
												</c:choose>
											</li>
											<li>第${pager.pageNum}页/共${pager.pages}页</li>

											<li class="disablepage">
												<c:choose>
													<c:when test="${pager.isLastPage}">
														下一页&lt;&lt;
													</c:when>
													<c:otherwise>
														<a href="javascript:void(0)" onclick="changePage(${pager.nextPage})">下一页&lt;&lt;</a>
													</c:otherwise>
												</c:choose>
											</li>
										</ul>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

	<jsp:include page="foot.jsp" />

</body>
<script type="text/javascript">
	function changePage(startPage) {
		location.href="${pageContext.request.contextPath}/product/productList.do?startPage="+startPage;
    }
</script>
</html>