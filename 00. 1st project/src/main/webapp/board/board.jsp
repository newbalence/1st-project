<%@page import="board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="board.SearchVO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/navbar.jsp" %>
<%
	BoardDAO bdao = new BoardDAO();
	
	String pageNum = request.getParameter("page");
	if(pageNum == null || pageNum.equals("null")){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int limitSize = 10;
	int startNum = (currentPage - 1) * limitSize;
	String searchType = request.getParameter("searchType");
	String keyword = request.getParameter("searchKeyword");
	String listType = request.getParameter("type");
	String listOrder = request.getParameter("order");

	
	SearchVO svo = new SearchVO();
	svo.setSearchType(searchType);
	svo.setKeyword(keyword);
	svo.setStartNum(startNum);
	svo.setLimitSize(limitSize);
	svo.setSelectlist(listOrder);
	svo.setBoardType(listType);
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
	
	if(listType == null){
		listType = "";
	}
	
	if(listOrder == null){
		listOrder = "";
	}
	
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유 게시판</title>
    <style>
    	
    	ul {
		  list-style-type: none;
		  padding-left: 0px;
		}
		.select {
		  display: inline-block;
		  width: 120px;
		  border: 1px solid #999;
		  text-align-last: center;
		}
		
		.select .selected {
		  display: flex;
		  justify-content: center;
		  padding: 8px 5px;
		}
		
		.select .selected .selected-value {
		  max-width: 90px;
		}
		
		.select ul {
		  width: 120px;
		  border: 1px solid #999;
		  position: absolute;
		  background: #fff;
		  border-top: none;
		  margin: 1px 0 0 -1px;
		  cursor: pointer;
		  display : none;
	      
		}
		.select.active ul {
		  display: initial;
		}
		
		.select ul li {
		  padding: 8px 5px;
		}
		.select ul li,
		.select .selected .selected-value {
		  white-space: nowrap; /* 줄바꿈 안함 */
		  overflow: hidden;
		  text-overflow: ellipsis; /* 말줄임 적용 */
		}
		.select ul li:hover {
		  background: rgba(168, 156, 235, 0.35)
		}
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
        }
        .post-item a {
            text-decoration: none;
            color: #2575fc;
            font-weight: bold;
            font-size: 1.2rem;
        }
        .post-item a:hover {
            text-decoration: underline;
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
    </style>
</head>
<body>
    <div class="board-container">
    	<div id="sel">
			<div class="select">
				<div class="selected">
			    	<div class="selected-value">전체</div>
			  	</div>
			  	<ul>
			    	<li class="option">none</li>
			    	<li class="option">option 1</li>
			    	<li class="option">option 2</li>
			    	<li class="option">option 3</li>
			    	<li class="option">loooooooooooooooooong text option</li>
			  	</ul>
			</div>     
			<div class="select">
			  <div class="selected">
			    <div class="selected-value">실내취미</div>
			    <div class="arrow"></div>
			  </div>
			  <ul>
			    <li class="option">none</li>
			    <li class="option">option 1</li>
			    <li class="option">option 2</li>
			    <li class="option">option 3</li>
			    <li class="option">loooooooooooooooooong text option</li>
			  </ul>
			</div>
	     	<div class="select">
			  <div class="selected">
			    <div class="selected-value">실외취미</div>
			  </div>
			  <ul>
			    <li class="option">none</li>
			    <li class="option">option 1</li>
			    <li class="option">option 2</li>
			    <li class="option">option 3</li>
			    <li class="option">loooooooooooooooooong text option</li>
			  </ul>
			</div>
	     	<div class="select">
			  <div class="selected">
			    <div class="selected-value">수집취미</div>
			  </div>
			  <ul>
			    <li class="option">none</li>
			    <li class="option">option 1</li>
			    <li class="option">option 2</li>
			    <li class="option">option 3</li>
			    <li class="option">loooooooooooooooooong text option</li>
			  </ul>
			</div>
	    	<div class="select">
			  <div class="selected">
			    <div class="selected-value">경쟁취미</div>
			  </div>
			  <ul>
			    <li class="option">none</li>
			    <li class="option">option 1</li>
			    <li class="option">option 2</li>
			    <li class="option">option 3</li>
			    <li class="option">loooooooooooooooooong text option</li>
			  </ul>
			</div>
	    	<div class="select">
			  <div class="selected">
			    <div class="selected-value">관찰취미</div>
			  </div>
			  <ul>
			    <li class="option">none</li>
			    <li class="option">option 1</li>
			    <li class="option">option 2</li>
			    <li class="option">option 3</li>
			    <li class="option">loooooooooooooooooong text option</li>
			  </ul>
			</div>
		</div>
		<h1>러닝</h1>
		<form action="board.jsp" method="get" id="typeForm" style="display:inline">
			<select id="type" name="type">
				<option value="" <%= listType.equals("") ? "selected" : ""  %>>전체</option>
				<option value="1" <%= listType.equals("1") ? "selected" : ""  %>>인증</option>
				<option value="2" <%= listType.equals("2") ? "selected" : ""  %>>일상</option>
				<option value="3" <%= listType.equals("3") ? "selected" : ""  %>>기타</option>
			</select>
		<select id="order" name="order">
			<option value="" <%= listOrder.equals("") ? "selected" : ""  %>>최신순</option>
			<option value="push" <%= listOrder.equals("push") ? "selected" : ""  %>>추천순</option>
			<option value="old" <%= listOrder.equals("old") ? "selected" : ""  %>>오래된순</option>
		</select>
		</form>
		
        <ul class="post-list">
        	<li class="post-item">
				<a>번호</a>
				<a>제목</a>
				<a>글쓴이</a>
				<a>등록일</a>
				<a>조회</a>
				<a>추천</a>
				
			</li>
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
        			int push = bvo.getPush();;
        			createDate = createDate.substring(0, 10);
        			if(userType.equals("2") || bvo.getBoardType().equals("99")){
        				continue;
        			}
        			%>
					<li class="post-item">
						<a href="post.jsp?bno=<%= bno %><%= searchType != "" ? "&searchType=" + searchType : ""%><%= keyword != "" ? "&searchKeyword=" + keyword : ""%>&pageNum=<%= pageNum %><%= listType != "" ? "&type=" + listType : "" %><%= listOrder != "" ? "&order=" + listOrder : ""%>">
						<span><%= bno %></span>
						<span><%= title %></span>
						<span><%= nick %></span>
						<span><%= createDate %></span>
						<span><%= hit %></span>
						<span><%= push %></span>
						</a>
					</li>
        			<%
        		}
        	%>
        </ul>
        <%
        	if(user != null){
        		%>
  			<div class="action">
	            <button onclick="location.href='write.jsp'">글쓰기</button>
	        </div>
        		<%
        	}
        %>
        <div class="pagination">
        	<%
        		if(startPage > 1){
        			%>
                	<a href="board.jsp?page=<%= currentPage - 1 %><%= searchType != "" ? "&searchType=" + searchType : "" %><%= keyword != "" ? "&searchKeyword=" + keyword : "" %><%= listType != "" ? "&Type=" + listType : "" %><%= listOrder != "" ? "&order=" + listOrder : ""%>">&lt;</a>
                	<%
        		}
        	%>
        	<%
        	for(int i = startPage; i <= endPage; i++){
        		if(i == currentPage){
            		%>
            		<a class="active" href="board.jsp?page=<%= i %><%= searchType != "" ? "&searchType=" + searchType : "" %><%= keyword != "" ? "&searchKeyword=" + keyword : "" %><%= listType != "" ? "&type=" + listType : "" %><%= listOrder != "" ? "&order=" + listOrder : ""%>"><%= i %></a>
            		<%
        			continue;
        		}else{
            		%>
            		<a href="board.jsp?page=<%= i %><%= searchType != "" ? "&searchType=" + searchType : "" %><%= keyword != "" ? "&searchKeyword=" + keyword : "" %><%= listType != "" ? "&type=" + listType : "" %><%= listOrder != "" ? "&order=" + listOrder : ""%>"><%= i %></a>
            		<%
        		}
        	}
        	%>
        	<%
        		if(endPage < totalPage){
        			%>
       				<a href="board.jsp?page=<%= currentPage + 1 %><%= searchType != "" ? "&searchType=" + searchType : "" %><%= keyword != "" ? "&searchKeyword=" + keyword : "" %><%= listType != "" ? "&type=" + listType : "" %><%= listOrder != "" ? "&order=" + listOrder : ""%>">&gt;</a>
        			<%
        		}
        	%>
        </div>
                <div class="search-bar">
            <form action="board.jsp" method="get">
            	<input type="hidden" name="type" value="<%= listType %>">
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
	$("#type").change(function(e){
		$("#typeForm").submit();
	})
	
	const selectBoxElements = document.querySelectorAll(".select");
	
	function toggleSelectBox(selectBox) {
	  selectBox.classList.toggle("active");
	}
	
	function selectOption(optionElement) {
	  const selectBox = optionElement.closest(".select");
	  const selectedElement = selectBox.querySelector(".selected-value");
	  selectedElement.textContent = optionElement.textContent;
	}
	
	selectBoxElements.forEach(selectBoxElement => {
	  selectBoxElement.addEventListener("click", function (e) {
	    const targetElement = e.target;
	    const isOptionElement = targetElement.classList.contains("option");
	
	    if (isOptionElement) {
	      selectOption(targetElement);
	    }
	
	    toggleSelectBox(selectBoxElement);
	  });
	});
	
	document.addEventListener("click", function (e) {
	  const targetElement = e.target;
	  const isSelect = targetElement.classList.contains("select") || targetElement.closest(".select");
	
	  if (isSelect) {
	    return;
	  }
	
	  const allSelectBoxElements = document.querySelectorAll(".select");
	
	  allSelectBoxElements.forEach(boxElement => {
	    boxElement.classList.remove("active");
	  });
	});
	
	
	
</script>
</html>
