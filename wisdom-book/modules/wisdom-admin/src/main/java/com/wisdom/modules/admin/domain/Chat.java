package com.wisdom.modules.admin.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Chat {
    private int charId;
    private int userId;
    private int adminId;
    private String context;
    private int whoTowho;
    private Date receiverTime;
}
