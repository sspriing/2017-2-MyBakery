<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bakery</title>
</head>
<body>
<% String st=request.getParameter("st"); out.println("<script>alert('아이디나 비밀번호를 잘못 입력하였습니다.');history.back();</script>"); %>
</body>
</html>