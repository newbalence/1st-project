<%@page import="board.ConvertBoardType"%>
<%@page import="favorit.favoritDAO"%>
<%@page import="board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="board.SearchVO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/navbar.jsp" %>
<%@ include file="../main/comMenu.jsp" %>
<%
	BoardDAO bdao = new BoardDAO();
	String boardType = request.getParameter("boardType");
	String listType = request.getParameter("listType");
	if(boardType == null || boardType.isEmpty()){
		boardType = "";
	}
	System.out.println(boardType);
	String pageNum = request.getParameter("page");
	if(pageNum == null || pageNum.equals("null")){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int limitSize = 10;
	int startNum = (currentPage - 1) * limitSize;
	String searchType = request.getParameter("searchType");
	String keyword = request.getParameter("searchKeyword");
	String listOrder = request.getParameter("order");

	
	SearchVO svo = new SearchVO();
	svo.setSearchType(searchType);
	svo.setKeyword(keyword);
	svo.setStartNum(startNum);
	svo.setLimitSize(limitSize);
	svo.setSelectlist(listOrder);
	svo.setBoardType(boardType);
	svo.setListType(listType);
	List<BoardVO> list = bdao.selBoardAll(svo);
	
	int totalCount = bdao.getcount(svo);
	
	int pageGroupSize = 10;
	
	int startPage = ((currentPage - 1) / pageGroupSize) * pageGroupSize + 1;
	int totalPage = (int)Math.ceil(totalCount / (double)limitSize);
	int endPage = Math.min(startPage + pageGroupSize - 1, totalPage);
	
	if(searchType == null){
		searchType = "";
	}
	
	if(keyword == null){
		keyword = "";
	}
	
	if(listType == null || listType.isEmpty()){
		listType = "";
	}
	
	if(listOrder == null){
		listOrder = "";
	}
	
	String topTitle = ConvertBoardType.getBoardTye(boardType);
	
	if(topTitle == null || topTitle == "null" || topTitle.isEmpty() || topTitle == ""){
		topTitle = "전체";
	}
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유 게시판</title>
    <style>
    	
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .board-container {
            padding: 20px;
            max-width: 900px;
            margin: 10px auto;
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

        .post-item .meta {
            font-size: 0.9rem;
            color: #777;
            margin-top: 10px;
        }
        .action {
            text-align: center;
            margin-top: 30px;
        }
        .action button {
            background: #2575fc;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            cursor: pointer;
            font-size: 1.1rem;
            transition: background 0.3s ease, box-shadow 0.3s ease;
        }
        .action button:hover {
            background: #1a5fc4;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
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
        #favorit, #unfavorit{
        	cursor: pointer;
        	font-size: 40px;
        	margin-right: 15px;
        }
        #favorit:hover{
        	cursor: pointer;
       	    color: #C40000;
        }
        .bi-star-fill{
        	color: #FFD966;
        }
        .titleLine{
        	display: flex;
       	    justify-self: center;
       	    
        }
        h1{
   	    	margin-right: 30px;
        }
    </style>
</head>
<body>
    <div class="board-container">
    	<div class="titleLine">
    	<%
        	if(user != null && !boardType.equals("") && !boardType.equals("null") && boardType != null){
        		favoritDAO fdao = new favoritDAO();
        		int userFavorit = fdao.selFavoritOne(user.getId(), boardType);
        		%>
   		        <i id="favorit" class=<%= userFavorit == 1 ? "bi-star-fill" : "bi-star" %>></i>
      			<%
        	}else if(!boardType.equals("") && !boardType.equals("null") && boardType != null){
        		%>
        		<i id="unfavorit" class="bi-star" onclick="alert('로그인 후 사용가능합니다.')"></i>
        		<%
        	}
        %>
		<h1><%= topTitle %></h1>
		</div>
		<form action="board.jsp" method="get" id="typeForm" style="display:inline">
			<% 
			if(!boardType.equals("")){
				%>
				<input type="hidden" name="boardType" value="<%= boardType %>">
				<%
			}
			%>
			<select id="listType" name="listType">
				<option value="" <%= listType.equals("") ? "selected" : ""  %>>전체</option>
				<option value="1" <%= listType.equals("1") ? "selected" : ""  %>>인증</option>
				<option value="2" <%= listType.equals("2") ? "selected" : ""  %>>일상</option>
				<option value="3" <%= listType.equals("3") ? "selected" : ""  %>>자유</option>
			</select>
			<select id="order" name="order">
				<option value="" <%= listOrder.equals("") ? "selected" : ""  %>>최신순</option>
				<option value="push" <%= listOrder.equals("push") ? "selected" : ""  %>>추천순</option>
				<option value="old" <%= listOrder.equals("old") ? "selected" : ""  %>>오래된순</option>
			</select>
		</form>
		
        <table class="post-list">
        	<thead>
        		<tr class="post-item-container">
				<th style="width: 67px" id="content">타입</th>
				<th id="content">제목</th>
				<th style="width: 103px" id="content">글쓴이</th>
				<th style="width: 140px" id="content">등록일</th>
				<th style="width: 67px" id="content">조회</th>
				<th style="width: 67px" id="content">추천</th>
				</tr>
			</thead>
			<tbody>
        	<%
        		for(int i = 0; i < list.size(); i++){
        			BoardVO bvo = list.get(i);
        			String bno = bvo.getBno();
        			String title = bvo.getTitle();
        			String author = bvo.getAuthor();
        			String createDate = bvo.getCreateDate();
        			String userType = bvo.getUserType();
        			String nick = bvo.getNick();
        			int hit = bvo.getHit();
        			int push = bvo.getPush();
        			String blistType = bvo.getListType();
        			String blist = "기타";
        			if(blistType.equals("1")){
        				blist = "인증";
        			}else if(blistType.equals("2")){
        				blist = "일상";
        			}else if(blistType.equals("3")){
        				blist = "자유";
        			}
        			
        			createDate = createDate.substring(0, 10);
        			if(userType.equals("2") || bvo.getBoardType().equals("99")){
        				continue;
        			}
        			%>
					
					<tr class="post-item" onclick="location.href='post.jsp?bno=<%= bno %><%= searchType != "" ? "&searchType=" + searchType : ""%><%= keyword != "" ? "&searchKeyword=" + keyword : ""%>&pageNum=<%= pageNum %><%= listType != "" ? "&listType=" + listType : "" %><%= listOrder != "" ? "&order=" + listOrder : ""%><%= boardType != "" ? "&boardType=" + boardType : ""%>'">
					<td><%= blist %></td>
					<td class="title"><%= title %></td>
					<td class="title"><%= nick %></td>
					<td><%= createDate %></td>
					<td><%= hit %></td>
					<td><%= push %></td>
					</tr>
					
        			<%
        		}
        	%>
        	</tbody>
        </table>
        <%
        	if(user != null && !boardType.equals("") && !boardType.equals("null") && boardType != null){
        		%>
  			<div class="action">
	            <button onclick="location.href='write.jsp?boardType=<%= boardType %><%= listType != "" ? "&listType=" + listType : "" %>'">글쓰기</button>
	        </div>
        		<%
        	}
        %>
        <div class="pagination">
        	<%
        		if(startPage > 1){
        			%>
                	<a href="board.jsp?page=<%= currentPage - 1 %><%= searchType != "" ? "&searchType=" + searchType : "" %><%= keyword != "" ? "&searchKeyword=" + keyword : "" %><%= listType != "" ? "&listType=" + listType : "" %><%= listOrder != "" ? "&order=" + listOrder : ""%><%= boardType != "" ? "&boardType=" + boardType : ""%>">&lt;</a>
                	<%
        		}
        	%>
        	<%
        	for(int i = startPage; i <= endPage; i++){
        		if(i == currentPage){
            		%>
            		<a class="active" href="board.jsp?page=<%= i %><%= searchType != "" ? "&searchType=" + searchType : "" %><%= keyword != "" ? "&searchKeyword=" + keyword : "" %><%= listType != "" ? "&listType=" + listType : "" %><%= listOrder != "" ? "&order=" + listOrder : ""%><%= boardType != "" ? "&boardType=" + boardType : ""%>"><%= i %></a>
            		<%
        			continue;
        		}else{
            		%>
            		<a href="board.jsp?page=<%= i %><%= searchType != "" ? "&searchType=" + searchType : "" %><%= keyword != "" ? "&searchKeyword=" + keyword : "" %><%= listType != "" ? "&listType=" + listType : "" %><%= listOrder != "" ? "&order=" + listOrder : ""%><%= boardType != "" ? "&boardType=" + boardType : ""%>"><%= i %></a>
            		<%
        		}
        	}
        	%>
        	<%
        		if(endPage < totalPage){
        			%>
       				<a href="board.jsp?page=<%= currentPage + 1 %><%= searchType != "" ? "&searchType=" + searchType : "" %><%= keyword != "" ? "&searchKeyword=" + keyword : "" %><%= listType != "" ? "&listType=" + listType : "" %><%= listOrder != "" ? "&order=" + listOrder : ""%><%= boardType != "" ? "&boardType=" + boardType : ""%>">&gt;</a>
        			<%
        		}
        	%>
        </div>
        <div class="search-bar">
            <form action="board.jsp" method="get">
            	<input type="hidden" name="boardType" value="<%= boardType %>">
            	<input type="hidden" name="listType" value="<%= listType %>">
            	<input type="hidden" name="order"value="<%= listOrder %>">
                <select name="searchType">
                    <option value="title" <%= searchType.equals("title") ? "selected" : "" %>>제목</option>
                    <option value="content" <%= searchType.equals("content") ? "selected" : "" %>>내용</option>
                    <option value="nick" <%= searchType.equals("nick") ? "selected" : "" %>>닉네임</option>
                </select>
                <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요" value="<%= keyword %>">
                <button type="submit">검색</button>
            </form>
        </div>
    </div>
</body>
<script>
	$("#order").change(function(e){
		$("#typeForm").submit();
	})
	
	$("#listType").change(function(e){
		$("#typeForm").submit();
	})
	
	
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
		
		let id = "<%= user == null ? null : user.getId() %>";
		let boardType = <%= boardType %>
		$("#favorit").click(function(){
			let favorit = $("#favorit");
			let cName = favorit.attr("class");
			$.ajax({
				url : "favoritok.jsp",
				type : "post",
				data : {
					id : id,
					boardType : boardType
				},
				success : function (result){
					if(result.trim() < 5){
						if(cName == "bi-star"){
							favorit.attr("class", "bi-star-fill")
						}else if(cName == "bi-star-fill"){
							favorit.attr("class", "bi-star")
						}
					}else{
						alert("즐겨찾기는 최대 5개 까지 가능합니다.")
					}
					
				},
				error : function(){
					console.log("에러 발생");
				}
			});

		});
	
</script>
</html>
