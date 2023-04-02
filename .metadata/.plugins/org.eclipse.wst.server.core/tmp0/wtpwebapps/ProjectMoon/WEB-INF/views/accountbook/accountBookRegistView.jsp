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

})
var num = 0;


function addrow(){
	var division = $('#division').val();
	var divisionDetail = $('#divisionDetail').val();
	var divisionSubDetail = $('#divisionSubDetail').val()
	var bank = $('#bank').val();
	
	var list = '';
	list += '<div id="accountDiv_'+num+'">';
	list += '<br>';
	list += '<table>';
	list += '<input type="hidden" id="num" name="num" value="'+num+'">';
	list += '<select id="division_'+num+'" name="division_'+num+'" onchange="divisionChange('+num+', this.value);"></select>';
	list += '<select id="divisionDetail_'+num+'" name="divisionDetail_'+num+'" onchange="divisionDetailChange('+num+', this.value);"></select>';
	list += '<select id="divisionSubDetail_'+num+'" name="divisionSubDetail_'+num+'" onchange="divisionSubDetailChange('+num+', this.value);"></select>';
	list += '<select id="bank_'+num+'" name="bank_'+num+'"></select>';
	list += '<td><span>날짜</span></td>';
	list += '<td><input type="date" id="date_'+num+'" name="date_'+num+'" ></td>';
	list += '</tr>';
	list += '<tr>';
	list += '<td><span>금액</span></td>';
	list += '<td><input type="number" id="amount_'+num+'" name="amount_'+num+'"></td>';
	list += '</tr>';
	list += '<tr>';
	list += '<td><span>사용처 및 수수료</span></td>';
	list += '<td><input type="text" id="detail_'+num+'" name="detail_'+num+'" value="0"></td>';
	list += '</tr>';
	list += '</table>';
	list += '<button id="deleteAccount_'+num+'" name="deleteAccount_'+num+'" onclick="deleteAccount('+num+')">거래삭제</button>';
	list += '</div>';
	
	getCode(num);
	
	num++;
	
	$('#registDetail').append(list);
}


function getCode(num){
	console.log(num);
	var url = '/cdCommon/selectCode';
	var data = 'AB';
	$.ajax({
		type : 'POST',
		url : url,
		contentType : 'application/json',
		data : JSON.stringify({'code' : data}),
		dataType : 'json',
		success : function(resultData){
			var list = '';
			list += '<option value="" selected>선택';
			for(var i = 0; i < resultData.length; i++){
				var item = resultData[i];
				list += '<option value="'+item.mainCategory+'">'+item.properties+'';
			}
			$('#registDetail #division_'+num).html(list);
		}
	})
}

function divisionChange(num, obj){
	$('#registDetail #divisionDetail_'+num).val('');
	$('#registDetail #divisionSubDetail_'+num).val('');
	$('#registDetail #bank_'+num).val('');
	var data = obj;
	var url = '/cdCommon/selectCode'
	$.ajax({
		type : 'POST',
		url : url,
		contentType : 'application/json',
		data : JSON.stringify({'code' : data}),
		dataType : 'json',
		success : function(resultData){
			var list = '';
			list += '<option value="" selected>선택';
				for(var i = 0; i < resultData.length; i++){
					var item = resultData[i];
					list += '<option value="'+item.mainCategory+'">'+item.properties+'';
				}
			$('#registDetail #divisionDetail_'+num).html(list);
		}
	})
}

function divisionDetailChange(num, obj){
	$('#registDetail #divisionSubDetail_'+num).val('');
	$('#registDetail #bank_'+num).val('');
	var data = obj;
	var url = '/cdCommon/selectCode'
	$.ajax({
		type : 'POST',
		url : url,
		contentType : 'application/json',
		data : JSON.stringify({'code' : data}),
		dataType : 'json',
		success : function(resultData){
			var list = '';
			list += '<option value="" selected>선택';
			for(var i = 0; i < resultData.length; i++){
				var item = resultData[i];
				list += '<option value="'+item.mainCategory+'">'+item.properties+'';
			}
			$('#registDetail #divisionSubDetail_'+num).html(list);
		}
	})
}

function divisionSubDetailChange(num, obj){
	$('#registDetail #bank_'+num).val('');
	var data = 'BANK';
	var url = '/cdCommon/selectCode'
	$.ajax({
		type : 'POST',
		url : url,
		contentType : 'application/json',
		data : JSON.stringify({'code' : data}),
		dataType : 'json',
		success : function(resultData){
			var list = '';
			list += '<option value="" selected>선택';
			for(var i = 0; i < resultData.length; i++){
				var item = resultData[i];
				list += '<option value="'+item.mainCategory+'">'+item.properties+'';
			}
			$('#registDetail #bank_'+num).html(list);
		}
	})
}

function deleteAccount(num){
	var div = $('#registDetail #accountDiv_'+num);
	div.remove();
}

function regist(){
	console.log("번호확인 : " + num);
	var url = '/accountBook/regist';
	for(var i = 0; i < num; i++){
		var division = $('#division_' + i).val();
		var divisionDetail = $('#divisionDetail_' + i).val();
		var divisionSubDetail = $('#divisionSubDetail_' + i).val();
		var bank = $('#bank_' + i).val();
		var date = $('#date_' + i).val();
		var amount = $('#amount_' + i).val();
		var detail = $('#detail_' + i).val();
		
		if(date == null || date == ''){
			continue;
		}
		
		if(amount == null || amount == '' ){
			continue;
		}
		
		if(detail == null || detail == '' ){
			continue;
		}
		
		
		$.ajax({
			type : 'POST',
			url : url,
			contentType : 'application/json',
			data : JSON.stringify({
					'division' : division,
					'divisionDetail' : divisionDetail,
					'divisionSubDetail' : divisionSubDetail,
					'bank' : bank,
					'date' : date,
					'amount' : amount,
					'detail' : detail
				}),
			dataType : 'json',
			success : function(resultData){
				console.log(resultData);
			}
		})
	}

}
	

</script>

<title>가계부 등록</title>
</head>
<body>
	<!-- 구분및 은행 선택 -->
	<div>
		
		<button id="addrow" name="addrow" onclick="addrow();">거래추가</button>
		<button id="regist" name="regist" onclick="regist();">등록</button>
	</div>
	<div id="registDetail">
			
	</div>

</body>
</html>