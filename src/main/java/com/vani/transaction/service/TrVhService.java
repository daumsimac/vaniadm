package com.vani.transaction.service;

import com.vani.transaction.dto.TrVhListDto;
import com.vani.transaction.model.TrVhInfo;
import com.vani.transaction.model.TrVhListInfo;

import java.util.List;

public interface TrVhService {
  List<TrVhListInfo> getTrHistories(TrVhListDto trVhListDto);

  int getTrHistoriesCount(TrVhListDto trVhListDto);

  TrVhInfo getTrHistory(TrVhListInfo trVhListInfo);
}
