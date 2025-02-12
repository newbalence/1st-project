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
			font-size: 13px;
			height: 40px;
			min-width: 120px;
			line-height: 38px;
			border-radius: 30px;
			margin-left: 50px;
		}
		.btn-dark:hover {
			color: white;
			background-color: #c40000;
			border: none;
			line-height: 40px;
		}
		.nav-item {
			color:var(--bs-black);
			position: relative;
			margin: 0 5px 0 10px;
			padding: 4px 2px;
			font-size: 17px;
			font-weight: 600;
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

		.fa-search {
			position: absolute;
			left: 240px;
			bottom: 15px;
			top:11px;
			color:#ced4da;
		}
	
		.form-control {
			padding: .375rem 1.3rem;
			font-size: 0.8rem;
			width: 150%;
			height: 38px;
			background-color:#ffffff;
			border-radius: 30px;
		}
	
		.form-control:focus {
			background-color: #ffffff;
			box-shadow: none;
			border-color: #ced4da;
		}
		
		.bi-x-circle-fill {
			position: absolute;
			bottom: 8px;
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
		
	</style>
	</head>
		<body>
		
			<nav class="navbar navbar-expand-lg nav-container shadow-sm p-3 mb-5 rounded">
			
			  <div class="container-fluid">
			  
			    <a class="navbar-brand" href="../main/home.jsp"><i class="bi-alarm"></i></a>
			    
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			    
			      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			      
			        <li class="nav-item">
			          <a class="nav-link" href="../main/home.jsp">홈</a>
			        </li>
			        
			        <li class="nav-item">
			          <a class="nav-link" href="#">목표</a>
			        </li>
			        
			        <li class="nav-item">
			          <a class="nav-link" href="../board/board.jsp">커뮤니티</a>
			        </li>
			        
			        <li class="nav-item">
			          <a class="nav-link" href="#">마켓</a>
			        </li>
			        
			      </ul>
			      
 				<div class="input-box">
	                <input type="text" id="search" class="form-control" placeholder="검색어 입력">
 					<i onclick="del()" class="bi bi-x-circle-fill"></i>	                
	                <i onclick="search()" class="fa fa-search"></i>                    
                </div>
			      <%
			      	if(user == null){
			      		%>
						<button type="button" class="btn btn-dark" href="../goal/goalTimer.jsp" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">로그인</button>
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h1 class="modal-title fs-5" id="exampleModalLabel">Login</h1>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        <form>
						        	<div class="login-container">
						       			<h1>로그인</h1>
							            <label for="username">아이디</label>
							            <input type="text" id="username" name="username" placeholder="아이디를 입력하세요" value="admin">
							            <div id="username-feedback" class="feedback"></div>
						
							            <label for="password">비밀번호</label>
							            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" value="1234">
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
			      	}else{
			      		%>
			      		<a class="btn btn-dark" href="../main/user_management.jsp" role="button"><%= user.getNick() %></a>
			      		<%
			      	}
			      %>
			    
				</div>
			    </div>
			</nav>
		</body>
		<script>
			function search(){
				let search = $("#search").val();
				if(search.trim() == ""){
					return alert("검색어를 입력해주세요");
				}
				location.href = "../board/board.jsp?searchType=title&searchKeyword="+search;
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












































