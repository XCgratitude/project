package com.wisdom.modules.admin.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wisdom.framework.core.data.PagerRequest;
import com.wisdom.framework.core.exception.BusinessException;
import com.wisdom.modules.admin.domain.Admin;
import com.wisdom.modules.admin.domain.AdminLog;
import com.wisdom.modules.admin.domain.Chat;
import com.wisdom.modules.admin.persistence.AdminMapper;
import com.wisdom.modules.admin.service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService{

    protected Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public void insert(Admin admin) throws BusinessException {
        try {
            adminMapper.insert(admin);
        }catch (DataAccessException e){
            log.error("登录失败！");
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public List<Admin> selectAllAdmin() throws BusinessException {
        try {
            return  adminMapper.selectAllAdmin();
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public Admin selectAdmin(Admin admin) throws BusinessException {
        try {
            return  adminMapper.selectAdmin(admin);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void insertAdminLog(AdminLog adminLog) throws BusinessException {
        try {
            adminMapper.insertAdminLog(adminLog);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void updateLoginNum(int id) throws BusinessException {
        try {
            adminMapper.updateLoginNum(id);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void deleteAdmin(int id) throws BusinessException {
        try {
            adminMapper.deleteAdmin(id);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

  /*  @Override
    public List<AdminLog> selectAllLoginLog() throws BusinessException {
        try {
            return adminMapper.selectAllLoginLog();
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }*/

    @Override
    public void deleteLoginLog(int[] ids) throws BusinessException {
        try {
            adminMapper.deleteLoginLog(ids);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public PageInfo<AdminLog> selectAdminLogByPage(PagerRequest pagerRequest) throws BusinessException {
        try {
            PageHelper.startPage(pagerRequest.getStartPage(), pagerRequest.getPageLength());
            List<AdminLog> AdminLogs = adminMapper.selectAllLoginLog();
            PageInfo<AdminLog> pageInfo = new PageInfo<>(AdminLogs);
            return pageInfo;
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void updatePwdByAdminId(Admin admin) throws BusinessException {
        try {
            adminMapper.updatePwdByAdminId(admin);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public Admin selectAdminByName(String adminName) throws BusinessException {
        try {
            return adminMapper.selectAdminByName(adminName);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public void insertChar(Chat chat) throws BusinessException {
        try {
            adminMapper.insertChar(chat);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }

    @Override
    public List<Chat> selectChat(Chat chat) throws BusinessException {
        try {
            return  adminMapper.selectChat(chat);
        }catch (Exception e){
            throw new BusinessException(e.getMessage());
        }
    }
}
