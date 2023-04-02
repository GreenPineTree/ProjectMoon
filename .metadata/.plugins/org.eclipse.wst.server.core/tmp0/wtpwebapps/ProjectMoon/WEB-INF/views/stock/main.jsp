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
		var ticker = $(this).val();
		var list = '';
		var url = '/stock/selectCompany'
		$.ajax({
			type : 'POST',
			url : url,
			contentType : 'application/json',
			data : JSON.stringify({
				'country' : country,
				'market' : market,
				'ticker' : ticker
			}),
			dataType : 'json',
			success : function(resultData){
				
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

</script>


<title>주식</title>
</head>
<body>
	<div>
		<a href="../stock/registView"><button type="button" id="stockRegist">등록</button></a>
		
		<div id="content">
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
		</div>
		

	</div>
</body>
</html>