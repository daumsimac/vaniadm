// https://codenbike.tistory.com/48

function addMenuOn(li) {
  $(li).siblings().removeClass("on");
  $(li).addClass("on");
}

/* datepicker */
  $('#fromDate').datepicker({
  showOn: "button",
  buttonImage: "/resources/image/cal.png",
  buttonImageOnly: true,
  buttonText: "Select date"
});  
$('#fromDate').datepicker('option','dateFormat','yy-mm-dd'); // 기존 dd/mm/yy에서 yy-mm-dd로 format 변경(달력으로 직접 클릭시)

$('#toDate').datepicker({
  showOn: "button",
  buttonImage: "/resources/image/cal.png",
  buttonImageOnly: true,
  buttonText: "Select date"
});
$('#toDate').datepicker('option','dateFormat','yy-mm-dd');

$(".ui-datepicker-trigger").css("width","1.5rem");


/* 검색 조건 전일, 당일, 전월, 당월 함수 */
var fromDate;
var toDate;
var date = new Date();

function yesterday() { // 전일
  let yesterday = date.setTime(new Date().getTime() - (24*60*60*1000));

  let year = date.getFullYear(yesterday);
  let month = date.getMonth(yesterday) + 1;
  let startDay = date.getDate(yesterday);
  let lastDay = date.getDate(yesterday);
  inputDay(year, month, startDay, lastDay);
  addBtnPrimary(this);

  date.setTime(new Date().getTime()); // 오늘로 다시 세팅
}

function previousMonth() { // 전월
  let year = new Date(date.getFullYear(), date.getMonth() - 1, 1).getFullYear();
  let month = new Date(date.getYear(), date.getMonth() - 1, 1).getMonth() + 1;
  let startDay = new Date(date.getYear(), date.getMonth() - 1, 1).getDate();
  let lastDay = new Date(date.getYear(), date.getMonth(), 0).getDate();
  inputDay(year, month, startDay, lastDay);
  addBtnPrimary(this);
}

function today() { // 당일
  date.setTime(new Date().getTime());
  inputDay(date.getFullYear(), date.getMonth() + 1, date.getDate(), date.getDate());
  addBtnPrimary(this);
}

function currentMonth() { // 당월
  let year = date.getFullYear();
  let month = date.getMonth() + 1;
  let startDay = new Date(date.getYear(), date.getMonth(), 1).getDate();
  let lastDay = new Date(date.getYear(), date.getMonth() + 1, 0).getDate();
  inputDay(year, month, startDay, lastDay);
  addBtnPrimary(this);
}

function addBtnPrimary(btn) {
  $(btn).siblings().removeClass("btn-primary");
  $(btn).addClass("btn-primary");
}

function inputDay(year, month, startDay, lastDay) { // input 엘리먼트에 날짜 넣기
  if(month < 10) {
    month = "0" + month;
  }

  if(startDay < 10) {
    startDay = "0" + startDay;
  }

  if(lastDay < 10) {
    lastDay = "0" + lastDay;
  }

  fromDate = year + "-" + month + "-" + startDay;
  toDate = year + "-" + month + "-" + lastDay;

  $("#fromDate").val(fromDate);
  $("#toDate").val(toDate);
}

$("#yesterday").click(yesterday);
$("#prevMonth").click(previousMonth);
$("#today").click(today);
$("#currMonth").click(currentMonth);

/* 페이징 함수 */
function goPage(pageIndex) {
  $("#pageIndex").val(pageIndex);
  doSubmit();
}

/* from 내부 select한 시간을 fromTime, toTime 형식으로 조합 */
function timeFormat() {
  $('#fromTime').val($('#fromHH').val() + $('#fromMM').val() + $('#fromSS').val());
  $('#toTime').val($('#toHH').val() + $('#toMM').val() + $('#toSS').val());
}

function doSubmit(url, form, body) {
  if(url == undefined || url == '') url = $("#url").val(); // url을 ajax 호출할 때 전달하거나 아니면 아예 히든 값으로 박아넣음
    else url = url;
  if(form == undefined || form == '') form = $("#listForm"); // form 태그 넣어야 함
    else form = $(form);
  if(body == undefined || body == '') body = $("#body-list");
    else body = $(body);

  let nowDT = new Date();
  console.log("서버 수행 전 = "+nowDT);

  let nowTime = nowDT.getFullYear();
  let month = (nowDT.getMonth() + 1);

  nowTime += '.' + (month < 10 ? '0' + month : month);
  nowTime += '.' + (nowDT.getDate() < 10 ? '0' + nowDT.getDate() : nowDT.getDate());
  nowTime += ' ' + (nowDT.getHours() < 10 ? '0' + nowDT.getHours() : nowDT.getHours());
  nowTime += ':' + (nowDT.getMinutes() < 10 ? '0' + nowDT.getMinutes() : nowDT.getMinutes());
  nowTime += ':' + (nowDT.getSeconds() < 10 ? '0' + nowDT.getSeconds() : nowDT.getSeconds());

  timeFormat();

  $.ajax({
    type: "POST",
    url: url,
    data: form.serializeArray(),
    dataType: "html",
    success: function(result, status, xhr) {
      //if($(".time").length) {
      //  $(".time").text("["+nowTime+"]");
      //}

      $(".time").text("["+nowTime+"]");
      let now = new Date();

      $("#body-list").html(result);
    },
    error: function() {
      alert("error!");
    }
  });
}

/* 시간 select */
function setHH(id, select) { // 00 ~ 23시
  let selected = "";
  $(id).append('<option value="">선택</option>');
  for(let hh = 0; hh < 24; hh++) {
    if(hh == select) {
      selected = "selected";
    }

    if(hh < 10) {
      hh = "0" + hh;
    }

    $(id).append('<option value="'+ hh + '" '+ selected +'>'+ hh + '</option>');
    selected = "";
  }
}

function setMS(id, select) { // 00 ~ 59분, 00 ~ 59초
  let selected = "";
  $(id).append('<option value="">선택</option>');
  for(let ms = 0; ms < 60; ms++) {
    if(ms == select) {
      selected = "selected";
    }

    if(ms < 10) {
      ms = "0" + ms;
    }

    $(id).append('<option value="'+ ms + '" '+ selected +'>'+ ms + '</option>');
    selected = "";
  }
}

