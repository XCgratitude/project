package com.wisdom.modules.admin.controller;

import com.github.pagehelper.PageInfo;
import com.wisdom.framework.core.data.PagerRequest;
import com.wisdom.framework.core.exception.BusinessException;
import com.wisdom.framework.core.util.SystemUtil;
import com.wisdom.modules.admin.domain.Admin;
import com.wisdom.modules.admin.domain.AdminLog;
import com.wisdom.modules.admin.domain.Chat;
import com.wisdom.modules.admin.service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("admin")
public class AdminController {

    private Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    private AdminService adminService;

    @RequestMapping("index")
    private String index(Model model,HttpServletRequest request){

        Admin admin = (Admin)request.getSession().getAttribute("admin");
        if (admin != null){
            return  "admin/index";
        }
        return  "admin/login";
    }

    @RequestMapping("top")
    private String top(){return  "admin/iframe/top";}

    @RequestMapping("left")
    private String left(){return  "admin/iframe/left";}

    @RequestMapping("main")
    private String main(Model model){

        return  "admin/iframe/main";
    }

    @RequestMapping("help")
    private String help(){return  "admin/iframe/help";}

    @RequestMapping("foot")
    private String foot(){return  "admin/iframe/foot";}

    @RequestMapping("loginPage")
    private String loginPage(Admin admin) {
        return  "admin/login";
    }

    @RequestMapping("login")
    private String login(Admin admin, HttpServletRequest request,Model model) throws BusinessException {
        AdminLog adminLog = new AdminLog();
        try {
            Admin admin1 = adminService.selectAdmin(admin);
            String ipAddress = SystemUtil.getIpAddress();
            String systemName = SystemUtil.getSystemName();
            adminLog.setIpAddress(ipAddress);
            adminLog.setSystem(systemName);
            adminLog.setName(admin.getUsername());
            adminLog.setPassword(admin.getPassword());
            if(admin1 != null){
                if (admin1.getAdminStatus().equals("在用")){
                    request.getSession().setAttribute("admin",admin1);
                    adminLog.setIsSuccess("成功");
                    adminService.insertAdminLog(adminLog);
                    adminService.updateLoginNum(admin1.getId());
                    String format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
                    request.getSession().setAttribute("time",format);
                    return  "admin/index";
                }else {
                    adminLog.setIsSuccess("失败");
                    adminService.insertAdminLog(adminLog);
                    model.addAttribute("login","2");
                    return  "admin/login";
                }
            }
        } catch (BusinessException e) {
            adminLog.setIsSuccess("失败");
            adminService.insertAdminLog(adminLog);
            log.error("登录失败！");
            e.printStackTrace();
        } catch (UnknownHostException e) {
            adminLog.setIsSuccess("失败");
            adminService.insertAdminLog(adminLog);
            log.error("登录失败！");
            e.printStackTrace();
        }
        adminLog.setIsSuccess("失败");
        adminService.insertAdminLog(adminLog);
        model.addAttribute("login","1");
        return  "admin/login";
    }

    @RequestMapping("admin")
    private String admin(Model model) {

        List<Admin> admins = null;
        try {
            admins = adminService.selectAllAdmin();
        } catch (BusinessException e) {
            log.error("查询所有管理员失败！");
            e.printStackTrace();
        }
        model.addAttribute("admins",admins);
        return  "admin/system/admin";
    }

    @RequestMapping("addAdmin")
    private String addAdmin(Admin admin) {
        try {
            adminService.insert(admin);
        } catch (BusinessException e) {
            log.error("添加管理员失败！");
            e.printStackTrace();
        }
        return  "redirect:admin.do";
    }
    @RequestMapping("deleteAdmin")
    private String deleteAdmin(int id) {
        try {
            adminService.deleteAdmin(id);
        } catch (BusinessException e) {
            log.error("删除管理员失败！");
            e.printStackTrace();
        }
        return  "redirect:admin.do";
    }

    @RequestMapping("loginLog")
    private String loginLog(Model model,PagerRequest pagerRequest) {
        try {
            if (pagerRequest.getStartPage() == null){
                pagerRequest.setStartPage(1);
            }
            pagerRequest.setPageLength(2);
            PageInfo<AdminLog> pageInfo = null;
            pageInfo = adminService.selectAdminLogByPage(pagerRequest);
            model.addAttribute("pages",pageInfo);
        } catch (BusinessException e) {
            log.error("查询所有管理员登录日志失败！");
            e.printStackTrace();
        }
        return  "admin/system/log";
    }

    @RequestMapping("deleteLoginLog")
    private String deleteLoginLog(int[] ids) {
        try {
            if(ids == null || ids.length <= 0){
                return "redirect:loginLog.do";
            }else{
                adminService.deleteLoginLog(ids);
            }
        } catch (BusinessException e) {
            log.error("删除管理员登录日志失败！");
            e.printStackTrace();
        }
        return  "redirect:loginLog.do";
    }

    @RequestMapping("loginOut")
    private String loginOut(Model model, HttpServletRequest request) {

        request.getSession().invalidate();

        return  "admin/login";
    }

    @RequestMapping("editPwdPage")
    private String editPwdPage() {

        return  "admin/system/editpwd";

    }

    @RequestMapping("editPwd")
    private String editPwd(String newpwd, HttpServletRequest request, Model model) {
        try {
            Admin admin = (Admin) request.getSession().getAttribute("admin");
            if(newpwd != null && admin != null){
                admin.setPassword(newpwd);
                adminService.updatePwdByAdminId(admin);
                model.addAttribute("login","3");
            }
        } catch (BusinessException e) {
            log.error("更改管理员密码失败！");
            e.printStackTrace();
        }
        return  "admin/login";
    }

    @RequestMapping("nameIfExist")
    @ResponseBody
    private boolean nameIfExist(String adminName) {
        try {
            Admin admin = adminService.selectAdminByName(adminName);
            if (admin == null) {
                return false;
            }
        } catch (BusinessException e) {
            log.error("根据管理员名查询管理员失败！");
            e.printStackTrace();
        }
        return true;
    }



}
