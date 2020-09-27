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
        html, body {
            width: 100%;
            height: 100%
        }

        html {
            overflow-y: scroll
        }
        

        body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, form, fieldset, p, button {
            margin: 0;
            padding: 0
        }

        body, h1, h2, h3, h4, input, button {
            font-family: NanumGothicWeb,verdana,dotum,Helvetica,sans-serif;
            font-size: 13px;
            color: #383d41
        }

        body {
            background-color: #fff;
            *word-break: break-all;
            -ms-word-break: break-all;
        }

        img, fieldset, iframe {
            border: 0 none
        }

        li {
            list-style: none
        }
        
         a:link { color: black; text-decoration: none;}
		 a:visited { color: black; text-decoration: none;}
 		 a:hover { font-weight:bolder; color: black; text-decoration: none;}

        #wrap {
            width: 1000px;
            margin: 0 auto
        }

        header {
            width: 95%;
            margin-top: 20px;
            padding: 20px;
            background: #B2CCFF;
        }

        hgroup {
            overflow: hidden;
            padding-bottom: 20px
        }

        nav {
            clear: both;
            overflow: hidden
        }

            nav li {
                float: left;
                padding-left: 15px;
                padding-right: 15px;
            }

                nav li span {
                	width:150px;
                    font-size:15px;
                    display: inline-block;
                    padding: 10px 10px;
                    background-color:#D9E5FF;
                    border: 3px solid #FAFFFF;
                    text-align: center;
                }
         unav{
        	clear: both;
            overflow: hidden
         }               
         	unav li{
         		float: left;
                padding-left: 10px;
                padding-right:10px;
                background-color:white;
         	}
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

        article {
            margin-bottom: 20px
        }

            article h3 {
                font-size: 16px
            }

        footer {
            clear: both;
            padding: 20px;
            margin-top: 15px;
            border: 1px solid #ccc
        }
        
         * {
            box-sizing: border-box
        }

        body {
            font-family: Verdana,sans-serif;
            margin: 0
        }
        td{
         /* border: 1px solid black; */
         padding:5px;
        }

    </style>

</head>
<body>


<div id="wrap">
    	<a href="home.jsp"><img src="image/logo.jpg" style="width:250px;height:210px;margin-left:347px;"></a>
        <header>
            <nav>
                <ul>
                	<li><span><a href="home.jsp">home</a></span></li>
                    <li><span><a href="introduce.jsp">업체 소개</a></span></li>
                    <li><span><a href="menu.jsp">메뉴</a></span></li>
                    <li><span><a href="customer.jsp">공지사항</a></span></li>
                    <% Cookie[] cookies = request.getCookies(); 
                       String link="", linkname="";
                       if(cookies==null||cookies.length<=1){link="login.jsp";linkname="로그인";}
                       else{link="mypage.jsp";linkname="마이페이지";}
                    %>
                    <li><span><a href="<%=link%>"><%=linkname %></a></span></li>
                </ul>
            </nav>
        </header>
        <section>
<center><h1>축하합니다.<br> <a href="mypage.jsp">로그인페이지로 이동하여 로그인 해주세요</a></h1></center>
        </section>
        <footer>
            <address>by bomi</address>
        </footer>
    </div>


</body>
</html>

<%
String id=request.getParameter("id");
String pw=request.getParameter("pw");
String name=request.getParameter("name");
String e_mail=request.getParameter("e_mail");
String phone=request.getParameter("phone");
%>
<%
Connection conn = null;
Statement stmt = null;
String sql = null;
ResultSet rs = null;
int i;
try {
      Class.forName("com.mysql.jdbc.Driver");
      String jdbcurl = "jdbc:mysql://localhost:3306/mybakery_db";
      conn = DriverManager.getConnection(jdbcurl, "root", "1234");
      stmt = conn.createStatement();
      sql = "select * from mybakery_tbl";
      rs = stmt.executeQuery(sql);
}
catch(Exception e) {
      out.println("DB 연동 오류입니다. : " + e.getMessage());
}
     String sql1 = "insert into mybakery_tbl values ('" + id + "','"+ pw +"','"+ e_mail +"','"+ name +"','"+ phone +"')";
     try{
        stmt.executeUpdate(sql1);
     }catch(Exception e) {
        out.println("DB 연동 오류입니다. : " + e.getMessage() );
     }

		rs.close();
		stmt.close();

%>