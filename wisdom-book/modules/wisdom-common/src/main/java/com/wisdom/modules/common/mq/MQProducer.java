package com.wisdom.modules.common.mq;

public interface MQProducer {

    void sendDataToQueue(String queueKey, Object object) throws Exception;
}
