package com.wisdom.modules.product.domain;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Setter
@Getter
public class Receiver implements Serializable {
    private int userId;
    private String receiverAddress;
    private String receiverName;
    private String receiverPhone;
}
