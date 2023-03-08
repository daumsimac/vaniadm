<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Script-Type" content="text/javascript">
    <meta http-equiv="Content-Style-Type" content="text/css">
    <meta id="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Login</title>
    <link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="resources/css/bootstrap/bootstrap-grid.css">
    <link rel="stylesheet" href="resources/css/bootstrap/bootstrap-reboot.css">
    <link rel="stylesheet" href="resources/css/bootstrap/bootstrap-toggle.min.css">
    <link rel="stylesheet" href="resources/css/common.css">
    <!-- <link rel="stylesheet" href="resources/css/dashboard.css"> -->
  </head>

  <body>
  <div class="login_container">
    <div class="logo">
      <img src="resources/image/infoplus_sample.png" alt="Info Plus CI" style="width: 10%;">
      <span>| Admin Page</span>
    </div>
    <div class="login_form">
      <form method="post" action="/test">
        <table class="table">
          <tr class="">
            <td class="" style="text-align: center; line-height: 3.7rem;width: 30%;">아이디</td>
            <td class="" style="width: 70%;"><input type="text" id="id" name="id" style="width: 100%;" placeholder="아이디를 입력하세요." autocomplete="off" required></td>
          </tr>
          <tr class="">
            <td style="text-align: center; line-height: 3.7rem; width: 30%;">비밀번호</td>
            <td style="width: 70%;"><input type="password" id="password" name="password" style="width: 100%;" placeholder="비밀번호를 입력하세요." autocomplete="off" required></td>
          </tr>
        </table>
        <div style="margin: 0 43%;">
          <input type="submit" value="로그인" class="btn btn-primary">
        </div>
      </form>
      <div style="text-align: center;">
        Copyright ©
      </div>
    </div>
  </div>
  <script type="text/javascript" src="resources/js/jquery-3.6.3.js"></script>
    <!-- <script type="text/javascript" src="resources/bootstrap/js/tether.min.js"></script> -->
    <!-- <script type="text/javascript" src="resources/bootstrap/js/bootstrap.js"></script> -->
    <!-- <script type="text/javascript" src="resources/js/bootstrap-toggle.min.js"></script> -->
    <script type="text/javascript" src="resources/js/jquery-ui.js"></script>
    <script type="text/javascript" src="resources/select2-4.0.13/dist/js/select2.js"></script>
    <script type="text/javascript" src="resources/js/common.js"></script>
  </body>
</html>
