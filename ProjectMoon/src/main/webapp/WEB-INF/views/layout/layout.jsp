<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>test</title>
<style type="text/css">
#header {
	width: 100%;
	height: 100px;
	text-align: center;
}

#menu {
	float: left;
	width: 15%;
}

#content {
	float: left;
	width: 85%;
}

#footer {
	width: 100%;
	height: 50px;
	text-align: center;
	clear: both;
}

#menu, #content {
	min-height: 600px;
}
</style>
</head>

<body>

<div style="width:100%; height:100%;">
    <div id="header"><tiles:insertAttribute name="header" /></div>
    <div id="menu"><tiles:insertAttribute name="menu" /></div>
    <div id="content"><tiles:insertAttribute name="content" /></div>    
    <div id="footer"><tiles:insertAttribute name="footer" /></div>
</div>

</body>
</html>