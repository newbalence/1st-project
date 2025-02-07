<%@page import="user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO user = (UserVO)session.getAttribute("user");
	String type = request.getParameter("type");
	String order = request.getParameter("order");
	
	if(user != null){
		type = user.getUserType();
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>갓 생 살기</title>
    <script src="../js/jquery-3.7.1.js"></script>
    <style>
        header {
        	height : 35px;
            background: white;
            color: #333;
            padding: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .menu-toggle {
            position: absolute;
            top: 15px;
            right: 15px;
            background: #2575fc;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .menu-toggle:hover {
            background: #1a5fc4;
        }
        .dropdown-menu {
            display: none;
            position: absolute;
            top: 50px;
            right: 15px;
            background: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1000;
        }
        .dropdown-menu a {
            display: block;
            padding: 10px;
            color: #333;
            text-decoration: none;
            border-bottom: 1px solid #ddd;
        }
        .dropdown-menu a:last-child {
            border-bottom: none;
        }
        .dropdown-menu a:hover {
            background: #f4f4f4;
        }
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.1);
            z-index: 999;
        }
    </style>
    <script>
        function toggleMenu() {
            var menu = document.getElementById('dropdown-menu');
            var overlay = document.getElementById('overlay');
            if (menu.style.display === 'block') {
                menu.style.display = 'none';
                overlay.style.display = 'none';
            } else {
                menu.style.display = 'block';
                overlay.style.display = 'block';
            }
        }
        function closeMenu() {
            var menu = document.getElementById('dropdown-menu');
            var overlay = document.getElementById('overlay');
            menu.style.display = 'none';
            overlay.style.display = 'none';
        }
    </script>
</head>
<body>
    <header>
        <button class="menu-toggle" onclick="toggleMenu()">메뉴</button>
        <div class="dropdown-menu" id="dropdown-menu">
        	<a href="../main/main.jsp">홈</a>
   			<%
   			if(user != null){
   	   			if(type.equals("0")){
   	   				%>
   	        		<a href="#">회원관리</a>
   	   				<%
   				}
   	   			%>
   				<a href="#">마이페이지</a>	
   				<a href="../login/logout.jsp">로그아웃</a>	
   				<%
   			}
   			%>
        </div>
        <div class="overlay" id="overlay" onclick="closeMenu()"></div>
    </header>
</body>
</html>