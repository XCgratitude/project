package com.wisdom.modules.product.service;

import com.github.pagehelper.PageInfo;
import com.wisdom.framework.core.data.Pager;
import com.wisdom.framework.core.exception.BusinessException;
import com.wisdom.modules.product.domain.Cart;
import com.wisdom.modules.product.domain.Order;
import com.wisdom.modules.product.domain.OrderItem;
import com.wisdom.modules.product.domain.Product;

import java.util.List;


public interface ProductService{

    List<Product> selectAll() throws BusinessException;

    Product getByUniqueKey(String id) throws BusinessException;

    void update(Product product) throws BusinessException;

    void insert(Product product) throws BusinessException;

    void deleteById(String[] ids) throws BusinessException;

    PageInfo<Product> selectByPage(int currentPage, int pageSize) throws BusinessException;

    List<Product> selectBycategory(String category) throws BusinessException;

    PageInfo<Product>  selectByPage(int currentPage, int pageSize, String category) throws BusinessException;

    List<String> selectByName(String name) throws BusinessException;

    List<String> selectProductByName(String name);

    PageInfo<Product> selectByBookNamePage(Integer startPage, Integer pageLength, String bookName) throws BusinessException;

    List<Product> selectRSell() throws BusinessException;

    void updateIfSell(String pid) throws BusinessException;

    void updateAttackNum(String id) throws BusinessException;
}
