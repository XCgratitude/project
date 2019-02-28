<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<META http-equiv=Content-Type content="text/html; charset=UTF-8">
<head>
    <title>未付款订单</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.form.js"></script>
<LINK href="${pageContext.request.contextPath}/res/css/style.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/plugins/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">

    function  ss(t,startPage) {
        if(startPage > 0 && startPage <= t){
            location.href="${pageContext.request.contextPath}/order/adminOrderYesPay.do?startPage="+startPage;
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
                form3.action="${path}/order/adminOrderYesPay.do?startPage=1";
                form3.submit();
            }
            else{
                form3.action="${path}/order/adminOrderYesPay.do?startPage="+pageCount;
                form3.submit();
            }
        }
        else if(form3.busjump.value<=pageCount){
            var page=parseInt(form3.busjump.value);
            if(page==0){
                page=1;//如果你输入的是0，那么就让它等于1
                form3.action="${path}/order/adminOrderYesPay.do?startPage="+page;
                form3.submit();
            }else{
                form3.action="${path}/order/adminOrderYesPay.do?startPage="+page;
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
<body id="main">

<div><div class="content">
    <div class="loc icon"><samp class="t12"></samp>当前位置：订单管理&nbsp;&raquo;&nbsp;<span class="gray" title="待付款单">待付款单</span></div>

    <h2 class="h2_ch">
      <span id="tabs" class="l">
        <a id="label1" href="${path}/order/adminOrderYesPay.do?orderState=1,0"   title="全部订单" class="nor">全部订单</a>
        <a id="label2" href="${path}/order/adminOrderNoPay.do"   title="未付款订单" class="nor">未付款订单</a>
        <a id="label3" href="${path}/order/adminOrderYesPay.do"   title="已付款订单" class="nor">已付款订单</a>
<%--         <a id="label4" href="${path}/order/orderPay.do?orderState=17"  title="超时作废" class="nor">超时作废</a> --%>
      </span>
    </h2>
    <div>
        <TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0 id="list">
            <TBODY>
            <TR>
                <TD align="center" vAlign=top >
                    <table cellspacing="0" summary="" class="tab" id="myTable">
                        <tr align="center">
                            <th align="center">订单号</th>
                            <th align="center">收货人</th>
                            <th align="center">联系电话</th>
                            <th align="center">支付金额</th>
                            <th align="center">支付方式</th>
                            <th align="center">支付状态</th>
                            <th align="center">下单时间</th>
                            <th align="center">订单状态</th>
                            <th align="center">操作</th>
                        </tr>
                        <c:forEach items="${pages.list}" var="orders">
                            <tr>
                                <td>${orders.id}</td>
                                <td>${orders.receiverName}</td>
                                <td>${orders.receiverPhone}</td>
                                <td>${orders.money}</td>
                                <td>在线支付</td>
                                <td>${orders.payState == 0 ? "未支付" : "已支付"}</td>
                                <td class="nwp"><var class="red">
                                    <fmt:formatDate value="${orders.orderTime}" pattern="yyyy-MM-dd"/><br/>
                                    <fmt:formatDate value="${orders.orderTime}" pattern="HH:mm:ss"/> </var>
                                </td>
                                <td class="nwp">已发货</td>
                                <td><a href="${path }/order/adminDetail.do?orderId=${orders.id}">查看</a></td>
                            </tr>
                        </c:forEach>
                    </table>
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
                                <input type="hidden" name="pageCount" value="${pages.pages}" /><!--//用于给上面javascript传值-->
                                <input type="hidden" name="page" value="" /><!--//用于给上面javascript传值-->
                                <a href="${path}/order/adminOrderYesPay.do?startPage=1" ><img src="${pageContext.request.contextPath}/images/first.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;

                                <a href="javascript:void (0);" onclick="ss(${pages.pages},${pages.prePage})"><img src="${pageContext.request.contextPath}/images/pre.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;

                                共${pages.total}条记录,共计${pages.pages}页,当前第${pages.pageNum}页&nbsp;&nbsp;&nbsp;

                                <a href="javascript:void (0);" onclick="ss(${pages.pages},${pages.nextPage})"><img src="${pageContext.request.contextPath}/images/next.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;

                                <a href="${path}/order/adminOrderYesPay.do?startPage=${pages.lastPage}" ><img src="${pageContext.request.contextPath}/images/last.gif" border="0" /></a>
                                第<input name="busjump" type="text" size="3" />页<a href="javascript:void (0);" onClick="bjump()"><img src="${pageContext.request.contextPath}/images/jump.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
                            </form>
                        </TD>
                    </TR>
                </table>
            </TD>
        </TR>
        </TBODY>
        </TABLE>
    </div>

    <%-- <table cellspacing="0" summary="" class="tab" id="myTable">
         <tr>
             <th>订单号</th>
             <th>收货人</th>
             <th>联系电话</th>
             <th>支付金额</th>
             <th>支付方式</th>
             <th>支付状态</th>
             <th>下单时间</th>
             <th>订单状态</th>
             <th>操作</th>
         </tr>
         <c:forEach items="${orders}" var="orders">
             <tr>
                 <td>${orders.id}</td>
                 <td>${orders.receiverName}</td>
                 <td>${orders.receiverPhone}</td>
                 <td>${orders.money}</td>
                 <td>在线支付</td>
                 <td>${orders.payState == 0 ? "未支付" : "已支付"}</td>
                 <td class="nwp"><var class="red">
                     <fmt:formatDate value="${orders.orderTime}" pattern="yyyy-MM-dd"/><br/>
                     <fmt:formatDate value="${orders.orderTime}" pattern="HH:mm:ss"/> </var>
                 </td>
                 <td class="nwp">已发货</td>
                 <td><a href="${path }/order/detail.do?orderId=${orders.id}">查看</a></td>
             </tr>
         </c:forEach>
     </table>--%>
</div></div>
</body>
</html>
