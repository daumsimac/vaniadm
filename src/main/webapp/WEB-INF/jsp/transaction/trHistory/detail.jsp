<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="modal-header">
    <!-- <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close" aria-hidden="true" onclick="javascript:close();">×</button> -->
    <h3 class="smaller lighter blue no-margin modal-title">거래내역 상세조회</h3>
</div>

<div class="modal-body mb-3">
    <table class="mb-2 dtl-table">
      <tr>
        <th class="col-md-2">거래일자</th>
        <td class="col-md-4">
          <fmt:parseDate value="${info.trDt}" var="trDt" pattern="yyyyMMdd" />
          <fmt:formatDate value="${trDt}" pattern="yyyy-MM-dd" />
        </td>
        <th class="col-md-2">기관코드</th>
        <td class="col-md-4">${info.orgC}</td>
      </tr>
      <tr>
        <th class="col-md-2">중계시스템</th>
        <td class="col-md-4">${info.rlysysId}</td>
        <th class="col-md-2">거래식별코드</th>
        <td class="col-md-4">${info.svcId}</td>
      </tr>
      <tr>
        <th class="col-md-2">글로벌ID</th>
        <td class="col-md-4">${info.gblid}</td>
        <th class="col-md-2">거래상태코드</th>
        <td class="col-md-4">
          <c:choose>
            <c:when test="${info.trprcStsc eq 1}">요청중</c:when>
            <c:when test="${info.trprcStsc eq 2}">정상응답</c:when>
            <c:when test="${info.trprcStsc eq 3}">오류응답</c:when>
            <c:otherwise>
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
      <tr>
        <th class="col-md-2">삽입시각</th>
        <td class="col-md-4">
          <fmt:parseDate value="${info.insTm}" var="insTm" pattern="HHmmss" />
          <fmt:formatDate value="${insTm}" pattern="HH:mm:ss" />
        </td>
        <th class="col-md-2">응답시각</th>
        <td class="col-md-4">
          <fmt:parseDate value="${info.rspTm}" var="rspTm" pattern="HHmmss" />
          <fmt:formatDate value="${rspTm}" pattern="HH:mm:ss" />
        </td>
      </tr>
      <tr>
        <th class="col-md-2">응답코드</th>
        <td class="col-md-4">${info.rspC}</td>
        <th class="col-md-2">타임아웃발생여부</th>
        <td class="col-md-4">
          <c:choose>
            <c:when test="${info.tmoOcuYn eq 'Y'}">발생</c:when>
            <c:when test="${info.tmoOcuYn eq 'N'}">미발생</c:when>
            <c:otherwise>
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
      <tr>
        <th class="col-md-2">거래고유번호</th>
        <td class="col-md-4">${info.tranId}</td>
        <th class="col-md-2">메세지고유식별자</th>
        <td class="col-md-4">${info.cliMsgId}</td>
      </tr>
      <tr>
        <th class="col-md-2">수수료</th>
        <td class="col-md-4">${info.trfFee}</td>
        <th class="col-md-2">할인적용코드(MB Bank)</th>
        <td class="col-md-4">${info.dcC}</td>
      </tr>
      <tr>
        <th class="col-md-2">고객구분</th>
        <td class="col-md-4">${info.cusTp}</td>
        <th class="col-md-2">수수료수납구분</th>
        <td class="col-md-4">${info.feeTp}</td>
      </tr>
      <tr>
        <th class="col-md-2">은행제공인증사용여부</th>
        <td class="col-md-4">${info.vfyBnk}</td>
        <th class="col-md-2">인증방식</th>
        <td class="col-md-4">${info.vfyMtd}</td>
      </tr>
      <tr>
        <th class="col-md-2">인증증명</th>
        <td class="col-md-4">${info.vfyInf}</td>
        <th class="col-md-2">OTP번호</th>
        <td class="col-md-4">${info.otp}</td>
      </tr>
      <tr>
        <th class="col-md-2">원거래ID</th>
        <td class="col-md-4">${info.otpReqId}</td>
        <th class="col-md-2">전자지갑연결여부</th>
        <td class="col-md-4">
          <c:choose>
            <c:when test="${info.lnkTp eq 1}">연결</c:when>
            <c:when test="${info.lnkTp eq 0}">미연결</c:when>
            <c:otherwise>
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
      <tr>
        <th class="col-md-2">전자지갑고유ID</th>
        <td class="col-md-4">${info.waltId}</td>
        <th class="col-md-2">수수료포함여부</th>
        <td class="col-md-4">${info.feeIncYn}</td>
      </tr>
      <tr>
        <th class="col-md-2">출금계좌형태</th>
        <td class="col-md-4">${info.debitTp}</td>
        <th class="col-md-2">출금계좌번호</th>
        <td class="col-md-4">${info.debitRsrcNum}</td>
      </tr>
      <tr>
        <th class="col-md-2">출금계좌소유자</th>
        <td class="col-md-4">${info.debitNm}</td>
        <th class="col-md-2">출금은행코드</th>
        <td class="col-md-4">${info.debitBnkId}</td>
      </tr>
      <tr>
        <th class="col-md-2">거래통화코드</th>
        <td class="col-md-4">${info.curC}</td>
        <th class="col-md-2">수취은행코드</th>
        <td class="col-md-4">${info.crdBnkId}</td>
      </tr>
      <tr>
        <th class="col-md-2">수취인신분증ID</th>
        <td class="col-md-4">${info.crdCd}</td>
        <th class="col-md-2">수취계좌/카드구분</th>
        <td class="col-md-4">${info.crdTp}</td>
      </tr>
      <tr>
        <th class="col-md-2">수취계좌번호</th>
        <td class="col-md-4">${info.crdRsrcNum}</td>
        <th class="col-md-2">수취인명</th>
        <td class="col-md-4">${info.crdNm}</td>
      </tr>
      <tr>
        <th class="col-md-2">적요</th>
        <td class="col-md-4">${info.tranDesc}</td>
        <th class="col-md-2">거래금액</th>
        <td class="col-md-4">${info.tranAm}</td>
      </tr>
      <tr>
        <th class="col-md-2">납부참조번호</th>
        <td class="col-md-4">${info.payRefNo}</td>
        <th class="col-md-2">납부내용설명</th>
        <td class="col-md-4">${info.payRefInf}</td>
      </tr>
      <tr>
        <th class="col-md-2">응답거래코드</th>
        <td class="col-md-4">${info.resTxnC}</td>
        <th class="col-md-2">부가세금액</th>
        <td class="col-md-4">${info.vatAm}</td>
      </tr>
      <tr>
        <th class="col-md-2">은행거래고유번호</th>
        <td class="col-md-4">${info.bnkRefNo}</td>
        <th class="col-md-2">거래전송일자</th>
        <td class="col-md-4">
          <fmt:parseDate value="${info.sndDt}" var="sndDt" pattern="yyyyMMddHHmmss" />
          <fmt:formatDate value="${sndDt}" pattern="yyyy-MM-dd HH:mm:ss" />
        </td>
      </tr>
      <tr>
        <th class="col-md-2">출금후잔액부호(Woori Bank)</th>
        <td class="col-md-4">${info.wdrAfBiMrk}</td>
        <th class="col-md-2">출금후잔액</th>
        <td class="col-md-4">${info.wdrAfBi}</td>
      </tr>
      <tr>
        <th class="col-md-2">거래오류코드</th>
        <td class="col-md-4">${info.bzErrC}</td>
        <th class="col-md-2">거래오류내용</th>
        <td class="col-md-4">${info.bzErrDesc}</td>
      </tr>
      <tr>
        <th class="col-md-2">전자지갑연결Link</th>
        <td class="col-md-4">${info.waltTk}</td>
        <th class="col-md-2">은행거래참조번호</th>
        <td class="col-md-4">${info.repRefNo}</td>
      </tr>
      <tr>
        <th class="col-md-2">OTP유형</th>
        <td class="col-md-4">${info.otpTp}</td>
        <th class="col-md-2">OTP검증여부</th>
        <td class="col-md-4">
          <c:choose>
            <c:when test="${info.isReqOtp2 eq 1}">True</c:when>
            <c:when test="${info.isReqOtp2 eq 0}">False</c:when>
            <c:otherwise>
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
      <tr>
        <th class="col-md-2">고객검증방식</th>
        <td class="col-md-4">${info.authTp}</td>
        <th class="col-md-2">OTP검증사용여부</th>
        <td class="col-md-4">
          <c:choose>
            <c:when test="${info.isBypassOtp eq 1}">True</c:when>
            <c:when test="${info.isBypassOtp eq 0}">False</c:when>
            <c:otherwise>
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
      <tr>
        <th class="col-md-2">요청전문</th>
        <td class="col-md-4" colspan="3">${info.reqData}</td>
      </tr>
      <tr>
        <th class="col-md-2">응답전문</th>
        <td class="col-md-4" colspan="3">${info.rspData}</td>
      </tr>
      <tr>
        <th class="col-md-2">예비필드1</th>
        <td class="col-md-4">${info.etc1}</td>
        <th class="col-md-2">예비필드2</th>
        <td class="col-md-4">${info.etc2}</td>
      </tr>
      <tr>
        <th class="col-md-2">예비필드3</th>
        <td class="col-md-4">${info.etc3}</td>
        <th class="col-md-2">이체처리시스템</th>
        <td class="col-md-4">${info.rmtTp}</td>
      </tr>
      <tr>
        <th class="col-md-2">최종변경일자</th>
        <td class="col-md-4">${info.lsChgDtm}</td>
        <th class="col-md-2">최종변경자</th>
        <td class="col-md-4">${info.lsChgNm}</td>
      </tr>
    </table>
</div>

<div class="modal-footer">
    <button class="btn btn-sm btn-primary" data-dismiss="modal" id="btnClose" onclick="javascript:close();">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>

<script>
function close() {
  console.log("click");
  $(".modal-content").css("display", "none");
  $(".modal-background").css("display", "none");
  $(".modal-content").html("");
}
</script>
