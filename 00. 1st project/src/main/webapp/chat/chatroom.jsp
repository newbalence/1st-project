<%@page import="chat.ChatVO"%>
<%@page import="java.util.List"%>
<%@page import="chat.ChatDAO"%>
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
	
	ChatDAO cdao = new ChatDAO();
	List<ChatVO> list = cdao.selChat(cno);
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
		max-width: 60%;
	}
	#div{
		position: fixed;
	    bottom: 0;
	    width: 100%;
	    height: 85.5vh;
	    overflow-y: scroll;
	    font-size: 25px;
	    padding: 10px 30% 80px 30%;
	    margin-bottom: 75px;
	    word-break: break-all;
    }
    .you{
    	text-align: right;
	  width: 80%;	  
    }
    .user{
   		text-align: left;
   		width: 40%;
   }
   .id{
   		font-size: 15px;
   }
   
   body{
		
	}
	
	::-webkit-scrollbar {
		display: none;
	}
	
	/*특정 부분 스크롤바 없애기*/
	
	#div{
	   -ms-overflow-style: none;
	}
	.div::-webkit-scrollbar{
	  display:none;
	}
	#exit{
    	max-width: max-content;
   		float: right;
	}
</style>
</head>
<body>
	<div id="div">
	<%
		for(int i = 0; i < list.size(); i++){
			ChatVO cvo = list.get(i);
			String content = cvo.getChatcontent();
			String sender = cvo.getSender();
			String cid = cvo.getId();
			if(cid.equals(user.getId())){
				%>
				<div class="id you"> you : </div>
				<div class="you"><%= content %></div>
				<%
			}else{
				%>
				<div class="id user"><%= sender %></div>
				<div class="user"><%= content %></div>
				<%	
			}
		}
	%>
	</div>
	<div class="chat">
		<div class="container">
			<input class="text" type="text" id="chat"><br>
			<input class="button" type="button" value="전송" id="send">
		</div>
		<input type="button" id="exit" value="나가기" onClick="location.href='../chat/chatlist.jsp'">
	</div>
</body>
<script>
	
	
	
	let sender = "<%= nick %>";
	let id = "<%= user.getId() %>";
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
			log.innerHTML += "<div class='id you'> you : </div>";
			log.innerHTML += "<div class='you'>" + data.chatcontent + "</div>";
		}else{
			log.innerHTML += "<div class='id user'> " + data.sender + " : </div>";
			log.innerHTML += "<div class='user'>" + data.chatcontent+ "</div>";
		}
		div.scrollTop = div.scrollHeight;
		chat.focus();
		
	}
	
	function sendMessage(){
		//웹소켓 데이터 전송
		//일반 텍스트
		//{sender : sender, message : chat.value}
		const data = JSON.stringify({sender : sender, chatcontent : chat.value, chatroomno : <%= cno %>, id : id});
		socket.send(data);
		chat.value = "";
		chat.focus();
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