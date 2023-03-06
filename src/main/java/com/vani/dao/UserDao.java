package com.vani.dao;

import com.vani.model.UserVO;

public interface UserDao {

    UserVO getUser(String id) throws Exception;
}
