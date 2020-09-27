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
String name="",e_mail="",phone="";
String dname="",de_mail="",dphone="";
String byPhone="",byEmail="";

name=request.getParameter("name");
e_mail=request.getParameter("e_mail");
phone=request.getParameter("phone");

byPhone=request.getParameter("byPhone");
byEmail=request.getParameter("byEmail");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/mybakery_db";
      conn = DriverManager.getConnection(url, "root", "1234");
      stmt = conn.createStatement();
      String sql = "select * from mybakery_tbl where name = '"+ name+"'";
      rs = stmt.executeQuery(sql);
}
catch(Exception e) {
      out.println("DB 연동 오류입니다. : " + e.getMessage());
} 
while(rs.next()){
dname=rs.getString("name");
de_mail=rs.getString("e_mail");
dphone=rs.getString("phone");}
/* if(rs.getRow()==0){out.println("<script>alert('회원정보가 없습니다.');location.href='login.jsp';</script>");}
else{
dname=rs.getString("name");
de_mail=rs.getString("e_mail");
dphone=rs.getString("phone");
} */
if(name.equals(dname)&&e_mail.equals(de_mail)&&phone.equals(dphone)){
	if(byPhone==null){out.println("<script>alert('이메일로 아이디를 발송했습니다.');location.href='login.jsp';</script>");}
	else{out.println("<script>alert('메세지로 아이디를 발송했습니다.');location.href='login.jsp';</script>");}
}

else{out.println("<script>alert('해당 회원정보가 없습니다. 다시 확인해 주세요');location.href='login.jsp';</script>");}

%>

</body>
</html>
