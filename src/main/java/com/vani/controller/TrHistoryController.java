package com.vani.controller;

import com.vani.dao.TrHistoryDao;
import com.vani.model.TrHistory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class TrHistoryController {

    private static final Logger logger = LoggerFactory.getLogger(TrHistoryController.class);

    @Autowired
    TrHistoryDao trHistoryDao;

    @RequestMapping(value = "/trhistory", method = RequestMethod.GET)
    public @ResponseBody List<TrHistory> getTrHistory() throws Exception {
        List<TrHistory> trHistorylist = trHistoryDao.findAllTrHistory();
        return trHistorylist;
    }
}
