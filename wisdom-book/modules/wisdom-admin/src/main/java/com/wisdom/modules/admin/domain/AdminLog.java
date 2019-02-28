package com.wisdom.modules.admin.domain;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class AdminLog implements Serializable {

    private int id;
    private String name;
    private String password;
    private String system;
    private String isSuccess;
    private Date loginTime;
    private String ipAddress;
}
