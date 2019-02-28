package com.wisdom.modules.user.controller;

import com.wisdom.framework.core.exception.BusinessException;
import com.wisdom.modules.admin.domain.Admin;
import com.wisdom.modules.admin.domain.Chat;
import com.wisdom.modules.admin.service.AdminService;
import com.wisdom.modules.user.domain.User;
import com.wisdom.modules.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/user")
public class UserController{

    @Autowired
    private UserService userService;

    @RequestMapping("register")
    public String register(){ return "register";}

    @RequestMapping("index")
    public String index(){
        return "index";
    }

    @RequestMapping("error")
    public String error(HttpServletRequest request){
        request.getSession().invalidate();

        request.setAttribute("login","3");

        return "login";

    }

    @RequestMapping("validUserName")
    @ResponseBody
    public String validUserName(String userName){
        String result = null;
        try {
            result = userService.selectByUserName(userName);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return result;
    }

    @RequestMapping("registerUser")
    public String registerUser(User user, String code, HttpServletRequest request, Model model){

        String ckcode = (String)request.getSession().getAttribute("verifyCodeValue");
        if(!ckcode.equalsIgnoreCase(code)){
            model.addAttribute("code_msg", "验证码错误");
            model.addAttribute("hUser",user);
            return "register";
        }else {
            String text = "";
            Random random = new Random();
            for(int i = 0; i < 4; i++){
                int a = random.nextInt(10);
                text += a;
            }
            user.setActiveCode(text);
            try {
                userService.registerUser(user);
            } catch (BusinessException e) {
                e.printStackTrace();
            }
        }
        return "registersuccess";
    }

    @RequestMapping("myAccount")
    public String myAccount(HttpServletRequest request){

        User user = (User) request.getSession().getAttribute("user");
        if(user != null){
            return "myAccount";
        }else {
            return  "login";
        }
    }

    @RequestMapping("login")
    public String login(User user, HttpServletRequest request, Model model) {

        User u = null;
        try {
            u = userService.selectByUserNameAndPass(user);
            if (u != null) {
                request.getSession().setAttribute("user", u);
                return "redirect:index.do";
            } else {
                model.addAttribute("msg", "用户名或密码错误！");
                return "login";
            }
        } catch (BusinessException e) {
            e.printStackTrace();
            return "index";
        }
    }

    @RequestMapping("modifyUserInfo")
    public String modifyUserInfo() {

        return "modifyuserinfo";
    }

    @RequestMapping("modifyUser")
    public String modifyUser(User user, HttpServletRequest request) {
        try {
            userService.updateUser(user);
            //session销毁
            request.getSession().invalidate();
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "modifyUserInfoSuccess";
    }
    @RequestMapping("loginOut")
    public String loginOut(HttpServletRequest request) {
        //session销毁
        request.getSession().invalidate();
        return "login";
    }

    @Autowired
    private AdminService adminService;
    @RequestMapping("sendMsg")
    private String sendMsg(Chat chat, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        User user = (User) session.getAttribute("user");
        if (user==null || admin == null){
            model.addAttribute("UI",1);
            return "admin/chat/UI";
        }
        chat.setUserId(user.getId());
        chat.setAdminId(admin.getId());
        try {
            adminService.insertChar(chat);
            //List<Chat> chats = adminService.selectChat(chat);
            //model.addAttribute("chats",chats);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        if(chat.getWhoTowho() == 1){
            return "redirect:adminUI.do";
        }else {
            return "redirect:userUI.do";
        }

    }
    @RequestMapping("userUI")
    private String userUI(Chat chat, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        User user = (User) session.getAttribute("user");
        if (user==null || admin == null){
            model.addAttribute("UI",1);
            return "UI";
        }
        chat.setAdminId(admin.getId());
        chat.setUserId(user.getId());
        try {
            List<Chat> chats = adminService.selectChat(chat);
            model.addAttribute("chats",chats);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "UI";
    }

    @RequestMapping("adminUI")
    private String adminUI(Chat chat, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        User user = (User) session.getAttribute("user");
        if (user==null || admin == null){
            model.addAttribute("UI",1);
            return "admin/chat/UI";
        }
        chat.setAdminId(admin.getId());
        chat.setUserId(user.getId());
        try {
            List<Chat> chats = adminService.selectChat(chat);
            model.addAttribute("chats",chats);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "admin/chat/UI";
    }

    @RequestMapping("index1")
    private String index1(){
        return "index1";
    }
}
