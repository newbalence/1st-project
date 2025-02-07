<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String cno = request.getParameter("no");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div id="div"></div>
	</div>
	<div>
		<input type="text" id="chat"><br>
		<input type="button" value="전송" id="send">
	</div>
</body>
<script>
	let sender = "User_" + Math.floor(Math.random() * 1000);
	console.log(sender);
	let socket = new WebSocket("ws://" + location.host + "/1st_project/chat");
	let chat = document.getElementById("chat");
	let btn = document.getElementById("send");
	//웹소켓 서버 연결 시 동작
	socket.onopen = function(obj){
		console.log("웹소켓 연결", obj);
	}
	
	//웹소켓 서버 연결 종료 시 동작
	socket.onclose = function(obj){
		console.log("웹소켓 연결 해제", obj);
	}
	
	//웹소켓 서버 연결 오류 시 동작
	socket.onerror = function(obj){
		console.log("웹소켓 연결 에러 ",obj);
	}

	//웹소켓 데이터 수신 시 동작
	socket.onmessage = function(obj){
		//json 형태의 문자열을 진짜 json으로 재변환
		const data = JSON.parse(obj.data);
		if(data.chatroomno != <%= cno %>){
			return;
		}
		let log = document.getElementById("div")
		
		if(data.sender == sender){
			log.innerHTML += "<div> you : "+ data.chatcontent + "</div>";
		}else{
			log.innerHTML += "<div> " +data.sender + " : " + data.chatcontent+ "</div>";
		}
		btn.scrollTop = btn.scrollHeight;
		chat.focus();
		
	}
	

	btn.addEventListener("click", function(){

		if(chat.value.trim() == ""){
			return;
		}
		//웹소켓 데이터 전송
		//일반 텍스트
		//{sender : sender, message : chat.value}
		const data = JSON.stringify({sender : sender, chatcontent : chat.value, chatroomno : <%= cno %>});
		socket.send(data);
		chat.value = "";
	});
</script>
</html>