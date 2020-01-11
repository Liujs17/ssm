<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isErrorPage="true" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>房间</title>
<link href="${ctx}/layui/css/layui.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/responsive.css">
<link rel="stylesheet" type="text/css" href="css/header_search.css">

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</head>
<body>	
<header>
         <div class="header_search">
　　                      <input type="text" name="keyword" id="keyword" class="search" placeholder="搜索从这里开始..." />
             <a href="#" class="login_btn">搜索</a>
　    　                          <div id="searchBox" >
			</div>
         </div>
        </div>
		</header> 
		<section class="listings"> 
    <table class="layui-table" lay-skin="nob">
           <!--  <thead>
            <tr>
            <th>编号</th>
            <th>房间类型</th>
            <th>价格</th>
            <th>数量</th>
            <th>图片</th>
            </tr>
            </thead> -->
            <tbody>
                <c:forEach var="lists" items="${lists}">
			  <tr>
			   <th><c:if test="${lists.image !=null }">
                    <img id="images" alt="" src="/image/${lists.image }">
                </c:if> </th>
				<%-- <td>${list.roomId}</td> --%>
				<td>${lists.formu}</td>
				<td>${lists.roomType}</td>
				<td>${lists.roomPrice}</td>
				<td>${lists.roomStock}</td>
				
					
		      </tr>
			
		  </c:forEach>
         </tbody>
		</table>
		</section>
	<!-- <table width="300px" border="1" cellpadding="0" cellspacing="0"
		align="center">
		<tr>
			<td>编号</td>
			<td>房间类型</td>
			<td>价格</td>
			<td>数量</td>
		</tr> -->
</body>
</html>
