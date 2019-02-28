package com.wisdom.modules.product.domain;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Setter
@Getter
public class Product implements Serializable {
    private String id;
    private String name;
    private double price;
    private int pnum;
    private String category;
    private String description;
    private String imgUrl;
    private int attackNum;
    private String display;
    private int ifdelete;
    private Date publishTime;
    private String publishPerson;
}
