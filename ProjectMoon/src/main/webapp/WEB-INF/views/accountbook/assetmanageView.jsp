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
	getYear();


	$('#year').change(function(){
		var data = $(this).val();
		var url = '/accountBook/getMonth'
		console.log(data);
		$.ajax({
			type : 'POST',
			url : url,
			contentType : 'application/json',
			data : JSON.stringify({'year' : data}),
			dataType : 'json',
			success : function(resultData){
				var list = '';
				list += '<option value="" selected>선택';
				for(var i = 0; i < resultData.length; i++){
					var item = resultData[i];
					list += '<option value="'+item.month+'">'+item.month+'';
				}
				
				$('#month').html(list);
			}
		})
		
	})
	
	$('#month').change(function(){
		var data = 'BANK';
		var url = '/cdCommon/selectCode'
		console.log(data);
		$.ajax({
			type : 'POST',
			url : url,
			contentType : 'application/json',
			data : JSON.stringify({'code' : data}),
			dataType : 'json',
			success : function(resultData){
				var list = '';
				console.log(resultData);
				console.log(resultData.length);
				list += '<option value="" selected>선택';
				list += '<option value="">전체';
				for(var i = 0; i < resultData.length; i++){
					var item = resultData[i];
					list += '<option value="'+item.mainCategory+'">'+item.properties+'';
				}
				
				$('#bank').html(list);
			}
		})
	})
	
		$('#bank').change(function(){
		var year = $('#year').val();
		var month = $('#month').val();
		var bank = $(this).val();
		var url = '/accountBook/SelectAccountBookList'
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
				var revenueList = '';
				var costList = '';
				var transferList ='';

				revenueList += '<table>';
				revenueList += '<tr>';
				revenueList += '<td>수익</td>';
				revenueList += '<td></td>';
				revenueList += '<td></td>';
				revenueList += '<td></td>';
				revenueList += '</tr>';
				
				costList += '<table>';
				costList += '<tr>';
				costList += '<td>비용</td>';
				costList += '<td></td>';
				costList += '<td></td>';
				costList += '<td></td>';
				costList += '</tr>';
				
				
				for(var i = 0; i < resultData.length; i++){
					var item = resultData[i];
					if(item.division == 'ACCOUNT_REVENUE'){
						revenueList += '<tr>';
						revenueList += '<td>'+item.date+'</td>';
						revenueList += '<td>'+item.bank+'</td>';
						revenueList += '<td>'+item.detail+'</td>';
						revenueList += '<td>'+item.amount+'</td>';
						revenueList += '</tr>';
					} else if(item.division == 'ACCOUNT_COST'){
						costList += '<tr>';
						costList += '<td>'+item.date+'</td>';
						costList += '<td>'+item.bank+'</td>';
						costList += '<td>'+item.detail+'</td>';
						costList += '<td>'+item.amount+'</td>';
						costList += '</tr>';
					} else{
					}
				}
				revenueList += '</table>';
				
				costList += '</table>';
				
				transferList += '</table>';
				
				
				$('#nowRevenue').html(revenueList);
				$('#nowCost').html(costList);
				
			}
		})
		getBalance(year, month, bank);
		getSettle(year, month, bank);
		
	})
	
})

function getBalance(year, month, bank){
	var url = '/accountBook/getBalance'
	var year = year;
	var month = month;
	var bank = bank;
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
			console.log(resultData);
			var bankList = '';
			bankList += '<table>';
			bankList += '<tr>';
			bankList += '<td>은행</td>';
			bankList += '<td>잔액</td>';
			bankList += '</tr>';
			for(var i = 0; i < resultData.length; i++){
				var item = resultData[i];
				bankList += '<tr>';
				bankList += '<td>'+item.bank+'</td>';
				bankList += '<td>'+item.amount+'</td>';
				bankList += '</tr>';
			}
			bankList += '</table>';
			$('#prevBank').html(bankList);
		}
	})
}

function getSettle(year, month, bank){
	var url = '/accountBook/getSettle';
	var year = year;
	var month = month;
	var bank = bank;
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
			var bankList = '';
			bankList += '<table>';
			bankList += '<tr>';
			bankList += '<td>은행</td>';
			bankList += '<td>잔액</td>';
			bankList += '</tr>';
			for(var i = 0; i < resultData.length; i++){
				var item = resultData[i];
				bankList += '<tr>';
				bankList += '<td>'+item.bank+'</td>';
				bankList += '<td>'+item.amount+'</td>';
				bankList += '</tr>';
			}
			bankList += '</table>';
			$('#settleBank').html(bankList);
		}
		
	})
}

function getYear(){
	var url = '/accountBook/getYear';
	$.ajax({
		type : 'POST',
		url : url,
		contentType : 'application/json',
		dataType : 'json',
		success : function(resultData){
			var list = '';
			list += '<option value="" selected>선택';
			for(var i = 0; i < resultData.length; i++){
				var item = resultData[i];
				list += '<option value="'+item.year+'">'+item.year+'';
			}
			$('#year').html(list);
		}
	})
}

function setNewSettle(){
	var url = '/accountBook/setNewSettle';
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
			var bankList = '';
			bankList += '<table>';
			bankList += '<tr>';
			bankList += '<td>은행</td>';
			bankList += '<td>잔액</td>';
			bankList += '</tr>';
			
			for(var i = 0; i < resultData.length; i++){
				var item = resultData[i];
				bankList += '<tr>';
				bankList += '<td>'+item.bank+'</td>';
				bankList += '<td>'+item.amount+'</td>';
				bankList += '</tr>';
			}
			bankList += '</table>';
			$('#settleBank').html(bankList);
		}
		
	})
}


	

</script>


<title>자산 현황</title>
</head>
<body>
	<div>
		<form action="" id="assetfrm" name="assetfrm" method="POST">
			<!-- 기간 선택 -->
			<div>
				<!-- 기간 구분 -->
				<select id="year" name="year">
				
				</select>

				<select id="month" name="month">
					
				</select>
				
				<select id="bank" name="bank">
					
				</select>
				
			</div>
			<div id="prevBank">
				<!-- 전월 잔액 테이블 -->
			</div>
			<div id="nowRevenue">
				<!-- 당월 사용 -->
				
			</div>
			<div id="nowCost">
			
			</div>
			<div id="settleBank">
				<!-- 당월 잔액 정산 -->
			</div>
			<button id="settle" name="settle" onclick="setNewSettle();">새로정산하기</button>
			
		</form>
	</div>

</body>
</html>