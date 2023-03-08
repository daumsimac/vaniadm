<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta http-equiv="Content-Script-Type" content="text/javascript">
    <meta http-equiv="Content-Style-Type" content="text/css">
    <meta id="viewport" content="width=device-width, initial-scale=1">
    <title>Admin</title>
    <tiles:importAttribute name="stylesheets" />
    <c:forEach var="css" items="${stylesheets}">
      <link rel="stylesheet" href="${css}">
    </c:forEach>
  </head>
  <body>
    <tiles:insertAttribute name="header"/> <!--  /WEB-INF/jsp/header.jsp -->
    <div class="container-fluid bb-bl">
      <div class="row">
        <tiles:insertAttribute name="body"/> <!-- body -->
      </div>
    </div>
    <tiles:insertAttribute name="footer"/> <!-- /WEB-INF/jsp/footer.jsp -->
    <tiles:importAttribute name="javascripts" />
    <c:forEach var="js" items="${javascripts}">
      <script src="${js}"></script>
    </c:forEach>

    <script>
      $(document).ready(function() {
      $('.datepicker').datepicker({
        dateFormat: 'yy-mm-dd',
        prevText:'prev',
        nextText:'next',
        showButtonPanel: true,
        changeMonth: true,
        changeYear: true,
        showMonthAfterYear: true,
        selectOtherMonths: true
      });

      $('.js-select2').select2();
    });

    $(".sch-btn").on("click", function() {
      doSubmit();
    });
    </script>
  </body>
</html>
