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
<html>
	<head>
	<meta charset="UTF-8">
	<title>Good Life</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<link rel="stylesheet" href=https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css>
	<script src=https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js></script>
	<script src=https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js></script>
	<link rel="stylesheet" href=https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
	<script src="https://kit.fontawesome.com/ed2cfa7d40.js"></script>
	<style>
	
		li {
			z-index:99;
			position: relative;
			list-style-type: none;
			padding-left: 0px;
			background-color: white;
			display: table-cell;
		}
		.select {
		  display: inline-block;
		  width: 120px;
		  border: 1px solid #999;
		  text-align-last: center;
		}
		
		.select .selected {
		  display: flex;
		  justify-content: center;
		  padding: 8px 5px;
		}
		
		.select .selected .selected-value {
		  max-width: 90px;
		}
		
		.select li {
		  width: 120px;
		  border: 1px solid #999;
		  position: absolute;
		  background: #fff;
		  border-top: none;
		  margin: 1px 0 0 -1px;
		  cursor: pointer;
		  display : none;
	      
		}
		.select.active li {
		  display: initial;
		}
		
		.select ul li {
		  padding: 8px 5px;
		}
		.select ul li,
		.select .selected .selected-value {
		  white-space: nowrap; /* 줄바꿈 안함 */
		  overflow: hidden;
		  text-overflow: ellipsis; /* 말줄임 적용 */
		}
		.select ul li:hover {
		  background: rgba(168, 156, 235, 0.35)
		}
		.mb-5 {
		    margin-bottom: 0 !important;
		}
		
		.nav-container{
			background-color: white;
			height: 82px;
		}
		.bi-alarm {
			margin-left: 25px;
			margin-right: 25px;
			font-size: 2rem;
		}
		.bi-alarm:hover {
			color: #c40000;
		}
		.btn-dark {
			padding: 0 23px;
			box-sizing: border-box;
			height: 40px;
			min-width: 120px;
			line-height: 38px;
			border-radius: 30px;
			margin-left: 50px;
		}
		.login{
			padding: 0 23px;
			box-sizing: border-box;
			height: 40px;
			min-width: 120px;
			line-height: 38px;
			border-radius: 30px;
			margin-left: 50px;
			background-color: #23272B;
			color: white;
		}
		.btn-dark:hover {
			background-color: #c40000;
			border: none;
			line-height: 40px;
		}
		.login:hover{
			background-color: #c40000;
			border: none;
			line-height: 40px;
		}
		.nav-item {
			line-height: 2.5;
			color:var(--bs-black);
			position: relative;
			margin: 0 5px 0 10px;
			padding: 4px 2px;
			font-size: 17px;
			font-weight: 600;
			cursor: pointer;
		}
		
		.nav-link {
			color: var(--bs-black);
		}
		.nav-link:hover {
			color: #c40000;
		}
		
		.input-box {
			position: relative;
			right: 60px;

		}

		.whole-search {
			cursor: pointer;
			position: absolute;
			left: 240px;
			top: 11px;
			color:#ced4da;
		}
	
		.form-control {
			padding: .375rem 1.3rem;
			font-size: 0.8rem;
			width: 150%;
			height: 38px;
			background-color:#ffffff;
			border-radius: 30px;
			font-family: auto;
			autocomplete: off;
		}
	
		.form-control:focus {
			background-color: #ffffff;
			box-shadow: none;
			border-color: #ced4da;
		}
		
		.bi-x-circle-fill {
			cursor: pointer;
			position: absolute;
			top: 6px;
			left: 212px;
			color: #5b5b5b;
		}
		
		.fa-bell {
			font-size: 1.5rem;
			margin-left: 4rem;
			margin-right: 2rem;
			margin-top: .13rem;
		}
		
		.fa-bell:hover {
			color: #c40000;
		}
		
		.bi-person-circle {
			font-size: 2.5rem;
			margin-right: 1rem;
			color: #7aabff;
		}
		
		.bi-person-circle:hover {
			color: #000000;
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
        .dropdown-menus {
        	text-align: center;
            display: none;
            position: absolute;
            background: white;
            border: 1px solid #ddd;
            /* border-radius: 5px; */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            right: 40px;
            top: 100%;
        }
        .dropdown-menus a {
            display: block;
            padding: 10px;
            color: #333;
            text-decoration: none;
            border-bottom: 1px solid #ddd;
        }
        .dropdown-menus a:last-child {
            border-bottom: none;
        }
        .dropdown-menus a:hover {
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
        .login-container {
	            background: white;
	            padding: 30px 40px;
	        }
	        h1 {
	            text-align: center;
	            margin-bottom: 20px;
	            color: #23272B;
	            font-family: 'Verdana', sans-serif;
	        }
	        label {
	            display: block;
	            margin-bottom: 8px;
	            font-weight: bold;
	            color: #444;
	        }
	        input {
	            display: block;
	            width: calc(100% - 20px);
	            padding: 10px;
	            margin-bottom: 5px;
	            border: 1px solid #ddd;
	            border-radius: 5px;
	            font-size: 1rem;
	            margin-right: auto;
	        }
	        input:focus {
	            outline: none;
	            border-color: #2575fc;
	            box-shadow: 0 0 5px rgba(37, 117, 252, 0.5);
	        }
	        .feedback {
	            font-size: 0.9rem;
	            color: red;
	            margin-bottom: 10px;
	        }
	        .feedback.success {
	            color: green;
	        }
	        button:hover {
	            background: #1a5fc4;
	        }
	        .alternate-option {
	            text-align: center;
	            margin-top: 20px;
	        }
	        .alternate-option a {
	            color: #23272B;
	            text-decoration: none;
	            font-weight: bold;
	        }
	        .alternate-option a:hover {
	            text-decoration: underline;
	            color: red;
	        }
	        
	        .goal-dropdown {
	        	display: none;
	        	position: absolute;
	        	z-index: 1;
	        	font-weight: 400;
	        	background-color: #f9f9f9;
	        	min-width: 150px;
	        	text-align: center;
	        }
	        
	        .goal-dropdown a {
	        	display: block;
	        	text-decoration: none;
	        	color: rgb(37, 37, 37);
	        	font-size: 12px;
	        	padding: 12px 20px;
	        }
	        
	        .goal-dropdown a:hover {
	        	background-color : #c40000;
	        	color: white;
	        }
	        
	        .nav-goal:hover .goal-dropdown {
	        	display: block;
	        }
            background: white;
            padding: 30px 40px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #23272B;
            font-family: 'Verdana', sans-serif;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #444;
        }
        input {
            display: block;
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            margin-right: auto;
        }
        input:focus {
            outline: none;
            border-color: #2575fc;
            box-shadow: 0 0 5px rgba(37, 117, 252, 0.5);
        }
        .feedback {
            font-size: 0.9rem;
            color: red;
            margin-bottom: 10px;
        }
        .feedback.success {
            color: green;
        }
        button:hover {
            background: #1a5fc4;
        }
        .alternate-option {
            text-align: center;
            margin-top: 20px;
        }
        .alternate-option a {
            color: #23272B;
            text-decoration: none;
            font-weight: bold;
        }
        .alternate-option a:hover {
            text-decoration: underline;
            color: red;
        }
		.menu:after{
			display:block;
			content:'';
			clear:both;
		}
		.menu > li{
			position:relative;
			float:left;
			margin-right:5px;
		}
		.menu > li > a{
			display:block;
			padding:0 15px;
			height:40px;
			line-height:40px;
			color:black;
		}
		.menu > li:hover .depth_1 {display:block;}
		.depth_1 > li > a:hover{
			display:block;
			color:red;
		}
		.menu .depth_1{
			display:none; 
			position:absolute; 
			left:-156px;
			right:0;
			text-align:center;
		}
		.menu .depth_1 a{
			display:block; 
			padding:5px; 
			background:white; 
			color:black; 
			width: 60px;
    		font-size: 20px;
    	}
    	#unlogin{
    		cursor: pointer;
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
		
			<nav class="navbar navbar-expand-lg nav-container shadow-sm p-3 mb-5 rounded">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="../main/home.jsp"><i class="bi-alarm"></i></a>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav me-auto mb-2 mb-lg-0 menu">
			        <li class="nav-item">
			          <a class="nav-link" href="../main/home.jsp">홈</a>
			        </li>
			        
			        <li class="nav-item nav-goal">
			        	<% if(user == null){ %>
			          		<a class="nav-link" id="unlogin" onclick="alert('로그인 후 사용 가능합니다.')">목표</a>
			          	<%}else{%>
			          		<!-- <a class="nav-link" href="../goal/goalTimer.jsp">목표</a> -->
			          		<a class="nav-link" href="../board/goal.jsp">목표</a>
						        <div class="goal-dropdown">
						        	<a href="../board/goal.jsp">나의 목표</a>
						        	<a href="../board/pomodoro.jsp">뽀모도로</a>
						        	<a href="../board/report.jsp">보고서</a>
						        </div>
			          	<%} %>
			        </li>
			        
			        <li class="nav-item">
						<a class="nav-link" href="../board/board.jsp">커뮤니티</a>
						<ul class="depth_1">
					      <li><a href="../board/board.jsp?boardType=1">공부</a></li>
					      <li><a href="../board/board.jsp?boardType=2">독서</a></li>
					      <li><a href="../board/board.jsp?boardType=3">축구</a></li>
					      <li><a href="../board/board.jsp?boardType=4">런닝</a></li>
					      <li><a href="../board/board.jsp?boardType=5">헬스</a></li>
					      <li><a href="../board/board.jsp?boardType=6">여행</a></li>
					      <li><a href="../board/board.jsp?boardType=7">우표</a></li>
					      <li><a href="../board/board.jsp?boardType=8">야구</a></li>
						</ul>
			        </li>
			        
			        <li class="nav-item">
			          <a class="nav-link" href="#">마켓</a>
			        </li>
				</ul>
 				<div class="input-box">
	                <input type="text" id="search" class="form-control" autocomplete="off" placeholder="검색어 입력">
 					<i onclick="del()" class="bi bi-x-circle-fill"></i>	                
	                <i onclick="search()" class="fa fa-search whole-search"></i>                    
                </div>

			      <%
			      	if(user == null){
			      		%>
						<button type="button" class="btn btn-dark" href="../goal/goalTimer.jsp" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">시작하기</button>
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        <form>
						        	<div class="login-container">
						       			<h1>로그인</h1>
						       			<div>
								            <label for="username">아이디</label>
								            <input type="text" id="username" name="username" placeholder="아이디를 입력하세요" autocomplete="off" value="admin">
								            <div id="username-feedback" class="feedback"></div>
										</div>
										<div>
								            <label for="password">비밀번호</label>
								            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" autocomplete="off" value="1234">
								            <div id="password-feedback" class="feedback"></div>
										</div>
										<div style="margin-left: 80px;">
							            	<button type="button" id="submit" class="login">로그인</button>
							            </div>
								        <div class="alternate-option">
							            	<p>계정이 없으신가요? <a href="../signup/signup.jsp">회원가입</a></p>
							        	</div>
					  		 		</div>
						        </form>
						      </div>
						    </div>
						  </div>
						</div>
			      		<%
			      	}else{
			      		%>
   		                <button type="button" onclick="toggleMenu()" class="btn btn-dark" >메뉴</button>
      					<div class="dropdown-menus" id="dropdown-menu">
      					<%
			   			if(user != null){
			   	   			if(type.equals("0")){
			   	   				%>
			   	        		<a href="../main/user_management.jsp">회원관리</a>
			   	   				<%
			   				}
			   	   			%>
			   				<a href="../signup/myPage.jsp">마이페이지</a>	
			   				<a href="../login/logout.jsp">로그아웃</a>	
			   				<%
			   				%>
			   				</div>
        					<div class="overlay" id="overlay" onclick="closeMenu()"></div>
			   				<%
			   			}
			     	}
			     %>
				</div>
			    </div>
			</nav>
		</body>
		<script>

			function search(){
				let search = $("#search");
				if(search.val().trim() == ""){
					search.focus();
					return alert("검색어를 입력해주세요");
				}
				location.href = "../board/board.jsp?searchType=title&searchKeyword="+search.val();
			}
			
			function del(){
				$("#search").val("").focus();
				
			}
			
			
			$("#submit").click(function(){
				let id = $("#username");
				let idFeedback = $("#username-feedback");
				let pw = $("#password");
				let pwFeedback = $("#password-feedback");
				
				$.ajax({
					url : "../login/loginok.jsp",
					type : "post",
					data : {
						id : id.val().trim(),
						pw : pw.val().trim()
					},
					success : function(result){
						console.log(result)
						
						if(result.trim() != "0"){
							location.href = "../main/home.jsp";
						}else{
							if(id.val().trim() == ""){
								id.focus();
								id.val("");
								idFeedback.css("display", "block");
								idFeedback.text("아이디를 입력하여 주십시오.");
								return;
							}
							
							idFeedback.css("display", "none");
							
							if(pw.val().trim() == ""){
								pw.focus();
								pw.val("");
								pwFeedback.css("display", "block");
								pwFeedback.text("비밀번호를 입력하여 주십시오.");
								return;
							}
							
							pwFeedback.css("display", "block");
							pwFeedback.text("아이디 혹은 비밀번호를 잘못 입력하였습니다.");
							return;
						}
					},
					error : function(){
						console.log("에러 발생");
					}
				});
			});
		</script>
</html>

