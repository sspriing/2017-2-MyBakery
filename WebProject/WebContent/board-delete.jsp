<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bakery</title>
<style>
        html, body {width: 100%;height: 100%}
        html {overflow-y: scroll}
        body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, form, fieldset, p, button { margin: 0;padding: 0}
        body, h1, h2, h3, h4, input, button {font-family: NanumGothicWeb,verdana,dotum,Helvetica,sans-serif;font-size: 13px;color: #383d41}
        body {background-color: #fff;*word-break: break-all;-ms-word-break: break-all;}
        img, fieldset, iframe {border: 0 none}
        li {list-style: none}
         a:link { color: black; text-decoration: none;}
		 a:visited { color: black; text-decoration: none;}
 		 a:hover { font-weight:bolder; color: black; text-decoration: none;}
        #wrap {width: 1000px;margin: 0 auto}
        header {width: 95%;margin-top: 20px;padding: 20px;background: #B2CCFF;}
        hgroup { overflow: hidden;padding-bottom: 20px}
        nav { clear: both;overflow: hidden}
            nav li {float: left;padding-left: 15px;padding-right: 15px;}
                nav li span {width:150px;font-size:15px;display: inline-block;padding: 10px 10px;background-color:#D9E5FF; border: 3px solid #FAFFFF;text-align: center;}
         unav{clear: both;overflow: hidden}               
         	unav li{float: left;padding-left: 10px;padding-right:10px;background-color:white;}
         	unav li span {
         			text-align: center;
         			width:207px;
         			height:80px;
                    font-size:25px;
                    display: inline-block;
                    padding: 10px 11px;
                    background-color: #FFD9EC;
                }

        section {
          	width: 95%;
          	min-height:200px;
            margin-top: 20px;
            padding: 20px;
            background: #FFA7A7;
			clear: both;
            overflow: hidden;
        }
        	section li{
                float: left;
                 padding-left: 20px;
                padding-right:20px;
                margin-top:50px;
            }
            	section li span{
            	background: white;
            	text-align:center;
            	font-size:15px;
            	display: inline-block;
            	padding: 5px 5px;
            	}

        article {margin-bottom: 20px}
            article h3 {font-size: 16px}
        footer {clear: both;padding: 20px;margin-top: 15px;border: 1px solid #ccc}
         * {box-sizing: border-box}
        body {font-family: Verdana,sans-serif;margin: 0}

    </style>
</head>
<body>
        <%
        
        String id="",cname="",name="";
        id=request.getParameter("id");
        name=request.getParameter("name");
        Cookie[] cookies = request.getCookies();
        if(cookies==null||cookies.length<=1)
        {out.println("<script>alert('로그인후 사용해 주세요.로그인 페이지로 이동합니다.');location.href='login.jsp';</script>");}
        else{
        	cname=getCookieValue(cookies,"name");
        }
        if(cname.equals(name)){out.println("<script>alert('삭제 권한이 없습니다.');location.href='customer.jsp';</script>");}
        %>  
 		<%
 		
		int i=0;

 		Connection conn = null;
 		Statement stmt = null;
 		ResultSet rs = null;
	
 	    //board 테이블에서 게시글을 삭제한다
 	    try {
	          Class.forName("com.mysql.jdbc.Driver");
	          String url = "jdbc:mysql://localhost:3306/mybakery_db";
	          conn = DriverManager.getConnection(url, "root", "1234");
	          stmt = conn.createStatement();
	          String sql = "delete from board_tbl  where author = '"+ cname+"' and id = '"+id+"'";
	          stmt.executeUpdate(sql);
	    }
	    catch(Exception e) {
	          out.println("DB 연동 오류입니다. : " + e.getMessage());
	    } 

		%>
<div id="wrap">
    	<a href="home.jsp"><img src="image/logo.jpg" style="width:250px;height:210px;margin-left:347px;"></a>
        <header>
            <nav>
                <ul>
                	<li><span><a href="home.jsp">home</a></span></li>
                    <li><span><a href="introduce.jsp">업체 소개</a></span></li>
                    <li><span><a href="menu.jsp">메뉴</a></span></li>
                    <li><span><a href="customer.jsp">공지사항</a></span></li>
                    <%
                       String link="", linkname="";
                       if(cookies==null||cookies.length<=1){link="login.jsp";linkname="로그인";}
                       else{link="mypage.jsp";linkname="마이페이지";}
                    %>
                    <li><span><a href="<%=link%>"><%=linkname %></a></span></li>
                </ul>
            </nav>
        </header>
        <section>
        <center style=" margin-top:20px">
				
				<table style="text-align:center; width:600px; border:1px solid black;border-collaspe:collaspe; background-color:white;padding:10px;" >
						<tr><th style="padding:20px;"><font size="7"><a href="customer.jsp">삭제완료</a></font></th></tr>	
				</table>	
			
				<center style=" margin-top:20px">
        </section>
                <footer>
            <address>by bomi</address>
        </footer>
        </div>
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
