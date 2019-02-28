package com.wisdom.modules.user.persistence;

import com.wisdom.framework.core.data.Mapper;
import com.wisdom.modules.user.domain.User;


public interface UserMapper{

    User findById(int id);

    User selectByUserName(String userName);

    User selectByUserNameAndPass(User user);

    void registerUser(User user);

    void updateUser(User user);
}
