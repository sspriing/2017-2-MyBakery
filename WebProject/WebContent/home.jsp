
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
            -ms-word-break: break-all
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
           background: white;
        }

        hgroup {
            overflow: hidden;
            padding-bottom: 20px
        }

            hgroup h1 {
                float: left;
                font-size: 18px;
                color: #fff
            }

            hgroup h2 {
                float: right;
                font-weight: normal;
                color: #fff;
                opacity: 0.8
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
         			height:100px;
                    font-size:25px;
                    display: inline-block;
                    padding: 10px 11px;
                    background: #B2CCFF;
                }

        section {
            float: initial;
            width: 95%;
            margin-top: 15px;
            margin-bottom: 20px;
            padding: 3px;
            line-height: 20px
        }

    

        footer {
            clear: both;
            padding: 20px;
            margin-top: 30px;
            border: 1px solid #ccc
        }

    </style>

    <style>
        * {
            box-sizing: border-box
        }

        body {
            font-family: Verdana,sans-serif;
            margin: 0
        }

        .mySlides {
            display: none
        }

        /* Slideshow container */
        .slideshow-container {
            max-width: 1000px;
            position: relative;
            margin: auto;
        }

        /* On hover, add a black background color with a little bit see-through */
        .prev:hover, .next:hover {
            background-color: rgba(0,0,0,0.8);
        }

        /* Caption text */
        .dot {
            cursor: pointer;
            height: 15px;
            width: 15px;
            margin: 0 2px;
            margin-top: 5px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

            .active, .dot:hover {
                background-color: #717171;
            }

        @media only screen and (max-width: 300px) {
            .prev, .next, .text {
                font-size: 11px
            }
        }

    </style>
<script>
function popUp(){
	window.open("popUp.html","광고","width=300,height=300,toolbar=no,location=no,left=150,top=150");
	
}
</script>
</head>
<body onLoad="popUp()">
    <div id="wrap"> 
    <a href="home.jsp"><img src="image/logo.jpg" style="width:250px;height:210px;margin-left:347px;"></a>
         <header style="background-color: #B2CCFF;">
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
        <section >
            <div class="slideshow-container">
					<center>
                <div class="mySlides fade">
                    <a href="information.jsp?id=5"> <img src="image/grape.JPG" style="width:500px;height:500px"></a>
                </div>

                <div class="mySlides fade">
                    <a href="information.jsp?id=4"><img src="image/cheesecake.jpg" style="width:500px;height:500px"></a>
                </div>
                <div style="text-align:center">
                    <span class="dot" onclick="currentSlide(1)"></span>
                    <span class="dot" onclick="currentSlide(2)"></span>
                </div>
                </center>
            </div>
            <br>          
        </section>
        <header style="height:100px; border:1px solid white;">
        	<unav>
        		<ul><tt>	
        			<li><span><b>주소</b> <br> 서울특별시<br> 중구 필동</span></li>
        			<li><span><b>운영시간 </b><br> 10:00 - 21:00</span></li>
        			<li><span><b>전화번호</b> <br> 02)123-456</span></li>
        			<li><span><b>카카오 계정</b> <br> mybakery </span></li>     	
        		</tt></ul>
        	</unav>
        </header>
        
        <footer>
            <address>by bomi</address>
        </footer>
        
    </div>
    <script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}
    </script>

</body>
</html>
