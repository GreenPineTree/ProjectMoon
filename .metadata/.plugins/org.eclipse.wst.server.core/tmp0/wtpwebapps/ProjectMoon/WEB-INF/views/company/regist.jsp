<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript">
<!-- 등록 함수 -->
function login(){
	var frm = document.getElementById("loginfrm");
	
	frm.action="<c:url value='/main/main.action'/>";
	frm.submit();
	
}


</script>


<title>가계부</title>
</head>
<body>

	<P>The time on the server is ${serverTime}.</P>
	<form id="loginfrm" name="loginfrm" method="post">>
		<input type="text" id="" name="">
		<button id="regist" name="regist" onclick="regist();">등록</button>
	</form>
</body>
</html>