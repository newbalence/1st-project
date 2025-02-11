<%@page import="timer.TimerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
	int targetTime = 0;
	TimerDAO dao = new TimerDAO();
	int allTime = 0;
	if(user != null){
		allTime = dao.selTimeone(user.getId());
		targetTime = user.getTargetTime();
	}
	System.out.println(user);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>갓 생 살기</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
   	 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
   	 	<script src="../js/jquery-3.7.1.js"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #ffffff, #e8f0fe);
            margin: 0;
            padding: 0;
            color: #333;
        }
        .main-container {
            padding: 20px;
            max-width: 800px;
            margin: 20px auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        h2 {
            color: #2575fc;
            margin-bottom: 20px;
        }
        .nav {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }
        .nav a {
            text-decoration: none;
            color: #2575fc;
            font-weight: bold;
            padding: 10px 20px;
            border: 2px solid #2575fc;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        .nav a:hover {
            background: #2575fc;
            color: white;
        }
        .welcome-message {
            font-size: 1.2rem;
            margin-bottom: 20px;
            text-align: center;
            color: #555;
        }
        .info {
            text-align: center;
            margin-top: 30px;
            font-size: 0.9rem;
            color: #888;
        }
        .login-container {
	            background: white;
	            padding: 30px 40px;
	            border-radius: 10px;
	            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	            width: 90%;
	            max-width: 400px;
	            border: 2px solid #2575fc;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #2575fc;
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
            margin-left: auto;
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
        .login {
            display: block;
            background: #2575fc;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s ease;
            width: 100%;
            margin: auto;
        }
        button:hover {
            background: #1a5fc4;
        }
        .alternate-option {
            text-align: center;
            margin-top: 20px;
        }
        .alternate-option a {
            color: #2575fc;
            text-decoration: none;
            font-weight: bold;
        }
        .alternate-option a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="main-container">
    	<p class="welcome-message">환영합니다, <%= user == null ? "사용자" : user.getNick() %>님!</p>
    	<%
    		if(targetTime != 0){
    			%>
		    		<p class="welcome-message">목표시간 <%= targetTime %>시간 중 <%= allTime %> 시간 달성</p>
    			<%
    		}else{
    			%>
    				<p class="welcome-message">목표시간 설정이 되어있지 않습니다.</p>
    			<%
    		}
    	%>
		    <!-- Button trigger modal -->
	
        <h2 align="center">메뉴</h2>
        <div class="nav">
        	<a href="#">타이머</a>
            <a href="../board/board.jsp">자유 게시판</a>
            <a href="../signup/myPage.jsp">마이페이지</a>
            <% 
            	if(user != null){
            		%>
   		            	<a href="../login/logout.jsp">로그아웃</a>
            		<%
            	}else{
            		%>
            		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">로그인</button>
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalLabel">New message</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <form>
					        	<div class="login-container">
					       			<h1>로그인</h1>
						            <label for="username">아이디</label>
						            <input type="text" id="username" name="username" placeholder="아이디를 입력하세요">
						            <div id="username-feedback" class="feedback"></div>
					
						            <label for="password">비밀번호</label>
						            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요">
						            <div id="password-feedback" class="feedback"></div>
					
						            <button type="button" id="submit" class="login">로그인</button>
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
            	}
            %>

        </div>
        <div class="info">
            <p>© 2025 Your Website. All Rights Reserved.</p>
        </div>

    </div>
</body>
<script>
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
				location.href = "../main/main.jsp";
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
