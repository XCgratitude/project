package com.wisdom.modules.product.controller;

import com.github.pagehelper.PageInfo;
import com.wisdom.framework.core.data.PagerRequest;
import com.wisdom.framework.core.exception.BusinessException;
import com.wisdom.modules.product.domain.*;
import com.wisdom.modules.product.service.OrderService;
import com.wisdom.modules.product.service.ProductService;
import com.wisdom.modules.user.domain.User;
import com.wisdom.modules.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping("index")
    public String index(){return "index";}

    @RequestMapping("orderList")
    public String orderList(int id, Model model){

        try {
            List<Order> orders = orderService.selectOrderById(id);
            model.addAttribute("orders",orders);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "orderlist";
    }
    @RequestMapping("orderInfo")
    public String orderInfo(String orderId, Model model){
        try {
            List<OrderItem> orderItems = orderService.selectOrderInfoById(orderId);
            Order order = orderService.selectOrderByOrderId(orderId);
            model.addAttribute("order",order);
            model.addAttribute("orderItems",orderItems);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "orderInfo";
    }

    @RequestMapping("order")
    public String order(HttpServletRequest request, Model model){

        User user = (User) request.getSession().getAttribute("user");
        if (user == null){
            request.setAttribute("login", "2");
            return "login";
        }
        List<Cart> carts = null;
        try {
            carts = orderService.selectCartByUserId(user.getId());
            Receiver receiver =  orderService.selectReceiverByUserId(user.getId());
            if (receiver != null){
                model.addAttribute("receiver", receiver);
                request.getSession().setAttribute("receiver1",1);
            }else {
                request.getSession().setAttribute("receiver1",0);
            }
            model.addAttribute("carts", carts);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "order";
    }

    @RequestMapping("cart")
    public String cart(String pid, Model model, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if (user == null){
            return "login";
        }
        int userId = user.getId();
        List<Cart> carts = null;
        try {
            carts = orderService.selectCartByUserId(userId);
            if (carts == null){
                carts = new ArrayList<>();
            }else if (pid != null || "".equals(pid)){
                for (Cart cart : carts){
                    if(pid.equals(cart.getProductId())){
                        cart.setBnum(cart.getBnum()+1);
                        cart.setPriceTotal(cart.getBnum()*cart.getProduct().getPrice());
                        orderService.updateCartBnum(cart);
                        model.addAttribute("carts", carts);
                        return "cart";
                    }
                }
            }
            if(pid != null || "".equals(pid)){
                Product product = orderService.getByUniqueKey(pid);
                Cart cart = new Cart();
                cart.setProduct(product);
                cart.setBnum(1);
                cart.setPriceTotal(product.getPrice());
                cart.setProductId(pid);
                cart.setUserId(userId);
                orderService.insertCart(cart);
                carts.add(cart);
            }
            model.addAttribute("carts", carts);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "cart";
    }

    @RequestMapping("updateCart")
    public String updateCart(String cartId, Integer bnum){
        try {
            if(bnum==null || "".equals(bnum)){
                orderService.deleteCartById(cartId);
            }else {
                Cart cart = orderService.selectCartById(cartId);
                cart.setBnum(bnum);
                cart.setPriceTotal(cart.getProduct().getPrice()*bnum);
                orderService.updateCartBnum(cart);
            }
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "redirect:/order/cart.do";
    }


    @RequestMapping("orderSubmit")
    public String orderSubmit(int id, Order order,Model model, HttpServletRequest request){
        order.setUserId(id);
        String oid = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
        try {
            Receiver receiver = new Receiver();
            receiver.setUserId(id);
            receiver.setReceiverAddress(order.getReceiverAddress());
            receiver.setReceiverName(order.getReceiverName());
            receiver.setReceiverPhone(order.getReceiverPhone());
            if((int)request.getSession().getAttribute("receiver1") == 1){
                orderService.updateReceiver(receiver);
            }else{
                orderService.insertReceiver(receiver);
            }
            order.setId(oid);
            orderService.insertOrder(order);
            List<Cart> carts = orderService.selectCartByUserId(id);
            List<OrderItem> OrderItems = new ArrayList<>();
            OrderItem orderItem = null;
            for (Cart  cart : carts) {
                orderItem = new OrderItem();
                orderItem.setOrderId(oid);
                orderItem.setProductId(cart.getProductId());
                orderItem.setBuyNum(cart.getBnum());
                OrderItems.add(orderItem);
            }
            orderService.insertOrderItem(OrderItems);
            orderService.deleteCartByUserId(id);
            request.getSession().removeAttribute("carts");
            order.setMoney(order.getMoney()*0.8);
            model.addAttribute("pay",order);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "pay";
    }

    @RequestMapping("orderSubmit2")
    public String orderSubmit2(String orderId, Model model){
        try {
            Order order = orderService.selectOrderByOrderId(orderId);
            model.addAttribute("pay",order);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "pay";
    }

    @RequestMapping("deleteOrderByOrderId")
    public String deleteOrderByOrderId(String orderId){
        try {
            orderService.deleteOrderItemByOrderId(orderId);
            orderService.deleteOrderByOrderId(orderId);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "delOrderSuccess";
    }

    @RequestMapping("selectAllOrder")
    public String selectAllOrder(Model model){
        try {
            List<Order> orders = orderService.selectAllOrder();
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "delOrderSuccess";
    }

    @RequestMapping("adminOrderNoPay")
    public String orderNoPay(Model model, PagerRequest pagerRequest){
        try {
            if (pagerRequest.getStartPage() == null){
                pagerRequest.setStartPage(1);
            }
            pagerRequest.setPageLength(4);
            PageInfo<Order> pageInfo = null;
            pageInfo = orderService.selectPayOrder(0, pagerRequest.getStartPage(), pagerRequest.getPageLength());
            model.addAttribute("pages",pageInfo);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "admin/orderManage/orderNoPay";

    }

    @RequestMapping("adminOrderYesPay")
    public String orderYesPay(Model model, PagerRequest pagerRequest){
        try {
            if (pagerRequest.getStartPage() == null){
                pagerRequest.setStartPage(1);
            }
            pagerRequest.setPageLength(4);
            PageInfo<Order> pageInfo = null;
            pageInfo = orderService.selectPayOrder(1, pagerRequest.getStartPage(), pagerRequest.getPageLength());
            model.addAttribute("pages",pageInfo);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "admin/orderManage/orderNoPay";
    }

    @RequestMapping("adminAllOrderPay")
    public String adminAllOrderPay(Model model, PagerRequest pagerRequest){
        try {
            if (pagerRequest.getStartPage() == null){
                pagerRequest.setStartPage(1);
            }
            pagerRequest.setPageLength(4);
            PageInfo<Order> pageInfo = null;
            pageInfo = orderService.selectPayOrder(2, pagerRequest.getStartPage(), pagerRequest.getPageLength());
            model.addAttribute("pages",pageInfo);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "admin/orderManage/orderNoPay";
    }

    @Autowired
    private UserService userService;

    @RequestMapping("adminDetail")
    public String detail(String orderId, Model model) {
        try {
            List<OrderItem> orderItems = orderService.selectOrderInfoById(orderId);
            Order order = orderService.selectOrderByOrderId(orderId);
            User user = userService.findById(order.getUserId());
            model.addAttribute("u",user);
            model.addAttribute("order",order);
            model.addAttribute("products",orderItems);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "admin/orderManage/detail";
    }

}
