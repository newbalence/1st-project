<%@page import="java.util.regex.Pattern"%>
<%@page import="push.PushDAO"%>
<%@page import="hit.HitDAO"%>
<%@page import="reply.ReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="reply.ReplyDAO"%>
<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/navbar.jsp" %>
<%
	String no = request.getParameter("bno");
	String searchType = request.getParameter("searchType");
	String keyword = request.getParameter("keyword");
	String pageNum = request.getParameter("pageNum");
	String listType = request.getParameter("listType");
	String listOrder = request.getParameter("order");
	String boardType = request.getParameter("boardType");

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
	String nick = bvo.getNick();
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
	
	String path = request.getContextPath();
	
	if(nick.equals("") || nick == null){
		nick = "익명";
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
            color: red;
            margin-bottom: 20px;
            text-align: center;
            font-size: 3.8rem;
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
            float : right;
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
        .meta-reply {
            font-size: 0.9rem;
            color: #777;
        }
        #img{
        	max-width: 100%
        }
        #push{
        	cursor: pointer;
        }
        
    </style>
</head>
<body>
    <div class="detail-container">
        <h2><%= title %></h2>
        <div class="meta">
        <span>작성자: <%= nick %> | 작성일: <%= createDate %><%= updateDate == null ? "" : "(수정됨)" %></span>
        <span style="float:right">
        	<span id="pushNum">조회<%= hit %> 추천<%= push %></span> 
        <%
        	if(user != null){
        		%>
   		        <i id="push" class=<%= userPush == 1 ? "bi-hand-thumbs-up-fill" : "bi-hand-thumbs-up" %>></i>
      			<%
        	}else{
        		%>
        		<i class="bi-hand-thumbs-up"></i>
        		<%
        	}
        %>
		</span>
        </div>
        <div class="post-content">
            <p><%= content %></p>
        </div>
        <%
        	if(uploadName != null && !uploadName.equals("null")){
        		boolean imageExtention =  Pattern.matches("([^\\s]+(\\.(?i)(png|jpg|gif|bmp|jpeg|tiff|PNG|JPG|GIF|BMP|JPEG|TIFF))?)", uploadName);
		                	if(imageExtention){
		                		%>
		                		<div>
		                			<img id="img" src="<%= path %>/upload/<%= uploadName %>"></img>
	                			</div>
		                		<%
		                	}
		                %>
       		     <div class="attachments">
		            <h3>첨부파일</h3>
		            <div class="attachment-item">
		                <a download="<%= originName %>" href="<%= path %>/upload/<%= uploadName %>" class="attachment-name"><%= originName %></a>
		                <span class="attachment-size">(<%= data %>)</span>
		            </div>
		        </div>
        		<%
        	}
        %>
        <div class="actions">
			<button onclick="location.href='board.jsp?page=<%= pageNum %><%= boardType != "" ? "&boardType=" + boardType : ""%><%= searchType != "" ? "&searchType=" + searchType : "" %><%= keyword != "" ? "&searchKeyword=" + keyword : "" %><%= listType != "" ? "&listType=" + listType : "" %><%= listOrder != "" ? "&order=" + listOrder : ""%>'">뒤로가기</button>

        <%
        	//로그인을 하였고, 로그인한 사용자의 아이디(user.getId())와 
        	//게시글을 작성한 작성자 아이디(author)가 같으면 수정 삭제 버튼 표출
        	if(user != null && (user.getId().equals(author) || user.getUserType().equals("0"))){
        		%>
		        <span class="post-actions">
		            <button onclick="location.href='modify.jsp?no=<%= no %>&boardType=<%= bvo.getBoardType() %><%= bvo.getListType() != "" ? "&listType=" + bvo.getListType() : "" %>'">수정</button>
		            <button onclick="deletePost(<%= no %>)">삭제</button>
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
            		String rnick = rvo.getRnick();
            		rcreateDate = rcreateDate.substring(0, 16);
            		
            		if(ruserType.equals("2")){
            			continue;
            		}
            		%>
          	<div class="comment">
                <div class="meta">작성자: <%= rnick %></div>
                <p><%= rcontent %></p>
                <div class="meta-reply">
                	<span>작성일: <%= rcreateDate %><%= rupdateDate == null ? "" : "(수정됨)" %></span>
                
	                <%
	                	//댓글 목록을 반복하며 댓글의 작성자가 로그인한 사용자의 아이디와
	                	//동일하면 수정 삭제 버튼을 보여준다.
	                	if(user != null && (user.getId().equals(rauthor) || user.getUserType().equals("0"))){
	                		%>
	                			<span class="comment-actions">
				                    <button onclick="replyBtn(this)">수정</button>
				                    <input type="hidden">
				                    <button class="dpnone" onclick="modifyReply(<%= rno %>, this)">확인</button>
				                    <button class="dpnone" onclick="cancelBtn(this, '<%= rcontent %>')">취소</button>
				                    <button onclick="deleteReply(<%= rno %>, this)">삭제</button>
				                </span>
	                		<%
	                	}
	                %>
                </div>
            </div>
            	<%
            	}
            %>
            
        </div>
        

    </div>
	</body>
	<script>
		
		let rauthor = "<%= user == null ? null : user.getId() %>";
		let rnick = "<%= user == null ? null : user.getNick() %>";
		console.log(rnick);
		function replyBtn(obj){
			let el = $(".comment");
			for(let i = 0; i < el.length; i++){
				let value = el.eq(i).children().children().children("input").val();
				let input = el.eq(i).children("input");
				input.replaceWith("<p>" + value + "</p>");
				
				
				el.eq(i).children().children().children().eq(0).css("display", "inline");
				el.eq(i).children().children().children(".dpnone").css("display", "none");
			}
			
			let p = $(obj).parent().parent().parent().children("p");
			$(obj).next().val(p.text());
			
			p.replaceWith("<input type='text' value='" + p.text() + "'>");
			
			$(obj).css("display", "none");
			$(obj).parent().children(".dpnone").css("display", "inline");
			
		}
		
		function cancelBtn(obj, text){
			let input = $(obj).parent().parent().parent().children("input");
			input.replaceWith("<p>" + text + "</p>")
			
			$(obj).prev().prev().prev().css("display", "inline");
			$(obj).parent().children(".dpnone").css("display", "none");
			
		}
		
		
		function deleteReply(rno, obj){
			let result = confirm("댓글을 삭제하시겠습니까?");
			if(result == true){
				$.ajax({
					url : "deleteReply.jsp",
					type : "post",
					data : {
						rno : rno
					},
					success : function(result){
						if(result.trim() == "success"){
							$(obj).parent().parent().parent().remove();
						}else{
							alert("삭제 실패");
						}
					},
					error : function(){
						console.log("에러 발생");
					}
				});
			}
			
		}
		
		function modifyReply(rno, obj){
			let input = $(obj).parent().parent().parent().children("input");
			let reply = input.val();
			
			if(reply != null && reply.trim() != ""){
				let mresult = confirm("댓글을 수정하시겠습니까?");
				if(mresult == true){
					$.ajax({
						url : "modifyReply.jsp",
						type : "post",
						data : {
							rcontent : reply,
							rno : rno
						},
						success : function (result){
							if(result.trim() == "success"){
								input.replaceWith("<p>" + reply + "</p>");
								$(obj).parent().children(".dpnone").css("display", "none");
								$(obj).prev().prev().css("display", "inline");
								$(obj).next().attr("onclick", "cancelBtn(this, '" + reply + "')");
							}
						},
						error : function(){
							console.log("에러 발생");
						}
					});
				}
			}
			
		}
		
		function deletePost(no){
			let result = confirm("삭제하시겠습니까?");
			if(result == true){
				location.href = "delete.jsp?no=" + no;
			}
		}
		
		$("#replyBtn").click(function(){
			$.ajax({
				url : "replyWriteok.jsp",
				type : "post",
				data : {
					no : "<%= bno %>",
					rauthor : rauthor,
					rnick : rnick,
					rcontent : $("#rcontent").val()
				},
				success : function(result){
					let time = getTime();
					console.log(result);
					
					if(result.trim() != "0"){
						//html요소를 추가
						let rcontent = $("#rcontent");
						
						let html = "";
						html += "<div class='comment'>";
						html += 	"<div class='meta'>작성자: " + rnick + "</div>";
						html += 	"<p>"+rcontent.val()+"</p>";
						html +=		"<div class='meta-reply'>"
						html +=		"<span>작성일 : " + time + "</span>";
						html += 	"<span class='comment-actions'>";
						html += 		"<button onclick='replyBtn(this)'>수정</button>";
						html += 		"<input type='hidden'>";
						html += 		"<button class='dpnone' onclick='modifyReply(" + result.trim() + ", this)'>확인</button>";
						html += 		"<button class='dpnone' onclick='cancelBtn(this, `" + rcontent.val() + "`)'>취소</button>";
						html +=			"<button onclick='deleteReply(" + result.trim() + ", this)'>삭제</button>";
						html += 	"</span>";
						html += "</div>";
						$(".comments-section").prepend(html);
						
						rcontent.val("");
					}else{
						$("#rcontent").val("").focus();
					}
				},
				error : function(){
					$("#rcontent").val("").focus();
				}
			});
			
		});
		
		function getTime(){
			let date = new Date();
			console.log(date);
			
			let year = date.getFullYear();
			let month = (date.getMonth() + 1).toString().padStart(2,"0");
			let day = date.getDate().toString().padStart(2,"0");
			let hour = date.getHours().toString().padStart(2,"0");
			let minute = date.getMinutes().toString().padStart(2,"0");
			let second = date.getSeconds().toString().padStart(2,"0");
			
			let time = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second
			return time;
		}
		
		let pushNo = <%= push %>;
		$("#push").click(function(){
			let pushNum = $("#pushNum");
			let bno = <%= no %>
			let push = $("#push");
			let cName = push.attr("class");
			$.ajax({
				url : "pushok.jsp",
				type : "post",
				data : {
					bno : bno,
					uId : rauthor
				},
				success : function (result){
					if(result.trim() == "success"){
						if(cName == "bi-hand-thumbs-up"){
							push.attr("class", "bi-hand-thumbs-up-fill")
							pushNum.text("조회<%= hit %> 추천" + (++pushNo));
						}else if(cName == "bi-hand-thumbs-up-fill"){
							push.attr("class", "bi-hand-thumbs-up")
							pushNum.text("조회<%= hit %> 추천" + (--pushNo));
						}
					}else{
						console.log("에러 발생");
					}
					
				},
				error : function(){
					console.log("에러 발생");
				}
			});
			if(cName == "bi-hand-thumbs-up"){
				push.attr("class", "bi-hand-thumbs-up-fill");
			}else if(cName == "bi-hand-thumbs-up-fill"){
				push.attr("class", "bi-hand-thumbs-up");
			}else{
				return;
			}
		});
		
		
	</script>
</html>