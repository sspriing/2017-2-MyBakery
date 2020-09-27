<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bakery</title>
</head>
<body>
<% 	    

//mycart테이블에서 사용자의 정보를 삭제한다
 try {
	 String cname="";
	 Cookie[] cookies = request.getCookies();
     if(cookies==null||cookies.length<=1)
     {out.println("<script>alert('로그인후 사용해 주세요.로그인 페이지로 이동합니다.');location.href='login.jsp';</script>");}
     else{
     	cname=getCookieValue(cookies,"name");
     }
	 
	 Connection conn = null;
	 Statement stmt = null;
	 ResultSet rs = null;
     Class.forName("com.mysql.jdbc.Driver");
     String url = "jdbc:mysql://localhost:3306/mybakery_db";
     conn = DriverManager.getConnection(url, "root", "1234");
     stmt = conn.createStatement();
     String sql = "delete from mycart_tbl  where name = '"+ cname+"'";
     stmt.executeUpdate(sql);
}
catch(Exception e) {
     out.println("DB 연동 오류입니다. : " + e.getMessage());
}  

	out.println("<script>alert('삭제 되었습니다.');location.href='mycart.jsp';</script>");
%>
</body>
</html>

<%! private String getCookieValue(Cookie[] cookies,String name){
	String value=null;
	if(cookies==null)return null;
	for(Cookie cookie : cookies){
		if(cookie.getName().equals(name))return cookie.getValue();
	}
	return null;
	} 
%>