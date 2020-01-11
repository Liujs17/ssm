<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" isErrorPage="true"%>
 <% pageContext.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
    <form action="${ctx}/room/save" method="post" enctype="multipart/form-data">
       编号：<input type="number" name="roomId"><br>
       类型：<input type="text" name="roomType"><br>
       价格：<input type="number" name="roomPrice"><br>
       数量：<input type="number" name="roomStock"><br>
       描述:<input type="text" name="formu"><br>
        图片：<input type="file" name="file"><br>
        <input type="submit" value="提交">
    </form>
</body>
</html>