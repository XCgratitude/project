package com.wisdom.modules.admin.service;

import com.github.pagehelper.PageInfo;
import com.wisdom.framework.core.data.PagerRequest;
import com.wisdom.framework.core.exception.BusinessException;
import com.wisdom.modules.admin.domain.Admin;
import com.wisdom.modules.admin.domain.AdminLog;
import com.wisdom.modules.admin.domain.Chat;
import org.springframework.stereotype.Service;

import java.util.List;

public interface AdminService {

    void insert(Admin admin) throws BusinessException;

    List<Admin> selectAllAdmin() throws BusinessException;

    Admin selectAdmin(Admin admin) throws BusinessException;

    void insertAdminLog(AdminLog adminLog) throws BusinessException;

    void updateLoginNum(int id) throws BusinessException;

    void deleteAdmin(int id) throws BusinessException;

    void deleteLoginLog(int[] ids) throws BusinessException;

    PageInfo<AdminLog> selectAdminLogByPage(PagerRequest pagerRequest) throws BusinessException;

    void updatePwdByAdminId(Admin admin) throws BusinessException;

    Admin selectAdminByName(String adminName) throws BusinessException;

    void insertChar(Chat chat) throws BusinessException;

    List<Chat> selectChat(Chat chat) throws BusinessException;
}
