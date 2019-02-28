package com.wisdom.modules.product.controller;

import com.wisdom.framework.core.util.PaymentUtil;
import com.wisdom.modules.product.domain.Order;
import com.wisdom.modules.product.persistence.OrderMapper;
import com.wisdom.modules.product.service.OrderService;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/pay")
public class PayController {

    @Autowired
    private OrderService orderService;

    @RequestMapping("pay")
    public String pay(Order order, String yh, HttpServletRequest request){

        String pd_FrpId = yh;
        String p0_Cmd ="Buy";
        String p1_MerId ="10001126856";
        String p2_Order = order.getId();
        String p3_Amt =  String.valueOf(order.getMoney());
        String p4_Cur = "CNY";
        String p5_Pid ="unknow";
        String p6_Pcat ="unknow";
        String p7_Pdesc ="unknow";
        String p8_Url ="http://localhost:8080/wisdom/pay/callBack.do";
        String p9_SAF ="1";
        String pa_MP ="unknow";
        String pr_NeedResponse ="1";
        String  hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl");

        //response.sendRedirect("https://www.yeepay.com/app-merchant-proxy/node?p0_Cmd="+p0_Cmd+"&p1_MerId"+"");
        request.setAttribute("pd_FrpId", pd_FrpId);
        request.setAttribute("p0_Cmd", p0_Cmd);
        request.setAttribute("p1_MerId", p1_MerId);
        request.setAttribute("p2_Order", p2_Order);
        request.setAttribute("p3_Amt", p3_Amt);
        request.setAttribute("p4_Cur", p4_Cur);
        request.setAttribute("p5_Pid", p5_Pid);
        request.setAttribute("p6_Pcat", p6_Pcat);
        request.setAttribute("p7_Pdesc", p7_Pdesc);
        request.setAttribute("p8_Url", p8_Url);
        request.setAttribute("p9_SAF", p9_SAF);
        request.setAttribute("pa_MP", pa_MP);
        request.setAttribute("pr_NeedResponse", pr_NeedResponse);
        request.setAttribute("hmac", hmac);
        return "confirm";
    }

    @RequestMapping("callBack")
    public String callBack(HttpServletRequest request, HttpServletResponse response) throws IOException {

        PrintWriter out = response.getWriter();

        String  p1_MerId = request.getParameter("p1_MerId");
        String  r0_Cmd = request.getParameter("r0_Cmd");
        String  r1_Code = request.getParameter("r1_Code");//支付结果，1代表支付成功
        String  r2_TrxId = request.getParameter("r2_TrxId");
        String  r3_Amt = request.getParameter("r3_Amt");
        String  r4_Cur = request.getParameter("r4_Cur");
        String  r5_Pid = request.getParameter("r5_Pid");
        String  r6_Order = request.getParameter("r6_Order");//商户订单号
        String  r7_Uid = request.getParameter("r7_Uid");
        String  r8_MP = request.getParameter("r8_MP");
        String  r9_BType = request.getParameter("r9_BType");//为“2”: 服务器点对点通讯.
        String  hmac = request.getParameter("hmac");

        boolean isOK = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl");

        if(!isOK){
            out.print("支付数据有可能被篡改,请联系客服");
        }else{

            if("1".equals(r1_Code)){//支付结果，1代表支付成功
                if("2".equals(r9_BType)){
                    out.print("success");
                }
                //out.print("hello servlet..");
                //修改定单状态
                try {
                    orderService.modifyOrderState(r6_Order);
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
        }
        return "paysuccess";
    }
}
