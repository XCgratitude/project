package com.wisdom.modules.common.mq.impl;

import com.wisdom.modules.common.mq.MQProducer;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("mqProducer")
public class MQProducerImpl implements MQProducer {

    @Autowired
    private AmqpTemplate amqpTemplate;

    @Override
    public void sendDataToQueue(String queueKey, Object object) throws Exception {
        try {
            amqpTemplate.convertAndSend(queueKey, object);
        } catch (Exception e) {
            throw new Exception(e);
        }
    }

   /* public void onMessage(String message){
        System.out.println("consumor:" + message);
    }*/

}
