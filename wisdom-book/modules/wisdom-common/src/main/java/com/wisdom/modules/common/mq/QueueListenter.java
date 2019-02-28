package com.wisdom.modules.common.mq;

import org.springframework.amqp.core.Message;

public class QueueListenter {

    public void onMessage(Message message) {

        System.out.println(1111111111);
        System.out.println(message);
    }
}
