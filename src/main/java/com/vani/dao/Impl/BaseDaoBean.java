package com.vani.dao.Impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import javax.annotation.Resource;

public class BaseDaoBean extends SqlSessionDaoSupport {

    @Resource(name = "sqlSessionFactory")
    public void setSuperSqlSessionFactory(SqlSessionFactory sqlSessionFactoryForACARS){
        super.setSqlSessionFactory(sqlSessionFactoryForACARS);
    }
}
