package com.wisdom.modules.product.persistence;

import com.github.pagehelper.PageInfo;
import com.wisdom.modules.product.domain.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {

    List<Order> selectOrderById(int id);

    List<OrderItem> selectOrderInfoById(String id);

    List<Cart> selectCartByUserId(int userId);

    Product getByUniqueKey(String id);

    void insertCart(Cart cart);

    void insertOrder(Order order);

    void insertOrderItem(List<OrderItem> OrderItems);

    void deleteCartByUserId(int id);

    void modifyOrderState(String r6_order);

    Order selectOrderByOrderId(String orderId);

    void deleteOrderByOrderId(String orderId);

    void deleteOrderItemByOrderId(String orderId);

    void deleteCartByPId(String cartId);

    void updateCartBnum(Cart cart);

    Cart selectCartById(String cartId);

    List<Order> selectAllOrder();

    List<Order> selectPayOrder(@Param("payState")int payState);

    Receiver selectReceiverByUserId(int userId);

    void updateReceiver(Receiver receiver);

    void insertReceiver(Receiver receiver);
}
