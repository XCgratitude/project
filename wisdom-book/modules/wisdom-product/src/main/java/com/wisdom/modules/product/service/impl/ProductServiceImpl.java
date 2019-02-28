package com.wisdom.modules.product.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wisdom.framework.core.data.Pager;
import com.wisdom.framework.core.exception.BusinessException;
import com.wisdom.modules.product.domain.Cart;
import com.wisdom.modules.product.domain.Order;
import com.wisdom.modules.product.domain.OrderItem;
import com.wisdom.modules.product.domain.Product;
import com.wisdom.modules.product.persistence.ProductMapper;
import com.wisdom.modules.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("productService")
public class ProductServiceImpl implements ProductService{


    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Product> selectAll() throws BusinessException {
        try {
            return productMapper.selectAll();
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public Product getByUniqueKey(String id) throws BusinessException {
        try {
            return productMapper.getByUniqueKey(id);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void update(Product product) throws BusinessException {
        try {
            productMapper.update(product);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void insert(Product product) throws BusinessException {
        try {
            productMapper.insert(product);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void deleteById(String[] ids) throws BusinessException {
        try {
            productMapper.deleteById(ids);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public PageInfo<Product> selectByPage(int currentPage, int pageSize) throws BusinessException {
        try {
            PageHelper.startPage(currentPage,pageSize);
            List<Product> products = productMapper.selectByPage();
            PageInfo<Product> pageInfo = new PageInfo<>(products);
            return pageInfo;
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public List<Product> selectBycategory(String category) throws BusinessException {
        try {
            return productMapper.selectBycategory(category);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public PageInfo<Product> selectByPage(int currentPage, int pageSize, String category) throws BusinessException {
       // Pager<Product> pager = new Pager( pageInfo.getTotal(), pageInfo.getList());
        //pageInfo.getFirstPage(),
        try {
            PageHelper.startPage(currentPage, pageSize);

            List<Product> products = productMapper.selectBycategory(category);

            PageInfo<Product> pageInfo = new PageInfo<>(products);

            return pageInfo;
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public List<String> selectByName(String name) throws BusinessException {

        try {
            return productMapper.selectByName(name);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public List<String> selectProductByName(String name) {
        return null;
    }

    @Override
    public PageInfo<Product> selectByBookNamePage(Integer currentPage, Integer pageSize, String bookName) throws BusinessException {
        try {
            PageHelper.startPage(currentPage, pageSize);

            List<Product> products = productMapper.selectByBookName(bookName);

            PageInfo<Product> pageInfo = new PageInfo<>(products);

            return pageInfo;
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public List<Product> selectRSell() throws BusinessException {
        try {
            return productMapper.selectRSell();
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void updateIfSell(String pid) throws BusinessException {
        try {
            productMapper.updateIfSell(pid);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void updateAttackNum(String id) throws BusinessException {
        try {
            productMapper.updateAttackNum(id);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }
}
