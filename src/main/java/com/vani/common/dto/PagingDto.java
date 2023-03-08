package com.vani.common.dto;

public class PagingDto {
  private int pageIndex = 1;
  private int pageSize = 10;
  private int firstIndex = 1;
  private int recordCountPerPage = 10;
  private int currentPageNo;
  private int totalRecordCount;
  public int getPageIndex() { return pageIndex; }
  public void setPageIndex(int pageIndex) { this.pageIndex = pageIndex; }
  public int getPageSize() { return pageSize; }
  public void setPageSize(int pageSize) { this.pageSize = pageSize; }
  public int getFirstIndex() { return firstIndex; }
  public void setFirstIndex(int firstIndex) { this.firstIndex = firstIndex; }
  public int getRecordCountPerPage() { return recordCountPerPage; }
  public void setRecordCountPerPage(int recordCountPerPage) { this.recordCountPerPage = recordCountPerPage; }
  public int getCurrentPageNo() { return currentPageNo; }
  public void setCurrentPageNo(int currentPageNo) { this.currentPageNo = currentPageNo; }
  public int getTotalRecordCount() { return totalRecordCount; }
  public void setTotalRecordCount(int totalRecordCount) { this.totalRecordCount = totalRecordCount; }

  /**
   * 필수 필드가 아닌 것들 :  이 필드는 필수 필드 값을 바탕으로 계산해서 정해지는 필드 값
   */

  private int totalPageCount; // 페이지 갯수
  private int firstPageNoOnPageList; // 페이지 리스트의 첫 페이지 번호
  private int lastPageNoOnPageList; // 페이지 리스트의 마지막 페이지 번호
  private int firstRecordIndex; // 페이징 SQL의 조건절에 사용되는 시작 rownum
  private int lastRecordIndex; // 페이징 SQL의 조건절에 사용되는 마지막 rownum

  public int getTotalPageCount() {
    totalPageCount = ((getTotalRecordCount() - 1) / getRecordCountPerPage()) + 1;
    return totalPageCount;
  }

  public int getFirstPageNo() { return 1; }

  public int getLastPageNo() { return getTotalPageCount(); }

  public int getFirstPageNoOnPageList() {
    firstPageNoOnPageList = ((getCurrentPageNo() - 1)/getPageSize()) * getPageSize() + 1;
    return firstPageNoOnPageList;
  }

  public int getLastPageNoOnPageList() {
    lastPageNoOnPageList = getFirstPageNoOnPageList() + getPageSize() - 1;
    if(lastPageNoOnPageList > getTotalPageCount()) {
      lastPageNoOnPageList = getTotalPageCount();
    }
    return lastPageNoOnPageList;
  }

  public int getFirstRecordIndex() {
    firstRecordIndex = (getCurrentPageNo() - 1) * getRecordCountPerPage();
    return firstRecordIndex;
  }

  public int getLastRecordIndex() {
    lastRecordIndex = getCurrentPageNo() * getRecordCountPerPage();
    return lastRecordIndex;
  }
}
