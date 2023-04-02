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
	getCountry();

	
	
	$('#country').change(function(){
		$('#market').val('');
		$('#ticker').val('');
		var country = $(this).val();
		var url = '/company/getMarketList'
		$.ajax({
			type : 'POST',
			url : url,
			contentType : 'application/json',
			data : JSON.stringify({'country' : country}),
			dataType : 'json',
			success : function(resultData){
				var list = '';
				list += '<option value="" selected>선택';
					for(var i = 0; i < resultData.length; i++){
						var item = resultData[i];
						list += '<option value="'+item.market+'">'+item.name+'';
					}
				$('#market').html(list);
			}
		})
	})
	
	$('#market').change(function(){
		$('#ticker').val('');
		var country = $('#country').val();
		var market = $('#market').val();
		var list = '';
		var url = '/company/getCompanyList'
		$.ajax({
			type : 'POST',
			url : url,
			contentType : 'application/json',
			data : JSON.stringify({
				'country' : country,
				'market' : market,
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
	
	
	
})
var num = 0;


function addrow(){
	var country = $('#country').val();
	var market = $('#market').val();
	var ticker = $('#ticker').val()
	var countryText = $('#country option:checked').text();
	var marketText = $('#market option:checked').text();
	var tickerText = $('#ticker option:checked').text()
	
	var list = '';
	list += '<table>';
		
	list += '<input type="text" id="country_'+num+'" name="country_'+num+'" value="'+country+'">'
	list += '<input type="text" id="market_'+num+'" name="market_'+num+'" value="'+market+'">'
	list += '<input type="text" id="ticker_'+num+'" name="ticker_'+num+'" value="'+ticker+'">'
	list += '<input type="text" id="name_'+num+'" name="name_'+num+'" value="'+tickerText+'">'
	list += '<tr>';
	list += '<td><span>국가</span></td>';
	list += '<td><input type="text" value="'+countryText+'" readonly></td>'
	list += '</tr>';
	list += '<tr>';
	list += '<td><span>시장</span></td>';
	list += '<td><input type="text" value="'+marketText+'" readonly></td>'
	list += '</tr>';
	list += '<tr>';
	list += '<td><span>이름</span></td>';
	list += '<td><input type="text" value="'+tickerText+'" readonly></td>'
	list += '</tr>';
	list += '<tr>';
	list += '<td><span>기준연월</span></td>';
	list += '<td><input type="date" id="yymm_'+num+'" name="yymm_'+num+'" ></td>';
	list += '</tr>';
	list += '<tr>';
	list += '<td><span>종가</span></td>';
	list += '<td><input type="text" id="closingPrice_'+num+'" name="closingPrice_'+num+'"></td>';
	list += '</tr>';
	list += '<tr>';
	list += '<td><span>시가</span></td>';
	list += '<td><input type="text" id="startingPrice_'+num+'" name="startingPrice_'+num+'"></td>';
	list += '</tr>';
	list += '<tr>';
	list += '<td><span>최대가</span></td>';
	list += '<td><input type="text" id="maximum_'+num+'" name="maximum_'+num+'"></td>';
	list += '</tr>';
	list += '<tr>';
	list += '<td><span>최저가</span></td>';
	list += '<td><input type="number" id="minimum_'+num+'" name="minimum_'+num+'"></td>';
	list += '</tr>';

	list += '</table>';
	list += '<br><br>';
	num++;
	
	$('#registDetail').append(list);
}

function getCountry(){
	var url = '/company/getCountryList';
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
				list += '<option value="'+item.country+'">'+item.name+'';
			}
			$('#country').html(list);
		}
	})
	
	
}


function regist(){
	var url = '/stock/regist';
	for(var i = 0; i < num; i++){
		var country = $('#country_' + i).val();
		var market = $('#market_' + i).val();
		var ticker = $('#ticker_' + i).val();
		var name = $('#name_' + i).val();
		var yymm = $('#yymm_' + i).val();
		var minimum = $('#minimum_' + i).val();
		var maximum = $('#maximum_' + i).val();
		var startingPrice = $('#startingPrice_' + i).val();
		var closingPrice = $('#closingPrice_' + i).val();
		
		if(yymm == null || yymm == ''){
			break;
		}
		
		if(minimum == null || minimum == '' ){
			break;
		}
		
		if(maximum == null || maximum == '' ){
			break;
		}
		
		
		$.ajax({
			type : 'POST',
			url : url,
			contentType : 'application/json',
			data : JSON.stringify({
					'country' : country,
					'market' : market,
					'ticker' : ticker,
					'name' : name,
					'yymm' : yymm,
					'minimum' : minimum,
					'maximum' : maximum,
					'startingPrice' : startingPrice,
					'closingPrice' : closingPrice
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
				<select id="country" name="country">
				</select>
				
				<select id="market" name="market">
				</select>
				
				<select id="ticker" name="ticker">
				</select>
				
				<button id="addrow" name="addrow" onclick="addrow();">추가</button>
				<button id="regist" name="regist" onclick="regist();">등록</button>
				
			</div>
			<div id="registDetail">
				
			</div>
		</div>
		
		
	</div>

</body>
</html>