<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
              <div class="table-responsive bt-bl">
                <table class="table mb-2 list-table">
                  <thead>
                    <tr>
                      <th rowspan="2">No.</th>
                      <th rowspan="2">거래일자</th>
                      <th>삽입시각</th>
                      <th rowspan="2">기관명</th>
                      <th>출금은행명</th>
                      <th rowspan="2">식별구분</th>
                      <th>글로벌ID</th>
                      <th rowspan="2">거래금액</th>
                      <th rowspan="2">응답코드</th>
                      <th rowspan="2">거래상태</th>
                      <th rowspan="2">상세보기</th>
                    </tr>
                    <tr>
                      <th>응답시간</th>
                      <th>입금은행명</th>
                      <th>기관거래고유번호</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:choose>
                  <c:when test="${not empty list}">
                    <c:forEach items="${list}" var="item" varStatus="status">
                    <tr>
                      <td rowspan="2">${item.no}</td>
                      <td rowspan="2">
                        <fmt:parseDate value="${item.trDt}" var="trDt" pattern="yyyyMMdd" />
                        <fmt:formatDate value="${trDt}" pattern="yyyy-MM-dd" />
                      </td>
                      <td>
                        <fmt:parseDate value="${item.insTm}" var="insTm" pattern="HHmmss" />
                        <fmt:formatDate value="${insTm}" pattern="HH:mm:ss" />
                      </td>
                      <td rowspan="2">${item.orgNm}</td>
                      <td>${item.debitBnkId}</td>
                      <td rowspan="2">${item.svcId}</td>
                      <td>${item.gblid}</td>
                      <td rowspan="2">${item.tranAm}</td>
                      <td rowspan="2">${item.rspC}</td>
                      <td rowspan="2">
                      <c:choose>
                      <c:when test="${item.trprcStsc eq 1}">요청중</c:when>
                      <c:when test="${item.trprcStsc eq 2}">정상응답</c:when>
                      <c:when test="${item.trprcStsc eq 3}">오류응답</c:when>
                      <c:otherwise>
                      </c:otherwise>
                      </c:choose>
                      </td>
                      <td rowspan="2">
                        <!-- <button type="button" class="btn btn-primary" data-toggle="modal" onclick="javascript:setModal('${item.trDt}','${item.orgC}','${item.rlysysId}','${item.svcId}','${item.cliMsgId}');">거래내역</button> -->
                        <button type="button" class="dateBtn btn"onclick="fnModuleInfo('${item.trDt}','${item.orgC}','${item.rlysysId}','${item.svcId}','${item.cliMsgId}');">거래내역</button>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <fmt:parseDate value="${item.rspTm}" var="rspTm" pattern="HHmmss" />
                        <fmt:formatDate value="${rspTm}" pattern="HH:mm:ss" />
                      </td>
                      <td>${item.crdBnkId}</td>
                      <td>${item.cliMsgId}</td>
                    </tr>
                    </c:forEach>
                  </c:when>
                  <c:otherwise>
                    <tr>
                      <td colspan="11">no data</td>
                    </tr>
                  </c:otherwise>
                  </c:choose>
                  </tbody>
                </table>
              </div>

              <c:if test="${not empty list}">
              <!-- 페이징 -->
              <div class="row col-md-12 justify-content-center">
                <nav aria-label="Page navigation example">
                  <ul class="pagination">
                    <jsp:include page="/WEB-INF/jsp/common/paging.jsp">
                      <jsp:param name="currentPage" value="${trVhListDto.currentPageNo}"/>
                      <jsp:param name="listSize" value="${trVhListDto.recordCountPerPage}"/>
                      <jsp:param name="listCount" value="${trVhListDto.totalRecordCount}"/>
                      <jsp:param name="pageSize" value="${trVhListDto.pageSize}"/>
                      <jsp:param name="jsFunction" value="goPage"/>
                    </jsp:include>
                  </ul>
                </nav>
              </div>
              </c:if>
<script>
  function fnModuleInfo(trDt, orgC, rlysysId, svcId, cliMsgId){
    let data = {
      trDt: trDt,
      orgC: orgC,
      rlysysId: rlysysId,
      svcId: svcId,
      cliMsgId: cliMsgId
    };
     $('#MoaModal .modal-content').load("/transaction/trHistory/detail", data);
     $('#MoaModal').modal();
  }
</script>
