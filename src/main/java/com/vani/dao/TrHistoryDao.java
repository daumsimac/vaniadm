package com.vani.dao;

import com.vani.model.TrHistory;

import java.util.List;

public interface TrHistoryDao {

    public List<TrHistory> findAllTrHistory() throws Exception;

    public TrHistory findTrHistoryById() throws Exception;
}
