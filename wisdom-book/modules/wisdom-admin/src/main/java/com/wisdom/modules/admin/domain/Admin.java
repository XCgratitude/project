package com.wisdom.modules.admin.domain;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class Admin implements Serializable {

    private int id;
    private String username;
    private String password;
    private String adminStatus;
    private int loginNum;
    private Date createTime;
    private int identity;
}
