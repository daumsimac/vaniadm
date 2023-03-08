<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  // 현재페이지
  int cp = Integer.parseInt((String)request.getParameter("currentPage"));

  // 리스트 사이즈
  int ls = Integer.parseInt((String)request.getParameter("listSize"));

  // 전체갯수
  int listCount = Integer.parseInt((String)request.getParameter("listCount"));

  // 출력페이지갯수
  int ps = Integer.parseInt((String)request.getParameter("pageSize"));

  // 링크
  String jsFunction = (String)request.getParameter("jsFunction");

  // 총 페이지 수
  int pageCount = (int)Math.ceil((double)(listCount + ((int)((cp - 1) /ps)) * ps * ls) /ls);

  // prev page 페이지 블럭 시작 카운트
  int pp = (int)((cp - 1)/ps) * ps;

  // next page 페이지블럭 끝카운트
  int np = pp + ps + 1;
  if(np > pageCount) {
    np = pageCount + 1;
  }

  java.text.DecimalFormat Commas = new java.text.DecimalFormat("#,###");
  String totalCount = (String)Commas.format(listCount);
%>

<%-- first page --%>
<%-- <li class="page-item"><a class="page-link" href="javascript:<%=jsFunction%>('1');" title="처음">처음으로</a></li> --%>


<%-- prev page --%>
<%
  if(pp > 0) {
%>
<li class="page-item"><a class="page-link" href="javascript:<%=jsFunction%>('<%=pp%>');" title="이전">&lt;</a></li>
<%
  } else {
%>
<li class="page-item"><a class="page-link" href="javascript:<%=jsFunction%>('1');" title="이전">&lt;</a></li>
<%
  }
%>


<%-- current page --%>
<%
  for(int i = 1; i <= ps; i++) {
    if(pp + i == cp) {
%>
<li class="page-item active"><span class="page-link"><%=cp%></span></li>
<%
    } else if(pp + i <= pageCount) {
%>
<li class="page-item"><a class="page-link" href="javascript:<%=jsFunction%>('<%=pp + i%>');"><%=pp + i%></a></li>
<%
    } else {
    }
  }
%>


<%-- next page --%>
<%
  if(np < pageCount) {
%>
<li class="page-item"><a class="page-link" href="javascript:<%=jsFunction%>('<%=np%>');" title="다음">&gt;</a></li>
<%
  } else {
%>
<li class="page-item"><a class="page-link" href="javascript:<%=jsFunction%>('<%=pageCount%>');" title="다음">&gt;</a></li>
<%
  }
%>


<%-- last page --%>
<%-- <li class="page-item"><a class="page-link" href="javascript:<%=jsFunction%>('<%=pageCount%>');" title="마지막">끝으로</a></li> --%>
