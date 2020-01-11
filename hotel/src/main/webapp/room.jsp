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
<link rel="stylesheet" type="text/css" href="${ctx}/css/header_search.css">
<link href="${ctx}/layui/css/layui.css" rel="stylesheet">

<script type="text/javascript" src="${ctx}/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/js/main.js"></script>
<title>Insert title here</title>
</head>
<body>
	<section class="listings"> 
	<header>
	<div class="header_search">
			 <%-- <a href="${ctx}/room/lists" class="login_btn">搜索</a> --%>
			 <form action="${ctx}/room/lists" method="post" class="login_btn">
			 <input type="text" name="roomType" class="search" placeholder="搜索从这里开始..." value=""/>
              <button type="submit" class="layui-btn">搜索</button>
     </form>
	</div>
	</header>
	<div class="wrapper">
		<ul class="properties_list">
			<c:forEach var="list" items="${list}">
				<li><a href="login.jsp"> <c:if test="${list.image !=null }">
							<img id="images" alt="" src="/image/${list.image}"
								class="property_img">
						</c:if>
				</a> <span class="price">${list.roomPrice}</span>
					<div class="property_details">
						<h1>
							<a href="#">${list.roomType}</a>
						</h1>
						<h2>
							${list.formu}<br> <span class="property_size">数量:
								${list.roomStock}</span>
						</h2>
					</div></li>
			</c:forEach>
	</div>
	<div class="wrapper">
		<ul class="properties_list">
			<c:forEach var="lists" items="${lists}">
				<li><a href="login.jsp"> <c:if test="${lists.image !=null }">
							<img id="images" alt="" src="/image/${lists.image}"
								class="property_img">
						</c:if>
				</a> <span class="price">${lists.roomPrice}</span>
					<div class="property_details">
						<h1>
							<a href="#">${lists.roomType}</a>
						</h1>
						<h2>
							${lists.formu}<br> <span class="property_size">数量:
								${lists.roomStock}</span>
						</h2>
					</div></li>
			</c:forEach>
	</div>
	</section>
</body>
</html>