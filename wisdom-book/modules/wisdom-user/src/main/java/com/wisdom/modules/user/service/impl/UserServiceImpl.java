package com.wisdom.modules.user.service.impl;

import com.wisdom.framework.core.exception.BusinessException;
import com.wisdom.framework.core.util.MailEngine;
import com.wisdom.framework.core.util.SendJMail;
import com.wisdom.modules.user.domain.User;
import com.wisdom.modules.user.persistence.UserMapper;
import com.wisdom.modules.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User findById(int id) throws BusinessException{
        try {
            User user = userMapper.findById(id);
            return user;
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }

    }

    @Override
    public String selectByUserName(String userName) throws BusinessException {
        try {
            User user = userMapper.selectByUserName(userName);
            if(user != null ){
                return "yes";
            }else {
                return "no";
            }
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public String drawImg(ByteArrayOutputStream output) {
        String code = "";
        // 随机产生4个字符
        for (int i = 0; i < 4; i++) {
            code += randomChar();
        }
        int width = 70;
        int height = 25;
        BufferedImage bi = new BufferedImage(width, height,
                BufferedImage.TYPE_3BYTE_BGR);
        Font font = new Font("Times New Roman", Font.PLAIN, 20);
        // 调用Graphics2D绘画验证码
        Graphics2D g = bi.createGraphics();
        g.setFont(font);
        Color color = new Color(66, 2, 82);
        g.setColor(color);
        g.setBackground(new Color(226, 226, 240));
        g.clearRect(0, 0, width, height);
        FontRenderContext context = g.getFontRenderContext();
        Rectangle2D bounds = font.getStringBounds(code, context);
        double x = (width - bounds.getWidth()) / 2;
        double y = (height - bounds.getHeight()) / 2;
        double ascent = bounds.getY();
        double baseY = y - ascent;
        g.drawString(code, (int) x, (int) baseY);
        g.dispose();
        try {
            ImageIO.write(bi, "jpg", output);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return code;

    }

    @Override
    public User selectByUserNameAndPass(User user) throws BusinessException {
        try {
            return userMapper.selectByUserNameAndPass(user);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Autowired
    private MailEngine mailEngine;

    @Override
    public void registerUser(User user) throws BusinessException {
        try {
            userMapper.registerUser(user);
            String emailMsg = "注册成功，请<a href=' http://localhost:8080/wisdom/user/index.do/activeServlet?activeCode="+user.getActiveCode()+"'>激活</a>后登录";
            mailEngine.sendMessage("wisdom",user.getEmail(), emailMsg);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void updateUser(User user) throws BusinessException{
        try {
            userMapper.updateUser(user);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }


    private char randomChar() {
        Random r = new Random();
        String s = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
        return s.charAt(r.nextInt(s.length()));
    }

}
