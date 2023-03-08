<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <!-- 네비게이션바 -->
        <nav class="col-md-2 d-none d-md-block sidebar">
          <div class="sidebar-sticky">
            <h5 class="d-flex justify-content-between align-items-center px-3 mt-3 mb-3">기관정보[201]</h5>
            <ul class="nav flex-column mb-2">
              <li class="nav-item on"><a href="" class="nav-link">기관정보[201]</a></li>
            </ul>
          </div>
        </nav>
        <!-- 본문내용 -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="mb-2">
            <img src="" alt="icon">
            <span style="color:rgb(187, 185, 185);">기관관리[200] > </span>
            <span>기관정보[201]</span>
          </div>
          <h3>기관정보[201]</h3>
          <hr>
          <!-- 테이블 -->
          <div class="mb-3">
            <table class="mb-2">
              <tbody>
                <tr>
                  <th class="col-md-2">기관코드<span class="required">*</span></th><!-- org_c -->
                  <td class="col-md-4">
                    <select class="js-select2" name="orgC">
                      <option>선택</option>
                      <option>기관1</option>
                      <option>기관2</option>
                    </select>
                  </td>
                  <th class="col-md-2">기관명</th>
                  <td class="col-md-4">
                    <input type="text" name="orgNm" placeholder="기관명을 입력하세요."/>
                  </td>
                </tr>
                <tr>
                  <th class="col-md-2">중계시스템ID</th><!--  -->
                  <td class="col-md-4">
                    <select class="js-select2" name="rlysysId">
                      <option>선택</option>
                      <option>은행1</option>
                      <option>은행2</option>
                    </select>
                  </td>
                  <th class="col-md-2">은행기관코드</th><!-- rlysys_org_c -->
                  <td class="col-md-4">
                    <input type="text" name="rlysysOrgC" placeholder="은행기관코드를 입력하세요."/>
                  </td>
                </tr>
              </tbody>
            </table>
            <div style="text-align: center;">
              <button class="btn btn-primary">조회</button>
            </div>
          </div>

          <!-- 리스트 -->
          <div class="container-list">
            <div class="list-header mb-2">
              <span class="header-h5">기관정보리스트</span>
            </div>

            <div class="table-responsive bt-bl">
              <table class="table">
                <thead>
                  <tr>
                    <th>No.</th>
                    <th>기관명</th>
                    <th>기관코드</th>
                    <th>그룹코드</th>
                    <th>기관상태코드</th>
                  </tr>
                </thead>
                <tbody>
                <c:choose>
                <c:when test="${not empty list}">
                  <c:forEach items="${list}" var="item" varStatus="status">
                  <tr>
                    <td>${status.count}</td>
                    <td>${item.orgNm}</td>
                    <td>${item.orgC}</td>
                    <td>${item.grpOrgC}</td>
                    <td>${item.orgSts}</td>
                  </tr>
                  </c:forEach>
                </c:when>
                <c:otherwise>
                  <tr>
                    <td colspan="5">no data</td>
                  </tr>
                </c:otherwise>
                </c:choose>
                </tbody>
              </table>
            </div>
          </div>

          <!-- 기관정보 상세 -->
          <!-- 기관은행 기본 -->
        </main>
