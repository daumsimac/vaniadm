<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

        <!-- 네비게이션바 -->
        <nav class="col-md-2 d-none d-md-block sidebar">
          <div class="sidebar-sticky">
            <h5 class="d-flex justify-content-between align-items-center px-3 mt-3 mb-3">거래내역[101]</h5>
            <ul class="nav flex-column mb-2">
              <li class="nav-item on"><a href="/transaction/trHistory/list" class="nav-link">거래내역[101]</a></li>
              <li class="nav-item"><a href="/transaction/trInqBeneHistory/list" class="nav-link">성명조회내역[102]</a></li>
              <li class="nav-item"><a href="#" class="nav-link">거래집계내역[103]</a></li>
              <li class="nav-item"><a href="#" class="nav-link">거래로그내역[104]</a></li>
              <li class="nav-item"><a href="#" class="nav-link">타임아웃내역[105]</a></li>
            </ul>
          </div>
        </nav>
        <!-- 본문내용 -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="mb-2">
            <!-- <img src="" alt="icon"> -->
            <span class="home">Home > 거래관리[100] > </span>
            <span>거래내역[101]</span>
          </div>
          <h3>거래내역[101]</h3>
          <hr>
          <!-- 테이블 -->
          <form id="listForm" method="post">
          <input type="hidden" id="url" name="url" value="${trVhListDto.url}">
          <input type="hidden" id="pageIndex" name="pageIndex" value="${trVhListDto.pageIndex}">
          <input type="hidden" id="fromTime" name="fromTime" value="">
          <input type="hidden" id="toTime" name="toTime" value="">
          <div class="mb-3">
            <table class="mb-2 sch-table">
              <tbody>
                <tr>
                  <th class="col-md-2">기관코드<span class="required">*</span></th>
                  <td class="col-md-4">
                    <select class="js-select2" name="orgC">
                      <option selected disabled>선택</option>
                      <c:forEach var="item" items="${orgList}">
                      <option value="${item.orgC}">${item.orgC}|${item.orgNm}</option>
                      </c:forEach>
                    </select>
                  </td>
                  <th class="col-md-2">식별구분코드</th>
                  <td class="col-md-4">
                    <select class="js-select2" name="svcId">
                      <option selected disabled>선택</option>
                      <option value="TRNENX">TRNENX</option>
                      <option value="CINAXX">CINAXX</option>
                      <option value="BENXNX">BENXNX</option>
                      <option value="OUTEXX">OUTEXX</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <th class="col-md-2">조회기준일</th>
                  <td class="col-md-4" colspan="3">
                    <input type="text" id="fromDate" name="fromDate" class="datepicker" style="width: initial;">
                    <!-- <select class="datetime" id="fromHH"></select>
                    <select class="datetime" id="fromMM"></select>
                    <select class="datetime" id="fromSS"></select> -->
                    &nbsp;~&nbsp;
                    <input type="text" id="toDate" name="toDate" class="datepicker" style="width: initial;">
                    <!-- <select class="datetime" id="toHH"></select>
                    <select class="datetime" id="toMM"></select>
                    <select class="datetime" id="toSS"></select> -->
                    <button type="button" class="btn dateBtn" id="yesterday">전일</button>
                    <button type="button" class="btn dateBtn btn-primary" id="today">당일</button>
                    <button type="button" class="btn dateBtn" id="prevMonth">전월</button>
                    <button type="button" class="btn dateBtn" id="currMonth">당월</button>
                  </td>
                </tr>
                <tr>
                  <th class="col-md-2">출금은행코드</th>
                  <td class="col-md-4">
                    <select class="js-select2" name="debitBnkId">
                      <%-- <option selected disabled>선택</option>
                      <c:forEach var="item" items="${rlysysList}">
                      <option value="${item.rlysysId}">${item.rlysysId}|${item.rlysysNm}</option>
                      </c:forEach> --%>
                      <option selected disabled>선택</option>
                      <option value="BIDV">BIDV</option>
                      <option value="011">011</option>
                    </select>
                  </td>
                  <th class="col-md-2">출금계좌번호</th>
                  <td class="col-md-4">
                    <input type="text" name="debitRsrcNum" placeholder="출금계좌번호를 입력하세요."/>
                  </td>
                </tr>
                <tr>
                  <th class="col-md-2">입금은행코드</th>
                  <td class="col-md-4">
                    <select class="js-select2" name="crdBnkId">
                      <%-- <option selected disabled>선택</option>
                      <c:forEach var="item" items="${rlysysList}">
                      <option value="${item.rlysysId}">${item.rlysysId}|${item.rlysysNm}</option>
                      </c:forEach> --%>
                      <option selected disabled>선택</option>
                      <option value="BIDV">BIDV</option>
                    </select>
                  </td>
                  <th class="col-md-2">입금계좌번호</th>
                  <td class="col-md-4">
                    <input type="text" name="crdRsrcNum" placeholder="입금계좌번호를 입력하세요."/>
                  </td>
                </tr>
                <tr>
                  <th class="col-md-2">거래고유번호</th>
                  <td class="col-md-4">
                    <input type="text" name="cliMsgId" placeholder="거래고유번호를 입력하세요."/>
                  </td>
                  <th class="col-md-2">글로벌ID</th>
                  <td class="col-md-4">
                    <input type="text" name="gblid" placeholder="글로벌ID를 입력하세요."/>
                  </td>
                </tr>
                <tr>
                  <th class="col-md-2">거래금액</th>
                  <td class="col-md-4">
                    <input type="text" name="tranAm" placeholder="거래금액을 입력하세요."/>
                  </td>
                  <th class="col-md-2">응답코드</th>
                  <td class="col-md-4">
                    <input type="text" name="rspC" placeholder="응답코드를 입력하세요."/>
                  </td>
                </tr>
                <tr>
                  <th class="col-md-2">타임아웃발생여부</th>
                  <td class="col-md-4">
                    <select name="tmoOcuYn">
                      <option selected disabled>선택</option>
                      <option value="Y">발생</option>
                      <option value="N">미발생</option>
                    </select>
                  </td>
                  <th class="col-md-2">거래처리상태코드</th>
                  <td class="col-md-4">
                    <select name="trprcStsc">
                      <option selected disabled>선택</option>
                      <option value="1">요청중</option>
                      <option value="2">정상응답</option>
                      <option value="3">오류응답</option>
                    </select>
                  </td>
                </tr>
              </tbody>
            </table>
            <div class="txt-cnt">
              <button type="button" class="btn btn-primary sch-btn">조회</button>
            </div>
          </div>

          <!-- 리스트 -->
          <div class="list-header mb-2">
            <span class="header-h5">거래내역 조회결과</span><span class="time"></span>
            <select name="recordCountPerPage" onchange="$('#pageIndex').val('1'); doSubmit();">
              <option value="10">10개씩</option>
              <option value="20">20개씩</option>
              <option value="30">30개씩</option>
            </select>
          </div>
          </form>
          <div class="container-list">
            <div id="body-list">
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
                      <td rowspan="2">${item.trDt}</td>
                      <td>${item.insTm}</td>
                      <td rowspan="2">${item.orgC}</td>
                      <td>${item.debitBnkId}</td>
                      <td rowspan="2">${item.svcId}</td>
                      <td>${item.gblid}</td>
                      <td rowspan="2">${item.tranAm}</td>
                      <td rowspan="2">${item.rspC}</td>
                      <td rowspan="2">${item.trprcStsc}</td>
                      <td rowspan="2">
                        <button type="button" class="btn">거래내역</button>
                      </td>
                    </tr>
                    <tr>
                      <td>${item.rspTm}</td>
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
            </div>
          </div>
        </main>

        <!-- Moa Modal-->
        <div class="modal fade" id="MoaModal" tabindex="-1" role="dialog" aria-labelledby="historyModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document" style="max-width: 70%;">
            <div class="modal-content">
            </div>
          </div>
        </div>

<script>
window.onload = function() {
  today();

  // 거래 시각 컬럼 부재로 제외
  //setHH('#fromHH', '00');
  //setMS('#fromMM', '00');
  //setMS('#fromSS', '00');
  //setHH('#toHH', '23');
  //setMS('#toMM', '59');
  //setMS('#toSS', '59');

  let li = $('.nav-item');
  addMenuOn(li[0]);
}
</script>