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
		console.log(data);
		$.ajax({
			type : 'GET',
			url : url,
			contentType : 'application/json',
			data : {'code' : data},
			dataType : 'json',
			success : function(resultData){
				var list = '';
				list += '<option value="" selected>선택';
				if(data != 'ACCOUNT_TRANSFER'){
					for(var i = 0; i < resultData.length; i++){
						var item = resultData[i];
						list += '<option value="'+item.mainCategory+'">'+item.properties+'';
					}
				} else {
					list += '<option value="BANK">이체'; 
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
		console.log(data);
		$.ajax({
			type : 'GET',
			url : url,
			contentType : 'application/json',
			data : {'code' : data},
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
		console.log(data);
		$.ajax({
			type : 'GET',
			url : url,
			contentType : 'application/json',
			data : {'code' : data},
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
	document.getElementById("registfrm").action;
	
}
	

</script>


<title>가계부 등록</title>
</head>
<body>
	<div>
		<form action="../accountBook/regist" id="registfrm" name="registfrm" method="POST">
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

			</div>
			<div>
				<span>날짜</span>
				<input type="date" id="date" name="date" >
			</div>
			<div>
				<span>금액</span>
				<input type="number" id="amount" name="amount">
			</div>
			<div>
				<span>사용처</span>
				<input type="text" id="detail" name="detail">
			</div>
			<button id="add" name="add" onclick="add();">추가</button>
			<button id="regist" name="regist" onclick="regist();">등록</button>
		</form>
	</div>

</body>
</html>