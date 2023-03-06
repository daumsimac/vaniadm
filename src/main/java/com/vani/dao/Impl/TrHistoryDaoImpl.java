package com.vani.dao.Impl;

import com.vani.dao.TrHistoryDao;
import com.vani.model.TrHistory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TrHistoryDaoImpl extends BaseDaoBean implements TrHistoryDao {

    @Override
    public List<TrHistory> findAllTrHistory() throws Exception {
        return getSqlSession().selectList("com.vani.mapper.TrHistoryMapper.findAllTrHistory");
    }

    @Override
    public TrHistory findTrHistoryById() throws Exception {
        return null;
    }
}
