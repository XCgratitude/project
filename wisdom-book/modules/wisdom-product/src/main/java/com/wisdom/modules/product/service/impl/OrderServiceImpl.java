package com.wisdom.modules.product.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wisdom.framework.core.exception.BusinessException;
import com.wisdom.modules.product.domain.*;
import com.wisdom.modules.product.persistence.OrderMapper;
import com.wisdom.modules.product.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Order> selectOrderById(int id) throws BusinessException {
        try {
            return orderMapper.selectOrderById(id);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public List<OrderItem> selectOrderInfoById(String id) throws BusinessException {
        try {
            return orderMapper.selectOrderInfoById(id);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public List<Cart> selectCartByUserId(int userId) throws BusinessException {
        try {
            return orderMapper.selectCartByUserId(userId);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public Product getByUniqueKey(String id) throws BusinessException {
        try {
            return orderMapper.getByUniqueKey(id);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void insertCart(Cart cart) throws BusinessException {
        try {
            orderMapper.insertCart(cart);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void insertOrder(Order order) throws BusinessException {
        try {
            orderMapper.insertOrder(order);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void insertOrderItem(List<OrderItem> OrderItems) throws BusinessException {
        try {
            orderMapper.insertOrderItem(OrderItems);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void deleteCartByUserId(int id) throws BusinessException {
        try {
            orderMapper.deleteCartByUserId(id);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void modifyOrderState(String r6_order) throws BusinessException {
        try {
            orderMapper.modifyOrderState(r6_order);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }

    }

    @Override
    public Order selectOrderByOrderId(String orderId) throws BusinessException {
        try {
            return orderMapper.selectOrderByOrderId(orderId);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void deleteOrderByOrderId(String orderId) throws BusinessException {
        try {
            orderMapper.deleteOrderByOrderId(orderId);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void deleteOrderItemByOrderId(String orderId) throws BusinessException {
        try {
            orderMapper.deleteOrderItemByOrderId(orderId);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void deleteCartById(String cartId) throws BusinessException {
        try {
            orderMapper.deleteCartByPId(cartId);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void updateCartBnum(Cart cart) throws BusinessException {
        try {
            orderMapper.updateCartBnum(cart);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public Cart selectCartById(String cartId) throws BusinessException {
        try {
            return  orderMapper.selectCartById(cartId);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public List<Order> selectAllOrder() throws BusinessException{
        try {
            return  orderMapper.selectAllOrder();
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public PageInfo<Order> selectPayOrder(int payState, int currentPage, int pageSize) throws BusinessException {
        try {
            PageHelper.startPage(currentPage,pageSize);
            List<Order> orders = orderMapper.selectPayOrder(payState);
            PageInfo<Order> pageInfo = new PageInfo<>(orders);
            return pageInfo;
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public Receiver selectReceiverByUserId(int userId) throws BusinessException {
        try {
            return orderMapper.selectReceiverByUserId(userId);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void updateReceiver(Receiver receiver) throws BusinessException {
        try {
            orderMapper.updateReceiver(receiver);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void insertReceiver(Receiver receiver) throws BusinessException {
        try {
            orderMapper.insertReceiver(receiver);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }
}
