<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <form action="submitCustomer.jsp" method="post">
        	<center style=" margin-top:20px">
        	<table style="border:1px solid black; align:center; width:800px; background-color:white">
        	<tr align=center><td colspan="2"><center>회원정보 입력</center></td></tr>
        	<tr><td style="padding-left:20px"  width="150px" >아이디</td><td> <input type="text" name="id"/></td></tr>
        	<tr><td style="padding-left:20px">패스워드</td><td><input type="password" name="pw" /></td></tr>
        	<tr><td style="padding-left:20px">이름</td><td><input type="text" name="name" style="width:120px"/></td></tr>
        	<tr><td style="padding-left:20px">이메일 주소</td><td><input type="text" name="e_mail" style="width:200px"/></td></tr>
        	<tr><td style="padding-left:20px">전화번호</td><td><input type="text" name="phone" style="width:200px"/></td></tr>
        	<tr align=center><td colspan="2"><center><input type="submit" value="회원가입"> <input type="reset" value="다시 입력"></center></td></tr>
			</table>			
			</center>
			</form>
        </section>
        <footer>
            <address>by bomi</address>
        </footer>
    </div>
</body>
</html>