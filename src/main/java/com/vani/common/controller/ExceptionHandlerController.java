package com.vani.common.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class ExceptionHandlerController  {
  Logger logger = LoggerFactory.getLogger(ExceptionHandlerController.class);

  @RequestMapping("/error")
  public String getErrorView(Model model, HttpServletRequest request, HttpServletResponse response) {
    Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
    HttpStatus httpStatus = HttpStatus.valueOf(Integer.parseInt(status.toString()));

    logger.error("Error:: " + httpStatus);
    model.addAttribute("errorCode", status.toString());

    if(httpStatus.equals(HttpStatus.NOT_FOUND)) {
      model.addAttribute("errorMsg1","Page Not Found");
    } else if(httpStatus.equals(HttpStatus.INTERNAL_SERVER_ERROR)) {
      model.addAttribute("errorMsg1","Temporary error");
    } else {
      model.addAttribute("errorMsg1", httpStatus);
    }
    model.addAttribute("errorMsg2","If the error persists, please contact your administrator.");
    return "error.err";
  }
}
