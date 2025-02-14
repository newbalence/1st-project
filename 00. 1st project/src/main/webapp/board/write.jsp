<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/navbar.jsp" %>
<%
	if(user == null){
		response.sendRedirect("../board/board.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
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
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
            width: 90px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
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
        <h2>새 게시글 작성</h2>
        <form method="post" action="writeok.jsp" enctype="multipart/form-data">
        	<div class="title">
	        	<select name="type">
	        		<option value="01">인증</option>
	        		<option value="02">일상</option>
	        		<option value="03">기타</option>
	        	</select>
	            <input type="text" id="title" name="title" placeholder="제목을 입력하세요">
			</div>
			
            <label for="content"></label>
            <textarea id="content" name="content" placeholder="내용을 입력하세요"></textarea>
			
			<div class="file">
	            <label for="file">첨부파일</label>
	            <input type="file" id="file" name="file">
			</div>
			
			<div id="img-container">
			</div>
			
            <div class="action">
                <button type="submit">등록</button>
                <button type="button" onclick="history.back()">취소</button>
            </div>
        </form>
    </div>
</body>
<script>
$("#file").change(function(e) {
    console.log($("#file")[0].files)
    const files = $("#file")[0].files;
    
    for(let i = 0; i < files.length; i ++){
    	let file =  files[i];
    	let reader = new FileReader();
    	
    	reader.onload = function(e){
        	console.log(e.target.result)
        	if(file.type.includes("image")){
        		let html = "<img src='"+e.target.result+"'></img>"
        		$("#img-container").append(html);
        	}
        }
        
        reader.readAsDataURL(file);
    }
    
    
});
</script>
</html>