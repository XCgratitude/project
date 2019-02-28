package com.wisdom.modules.admin.persistence;

import com.wisdom.modules.admin.domain.Admin;
import com.wisdom.modules.admin.domain.AdminLog;
import com.wisdom.modules.admin.domain.Chat;

import java.util.List;

public interface AdminMapper {

    void insert(Admin admin);

    List<Admin> selectAllAdmin();

    Admin selectAdmin(Admin admin);

    void insertAdminLog(AdminLog adminLog);

    void updateLoginNum(int id);

    void deleteAdmin(int id);

    List<AdminLog> selectAllLoginLog();

    void deleteLoginLog(int[] ids);

    void updatePwdByAdminId(Admin admin);

    Admin selectAdminByName(String adminName);

    void insertChar(Chat chat);

    List<Chat> selectChat(Chat chat);
}
