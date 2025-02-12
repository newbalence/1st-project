<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>갓 생 살기</title>
		<script src="../js/jquery-3.7.1.js"></script>
		    <style>
			
			[type="radio"], span {
			  vertical-align: middle;
			}
			
			[type="radio"] {
			  appearance: none;
			  border: max(2px, 0.1em) solid gray;
			  border-radius: 50%;
			  width: 1em;
			  height: 1em;
			}
			
			[type="radio"]:checked {
			  border: 0.4em solid tomato;
			}
			
			[type="radio"]:focus-visible {
			  outline-offset: max(2px, 0.1em);
			  outline: max(2px, 0.1em) dotted tomato;
			}
			
			[type="radio"]:hover {
			  box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
			  cursor: pointer;
			}



		    
		    ul{
		   		list-style:none;
		    	display: inline-block;
		    }
		    li{
		    	display:inline-block;
		    	margin-right : 20px;
		    }
		    .radio-label{
		    	display: inline;
		    }
		    .radio{
		    	margin : 0;
		    	width : 70px;
		    	text-align: center;
		    	height : 80px;
		    	
		    }
		    .gender{
		    	
		    }
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
	        .signup-container {
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
	        form {
	            margin-top: 20px;
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
	            font-size: 0.8rem;
	            color: red;
	            margin-bottom: 10px;
	            display: none;
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
	            justify-content: center;
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
		<div class="signup-container">
			<form onsubmit="return formCheck()" method="post" action="singupok.jsp">
	            <label for="username">아이디</label>
	            <input type="text" id="username" name="username" placeholder="아이디를 입력하세요">
	            <div id="username-feedback" class="feedback"></div>
	
	            <label for="password">비밀번호</label>
	            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요">
				<div id="password-feedback" class="feedback"></div>
				
	            <label for="password-check">비밀번호 확인</label>
	            <input type="password" id="password-check" name="confirm-password" placeholder="비밀번호를 다시 입력하세요">
	            <div id="check-feedback" class="feedback"></div>
				
	            <label for="name">이름</label>
	            <input type="text" id="name" name="name" placeholder="이름을 입력하세요">
   	            <div id="name-feedback" class="feedback"></div>				
				
				<label for="nickname">닉네임</label>
	            <input type="text" id="nickname" name="nickname" placeholder="닉네임을 입력하세요">
	            <div id="nickname-feedback" class="feedback"></div>
	            
	            <label for="email">이메일</label>
	            <input type="email" id="email" name="email" placeholder="이메일을 입력하세요">
	            <input type="button" id="emailbtn" value="이메일 인증">
   	            <div id="email-feedback" class="feedback"></div>
   	            
   	            <label for="email-check">이메일 인증번호</label>
   	            <input type="text" id="emailCheck" placeholder="인증번호를 입력하세요">
	            <input type="button" id="emailCheckBtn" value="인증번호 확인">
   	            <div id="emailcheck-feedback" class="feedback"></div>
   	            
   	            <div>
   	            	<ul>
   	            		<li>
	   	            	<label for="hobby">취미</label>
			            <select id="hobby" name="hobby">
			            	<option value="1">공부</option>
			            	<option value="2">독서</option>
			            	<option value="3">축구</option>
			            	<option value="4">런닝</option>
			            	<option value="5">헬스</option>
			            	<option value="6">여행</option>
			            </select>
			            </li>
		            </ul>
					
					<ul>
						<li class="radio">
			            <input type="radio" name="gender" id="male" value="M">
			            <label for="male" class="radio-label">남성</label>
			            </li>
			            
			            <li class="radio">
			            <input type="radio" name="gender" id="female"  value="F">
			            <label for="female" class="radio-label">여성</label>
			            </li>
			            
			            <li class="radio">
			            <input type="radio" name="gender" id="no-gender" value="U" checked>
			            <label for="no-gender" class="radio-label">비공개</label>
			            </li>
		            </ul>
	            </div>
	            
	            <button type="submit">회원가입</button>
	            <div class="alternate-option">
		            <p>이미 계정이 있으신가요? <a href="../main/home.jsp">로그인</a></p>
		        </div>
	        </form>
		</div>
	</body>
	<script>
		let idRegex = /^[a-zA-Z0-9]{5,20}$/;
		
		let idCheckFlag = false;
		
		$("#username").keyup(function(e){
			let idCheck = e.target.value;
			let idFeedback = $("#username-feedback");
			idFeedback.css("display", "block");
			idFeedback.removeClass("success");
			idFeedback.text("영어 대소문자와 숫자 5 ~ 20자리만 사용이 가능합니다.");
			idCheckFlag = false;
			
			if(!idRegex.test(idCheck)){
				return;
			}
			
			$.ajax({
				url : "idCheck.jsp",
				type : "post",
				data : {
					id : idCheck
				},
				success : function(result){
					console.log(result);
					if(result.trim() == "0"){
						idCheckFlag = true;
						idFeedback.css("display", "block");
						idFeedback.addClass("success");
						idFeedback.text("사용 가능한 아이디 입니다.");
					}else{
						idCheckFlag = false;
						idFeedback.css("display", "block");
						idFeedback.removeClass("success");
						idFeedback.text("사용 불가한 아이디 입니다.");
					}
				},
				error : function(){
					console.log("에러발생");
				}
			});
		});

		let nickCheckFlag = false;
		
		$("#nickname").keyup(function(e){
			let nickCheck = e.target.value;
			let nickFeedback = $("#nickname-feedback");
			nickFeedback.css("display", "block");
			nickFeedback.removeClass("success");
			nickCheckFlag = false;
			
			$.ajax({
				url : "nickCheck.jsp",
				type : "post",
				data : {
					nickCheck : nickCheck
				},
				success : function(result){
					if(result == 0 && nickCheck != ""){
						nickCheckFlag = true;
						nickFeedback.css("display", "block");
						nickFeedback.addClass("success");
						nickFeedback.text("사용 가능한 닉네임 입니다.");
					}else{
						nickCheckFlag = false;
						nickFeedback.css("display", "block");
						nickFeedback.removeClass("success");
						nickFeedback.text("사용 불가한 닉네임 입니다.");
					}
				},
				error : function(){
					console.log("에러발생");
				}
			});
		});
		
		
		let emailcode = "";
		let emailCheckFlag = false;
		
		$("#emailbtn").click(function(){
			let email = $("#email");
			let emailFeedback = $("#email-feedback");
			
			emailFeedback.css("display", "block");
			emailFeedback.removeClass("success");

			$("#emailbtn").attr("disabled", true);
			
			if(email.val().trim() == ""){
				emailFeedback.css("display", "block");
				emailFeedback.text("이메일을 입력하여 주십시오.");
				emailFeedback.removeClass("success");
				$("#emailbtn").attr("disabled", false);
				email.focus();
				email.val("");
				return;
			}
			
			$.ajax({
				url : "sendMail.jsp",
				type : "post",
				data : {
					email : email.val()
				},
				success : function(result){
					emailcode = result.trim();
					if(emailcode == "fail"){
						$("#emailbtn").attr("disabled", false);
						eamilFeedback.removeClass("success");
						eamilFeedback.text("이메일 전송에 실패하였습니다.");
					}else{
						$("#emailbtn").attr("disabled", true);
						emailFeedback.addClass("success");
						emailFeedback.text("이메일 전송이 완료되었습니다. 인증코드를 확인해주세요.");
					}
				},
				error : function(){
					$("#emailbtn").attr("disabled", false);
					console.log("에러 발생");
				}

			});
		});
		
		$("#emailCheckBtn").click(function(){
			let emailCheck = $("#emailCheck");
			let emailcFeedback = $("#emailcheck-feedback");
			
			emailCheckFlag = false;
			
			emailcFeedback.css("display", "block");
			emailcFeedback.removeClass("success");
			
			$("#emailCheckBtn").attr("disabled", false);
			
			if(emailCheck.val().trim() == ""){
				emailCheckFlag = false;
				emailcFeedback.css("display", "block");
				emailcFeedback.text("이메일 인증코드를 입력해주세요.");
				emailcFeedback.removeClass("success");
				$("#emailCheckBtn").attr("disabled", false);
				emailCheck.focus();
				emailCheck.val("");
				return;
			}
			
			if(emailcode == emailCheck.val().trim()){
				emailCheckFlag = true;
				emailcFeedback.css("display", "block");
				emailcFeedback.text("인증코드가 일치 합니다.");
				emailcFeedback.addClass("success");
				$("#emailCheckBtn").attr("disabled", true);
			}else{
				emailCheckFlag = false;
				emailcFeedback.css("display", "block");
				emailcFeedback.text("인증코드가 일치하지 않습니다.");
				emailcFeedback.removeClass("success");
				$("#emailCheckBtn").attr("disabled", false);
				emailCheck.focus();
				emailCheck.val("");
			}
			
		});
		
		function formCheck(){
			let id = $("#username");
			let idFeedback = $("#username-feedback");
			let pw = $("#password");
			let pwc = $("#password-check");
			let pwFeedback = $("#password-feedback");
			let pwcFeedback = $("#check-feedback");
			let nick = $("#nickname");
			let nickFeedback = $("#nickname-feedback");
			let name = $("#name");
			let nameFeedback = $("#name-feedback");
			let email = $("#email");
			let emailFeedback = $("#email-feedback");
			let emailCheck = $("#emailCheck");
			let emailcFeedback = $("#emailcheck-feedback");
			
			if(id.val().trim() == ""){
				id.focus();
				id.val("");
				idFeedback.css("display", "block");
				idFeedback.text("아이디를 입력하여 주십시오.");
				idFeedback.removeClass("success");
				return false;
			}
			
			if(!idRegex.test(id.val())){
				id.focus();
				id.val("");
				
				idFeedback.css("display", "block");
				idFeedback.text("영어 대소문자와 숫자 4 ~ 12자리만 사용이 가능합니다.");
				idFeedback.removeClass("success");
				return false;
			}
			
			if(idCheckFlag == false){
				id.focus();
				id.val("");
				
				idFeedback.css("display", "block");
				idFeedback.text("아이디 중복확인이 필요합니다.");
				idFeedback.removeClass("success");
				return false;
			}
			
			idFeedback.css("display", "block");
			idFeedback.addClass("success");
			
			if(pw.val().trim() == ""){
				pw.focus();
				pw.val("");
				pwFeedback.css("display", "block");
				pwFeedback.text("비밀번호를 입력하여 주십시오.");
				return false;
			}
			
			pwFeedback.css("display", "none");
			
			if(pwc.val().trim() == ""){
				pwc.focus();
				pwc.val("");
				pwcFeedback.css("display", "block");
				pwcFeedback.text("비밀번호 확인을 입력하여 주십시오.");
				return false;
			}
			
			if(pw.val() != pwc.val()){
				pwc.focus();
				pwc.val("");
				pwcFeedback.css("display", "block");
				pwcFeedback.text("비밀번호가 일치하지 않습니다.");
				return false;
			}
			
			pwcFeedback.css("display", "none");
			
			if(name.val().trim() == ""){
				name.focus();
				name.val("");
				nameFeedback.css("display", "block");
				nameFeedback.text("이름을 입력하여 주십시오.");
				return false;
			}
			
			nameFeedback.css("display", "none");
			
			if(nick.val().trim() == ""){
				nick.focus();
				nick.val("");
				nickFeedback.css("display", "block");
				nickFeedback.text("닉네임을 입력하여 주십시오");
				return false;
			}
			
			if(nickCheckFlag == false){
				nick.focus();
				nick.val("");
				
				nickFeedback.css("display", "block");
				nickFeedback.text("닉네임 중복확인이 필요합니다.");
				nickFeedback.removeClass("success");
				return false;
			}
			
			nickFeedback.css("display", "block");
			nickFeedback.addClass("success");
			nickFeedback.text("사용가능한 닉네임 입니다.");
			
			if(email.val().trim() == ""){
				email.focus();
				email.val("");
				emailFeedback.css("display", "block");
				emailFeedback.text("이메일을 입력하여 주십시오.");
				return false;
			}
			
			emailFeedback.css("display", "none");
			
			if(emailCheck.val().trim() == ""){
				emailCheck.focus();
				emailCheck.val("");
				emailcFeedback.css("display", "block");
				emailcFeedback.text("인증번호를 입력하여 주십시오.");
				return false
			}
			
			eamilcFeedback.css("display", "none");
			
			if(emailCheckFlag == false){
				emailCheck.focus();
				emailCheck.val("");
				
				emailcFeedback.css("display", "block");
				emailcFeedback.text("이메일 인증이 필요합니다.");
				emailcFeedback.removeClass("success");
				return false;
			}
			
			return true;
		};
		
	</script>
</html>