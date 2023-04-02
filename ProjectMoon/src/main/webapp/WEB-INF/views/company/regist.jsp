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
				for(var i = 0; i < resultData.length; i++){
					var item = resultData[i];
					list += '<option value="'+item.mainCategory+'">'+item.properties+'';
				}
				$('#sector').html(list);
			}
		})
		
	})
	
	
	
})
var num = 0;


function addrow(){
	var country = $('#country').val();
	var market = $('#market').val();
	var sector = $('#sector').val()
	var countryText = $('#country option:checked').text();
	var marketText = $('#market option:checked').text();
	var sectorText = $('#sector option:checked').text()
	
	var list = '';
	list += '<table>';
		
	list += '<input type="hidden" id="country_'+num+'" name="country_'+num+'" value="'+country+'">'
	list += '<input type="hidden" id="market_'+num+'" name="market_'+num+'" value="'+market+'">'
	list += '<input type="hidden" id="sector_'+num+'" name="sector_'+num+'" value="'+sector+'">'
	list += '<tr>';
	list += '<td><span>국가</span></td>';
	list += '<td><input type="text" value="'+countryText+'" readonly></td>'
	list += '</tr>';
	list += '<tr>';
	list += '<td><span>시장</span></td>';
	list += '<td><input type="text" value="'+marketText+'" readonly></td>'
	list += '</tr>';
	list += '<tr>';
	list += '<td><span>섹터</span></td>';
	list += '<td><input type="text" value="'+sectorText+'" readonly></td>'
	list += '</tr>';
	list += '<tr>';
	list += '<td><span>회사명</span></td>';
	list += '<td><input type="text" id="name_'+num+'" name="name_'+num+'" ></td>';
	list += '</tr>';
	list += '<tr>';
	list += '<td><span>티커</span></td>';
	list += '<td><input type="text" id="ticker_'+num+'" name="ticker_'+num+'" ></td>';
	list += '</tr>';
	list += '<tr>';
	list += '<td><span>비고</span></td>';
	list += '<td><input type="textarea" id="remark_'+num+'" name="remark_'+num+'"></td>';
	list += '</tr>';
	list += '</table>';
	list += '<br><br>';
	num++;
	
	$('#registDetail').append(list);
}

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


function regist(){
	var url = '/company/regist';
	for(var i = 0; i < num; i++){
		var country = $('#country_' + i).val();
		var market = $('#market_' + i).val();
		var sector = $('#sector_' + i).val();
		var name = $('#name_' + i).val();
		var ticker = $('#ticker_' + i).val();
		var remark = $('#remark_' + i).val();
		
		if(name == null || name == ''){
			break;
		}
		
		if(ticker == null || ticker == '' ){
			break;
		}
		
		if(remark == null || remark == '' ){
			break;
		}
		
		
		$.ajax({
			type : 'POST',
			url : url,
			contentType : 'application/json',
			data : JSON.stringify({
					'country' : country,
					'market' : market,
					'sector' : sector,
					'name' : name,
					'ticker' : ticker,
					'remark' : remark
				}),
			dataType : 'json',
			success : function(resultData){
				console.log(resultData);
			}
		})
	}

}
	

</script>


<title>기업</title>
</head>
<body>
	<div>
		<div id="content">
			<!-- 구분및 은행 선택 -->
			<div>
				<!-- 수익 비용 이체 구분 -->
				<span>거래 종류</span>
				<select id="country" name="country">
				</select>
				
				<select id="market" name="market">
				</select>
				
				<select id="sector" name="sector">
				</select>
				
				<button id="addrow" name="addrow" onclick="addrow();">기업추가</button>
			</div>
			<div id="registDetail">
				
			</div>
		</div>
		
		<button id="regist" name="regist" onclick="regist();">등록</button>
		
	</div>
</body>
</html>