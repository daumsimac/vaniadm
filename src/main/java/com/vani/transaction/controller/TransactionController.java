package com.vani.transaction.controller;

import com.vani.transaction.dto.TrVhListDto;
import com.vani.transaction.model.TrVhListInfo;
import com.vani.transaction.service.TrVhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class TransactionController {

  @Autowired
  private TrVhService trVhService;


  @GetMapping("/transaction/trHistory/list")
  public String getTrList(@ModelAttribute("trVhListDto") TrVhListDto trVhListdto, Model model) {
    //model.addAttribute("orgList", orgVmService.getOrgs());
    // model.addAttribute("rlysysList", rlysysVmService.getRlysysList()); // 중계시스템 테이블 부재
    return "transaction/trHistory/list.do";
  }

  @PostMapping("/transaction/trHistory/listView")
  public String getTrListView(@ModelAttribute("trVhListDto") TrVhListDto trVhListDto, Model model, HttpServletRequest request, HttpServletResponse response) {
    trVhListDto.setCurrentPageNo(trVhListDto.getPageIndex());
    trVhListDto.setRecordCountPerPage(trVhListDto.getRecordCountPerPage());
    trVhListDto.setPageSize(trVhListDto.getPageSize());

    List<TrVhListInfo> list = trVhService.getTrHistories(trVhListDto);
    int listSize = trVhService.getTrHistoriesCount(trVhListDto);

    if(listSize > 0) {
      trVhListDto.setTotalRecordCount(listSize);
    } else {
      trVhListDto.setTotalRecordCount(0);
    }

    model.addAttribute("list",list);
    return "transaction/trHistory/listView.no";
  }

  @PostMapping("/transaction/trHistory/detail")
  public String getTrDtl(@ModelAttribute("trVhListInfo") TrVhListInfo trVhListInfo, Model model, HttpServletRequest request, HttpServletResponse response) {
    model.addAttribute("info",trVhService.getTrHistory(trVhListInfo));
    return "transaction/trHistory/detail.no";
  }

  @GetMapping("/transaction/trInqBeneHistory/list")
  public String getTrInqBeneList(Model model, HttpServletRequest request, HttpServletResponse response) {
    //model.addAttribute("orgList", orgVmService.getOrgs());
    return "transaction/trInqBene/list.do";
  }
}
