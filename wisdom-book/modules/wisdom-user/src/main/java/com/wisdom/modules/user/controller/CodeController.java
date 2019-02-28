package com.wisdom.modules.user.controller;

import com.wisdom.framework.core.exception.BusinessException;
import com.wisdom.modules.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

@Controller
@RequestMapping("/code")
public class CodeController {

    @Autowired
    private UserService userService;

    @RequestMapping("imageCode")
    public void imageCode(HttpServletResponse response, HttpSession session){

        ByteArrayOutputStream output = new ByteArrayOutputStream();
        String verifyCodeValue = null;
        try {
            verifyCodeValue = userService.drawImg(output);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        session.setAttribute("verifyCodeValue", verifyCodeValue);
        try {
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
