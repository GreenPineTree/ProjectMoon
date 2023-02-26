<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
google.load("visualization", "1",{"packages":["corechart"]});
google.setOnLoadCallback(drawChart);

function drawChart(){
	 // Create the data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', '기간');
    data.addColumn('number', '고정비');
    data.addColumn('number', '급여');
    data.addColumn('number', '배당소득');
    data.addColumn('number', '이자비용');
    data.addRows([
      ['2023.01', 3, 2, 5, 10],
      ['2023.02', 1, 2, 5, 7],
      ['2023.03', 1, 3, 7, 12],
      ['2023.04', 1, 5, 9, 8],
      ['2023.05', 2, 1, 5, 3]
    ]);

    // Set chart options
    var options = {'title':'자산그래프',
                   'width':500,
                   'height':300};

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  
	
	
}

function getCode(){
	var url = '/accountBook/getChart';
	var data = '2023';
	$.ajax({
		type : 'POST',
		url : url,
		contentType : 'application/json',
		data : JSON.stringify({'year' : data}),
		dataType : 'json',
		success : function(resultData){
			console.log(resultData)
		}
	})
}

</script>


<title>가계부</title>
</head>
<body>

	<div>
		<button id="regist" name="regist" onclick="getCode();">등록</button>
		<a href="../accountBook/registView"><button type="button" id="registView">등록하기</button></a>
		<a href="../accountBook/assetmanageView"><button type="button" id="assetmanageView">자산현황</button></a>
	</div>
	<div id="chart_div">
	</div>
</body>
</html>