package com.vani.dao.Impl;

import com.vani.dao.UserDao;
import com.vani.model.UserVO;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl extends BaseDaoBean implements UserDao {

    @Override
    public UserVO getUser(String id) throws Exception {
        return null;
    }
}
