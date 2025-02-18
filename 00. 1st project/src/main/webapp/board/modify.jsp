<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/navbar.jsp" %>
<%
	String no = request.getParameter("no");
	//modify.jsp?no=5
	
	String listType = request.getParameter("listType");
	
	if(no == null || no.isEmpty() || listType == null || listType.isEmpty()){
		response.sendRedirect("board.jsp");
		return;
	}
	
	BoardDAO dao = new BoardDAO();
	BoardVO vo = dao.selBoardOne(no, user.getId());
	String title = vo.getTitle();
	String content = vo.getContent();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 수정</title>
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
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }
        #title {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            margin-bottom: 0;
        }
        input[type="file"]{
        	width: 100%;
            padding: 10px;
            font-size: 1rem;
        }
        textarea {
            height: 200px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }
        button {
            background: #2575fc;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 25px;
            cursor: pointer;
            font-size: 1.1rem;
            transition: background 0.3s ease, box-shadow 0.3s ease;
        }
        button:hover {
            background: #1a5fc4;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .action {
            text-align: center;
            margin-top: 20px;
        }
        .title{
        	display: flex;
        	margin-bottom: 15px;
        	align-items: center;
        }
        select{
        	height : 40px;
        	border : 1px solid black;
        	border-radius : 5px;
        	margin-right : 10px;
       	}
       	.file{
       		border-top : 1px solid black;
       		border-bottom : 1px solid black;
       		display: flex;
        	margin-top: 15px;
        	align-items: center;
        	padding: 5px 0px 5px 0px;
       	}
    </style>
</head>
<body>
    <div class="board-container">
        <h2>게시글 수정</h2>
        <form method="post" action="modifyok.jsp" enctype="multipart/form-data">
        	<input type="hidden" name="no" value="<%= no %>">
            <div class="title">
	        	<select name="listType">
	        		<option value="1" <%= listType.equals("1") ? "selected" : "" %>>인증</option>
	        		<option value="2" <%= listType.equals("2") ? "selected" : "" %>>일상</option>
	        		<option value="3" <%= listType.equals("3") ? "selected" : "" %>>자유</option>
	        	</select>
	            <input type="text" id="title" name="title" placeholder="제목을 입력하세요" value="<%= title %>">
			</div>
			
            <label for="content">내용</label>
            <textarea id="content" name="content" placeholder="내용을 입력하세요"><%= content %></textarea>

			<div>
	            <label for="file">첨부파일</label>
	            <input type="file" id="file" name="file">
            </div>
            
   			<div id="img-container">
			</div>

            <div class="action">
                <button type="submit">수정</button>
                <button type="button" onclick="history.back()">취소</button>
            </div>
        </form>
    </div>
</body>
</html>