<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function mainView(obj){
	var flag = obj;
	var url = '';
	if(flag == '0'){
		url = '"/"';
	} else if(flag == '1'){
		url = '../financialStatements/mainView';
	} else if(flag == '2'){
		url = '../company/mainView';
	} else if(flag == '3'){
		url = '../worldNews/mainView';
	} else if(flag == '4'){
		url = '../accountBook/accountBookMainView';
	}
	location.href = url;
}
</script>
<title>Insert title here</title>
</head>
<body>
   <center>
    <h1>부자가 되겠다</h1>
  		<button type="button" id="financialstatementsMain" onclick="mainView('1');">경제지표</button>
    	<button type="button" id="companyMain" onclick="mainView('2');">기업</button>
		<button type="button" id="worldNewsMain" onclick="mainView('3');">뉴스</button>
		<button type="button" id="accountBook" onclick="mainView('4');">가계부</button>
		<button type="button" id="mainView" onclick="mainView('0');">홈으로</button>
   </center>
</body>
</html>