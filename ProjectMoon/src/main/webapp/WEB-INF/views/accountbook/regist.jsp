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
	getCode();

	
	
	$('#division').change(function(){
		$('#divisionDetail').val('');
		$('#divisionSubDetail').val('');
		$('#bank').val('');
		var data = $(this).val();
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
				$('#divisionDetail').html(list);
			}
		})
	})
	
	$('#divisionDetail').change(function(){
		$('#divisionSubDetail').val('');
		$('#bank').val('');
		var data = $(this).val();
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
				$('#divisionSubDetail').html(list);
			}
		})
		
	})
	
	$('#divisionSubDetail').change(function(){
		$('#bank').val('');
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
				$('#bank').html(list);
			}
		})
		
	})
	
	
	
})
var num = 0;


function addrow(){
	var division = $('#division').val();
	var divisionDetail = $('#divisionDetail').val();
	var divisionSubDetail = $('#divisionSubDetail').val()
	var bank = $('#bank').val();
	var divisionText = $('#division option:checked').text();
	var divisionDetailText = $('#divisionDetail option:checked').text();
	var divisionSubDetailText = $('#divisionSubDetail option:checked').text()
	var bankText = $('#bank option:checked').text();
	
	var list = '';
	list += '<table>';
		
	if(division == "ACCOUNT_TRANSFER"){
		list += '<input type="hidden" id="division_'+num+'" name="division_'+num+'" value="'+division+'">'
		list += '<input type="hidden" id="divisionDetail_'+num+'" name="divisionDetail_'+num+'" value="'+divisionDetail+'">'
		list += '<input type="hidden" id="divisionSubDetail_'+num+'" name="divisionSubDetail_'+num+'" value="'+divisionSubDetail+'">'
		list += '<input type="hidden" id="bank_'+num+'" name="bank_'+num+'" value="'+bank+'">'
		list += '<tr>';
		list += '<td><span>구분</span></td>';
		list += '<td><input type="text" value="'+divisionText+'" readonly></td>'
		list += '</tr>';
		list += '<tr>';
		list += '<td><span>구분1</span></td>';
		list += '<td><input type="text" value="'+divisionDetailText+'" readonly></td>'
		list += '</tr>';
		list += '<tr>';
		list += '<td><span>은행From</span></td>';
		list += '<td><input type="text" value="'+divisionSubDetailText+'" readonly></td>'
		list += '</tr>';
		list += '<tr>';
		list += '<td><span>은행To</span></td>';
		list += '<td><input type="text" value="'+bankText+'" readonly></td>'
		list += '</tr>';
		list += '<tr>';
		list += '<td><span>날짜</span></td>';
		list += '<td><input type="date" id="date_'+num+'" name="date_'+num+'" ></td>';
		list += '</tr>';
		list += '<tr>';
		list += '<td><span>금액</span></td>';
		list += '<td><input type="number" id="amount_'+num+'" name="amount_'+num+'"></td>';
		list += '</tr>';
		list += '<tr>';
		list += '<td><span>수수료</span></td>';
		list += '<td><input type="number" id="detail_'+num+'" name="detail_'+num+'" value="0"></td>';
		list += '</tr>';
	} else{
		list += '<input type="hidden" id="division_'+num+'" name="division_'+num+'" value="'+division+'">'
		list += '<input type="hidden" id="divisionDetail_'+num+'" name="divisionDetail_'+num+'" value="'+divisionDetail+'">'
		list += '<input type="hidden" id="divisionSubDetail_'+num+'" name="divisionSubDetail_'+num+'" value="'+divisionSubDetail+'">'
		list += '<input type="hidden" id="bank_'+num+'" name="bank_'+num+'" value="'+bank+'">'
		list += '<tr>';
		list += '<td><span>구분</span></td>';
		list += '<td><input type="text" value="'+divisionText+'" readonly></td>'
		list += '</tr>';
		list += '<tr>';
		list += '<td><span>구분1</span></td>';
		list += '<td><input type="text" value="'+divisionDetailText+'" readonly></td>'
		list += '</tr>';
		list += '<tr>';
		list += '<td><span>구분2</span></td>';
		list += '<td><input type="text" value="'+divisionSubDetailText+'" readonly></td>'
		list += '</tr>';
		list += '<tr>';
		list += '<td><span>은행</span></td>';
		list += '<td><input type="text" value="'+bankText+'" readonly></td>'
		list += '</tr>';
		list += '<tr>';
		list += '<td><span>날짜</span></td>';
		list += '<td><input type="date" id="date_'+num+'" name="date_'+num+'" ></td>';
		list += '</tr>';
		list += '<tr>';
		list += '<td><span>금액</span></td>';
		list += '<td><input type="number" id="amount_'+num+'" name="amount_'+num+'"></td>';
		list += '</tr>';
		list += '<tr>';
		list += '<td><span>사용처</span></td>';
		list += '<td><input type="text" id="detail_'+num+'" name="detail_'+num+'"></td>';
		list += '</tr>';
	}
	list += '</table>';
	list += '<br><br>';
	num++;
	
	$('#registDetail').append(list);
}

function getCode(){
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
			$('#division').html(list);
		}
	})
}


function regist(){
	var url = '/accountBook/regist';
	for(var i = 0; i < num; i++){
		var division = $('#division_' + i).val();
		var divisionDetail = $('#divisionDetail_' + i).val();
		var divisionSubDetail = $('#divisionSubDetail_' + i).val();
		var bank = $('#bank_' + i).val();
		var date = $('#date_' + i).val();
		var amount = $('#amount_' + i).val();
		var detail = $('#detail_' + i).val();
		
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
	<div>
		<div id="content">
			<!-- 구분및 은행 선택 -->
			<div>
				<!-- 수익 비용 이체 구분 -->
				<span>거래 종류</span>
				<select id="division" name="division">
				</select>
				
				<select id="divisionDetail" name="divisionDetail">
				</select>
				
				<select id="divisionSubDetail" name="divisionSubDetail">
				</select>
				
				<select id="bank" name="bank">
				</select>
				<button id="addrow" name="addrow" onclick="addrow();">거래추가</button>
			</div>
			<div id="registDetail">
				
			</div>
		</div>
		
		<button id="regist" name="regist" onclick="regist();">등록</button>
	</div>

</body>
</html>