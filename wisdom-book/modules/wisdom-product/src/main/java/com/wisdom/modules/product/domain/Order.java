package com.wisdom.modules.product.domain;

import com.wisdom.modules.user.domain.User;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Setter
@Getter
public class Order implements Serializable {
    private String id;
    private double money;
    private String receiverAddress;
    private String receiverName;
    private String receiverPhone;
    private String payState;
    private Date orderTime;
    private int userId;
}
