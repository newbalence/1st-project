<%@page import="chatuser.ChatuserDAO"%>
<%@page import="chatroom.ChatroomVO"%>
<%@page import="chatroom.ChatroomDAO"%>
<%@page import="board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="board.SearchVO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/navbar.jsp" %>
<%
	
	if(user == null){
		response.sendRedirect("../main/home.jsp");
		return;
	}

	String id = user.getId();
	ChatroomDAO crdao = new ChatroomDAO();
	ChatuserDAO cudao = new ChatuserDAO();
	List<ChatroomVO> list = crdao.selChatRoom(id);
	
	
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>갓 생 살기</title>
    <style>
         body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to bottom, #e9f5ff, #ffffff);
            margin: 0;
            padding: 0;
            color: #333;
        }
        .board-container {
            padding: 20px;
            max-width: 900px;
            margin: 40px auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        }
        h2 {
            color: #2575fc;
            margin-bottom: 20px;
            text-align: center;
            font-size: 1.6rem;
        }
        .post-list {
            list-style: none;
            padding: 0;
        }
        .post-item-container{
       	 	padding: 20px;
            margin-bottom: 15px;
            background: #f9f9f9;
            border-radius: 10px;
            border: 1px solid #ddd;
            margin-top: 50px;
        }
        .post-item-container table {
            text-decoration: none;
            color: #2575fc;
            font-weight: bold;
            font-size: 1.2rem;
        }
        .post-item {
            padding: 20px;
            margin-bottom: 15px;
            background: #f9f9f9;
            border-radius: 10px;
            border: 1px solid #ddd;
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }
        .post-item:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            transform: translateY(-3px);
            text-decoration: underline;
            text-decoration-color: #2575fc;
        }
        .post-item td {
            text-decoration: none;
            color: #2575fc;
            font-weight: bold;
        }
        .post-item a:hover {
            text-decoration: underline;
        }
        
        .post-item .meta {
            font-size: 0.9rem;
            color: #777;
            margin-top: 10px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .pagination a {
            display: block;
            padding: 10px 15px;
            margin: 0 5px;
            text-decoration: none;
            color: #2575fc;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: background 0.3s ease, color 0.3s ease;
        }
        .pagination a:hover {
            background: #2575fc;
            color: white;
        }
        .pagination a.active {
            background: #2575fc;
            color: white;
            pointer-events: none;
        }
		.search-bar {
			height: 80px;
			border-radius: 30px;
			justify-self: center;
        }
        .search-bar select, .search-bar input[type="text"], .search-bar button {
            padding: 10px;
		    border: 1px solid #ddd;
		    border-radius: 20px;
		    font-size: 1rem;
		    margin-right: 10px;
        }
        .search-bar button {
            background: #2575fc;
            color: white;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        .search-bar button:hover {
            background: #1a5fc4;
        }
        .search-bar > form{
        	margin : 10px;
        	display: flex
        }
        .search-bar > form > button{
        	width: 80px;
        }
        #sel{
            display: flex;
    		justify-content: space-evenly;
        }

        .post-item {
        	cursor:pointer;
        	color: black;
		}
        #typeForm{
        	float: right;
        }
        #content{
        	font-size: 23px;
        }
        .title{
			max-width: 50px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap; 
			text-align: left;
        }
        table{
        	border-collapse: separate;
    		border-spacing: 1px 20px;
    		text-align: center;
    		width: 100%;
    		font-size: 23px;
    		
        }
        #login-form{
   	    	justify-self: center;
    		padding-right: 49px;
        }
        .open{
	        justify-self: center;
	    	padding-right: 60px;
        }
        #line:hover{
        	text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="board-container">
        <table class="post-list">
        	<thead>
        		<tr class="post-item-container">
				<th style="width: 67px" id="content">번호</th>
				<th id="content">제목</th>
				<th style="width: 150px" id="content">참여자 수</th>
				</tr>
			</thead>
			<tbody>
        	<%
        		for(int i = 0; i < list.size(); i++){
					ChatroomVO cvo = list.get(i);
					String chatroomno = cvo.getChatroomno();
					String chatname = cvo.getChatname();
					int count = cudao.countChatUser(chatroomno);
        			%>
					<tr class="post-item" onclick="chatClick(this)">
						<td><%= chatroomno %></td>
						<td class="title"><%= chatname %></td>
						<td><%= count %></td>
					</tr>
					
        			<%
        		}
        	%>
        	</tbody>
        </table>
        
        <div id="login-form">
		<%
			if(user != null){
				%>
				
				<button type="button" class="btn btn-dark login-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">채팅방 개설</button>
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  	<div class="modal-dialog">
				    	<div class="modal-content">
				      		<div class="modal-header">
				        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      		</div>
				      		<div class="modal-body">
				        		<form>
					        		<div class="login-container">
					       				<h1>채팅방 개설</h1>
							            <label for="username">채팅방 이름</label>
							            <input type="text" id="chatname" name="chatname" placeholder="채팅방 이름을 입력하세요">
							            <div id="chatname-feedback" class="feedback"></div>

										<div class="open">
							            	<button type="button" id="submit" class="login">개설</button>
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
    </div>
</body>
<script>
	
	let user = "<%= user == null ? null : user.getId() %>";
	
	function chatClick(obj){
		let chatNo = $(obj).children().children().eq(0).text();
		$.ajax({
			url : "../chat/userCheck.jsp",
			type : "post",
			data : {
				chatNo : chatNo,
				id : user
			},
			success : function(result){
				if(result.trim() == 0){
					let open = confirm("채팅방에 참가하시겠습니까?");
					if(open == true){
						openChat(user, chatNo);
					}
				}else if(result.trim() == 1){
					location.href="chatroom.jsp?no=" + chatNo;
				}else{
					alert("입장이 불가합니다.");
				}
			},
			error : function(){
				console.log("에러 발생");
			}
		});
	}
	
	function openChat(id, chatNo){
		$.ajax({
			url : "../chat/insertChat.jsp",
			type: "post",
			data : {
				id : id,
				chatNo : chatNo
			},
			success : function(result){
				if(result.trim() == "success"){
					location.href="chatroom.jsp?no=" + chatNo;
				}
			},
			error : function(){
				console.log("에러 발생");
			}
		});
	}
	
	
	$("#submit").click(function(){
		let chat = $("#chatname");
		let chatFeedback = $("#chatname-feedback");
		
		$.ajax({
			url : "../chat/chatOpen.jsp",
			type : "post",
			data : {
				id : user,
				chatTitle : chat.val().trim()
			},
			success : function(result){
				console.log(result.trim());
				let cno = result.trim();
				if(result.trim() != "0"){
					location.href = "../chat/chatroom.jsp?no=" + cno;
				}else{
					if(chat.val().trim() == ""){
						chat.focus();
						chat.val("");
						chatFeedback.css("display", "block");
						chatFeedback.text("채팅방 이름을 입력해 주십시오.");
						return;
					}
					
					chatFeedback.css("display", "none");
				}
			},
			error : function(){
				console.log("에러 발생");
			}
		});
	});
	
</script>
</html>
