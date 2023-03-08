<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>


<html>
  <tiles:insertAttribute name="header"/>
  <div class="container-fluid bb-bl p-5">
    <tiles:insertAttribute name="body"/>
  </div>
  <tiles:insertAttribute name="footer"/>
</html>
