<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	buildCalendar();
	
})

//var nowMonth = new Date();	// 달 초기화

	
function buildCalendar(){
	//var calendarYear = nowMonth.getFullYear();		// 현재 연도 구하기
	//var calendarMonth = nowMonth.getMonth();	// 현재 월 구하기(월은 0부터 시작이므로 실제월보다 -1 차이가 남)
	
	var calendarYear = $('#year').val();		// 현재 연도 구하기
	var calendarMonth = $('#month').val()-1;	// 현재 월 구하기(월은 0부터 시작이므로 실제월보다 -1 차이가 남)
	
	var firstDate = new Date(calendarYear, calendarMonth, 1);		// 요일, 월, 일, 연, 시간 표기
	var monthLastDate = new Date(calendarYear, calendarMonth + 1, 0);	// 요일, 월, 일, 연, 시간 표기
	var lastDate = monthLastDate.getDate();		// 마지막 날짜
	
	var firstDay = firstDate.getDay();	// 1일의 요일
	var lastDay = monthLastDate.getDay();	// 마지막날의 요일
	
	var calendarWeekCount = Math.ceil((firstDay + lastDate) /7);		// 해당월의 주 수((시작요일 위치 + 월의 마지막 날짜) / 7)
	
	//$('#calYear').text(calendarYear);	// 연도 숫자 집어넣기
	//$('#calMonth').text(calendarMonth + 1);
	var list = '';
	
	var calendarPos = 0;	// 달력 위치
	var calendarDay = 0;	// 날짜
	for(var i = 0; i < calendarWeekCount; i++){
		list += '<tr>';
		for(var j = 0; j < 7; j++){
			list += '<td style=\"border: solid 1px black; padding: 40px 40px;\">';
			if(firstDay <= calendarPos && calendarDay < lastDate){
				calendarDay++;
				var calendarDayString = '';
				if(calendarDay < 10){
					calendarDayString = '0' + calendarDay;
				} else {
					calendarDayString = calendarDay;
				}
				list += '<span>' + calendarDayString + '</span><br>';
				list += '<span id="calendarSpan_' + calendarDayString + '"></span><br>';
				
			}
			
			
			list += '</td>';
			calendarPos++;
		}
		list += '</tr>';
	}
	$('#CalendarBody').append(list);
	selectAccountList();
	
}

function prevCalendar(){
	var nowYear = $('#year').val();
	var nowMonth = $('#month').val();
	if(nowMonth == '1'){
		nowYear = nowYear -1;
		nowMonth = '12';
	} else{
		nowMonth = nowMonth -1;
	}
	$('#year').val(nowYear);
	$('#month').val(nowMonth);
	document.getElementById('defaultFrm').action = '../accountBook/assetmanageView';
	document.getElementById('defaultFrm').submit();
	
}

function nextCalendar(){
	var nowYear = $('#year').val();
	var nowMonth = $('#month').val();
	if(nowMonth == '12'){
		nowYear = parseInt(nowYear) +1;
		nowMonth = '1';
	} else{
		nowMonth = parseInt(nowMonth) +1;
	}
	$('#year').val(nowYear);
	$('#month').val(nowMonth);
	document.getElementById('defaultFrm').action = '../accountBook/assetmanageView';
	document.getElementById('defaultFrm').submit();
	
}

//해당 은행만 검색에 띄우기
function onlyThisBnk(obj){
	obj = "0" + obj;
	$('#bank').val(obj);
	document.getElementById('defaultFrm').action = '../accountBook/assetmanageView';
	document.getElementById('defaultFrm').submit();
}

function selectAccountList(){
	var url = '/accountBook/SelectAccountBookList';
	var year = $('#year').val();
	var month = $('#month').val();
	var bank = $('#bank').val();
	$.ajax({
		type : 'POST',
		url : url,
		contentType : 'application/json',
		data : JSON.stringify({
			'year' : year,
			'month' : month,
			'bank' : bank
			}),
		dataType : 'json',
		success : function(resultData){
			var rtnMsg = resultData.rtnMsg;
			var rtnList = resultData.rtnList;
			if(rtnMsg == ''){
				for(var i=0; i<rtnList.length; i++){
					var item = rtnList[i];
					var date = item.date;
					var bank = item.bank;
					var arr = [];
					arr = bank.split('');
					bank = arr[0];
					var amount = item.amount;
					var detail = item.detail;
					$('#CalendarBody #calendarSpan_'+date).append(bank+'/ '+amount+'/ '+detail+'<br>');
				}
			} else {
				alert(rtnMsg);
			}
			
		}
		
	})
}


</script>


<title>자산 현황</title>

<style>
        td {
            width: 50px;
            height: 50px;
        }

        .Calendar { 
            text-align: center;
            margin: 0 auto; 
            width: 100%;
        }

        .Calendar>thead>tr:first-child>td { font-weight: bold; }

        .Calendar>thead>tr:last-child>td {
            background-color: gray;
            color: white;
        }        

        .pastDay{ background-color: lightgray; }

        .today{            
            background-color: #FFCA64;            
            cursor: pointer;
        }

        .futureDay{            
            background-color: #FFFFFF;
            cursor: pointer;
        }

        .futureDay.choiceDay, .today.choiceDay{            
            background-color: #3E85EF;            
            color: #fff;
            cursor: pointer;
        }
</style>
</head>
<body>
	<form id="defaultFrm" method="POST">
		<input type="hidden" id="year" name="year" value="${rtnVO.year }">
		<input type="hidden" id="month" name="month" value="${rtnVO.month }">
		<input type="hidden" id="bank" name="bank" value="${rtnVO.bank }">
	</form>
	<div>
	<!-- 은행별 잔액표시 -->
	<c:forEach var="list" items="${rtnAssetList }">
		<table onclick="onlyThisBnk(${list.bank});" style="border: 1px solid gold; float: left; width: 25%;">
			<thead>
				<tr>
					<td>${list.bankNm }</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${list.amount }</td>
				</tr>
			</tbody>
		</table>
	</c:forEach>
	</div>
	<div>
	<!-- 달력을 출력하여 해당 날짜에 자금 흐름 출력(은행별선택가능 / 입,출,이체간 글씨색 다르게 / ) -->
		<table class="Calendar">
			<thead>
				<tr>
					<td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
					<td colspan="5">
						<span id="calYear">${rtnVO.year }</span>년
						<span id="calMonth">${rtnVO.month }</span>월
					</td>
					<td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
				</tr>
				<tr>
					<td>일</td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
					<td>토</td>
				</tr>
			</thead>
			<tbody id="CalendarBody">
			</tbody>
		</table>
	</div>

</body>
</html>