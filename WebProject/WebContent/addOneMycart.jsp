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
        String name="",num="",cname="",pname="";
        int id, price,flag=0 ;
        Cookie[] cookies = request.getCookies();
        String link="", linkname="";
        if(cookies==null||cookies.length<=1)
        {flag=1;out.println("<script>alert('로그인후 사용해 주세요.로그인 페이지로 이동합니다.');location.href='login.jsp';</script>");}
        else{
        	cname=getCookieValue(cookies,"name");
        }
        %>  

        <%
        id = Integer.parseInt(request.getParameter("id"));
        name=request.getParameter("name");
        price = Integer.parseInt(request.getParameter("price"));
        %>
               
 		<%
		Connection conn = null;
		Statement stmt = null;
		String sql = null;
		ResultSet rs = null;
		int i;
		
	    try {
	          Class.forName("com.mysql.jdbc.Driver");
	          String url = "jdbc:mysql://localhost:3306/mybakery_db";
	          conn = DriverManager.getConnection(url, "root", "1234");
	          stmt = conn.createStatement();
	          String sql1 = "select * from mycart_tbl where name = '"+ cname+"'";
	          rs = stmt.executeQuery(sql1);
	    }
	    catch(Exception e) {
	          out.println("DB 연동 오류입니다. : " + e.getMessage());
	    } 
	    while(rs.next()&&flag==0){
			pname=rs.getString("productName");
			if(pname.equals(name)){out.println("<script>alert('장바구니에 이미 존재하는 상품입니다.');history.back();</script>");flag=1;break;}
	    }
		
	    if(flag==0){
		try {
      		Class.forName("com.mysql.jdbc.Driver");
      		String jdbcurl = "jdbc:mysql://localhost:3306/mybakery_db";
      		conn = DriverManager.getConnection(jdbcurl, "root", "1234");
      		stmt = conn.createStatement();
      		sql = "select * from mycart_tbl";
      		rs = stmt.executeQuery(sql);
		}
		catch(Exception e) {
		      out.println("DB 연동 오류입니다. : " + e.getMessage());
		}
	     String sql1 = "insert into mycart_tbl values ('" + cname + "','"+ name +"','1',"+price+")";
	     try{
	        stmt.executeUpdate(sql1);
	     }catch(Exception e) {
	        out.println("DB 연동 오류입니다. : " + e.getMessage() );
	     }
		rs.close();
		stmt.close();
		%>
		 <%out.println("<script>alert('장바구니에 추가 했습니다.');history.back();</script>");} %>
        
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
