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
<% Cookie[] cookies = request.getCookies(); %>
 <%
 	 String lid=request.getParameter("id");
 	 String lpw=request.getParameter("pw");
	 String id="",pw="",name="";
	 String st="";
     Connection conn = null;
	 Statement stmt = null;
	 ResultSet rs = null;
	 boolean login=false;


         try {
               Class.forName("com.mysql.jdbc.Driver");
               String url = "jdbc:mysql://localhost:3306/mybakery_db";
               conn = DriverManager.getConnection(url, "root", "1234");
               stmt = conn.createStatement();
               String sql = "select * from mybakery_tbl";
               rs = stmt.executeQuery(sql);
         }
         catch(Exception e) {
               out.println("DB 연동 오류입니다. : " + e.getMessage());
         } 
         while(rs.next()){
           pw = rs.getString("pw");
  	       id = rs.getString("id");
  	       name=rs.getString("name");
  	       if(lpw.equals(pw)&&lid.equals(id)&&rs.getRow()!=0){
  	    	   login=true;
  	    	 Cookie cookie = new Cookie("name", name);
  	    	 response.addCookie(cookie);
  	    	out.println("<script>location.href='mypage.jsp';</script>");
  	    	   break;
  	       }
  	       } out.println("<script>alert('아이디 혹은 비밀번호를 잘못 입력하셨습니다');location.href='login.jsp';</script>");
         
%>
</body>
</html>