<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript">
<!-- 로그인 함수 -->
function login(){
	var frm = document.getElementById("loginfrm");
	
	frm.action="<c:url value='/main/main.action'/>";
	frm.submit();
	
}


</script>


<title>가계부</title>
</head>
<body>
	<!-- <h1>부자되고 싶어요!!</h1> -->

	<P>The time on the server is ${serverTime}.</P>
	<a href="../accountBook/regist"><button type="button" id="accountBook">가계부</button></a>
	<a href="../accountBook/list"><button type="button" id="accountBook">가계부</button></a>
</body>
</html>