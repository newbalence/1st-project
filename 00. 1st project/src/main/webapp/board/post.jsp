<%@page import="push.PushDAO"%>
<%@page import="hit.HitDAO"%>
<%@page import="reply.ReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="reply.ReplyDAO"%>
<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp" %>
<%
	String no = request.getParameter("bno");
	String searchType = request.getParameter("searchType");
	String keyword = request.getParameter("keyword");
	String pageNum = request.getParameter("pageNum");
	String listType = request.getParameter("type");
	String listOrder = request.getParameter("order");

	if(no == null){
		response.sendRedirect("../board/board.jsp");
		return;
	}
	
	if(no.isEmpty()){
		response.sendRedirect("../board/board.jsp");
		return;
	}
	
	if(searchType == null){
		searchType = "";
	}
	
	if(keyword == null){
		keyword = "";
	}
	
	BoardDAO bdao = new BoardDAO();
	BoardVO bvo = bdao.selBoardOne(no, user == null ? null : user.getId());
	
	if(bvo == null){
		response.sendRedirect("../board/board.jsp");
		return;
	}
	
	String bno = bvo.getBno();
	String author = bvo.getAuthor();
	//String nick = bvo.getNick();
	String title = bvo.getTitle();
	String content = bvo.getContent();
	String createDate = bvo.getCreateDate();
	String updateDate = bvo.getUpdateDate();
	String originName = bvo.getOriginName();
	String uploadName = bvo.getUploadname();
	long fileSize = bvo.getFileSize();
	int userPush = bvo.getUserPush();
	int push = bvo.getPush();
	createDate = createDate.substring(0, 16);
	ReplyDAO rdao = new ReplyDAO();
	List<ReplyVO> list = rdao.selReplyAll(bno);
	
	HitDAO hdao = new HitDAO();
	if(user != null){
		hdao.insertHit(user.getId(), bno);
	}
	int hit = hdao.selHit(bno);
	
	String data = "";
	//fileSize의 크기에 따라서 kb, mb, gb 단위 변환
	if(fileSize < 1024){
		//바이트(b)
		data = fileSize + "B";
		//Size = (fileSize + 1) + "B";
	}else if(fileSize < 1024 * 1024){
		//키로바이트(kb)
		double kb = fileSize / (double)1024;
		kb = Math.round(kb * 100) / 100.0;
		data = kb + "KB";
		//Size = (fileSize / 1024) + 1 + "KB";
	}else if(fileSize < 1024 * 1024 * 1024){
		//메가바이트(mb)
		double mb = fileSize / (double)(1024 * 1024);
		mb = Math.round(mb *100) / 100.0;
		data = mb + "MB";
		//Size = (fileSize / (1024 * 1024)) + 1 + "MB";
	}else if(fileSize < 1024 * 1024 * 1024 * 1024){
		//기가바이트(gb)
		double gb = fileSize / (double)(1024 * 1024 * 1024);
		gb = Math.round(gb * 100) / 100.0;
		data = gb + "GB";
		//Size = (fileSize / (1024 * 1024 * 1024)) + 1 + "GB";
	}
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>갓 생 살기</title>
		<script src="../js/jquery-3.7.1.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to bottom, #f4f9ff, #ffffff);
            margin: 0;
            padding: 0;
            color: #333;
        }
        .detail-container {
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
        .post-content {
            margin-bottom: 20px;
        }
        .post-content p {
            font-size: 1rem;
            line-height: 1.6;
            color: #555;
        }
        .meta {
            font-size: 0.9rem;
            color: #777;
            margin-bottom: 20px;
        }
        .attachments {
            margin-top: 20px;
            padding: 15px;
            background: #f9f9f9;
            border-radius: 10px;
            border: 1px solid #ddd;
        }
        .attachments h3 {
            font-size: 1.1rem;
            color: #2575fc;
            margin-bottom: 10px;
        }
        .attachment-item {
            display: flex;
            align-items: center;
            padding: 10px;
            background: #ffffff;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 10px;
            transition: box-shadow 0.3s ease;
        }
        .attachment-item:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .attachment-icon {
            width: 30px;
            height: 30px;
            margin-right: 10px;
        }
        .attachment-name {
            flex: 1;
            color: #2575fc;
            text-decoration: none;
            font-weight: bold;
        }
        .attachment-name:hover {
            text-decoration: underline;
        }
        .attachment-size {
            color: #888;
            font-size: 0.9rem;
        }
        .post-actions {
            text-align: right;
            float: right;
        }
        .post-actions button {
            background: #2575fc;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            cursor: pointer;
            font-size: 1rem;
            margin-left: 10px;
            transition: background 0.3s ease, box-shadow 0.3s ease;
        }
        .post-actions button:hover {
            background: #1a5fc4;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .comments-section {
            margin-top: 40px;
        }
        .comments-section h3 {
            color: #2575fc;
            font-size: 1.4rem;
            margin-bottom: 20px;
        }
        .comment {
            padding: 15px;
            margin-bottom: 15px;
            background: #f9f9f9;
            border-radius: 10px;
            border: 1px solid #ddd;
        }
        .comment .meta {
            font-size: 0.8rem;
            color: #777;
            margin-bottom: 5px;
        }
        .comment p {
            font-size: 0.95rem;
            line-height: 1.4;
            color: #555;
        }
        .comment-actions {
            margin-top: 10px;
            text-align: right;
        }
        .comment-actions button {
            background: none;
            border: none;
            color: #2575fc;
            font-size: 0.9rem;
            cursor: pointer;
            margin-left: 10px;
            transition: color 0.3s ease;
        }
        .comment-actions button:hover {
            color: #1a5fc4;
        }
        .comment-form {
            margin-top: 30px;
            display: flex;
            gap: 10px;
        }
        .comment-form input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }
        .comment-form button {
            background: #2575fc;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            cursor: pointer;
            font-size: 1rem;
            transition: background 0.3s ease, box-shadow 0.3s ease;
        }
        .comment-form button:hover {
            background: #1a5fc4;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .actions {
            margin-top: 20px;
            text-align: center;
        }
        .actions button {
            background: #2575fc;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            cursor: pointer;
            font-size: 1rem;
            margin: 0 10px;
            transition: background 0.3s ease, box-shadow 0.3s ease;
        }
        .actions button:hover {
            background: #1a5fc4;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .dpnone{
        	display : none;
        }
    </style>
</head>
<body>
    <div class="detail-container">
        <h2><%= title %></h2>
        <div class="meta">
        <span>작성자: <%= author %> | 작성일: <%= createDate %><%= updateDate == null ? "" : "(수정됨)" %></span>
        <span style="float:right">조회<%= hit %> 추천<%= push %> <i class=<%= userPush == 1 ? "bi-hand-thumbs-up-fill" : "bi-hand-thumbs-up" %>></i></span>
        </div>
        <div class="post-content">
            <p><%= content %></p>
        </div>
        <%
        	if(uploadName != null && !uploadName.equals("null")){
        		%>
       		     <div class="attachments">
		            <h3>첨부파일</h3>
		            <div class="attachment-item">
		                <a download="<%= originName %>" href="/JspBoard/upload/<%= uploadName %>" class="attachment-name"><%= originName %></a>
		                <span class="attachment-size">(<%= 3 %>)</span>
		            </div>
		        </div>
        		<%
        	}
        %>
        <div class="actions">
			<button onclick="location.href='board.jsp?page=<%= pageNum %><%= searchType != "" ? "&searchType=" + searchType : "" %><%= keyword != "" ? "&searchKeyword=" + keyword : "" %><%= listType != "" ? "&type=" + listType : "" %><%= listOrder != "" ? "&order=" + listOrder : ""%>'">뒤로가기</button>

        <%
        	//로그인을 하였고, 로그인한 사용자의 아이디(user.getId())와 
        	//게시글을 작성한 작성자 아이디(author)가 같으면 수정 삭제 버튼 표출
        	if(user != null && (user.getId().equals(author) || user.getUserType().equals("0"))){
        		%>
		        <span class="post-actions">
		            <button onclick="location.href='modify.jsp?no=<%=no %>'">게시글 수정</button>
		            <button onclick="deletePost(<%=no %>)">게시글 삭제</button>
		        </span>
        		<%
        	}
        %>
        </div>
        <h3>댓글</h3>
        <%
        	if(user != null){
        		%>
        			<div class="comment-form">
			            <input id="rcontent" type="text" placeholder="댓글을 입력하세요...">
			            <button id="replyBtn">댓글 작성</button>
			        </div>
        		<%
        	}
        %>
        <div class="comments-section">
            <%
            	for(int i = 0; i < list.size(); i ++){
            		ReplyVO rvo = list.get(i);
            		String rno = rvo.getRno();
            		String rcontent = rvo.getRcontent();
            		String rauthor = rvo.getRauthor();
            		String rcreateDate = rvo.getCreateDate();
            		String ruserType = rvo.getUserType();
            		String rupdateDate = rvo.getUpdateDate();
            		
            		if(ruserType.equals("2")){
            			continue;
            		}
            		%>
          	<div class="comment">
                <div class="meta">작성자: <%= rauthor %> | 작성일: <%= rcreateDate %><%= rupdateDate == null ? "" : "(수정됨)" %></div>
                <p><%= rcontent %></p>
                
                <%
                	//댓글 목록을 반복하며 댓글의 작성자가 로그인한 사용자의 아이디와
                	//동일하면 수정 삭제 버튼을 보여준다.
                	if(user != null && (user.getId().equals(rauthor) || user.getUserType().equals("0"))){
                		%>
                			<div class="comment-actions">
			                    <button onclick="replyBtn(this)">수정</button>
			                    <input type="hidden">
			                    <button class="dpnone" onclick="modifyReply(<%= rno %>, this)">확인</button>
			                    <button class="dpnone" onclick="cancelBtn(this, '<%= rcontent %>')">취소</button>
			                    <button onclick="deleteReply(<%= rno %>, this)">삭제</button>
			                </div>
                		<%
                	}
                %>
            </div>
            	<%
            	}
            %>
            
        </div>
        

    </div>
	</body>
	<script>
		
	</script>
</html>