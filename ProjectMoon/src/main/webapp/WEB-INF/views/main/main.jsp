<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
<h1>메인 화면 이동</h1>

	<P>The time on the server is ${serverTime}.</P>
	<button type="button" id="financialStatementsMain" onclick="location.href='/financialStatements/main'">경제지표</button>
	<a href="../company/main"><button type="button" id="companyMain">기업</button></a>
	<a href="../worldNews/main"><button type="button" id="worldNewsMain">뉴스</button></a>
	<a href="../accountBook/main"><button type="button" id="accountBook">가계부</button></a>
</body>
</html>