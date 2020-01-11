<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isErrorPage="true" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="description"
	content="La casa free real state fully responsive html5/css3 home page website template" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />

<link rel="stylesheet" type="text/css" href="${ctx}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/responsive.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/css/header_search.css">

<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/main.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="${ctx}/room/lists">
		<div class="col-md-4 data1">
			<input type="text" class="form-control"   name="roomType"
				placeholder="roomType" value="">
		</div>
		<button type="submit" class="btn bg-maroon">搜索</button>
	</form>
</body>
</html>