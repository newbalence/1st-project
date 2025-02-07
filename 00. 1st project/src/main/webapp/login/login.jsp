<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>갓 생 살기</title>
	    <script src="../js/jquery-3.7.1.js"></script>
	    <style>
	        body {
	            font-family: 'Arial', sans-serif;
	            background: linear-gradient(135deg, #e0e0e0, #f0f0f0);
	            margin: 0;
	            padding: 0;
	            color: #333;
	            height: 100vh;
	            display: flex;
	            justify-content: center;
	            align-items: center;
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
	        button {
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
	    <div class="login-container">
	        <h1>로그인</h1>
            <label for="username">아이디</label>
            <input type="text" id="username" name="username" placeholder="아이디를 입력하세요">
            <div id="username-feedback" class="feedback"></div>

            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요">
            <div id="password-feedback" class="feedback"></div>

            <button type="button" id="submit">로그인</button>
	        <div class="alternate-option">
	            <p>계정이 없으신가요? <a href="../signup/signup.jsp">회원가입</a></p>
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
				url : "loginok.jsp",
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