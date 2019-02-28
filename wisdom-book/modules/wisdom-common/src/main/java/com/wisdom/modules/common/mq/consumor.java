package com.wisdom.modules.common.mq;

import sun.plugin2.message.Message;

public class consumor {

    public void onMessage(Object message){

        System.out.println("consumor:" + message);
        System.out.println(111111);
    }
}
