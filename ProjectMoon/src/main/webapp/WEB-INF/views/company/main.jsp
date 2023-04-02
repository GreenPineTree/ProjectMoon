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

	
	
	$('#country').change(function(){
		$('#market').val('');
		$('#sector').val('');
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
				$('#market').html(list);
			}
		})
	})
	
	$('#market').change(function(){
		$('#sector').val('');
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
				list += '<option value="" >전체';
				for(var i = 0; i < resultData.length; i++){
					var item = resultData[i];
					list += '<option value="'+item.mainCategory+'">'+item.properties+'';
				}
				$('#sector').html(list);
			}
		})
		
	})
	
	$('#sector').change(function(){
		var country = $('#country').val();
		var market = $('#market').val();
		var sector = $(this).val();
		var list = '';
		var url = '/company/getCompanyList'
		$.ajax({
			type : 'POST',
			url : url,
			contentType : 'application/json',
			data : JSON.stringify({
				'country' : country,
				'market' : market,
				'sector' : sector,
			}),
			dataType : 'json',
			success : function(resultData){
				var list = '';
				list += '<option value="" selected>선택';
				for(var i = 0; i < resultData.length; i++){
					var item = resultData[i];
					list += '<option value="'+item.ticker+'">'+item.name+'';
				}
				$('#ticker').html(list);
			}
		})
		
		
	})
	
	$('#ticker').change(function(){
		var country = $('#country').val();
		var market = $('#market').val();
		var sector = $('#sector').val();
		var ticker = $(this).val();
		var list = '';
		var url = '/company/selectCompany'
		$.ajax({
			type : 'POST',
			url : url,
			contentType : 'application/json',
			data : JSON.stringify({
				'country' : country,
				'market' : market,
				'sector' : sector,
				'ticker' : ticker
			}),
			dataType : 'json',
			success : function(resultData){
				console.log(resultData);
				var list = '';
				list += '<h2>'+ resultData.name + '</h2>';
				list += '<h4>'+ resultData.ticker + '</h4><br><br>';
				list += '<h4>'+ resultData.sector + '<h4><br>';
				list += '<h4>'+ resultData.remark + '<h4><br>';
				
				$('#registDetail').html(list);
			}
		})
	})
	
})



function getCode(){
	var url = '/cdCommon/selectCode';
	var data = 'CM';
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
			$('#country').html(list);
		}
	})
}

function stockMain(){
	$('#companyFrm').attr("action", "/stock/registView");
	$('#companyFrm').submit();
	
}

function financialStatementsMain(){
	$('#companyFrm').attr("action", "/financialStatements/mainView");
	$('#companyFrm').submit();
	
}


</script>


<title>기업</title>
</head>
<body>
	<div>
		<a href="../company/registView"><button type="button" id="companyRegist">기업등록</button></a>
		<button type="button" onclick="stockMain();">주식정보 등록</button>
		<button type="button" onclick="allocationMain();">배당등록</button>
		
		<div id="content">
			<form id="companyFrm">
			<!-- 구분및 은행 선택 -->
			<div>
				<!-- 수익 비용 이체 구분 -->
				<span>기업 찾기</span>
				<select id="country" name="country">
				</select>
				
				<select id="market" name="market">
				</select>
				
				<select id="sector" name="sector">
				</select>
				
				<select id="ticker" name="ticker">
				</select>
			</div>
			
			<div id="registDetail">
				
			</div>
			</form>
		</div>
		

	</div>
</body>
</html>