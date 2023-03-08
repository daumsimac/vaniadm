package com.vani.transaction.service.impl;

import com.vani.transaction.dto.TrVhListDto;
import com.vani.transaction.model.TrVhInfo;
import com.vani.transaction.model.TrVhListInfo;
import com.vani.transaction.service.TrVhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TrVhServiceImpl implements TrVhService {

  //@Autowired
  //private TrVhMapper trVhMapper;
  @Override
  public List<TrVhListInfo> getTrHistories(TrVhListDto trVhListDto) {
    //return trVhMapper.selectTrHistories(trVhListDto);
    return null;
  }

  @Override
  public int getTrHistoriesCount(TrVhListDto trVhListDto) {
    //return trVhMapper.selectTrHistoriesCount(trVhListDto);
    return 0;
  }

  @Override
  public TrVhInfo getTrHistory(TrVhListInfo trVhListInfo) {
    //return trVhMapper.selectTrHistory(trVhListInfo);
    return null;
  }
}
