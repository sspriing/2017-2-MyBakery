<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page import="java.sql.*" %>
<html>
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
     
   	 int id, ref = 0;
	 String name = "",  title = "", content = "";
     Connection conn = null;
	 Statement stmt = null;
	 ResultSet rs = null;
	     
         id = Integer.parseInt(request.getParameter("id"));

         try {
               Class.forName("com.mysql.jdbc.Driver");
               String url = "jdbc:mysql://localhost:3306/mybakery_db";
               conn = DriverManager.getConnection(url, "root", "1234");
               stmt = conn.createStatement();
               String sql = "select * from board_tbl where id = " + id;
               rs = stmt.executeQuery(sql);
         }
         catch(Exception e) {
               out.println("DB 연동 오류입니다. : " + e.getMessage());
         } 

         while(rs.next())  {
	       name = rs.getString("author");
	       title = rs.getString("title");
	       content = rs.getString("content");
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
                    <%Cookie[] cookies = request.getCookies();
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
				<table style=" width:600px; border:1px solid black;border-collaspe:collaspe; background-color:white;padding:10px;" >
						<tr><th colspan="2" style="padding:20px;"><font size="4"><a href="orderlist.jsp">게시글 내용</a></font></th></tr>	
						
      <tr>
              <td width="100px"><img src="image/ball.gif">글 쓴 이 : </td>
	      <td><%= name %></td>
      </tr>     
      <tr>
	      <td>글 제 목 : </td>
	      <td><%= title %></td>
      </tr>
      <tr>
	      <td> 글 내 용 : </td>
	      <td><%= content %></td>
      </tr>
<br><br>
				</table>	
<%
if(cookies.length>1&&cookies!=null){ String sname=getCookieValue(cookies,"name"); if(sname.equals("test")){ %>
    <a href="board-delete.jsp?id=<%= id %>"> 게시글 삭제 </a>&nbsp;&nbsp;
 <%}}%> 
    <a href="customer.jsp"> 게시글 목록 보기 </a>
        </center>
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