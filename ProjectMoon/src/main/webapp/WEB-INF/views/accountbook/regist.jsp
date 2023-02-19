<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">

<script type="text/javascript">

$(document).ready(function(){
	getCode();

	$('#code').change(function(){
		$('#mainCategory').val('');
		$('#subCategory').val('');
		$('#bank').val('');
		var data = $(this).val();
		var url = '/cdCommon/selectCode'
		console.log(data);
		$.ajax({
			type : 'GET',
			url : url,
			contentType : 'application/json',
			data : {'code' : data},
			dataType : 'json',
			success : function(resultData){
				var list = '';
				console.log(resultData);
				console.log(resultData.length);
				list += '<option value="" selected>선택';
				if(data != 'ACCOUNT_TRANSFER'){
					for(var i = 0; i < resultData.length; i++){
						var item = resultData[i];
						list += '<option value="'+item.mainCategory+'">'+item.properties+'';
					}
				} else {
					list += '<option value="BANK">이체'; 
				}
				$('#mainCategory').html(list);
			}
		})
		
	})
	
	$('#mainCategory').change(function(){
		$('#subCategory').val('');
		$('#bank').val('');
		var data = $(this).val();
		var url = '/cdCommon/selectCode'
		console.log(data);
		$.ajax({
			type : 'GET',
			url : url,
			contentType : 'application/json',
			data : {'code' : data},
			dataType : 'json',
			success : function(resultData){
				var list = '';
				console.log(resultData);
				console.log(resultData.length);
				list += '<option value="" selected>선택';
				for(var i = 0; i < resultData.length; i++){
					var item = resultData[i];
					list += '<option value="'+item.mainCategory+'">'+item.properties+'';
				}
				$('#subCategory').html(list);
			}
		})
		
	})
	
	$('#subCategory').change(function(){
		$('#bank').val('');
		var data = 'BANK';
		var url = '/cdCommon/selectCode'
		console.log(data);
		$.ajax({
			type : 'GET',
			url : url,
			contentType : 'application/json',
			data : {'code' : data},
			dataType : 'json',
			success : function(resultData){
				var list = '';
				console.log(resultData);
				console.log(resultData.length);
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

function getCode(){
	var url = '/cdCommon/selectCode';
	var data = 'AB';
	$.ajax({
		type : 'GET',
		url : url,
		contentType : 'application/json',
		data : {'code' : data},
		dataType : 'json',
		success : function(resultData){
			var list = '';
			console.log(resultData);
			console.log(resultData.length);
			list += '<option value="" selected>선택';
			for(var i = 0; i < resultData.length; i++){
				var item = resultData[i];
				list += '<option value="'+item.mainCategory+'">'+item.properties+'';
			}
			$('#code').html(list);
		}
	})
}

function regist(){
	var yymmdd = $('#date').val();
	yymmdd.replace("-", "");
	var year = yymmdd.substring(0, 4);
	var month = yymmdd.substring(4, 6);
	var date = yymmdd.substring(6);
	console.log(yymmdd);
	document.$('#year').value = year;
	document.$('#month').value = month;
	document.$('#division').value = $('#code').val();
	document.$('#divisionDetail').value = $('#mainCategory').val();
	document.$('#divisionSubDetail').value = $('#subCategory').val();
	document.$('#date').value = date;
	document.getElementById("registfrm").action;
	
}
	

</script>


<title>가계부 등록</title>
</head>
<body>
	<div>
		<form action="../accountBook/regist" id="registfrm" name="registfrm" method="POST">
			<input type="hidden" name="year" value="">
			<input type="hidden" name="month" value="">
			<input type="hidden" name="division" value="">
			<input type="hidden" name="divisionDetail" value="">
			<input type="hidden" name="divisionSubDetail" value="">
			<!-- <input type="hidden" name="amount" value=""> -->
			<input type="hidden" name="detail" value="">
			<!-- <input type="hidden" name="date" value=""> -->
			<input type="hidden" name="bank" value="">
			
			<!-- 구분및 은행 선택 -->
			<div id="division">
				<!-- 수익 비용 이체 구분 -->
				<span>거래 종류</span>
				<select id="code" name="code">
				
				</select>

				<select id="mainCategory" name="mainCategory">
					
				</select>
				
				<select id="subCategory" name="subCategory">
				
				</select>
				
				<select id="bank" name="bank">
				
				</select>

			</div>
			<div>
				<span>날짜</span>
				<input type="date" id="datepicker" name="datepicker" >
			</div>
			<div>
				<span>금액</span>
				<input type="number" id="amount" name="amount">
			</div>
			<div id="division">
				<span>사용처</span>
				<input type="text" id="detail" name="detail">
			</div>
			<button id="add" name="add" onclick="add();">추가</button>
			<button id="regist" name="regist" onclick="regist();">등록</button>
		</form>
	</div>

</body>
</html>