package com.wisdom.modules.user.controller;

import com.wisdom.modules.admin.domain.Admin;
import com.wisdom.modules.user.domain.User;
import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class HandlerInterceptor1 implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        //首先进入的方法
       // System.out.println(request.getServletPath());
        String servletPath = request.getServletPath();
        HttpSession session = request.getSession();
        if(servletPath.contains("admin")){
            Admin admin = (Admin) session.getAttribute("admin");
            if(admin!=null){
                return true;
            }else{
                request.setAttribute("login", "4");
                //response.sendRedirect(" /wisdom/admin/loginPage.do");
                request.getRequestDispatcher("/WEB-INF/pages/admin/login.jsp").forward(request, response);
                return false;
            }
        }/*
        String yz = request.getParameter("yz");
        if( "1".equals(yz)){
            Admin admin = (Admin) session.getAttribute("admin");
            if(admin!=null){
                return true;
            }else{
                request.setAttribute("login", "4");
                //response.sendRedirect(" /wisdom/admin/loginPage.do");
                request.getRequestDispatcher("/WEB-INF/pages/admin/login.jsp").forward(request, response);
                return false;
            }*/
        else {
            User u= (User)session.getAttribute("user");
            if(u!=null){
                return true;
            }else{
                request.setAttribute("login", "1");
                request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
                return false;
            }
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                           Object o, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                                Object o, Exception e) throws Exception {
    }
}
