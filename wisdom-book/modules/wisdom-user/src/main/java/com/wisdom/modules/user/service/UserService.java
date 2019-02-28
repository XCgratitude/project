package com.wisdom.modules.user.service;

import com.wisdom.framework.core.exception.BusinessException;
import com.wisdom.modules.user.domain.User;

import java.io.ByteArrayOutputStream;

public interface UserService {

    User findById(int id) throws BusinessException;

    String selectByUserName(String userName) throws BusinessException;

    String drawImg(ByteArrayOutputStream output) throws BusinessException;

    User selectByUserNameAndPass(User user) throws BusinessException;

    void registerUser(User user) throws BusinessException;

    void updateUser(User user)throws BusinessException;
}
