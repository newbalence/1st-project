<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp" %>
<%
	if(user == null){
		response.sendRedirect("../main/main.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>갓 생 살기</title>
    <script src="./jquery-3.7.1.js"></script>
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
    	
	    body {
	        font-family: 'Arial', sans-serif;
	        background: linear-gradient(to bottom, #e9f5ff, #ffffff);
	        margin: 0;
	        padding: 0;
	        color: #333;
	    }
	    .profile-container {
	        padding: 20px;
	        max-width: 600px;
	        margin: 50px auto;
	        background: white;
	        border-radius: 10px;
	        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    }
	    h2 {
	        color: #2575fc;
	        text-align: center;
	        margin-bottom: 20px;
	    }
	    .profile-field {
	        margin-bottom: 15px;
	    }
	    .profile-field label {
	        font-weight: bold;
	        margin-bottom: 5px;
	        display: block;
	        color: #555;
	    }
	    .profile-field input {
	        width: 100%;
	        padding: 10px;
	        border: 1px solid #ddd;
	        border-radius: 5px;
	        font-size: 1rem;
	        box-sizing: border-box; /* 수정된 부분 */
	    }
	    .feedback {
	        font-size: 0.9rem;
	        color: red;
	        margin-bottom: 10px;
	    }
	    .feedback.success {
	        color: green;
	    }
	    .profile-actions {
	        text-align: center;
	        margin-top: 20px;
	    }
	    .profile-actions button {
	        background: #2575fc;
	        color: white;
	        border: none;
	        padding: 10px 20px;
	        border-radius: 25px;
	        cursor: pointer;
	        font-size: 1rem;
	        transition: background 0.3s ease;
	        margin: 0 10px;
	    }
	    .profile-actions button:hover {
	        background: #1a5fc4;
	    }
	</style>

</head>
<body>
    <div class="profile-container">
        <h2>프로필 관리</h2>
        <form method="post" action="profileok.jsp" onclick="return formCheck()">
        	<div class="profile-field">
          		<label for="username">아이디</label>
	            <input type="text" id="username" name="username" value="<%= user.getId() %>" readonly>
            </div>
			<div class="profile-field">
	            <label for="password">비밀번호</label>
	            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요">
				<div id="password-feedback" class="feedback"></div>
			</div>
			<div class="profile-field">	
	            <label for="password-check">비밀번호 확인</label>
	            <input type="password" id="password-check" name="confirm-password" placeholder="비밀번호를 다시 입력하세요">
	            <div id="check-feedback" class="feedback"></div>
            </div>
			<div class="profile-field">	
	            <label for="name">이름</label>
	            <input type="text" id="name" name="name" value="<%= user.getName() %>" readonly>			
           	</div>
			<div class="profile-field">	
				<label for="nickname">닉네임</label>
	            <input type="text" id="nickname" name="nickname" value="<%= user.getNick() %>">
	            <div id="nickname-feedback" class="feedback"></div>
           	</div>
            <div class="profile-field">
	            <label for="email">이메일</label>
	            <input type="email" id="email" name="email" value="<%= user.getEmail() %>" readonly>
            </div>
			<div>
   	            <div>
   	            	<ul>
   	            		<li>
	   	            	<label for="hobby">취미</label>
			            <select id="hobby" name="hobby">
			            	<option value="1" <%= user.getHobby().equals("1") ? "selected" : "" %>>공부</option>
			            	<option value="2" <%= user.getHobby().equals("2") ? "selected" : "" %>>독서</option>
			            	<option value="3" <%= user.getHobby().equals("3") ? "selected" : "" %>>축구</option>
			            	<option value="4" <%= user.getHobby().equals("4") ? "selected" : "" %>>런닝</option>
			            	<option value="5" <%= user.getHobby().equals("5") ? "selected" : "" %>>헬스</option>
			            	<option value="6" <%= user.getHobby().equals("6") ? "selected" : "" %>>여행</option>
			            </select>
			            </li>
		            </ul>
		            
					<ul>
						<li class="radio">
			            <input type="radio" name="gender" id="male" value="M" <%= user.getGender().equals("M") ? "checked" : ""%> onclick="return(false)">
			            <label for="male" class="radio-label">남성</label>
			            </li>
			            
			            <li class="radio">
			            <input type="radio" name="gender" id="female"  value="F" <%= user.getGender().equals("F") ? "checked" : ""%> onclick="return(false)">
			            <label for="female" class="radio-label">여성</label>
			            </li>
			            
			            <li class="radio">
			            <input type="radio" name="gender" id="no-gender" value="U" <%= user.getGender().equals("U") ? "checked" : ""%> onclick="return(false)">
			            <label for="no-gender" class="radio-label">비공개</label>
			            </li>
		            </ul>
	            </div>
            </div>
            <div class="profile-actions">
                <button type="submit">저장</button>
                <button type="button" onclick="returnhome()">취소</button>
                <button type="button" onclick="deleteUser()">탈퇴</button>
            </div>
        </form>
    </div>
</body>
<script>
	
	let nickCheckFlag = true;
	
	$("#nickname").keyup(function(e){
		let nickCheck = e.target.value;
		let nickFeedback = $("#nickname-feedback");
		nickFeedback.css("display", "block");
		nickFeedback.removeClass("success");
		nickCheckFlag = true;
		
		$.ajax({
			url : "nickCheck.jsp",
			type : "post",
			data : {
				nickCheck : nickCheck
			},
			success : function(result){
				if(result == 0){
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
	
	function formCheck(){
		let pw = $("#password");
		let pwc = $("#password-check");
		let pwcFeedback = $("#check-feedback");
		let nick = $("#nickname");
		let nickFeedback = $("#nickname-feedback");
		
		if(pw.val() != pwc.val()){
			pwc.focus();
			pwc.val("");
			pwcFeedback.css("display", "block");
			pwcFeedback.text("비밀번호가 일치하지 않습니다.");
			pwcFeedback.removeClass("success");
			return false;
		}
		
		pwcFeedback.css("display", "block");
		pwcFeedback.addClass("success");
		pwcFeedback.text("비밀번호가 일치합니다.");
		
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
		
		return true;
	};
	
	
	function returnhome(){
		let result = confirm("메인 화면으로 이동하시겠습니까?");
		if(result == true){
			location.href = "../main/main.jsp"
		}
	}
	
	function deleteUser(){
		let result = confirm("탈퇴하시겠습니까?");
		if(result == true){
			location.href = "joinout.jsp";
		}
	}
</script>
</html>