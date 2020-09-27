<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta name="viewport"content="width=device-width,initial-sclae-1" charset="utf-8">
    <title>Bakery</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
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
        	<ul>
        		<li><span onclick=""><a href="information.jsp?id=1"><img src="image/cupcake1.jpg" style="width:250px;height:210px"><br><br>레드벨벳 컵케이크</a><br><br><tt><a href="addOneMycart.jsp?id=1&name=red velbet cupcake&price=5000">장바구니 </a> </tt></span></li>
        		<li><span onclick=""><a href="information.jsp?id=2"><img src="image/cupcake2.jpg" style="width:250px;height:210px"><br><br>초코바닐라 컵케이크</a><br><br><tt><a href="addOneMycart.jsp?id=2&name=choco vanilla cupcake&price=4500">장바구니 </a></tt></span></li>
        		<li><span onclick=""><a href="information.jsp?id=3"><img src="image/cupcake3.jpg" style="width:250px;height:210px"><br><br>더블초코 컵케이크</a><br><br><tt><a href="addOneMycart.jsp?id=3&name= double choco cupcake&price=4000">장바구니 </a> </tt></span></li>
        	</ul>
        	<br>
        	<ul style="margin-top:10px">
        		<li><span onclick=""><a href="information.jsp?id=4"><img src="image/cheesecake.jpg" style="width:250px;height:210px"><br><br>치즈케이크</a><br><br><tt><a href="addOneMycart.jsp?id=4&name=cheese cake&price=20000">장바구니 </a></tt></span></li>
        		<li><span onclick=""><a href="information.jsp?id=5"><img src="image/grape.JPG" style="width:250px;height:210px"><br><br>청포도 타르트</a><br><br><tt><a href="addOneMycart.jsp?id=5&name=grape tarte&price=18000">장바구니 </a></tt></span></li>
        		<li><span onclick=""><a href="information.jsp?id=6"><img src="image/chococake.jpg" style="width:250px;height:210px"><br><br>초코케이크</a><br><br><tt><a href="addOneMycart.jsp?id=6&name=choco cake&price=25000">장바구니 </a></tt></span></li>
        	</ul>
        </section>
        <footer>
            <address>by bomi</address>
        </footer>
    </div>


</body>
</html>
