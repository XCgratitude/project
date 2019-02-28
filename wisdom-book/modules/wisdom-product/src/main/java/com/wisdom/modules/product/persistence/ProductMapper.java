package com.wisdom.modules.product.persistence;

import com.wisdom.modules.product.domain.Cart;
import com.wisdom.modules.product.domain.Order;
import com.wisdom.modules.product.domain.OrderItem;
import com.wisdom.modules.product.domain.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper{

    List<Product> selectAll();

    Product getByUniqueKey(String id);

    void update(Product product);

    void insert(Product product);

    void deleteById(String[] ids);

    List<Product> selectByPage();

    List<Product> selectBycategory(@Param("category") String category);

    List<String> selectByName(@Param("name")String name);

    List<Product> selectByBookName(@Param("bookName")String bookName);

    List<Product> selectRSell();

    void updateIfSell(String pid);

    void updateAttackNum(String id);
}
