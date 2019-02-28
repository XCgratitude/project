<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/1 0001
  Time: 下午 4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>代客下单管理</title>
    <meta name="menu" content="relpaceGuestSubmitOrder"/>
    <LINK href="${pageContext.request.contextPath}/res/css/style.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/order.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/plugins/My97DatePicker/WdatePicker.js"></script>
    <jsp:include page="/admins/common/jscript.jsp"/>
    <script language="javascript" type="text/javascript">
        var orderNum="";
        var taskId="";
        function cancel(num,id){
            orderNum = num;
            taskId = id;
            $("#confirmText").html("是否申请取消订单?");
            tipShow('#confirmDiv');
        }
        $(function(){
            function showTip(txt){
                $('#tipText').html(txt);
                tipShow('#tipDiv');
            }
            $("#confirmDivOk").bind("click",function(){
                $.ajax({
                    type : "post" ,
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    url : '${path}/order/valetOrderCancel.do?orderNum='+orderNum+'&taskId='+taskId ,
                    dataType : 'json',
                    complete:function(data){
                        var aa = eval("("+data.responseText+")");
                        if(aa[0].result == "1"){
                            alert(aa[0].msg);
                            window.location.reload();
                        } else {
                            showTip(aa[0].msg);
                        }
                    }
                });
            });
        });
    </script>
</head>

<body id="main">


<div ><div class="box"><div class="content">

    <div class="loc icon"><samp class="t12"></samp>：代客下单管理&nbsp;&raquo;&nbsp;<span class="gray" title="">查询修改订单</span></div>

    <form action="${path}/order/listGuestOrder.do" id="form1" name="form1" method="post">

        <div class="sch"><p>查询：<jsp:include page="/admins/common/search.jsp"/></div>


        <table cellspacing="0" summary="" class="tab" id="myTable">
            <tr>
                <th>归属地</th>
                <th>订单号</th>
                <th>收货人</th>
                <th>联系电话</th>
                <th>支付金额</th>
                <th>支付方式</th>
                <th>支付状态</th>
                <th>下单用户</th>
                <th>下单时间</th>
                <th>操作时间</th>
                <th>订单状态</th>
                <th>操作</th>
            </tr>
                <tr>
                    <td></td>
                    <td><a href="${path}/order/orderSummary/detail.do"></a></td>
                    <td class="nwp"></td>
                    <td>}</td>
                    <td><fmt:formatNumber value="" pattern="#0.00"/></td>
                    <td><ui:orderState var="" type="2"/></td>
                    <td><ui:orderState var="" type="3"/></td>
                    <td class="nwp"></td>
                    <td class="nwp"> <var class="red"><br/></var>
                        <br /></td>
                    <td class="nwp"><br/></td>
                        <%-- <c:if test='${d==1}'> <td class="nwp"><ui:orderModule var="${p.orderState}" type="8"/></td></c:if>
                        <c:if test='${d==2}'> <td class="nwp"><ui:orderModule var="${p.orderState}" type="6"/></td></c:if>
                        <c:if test='${d!=1&&d!=2}'> <td class="nwp"><ui:orderState var="${p.orderState}" type="1"/></td></c:if> --%>
                    <td class="nwp"><ui:orderState var="${p.orderState}" type="1"/></td>
                    <td><a href="${path}/order/orderSummary/detail.do">查看</a>

                                <a href="${path}/order/orderSummary/editOrder.do?orderId=${p.orderId}&taskId=${p.taskId}">修改</a>
                                <a href="javascript:cancel('${p.orderNum}','${p.taskId}')">申请取消</a>
                    </td>
                </tr>
        </table>

    </form>

</div></div></div>

</body>
</html>
