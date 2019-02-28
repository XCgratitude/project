package com.wisdom.modules.common.controller;

import com.wisdom.framework.core.controller.BaseController;
import com.wisdom.modules.common.domain.Merchant;
import com.wisdom.modules.common.mq.MQProducer;
import com.wisdom.modules.common.mq.Productor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



/**
 * @author hyberbin on 2016/10/30.
 */
@Controller
@RequestMapping("/index")
public class IndexController extends BaseController {

    @Autowired
    //  private MQProducer mqProducer;
    private Productor productor;
    @RequestMapping("index")
    public String index() throws Exception {

        //  mqProducer.sendDataToQueue("real_time_queue", "好好学习！");
        Merchant merchant = new Merchant();
        merchant.setIpLimit("111111");
        productor.sendMessage("learning");
        productor.sendMessage("111111");
        return "index";
    }

}
