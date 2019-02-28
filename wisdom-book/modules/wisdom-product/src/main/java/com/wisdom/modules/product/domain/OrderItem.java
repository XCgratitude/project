package com.wisdom.modules.product.domain;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Setter
@Getter
public class OrderItem implements Serializable {
    private String orderId;
    private String productId;
    private Product product;
    private Order order;
    private int buyNum;
}
