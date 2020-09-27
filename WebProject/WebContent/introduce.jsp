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
            	background-color: white;
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
<embed src="image/JunkDrunkLove.mp3" autostart="true" loop="true" hidden="true">
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
                       Cookie[] cookies = request.getCookies();
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
          	<table style="background:white;margin-bottom:50px">
          	<tr><td><img src="image/cheif.jpg" style="float:left;width:300px;height:350px" /></td>
          	<td>
<font size="3">갓 구운 신선함이 
매장을 가득 채웁니다.</font><br>

오븐에서 방금 꺼낸 빵이 가장 맛있다는 것을 알기에, 저희는 지금도<br>
더욱 따뜻하고 촉촉한 갓 구운 빵을 제공하기 위해 끊임없이 노력합니다.<br>
매장에서 직접 굽는 것에 그치지 않고, 언제라도 따끈한 빵을 만날 수 있게<br>
더욱 자주 굽고, 고객들이 필요한 시간에 맞춰 굽는 등<br>
세심하고 배려가 담긴 서비스도 준비하고 있습니다.<br>
갓 구워낸 빵은 고소한 향기와 따스한 온기로 매장을 가득 채우고,<br>
고객들에게는 가장 맛있는 빵을 맛보는 행복을 선물합니다.</td></tr></table>
<font size="4"><b>매장 위치</b></font>
        		<div id="map" style="width:500px;height:400px;"></div><br><br><font size="3"><a href="http://map.daum.net/link/search/동국대학교 신공학관"><input type="button"value="길찾기"></a></font>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0607498cf8ac1a7a6f26e9bb2d5b606e"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(37.558228, 126.998239),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
		
		var markerPosition  = new daum.maps.LatLng(37.558228, 126.998239); 

		// 마커를 생성
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정
		marker.setMap(map);
	</script>
				
        	<center style=" margin-top:20px">
        	
        		
				
        	
        	</center>
        </section>
                <footer>
            <address>by bomi</address>
        </footer>
        </div>
</body>
</html>
