package com.wisdom.modules.product.service;

import com.github.pagehelper.PageInfo;
import com.wisdom.framework.core.exception.BusinessException;
import com.wisdom.modules.product.domain.*;

import java.util.List;

public interface OrderService {

    List<Order> selectOrderById(int id) throws BusinessException;

    List<OrderItem> selectOrderInfoById(String id) throws BusinessException;

    List<Cart> selectCartByUserId(int userId) throws BusinessException;

    Product getByUniqueKey(String id) throws BusinessException;

    void insertCart(Cart cart) throws BusinessException;

    void insertOrder(Order order) throws BusinessException;

    void insertOrderItem(List<OrderItem> OrderItems) throws BusinessException;

    void deleteCartByUserId(int id) throws BusinessException;

    void modifyOrderState(String r6_order) throws BusinessException;

    Order selectOrderByOrderId(String orderId) throws BusinessException;

    void deleteOrderByOrderId(String orderId) throws BusinessException;

    void deleteOrderItemByOrderId(String orderId) throws BusinessException;

    void deleteCartById(String cartId) throws BusinessException;

    void updateCartBnum(Cart cart) throws BusinessException;

    Cart selectCartById(String cartId) throws BusinessException;

    List<Order> selectAllOrder() throws BusinessException;

    PageInfo<Order> selectPayOrder(int payState, int currentPage, int pageSize) throws BusinessException;

    Receiver selectReceiverByUserId(int id) throws BusinessException;

    void updateReceiver(Receiver receiver) throws BusinessException;

    void insertReceiver(Receiver receiver) throws BusinessException;
}
