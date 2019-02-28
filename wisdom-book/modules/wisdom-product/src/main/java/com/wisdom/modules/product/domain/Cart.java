package com.wisdom.modules.product.domain;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Setter
@Getter
public class Cart implements Serializable {

    private String cartId;
    private int bnum;
    private double priceTotal;
    private String productId;
    private int userId;
    private Product product;
}
