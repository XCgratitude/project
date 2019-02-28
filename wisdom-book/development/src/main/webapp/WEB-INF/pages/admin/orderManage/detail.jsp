<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>

<head>
    <title>订单详情_待付款单_</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.form.js"></script>
    <script language="javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" ></script>
    <LINK href="${pageContext.request.contextPath}/res/css/style.css" type=text/css rel=stylesheet>
    <%--<LINK href="${pageContext.request.contextPath}/res/css/shop.css" type=text/css rel=stylesheet>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.tablesorter.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/plugins/My97DatePicker/WdatePicker.js"></script>
    <script language="javascript" type="text/javascript">
        $(function(){
            var obj=null;
            $("#tabs a").each(function(){
                if($(this).attr("class").indexOf("here") == 0){tObj = $(this)}
                $(this).click(function(){
                    var c = $(this).attr("class");
                    if(c.indexOf("here") == 0){return;}
                    var ref = $(this).attr("ref");
                    var ref_t = tObj.attr("ref");
                    tObj.attr("class","nor");
                    $(this).attr("class","here");
                    $(ref_t).hide();
                    $(ref).show();
                    tObj = $(this);
                });
            });
            $(".sub1").click(function(){
                tipShow('#addItemNote');
            });
            $("#confirmDivOk").bind("click",function(){
                var a=$("#myForm");
                a.append('<input type="hidden" name="r" value="'+obj.val()+'">');
                a.submit();
            });
            $("input[id='addItemNoteConfirm']").click(function(){
                var orderId = $("#orderId").val();
                window.location.href="${path}/order/flowOrder.do?orderId="+orderId+"&orderState=0";
            });
        });
        function getBzqd(spid) {
            $.ajax({
                type : "POST",
                async : false,
                url : "${path}/order/packetAjaxList.do?itemNo="+spid,
                success : function(responseText) {
                    var dataObj = eval("(" + responseText + ")");
                    var txt = dataObj[0].txt;
                    $('#spqd').html(txt);
                    tipShow('#spqdDiv');
                }
            });
        }
    </script>
</head>
<body id="main">
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<div><div class="content">
    <div class="loc icon">
        <samp class="t12"></samp>
        当前位置：订单管理&nbsp;&raquo;&nbsp;未付款单&nbsp;&nbsp;<span
            class="gray" title="订单详情"></span>

    </div>
    <form id="myForm" action="${path}/order/orderPay/oper.do" method="post">
        <input type="hidden" id="orderId" value="">

        <div class="sch page_c">
            <span class="l">订单号：<b class="red"><var>${order.id}</var></b>&nbsp;&nbsp;&nbsp;下单时间：<b class="f14 blue"><var><fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd"/>
                        </var>&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${order.orderTime}" pattern="HH:mm:ss"/></b>&nbsp;&nbsp;&nbsp;
            <c:if test="${order.payState == 1 }">
                <input name="r" type="button" id="completeCall" class="pointer sub1 red" value="外呼完成" />
            </c:if>
            <input type="hidden" id="why"/>
            </span>
        </div>

        <h2 class="h2_ch">
            <span id="tabs" class="l">
                <a href="javascript:void(0);" ref="#tab_1" title="基本信息" class="here">基本信息</a>
                <a href="javascript:void(0);" ref="#tab_2" title="支付信息" class="nor">支付信息</a>
               <%-- <a href="javascript:void(0);" ref="#tab_3" title="操作记录" class="nor">操作记录</a>--%>
	        </span>
            <span class="r">
                <input type="button" class="pointer" onclick="window.open('${base}/order/preview.do?orderId=${ebco.orderId}&type=15','_blank','height=300,width=500,scrollbars=yes,location=no,resizable=yes')" value="打印订单" /><input type="button" class="pointer" onclick="window.history.back(-1);" value="返回列表" />
            </span>
        </h2>

        <div id="tab_1">
            <!-- 基本信息 -->
            <table cellspacing="0" summary="" class="tab4">
                <tr>
                    <th width="12%">下单用户：</th>
                    <td width="21%" class="nwp">${u.username}</td>
                    <th width="12%">购买类型：</th>
                    <td width="21%" class="nwp">
                        常规
                    </td>
                    <th width="12%">支付方式:</th>
                    <td class="nwp">在线支付
                    </td>
                </tr>
                <tr>
                    <th>送货方式：</th>
                    <td>圆通快递</td>
                    <th>送货时间：</th>
                    <td>
                        <%--<fmt:formatDate value="${docHead.makeDate }" pattern="yyy-MM-dd HH:mm:ss"></fmt:formatDate>--%>
                    </td>
                    <th>送货前电话确认：</th>
                    <td>已确认</td>
                </tr>
                <tr>
                    <th>收货人：</th>
                    <td class="nwp">${order.receiverName}</td>
                    <th>联系方式：</th>
                    <td><var>${order.receiverPhone}</var></td>
                    <th>邮编：</th>
                    <td><var>434100</var></td>
                </tr>
                <tr>
                    <th>收货地址：</th>
                    <td class="nwp" colspan="5">${order.receiverAddress}</td>
                </tr>
                <tr>
                    <th>用户备注:</th>
                    <td class="nwp" colspan="5">发圆通快递</td>
                </tr>
            </table>

            <!-- 根据分类显示详情 -->
            <%-- 裸机/团购裸机 /秒杀裸机--%>
            <table cellspacing="0" summary="" class="tab3">
                <tr>
                    <th width="12%">商品编号</th>
                    <th width="12%">商品名称</th>
                    <th width="15%">规格</th>
                    <th width="15%">单价</th>
                    <th width="15%">数量</th>
                    <th width="15%">小计</th>
                </tr>
                <c:set var="sum" value="0"></c:set>
                <c:forEach items="${products}" var="products">
                    <tr>
                        <td>${products.product.id}</td>
                        <td class="nwp">${products.product.name}</td>
                        <td>${products.product.name}</td>
                       <%-- <td><a href="javascript:void(0);" onclick="getBzqd(${e.itemNo});">查看包装清单</a></td>--%>
                        <td>${products.product.price}</td>
                        <td>${products.buyNum}个</td>
                        <td>${products.product.price*products.buyNum}</td>
                    </tr>
                    <c:set var="sum" value="${sum+products.product.price*products.buyNum}"></c:set>
                </c:forEach>
            </table>
            <%-- 号卡 --%>
            <!-- 金额合计 -->
            <div class="page_c">
			<span class="r">商品金额合计：${sum}元&nbsp;&nbsp;&nbsp;
					 运费：0.00元 &nbsp;&nbsp;&nbsp; 应付金额： <b class="f16 red">${sum}元</b>
			</span>
            </div>

        </div>

        <div id="tab_2" style="display: none">
            <table cellspacing="0" summary="" class="tab3">
                <tr><th width="12%">支付流水号：123456789</th><td></td></tr>
                <tr><th width="12%">支付方式：</th><td>
                    <c:if test="${order.payState == 1 }">在线支付</c:if>
                    <c:if test="${order.payState == 2 }">货到付款</c:if>
                </td></tr>
                <tr><th width="12%">支付平台：</th><td><c:if test="${order.payState == 0 }">未付</c:if>
                    <c:if test="${order.payState == 1 }">已付</c:if></td></tr>

                <tr><th width="12%">支付金额：</th><td><c:if test="${order.payState == 0 }">0</c:if>
                    <c:if test="${order.payState == 1 }">${sum}</c:if> 元</td></tr>

                <tr><th width="12%">支付状态：</th><td>
                    <c:if test="${order.payState == 0 }">未付</c:if>
                    <c:if test="${order.payState == 1 }">已付</c:if>
                </td></tr>
                <tr><th width="12%">付款时间：</th><td><var><fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd : HH:mm:ss"/></var></td></tr>
                <tr><th width="12%">到账时间：</th><td><var><fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd : HH:mm:ss"/></var></td></tr>
            </table>
        </div>


     <%--   <div id="tab_3" style="display: none">
            &lt;%&ndash; <table cellspacing="0" summary="" class="tab">
                <tr>
                <th width="12%">操作类型</th>
                <th width="12%">操作时间</th>
                <th width="15%">操作人</th>
                <th>操作备注</th>
                </tr>
                <c:forEach items="${ebJbpmLog}" var="e">
                <tr>
                <td>${e.oper}</td>
                <td><fmt:formatDate value="${e.operTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td class="nwp">${e.operUser}</td>
                <td class="nwp"><c:out value="${e.note}"/></td>
                </tr>
                </c:forEach>
            </table>  &ndash;%&gt;
        </div>--%>
    </form>

</div></div>
</body>

