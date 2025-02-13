<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/navbar.jsp" %>
<%
	if(user == null){
		response.sendRedirect("../main/home.jsp");
		return;
	}
	String cno = request.getParameter("no");
	String nick = user.getNick();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.chat{
	    position: fixed;
	    bottom: 0;
	    width: 100%;
	    margin-bottom: 20px;
	    padding: 0px 10px 0px 10px;
	}
	.text{
		display: block;
	    padding: 10px;
	    margin-bottom: 5px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    font-size: 1rem;
	    margin-right: auto;
	    flex-grow: 3;
	    width: auto;
   		min-width: 0;
	}
	.button{
	    flex-grow: 1;
	    width: auto;
   		min-width: 0;
	}
	.container{
		display: flex;
	}
	#div{
 		/* position: fixed;
	    bottom: 0;
	    width: 100%; */
	    height: 85.5vh;
	    overflow-y: scroll;
	    padding:80px;
	    font-size: 25px;
	    /* margin-bottom: 73px; */
    }
    .you{
    	text-align: right
    }
</style>
</head>
<body>
	<div id="div"></div>
	<div class="chat">
		<div class="container">
			<input class="text" type="text" id="chat"><br>
			<input class="button" type="button" value="전송" id="send">
		</div>
	</div>
</body>
<script>
	let sender = "<%= user.getId() %>";
	let socket = new WebSocket("ws://" + location.host + "/1st_project/chat");
	let chat = document.getElementById("chat");
	let btn = document.getElementById("send");
	let div = document.getElementById("div");
	//웹소켓 서버 연결 시 동작
	socket.onopen = function(obj){
		console.log("웹소켓 연결");
	}
	
	//웹소켓 서버 연결 종료 시 동작
	socket.onclose = function(obj){
		console.log("웹소켓 연결 해제");
	}
	
	//웹소켓 서버 연결 오류 시 동작
	socket.onerror = function(obj){
		console.log("웹소켓 연결 에러");
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
			log.innerHTML += "<div class='you'> you : "+ data.chatcontent + "</div>";
		}else{
			log.innerHTML += "<div> " + data.sender + " : " + data.chatcontent+ "</div>";
		}
		div.scrollTop = div.scrollHeight;
		chat.focus();
		
	}
	
	function sendMessage(){
		//웹소켓 데이터 전송
		//일반 텍스트
		//{sender : sender, message : chat.value}
		const data = JSON.stringify({sender : sender, chatcontent : chat.value, chatroomno : <%= cno %>});
		socket.send(data);
		chat.value = "";
	}

	btn.addEventListener("click", function(){

		if(chat.value.trim() == ""){
			chat.focus();
			return;
		}
		sendMessage();
	});
	
	chat.addEventListener('keydown', function(event) {
	  if (event.key === 'Enter') {
		  if(chat.value.trim() == ""){
				return;
			}
			sendMessage();
	  }
	});
	
</script>
</html>