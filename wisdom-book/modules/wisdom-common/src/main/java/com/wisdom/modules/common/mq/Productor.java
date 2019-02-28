package com.wisdom.modules.common.mq;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Productor{

    @Autowired
    private RabbitTemplate rabbitTemplate;

    public void sendMessage(Object message){
        System.out.println("productor:" + message);
        rabbitTemplate.convertAndSend("real_time_queue", message);
    }
}
