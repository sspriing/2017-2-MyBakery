<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Bakery</title>
</head>
<body>
<%
Cookie[] cookies = request.getCookies();
int i;
String name="";
String title=request.getParameter("title");
String content=request.getParameter("content");

if(cookies.length<=1||cookies==null){out.println("<script>alert('로그인후 사용해 주세요.로그인 페이지로 이동합니다.');location.href='login.jsp';</script>");}
else{
name=getCookieValue(cookies,"name");

Connection conn = null;
Statement stmt = null;
String sql = null;
ResultSet rs = null;

try {
      Class.forName("com.mysql.jdbc.Driver");
      String jdbcurl = "jdbc:mysql://localhost:3306/mybakery_db";
      conn = DriverManager.getConnection(jdbcurl, "root", "1234");
      stmt = conn.createStatement();
      sql = "select * from board_tbl";
      rs = stmt.executeQuery(sql);
}
catch(Exception e) {
      out.println("DB 연동 오류입니다. : " + e.getMessage());
}
String pid="";
while(rs.next()){
	pid=rs.getString("id");}

 String sql2 = "insert into board_tbl values (null ,'" + name + "','" + title +"','"+content +"')";
 try{
    stmt.executeUpdate(sql2);
 }catch(Exception e) {
    out.println("DB 연동 오류입니다. : " + e.getMessage() );
 }



rs.close();
stmt.close();}

out.println("<script>alert('작성한 글이 등록되었습니다.');location.href='customer.jsp';</script>");
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