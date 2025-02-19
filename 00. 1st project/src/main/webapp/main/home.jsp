<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@page import="favorit.favoritVO"%>
<%@page import="favorit.favoritDAO"%>
<%@page import="chatroom.ChatroomVO"%>
<%@page import="java.util.List"%>
<%@page import="chatroom.ChatroomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/navbar.jsp" %>
<%
	String id = "";
	if(user != null){
		id = user.getId();
	}
	
	ChatroomDAO crdao = new ChatroomDAO();
	List<ChatroomVO> clist = crdao.userChatRoom(id);
	
	favoritDAO fdao = new favoritDAO();
	List<favoritVO> flist = fdao.selFavorit(id);
	
	
	BoardDAO bdao = new BoardDAO();
	List<BoardVO> blist = bdao.homePushBoard();
	
	String boardType = "";
	
	
	
	
%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Good Life</title>
		<style>
			
		 	a {
				color: #000;
				text-decoration: none;
			}
			
			.screen_out {
				overflow: hidden; 
				position: absolute; 
				width: 0; 
				height: 0; 
				line-height: 0; 
				text-indent: -9999px;
			}
			
			#article {
				padding-top : 41px;
			}

			.articleLeft {
			/* .cont_g {
				border: 2px solid;
				padding: 5px 20px;
				margin: 10px 0;
				border-radius: 15px;
				text-align: left; */
			}
			.cont_num{
				margin-right: 10px;
				float: left;
			}
			.content {
				font-size: 20px;
			}
			.link_cont:hover {
				color: #c40000;
			} 
			
			.link_tab:hover {
				color: #c40000;
			}
			
			.innerArticle {
				display: flex;
				flex-wrap: nowrap;
				position: relative;
				width: 1216px;
				margin: 0 auto;	
				padding: 0 30px;
				flex-direction: row;
			}
			
			.articleLeft {
				padding: 0 20px;
				box-sizing: border-box;
			}
			
			.articleRight {
				position: relative;
				box-sizing: border-box;
				min-width: 250px;
				padding-left: 20px;
				magin-left: auto;
			}
			
			.articleRight:before {
				content: "";
				position: absolute;
				display: block;
				left: 0;
				top: 0;
				width: 1px;
				height: 100%;
				background-color: #f0f0f0;
			}
			
			#login-form {
				display: flex;
				flex-direction: column;
				margin-bottom: 100px;
			}
			
			#login-form p {
				text-align: center;
			}
			
			#login-form a {
				color: #c0c0c0;
				text-decoration: underline;
				display: flex;
				flex-direction: row;
			}
			
			#login-form a:hover {
				color: #c40000;
			}
			.auth-container{
				    display: flex;
    				justify-content: space-between;
			}
			
			.innerArticle > div:nth-child(1){
		     flex-grow: 3;
		   }
		   
		   .innerArticle > div:nth-child(2){
		     flex-grow: 1;
		   }
		   .login-btn{
		       margin-left: 0;
			}
			.weathers{
				width: 250px;
			}
			.weatherBox{
				display: flex;
				justify-content: center;
			}
			#windBox{
				padding-left: 25px;
			}
			#chatting{
				margin-top: 100px;
			}
			.Ranking-from-All, .choiceBoard, .doneList{
				margin-bottom: 10px;
				border: 1px solid;
			    border-radius: 15px;
			}
			.doneList{
				margin-bottom: 150px;
				display: none;
			}
			
			.list_category{
			    font-size: 25px;
		    }
		    #link_tab, {
		    	cursor: pointer;
		    }
		    .int_headText{
		    	cursor: pointer;
		    }
		</style>
	</head>
	<body>
		<div id="main"> 
			<div id="article"> 
				<div class="innerArticle"> 
					<div class="articleLeft"> 
						<div class="Ranking-from-All">
							<div class="Content-from-All">
								<h2 class="screen_out">BEST 게시글</h2>
								<%
									for(int i = 0; i< 3; i++){
										BoardVO bvo = blist.get(i);
										String title = bvo.getTitle();
										String nick = bvo.getNick();
										String bno = bvo.getBno();
										String num = "";
										if(i == 0){
											num = "1st";
										}else if(i == 1){
											num = "2nd";
										}else if(i == 2){
											num = "3ed";
										}
										%>
										<div class="cont_g">
											<div class="wrap_cont">
												<em class="cont_num"><%= num %></em>
												<a class="link_cont" href="../board/post.jsp?bno=<%= bno %>">
													<div class="cont_title">
														<strong class="content"><%= title %></strong>
														<em class="author"><%= nick %></em>
													</div>
												</a>
											</div>
										</div>
										<%
									}
								%>
							</div>
						</div>
						<%
							if(user != null){
								%>
								<div class="Ranking-from-Interest">
									<div class="choiceBoard">
										<div class="list_category">
											<div class="wrap_category">
											<%
												for(int i = 0; i < flist.size(); i++){
													favoritVO fvo = flist.get(i);
													boardType = fvo.getBoard_type();
													String topTitle = "";
													
													if(boardType.equals("1")){
														topTitle= "공부";
													}else if(boardType.equals("2")){
														topTitle= "독서";
													}else if(boardType.equals("3")){
														topTitle= "축구";
													}else if(boardType.equals("4")){
														topTitle= "런닝";
													}else if(boardType.equals("5")){
														topTitle= "헬스";
													}else if(boardType.equals("6")){
														topTitle= "여행";
													}else if(boardType.equals("7")){
														topTitle= "우표수집";
													}else if(boardType.equals("8")){
														topTitle= "야구";
													}else{
														topTitle= "전체";
													}
													
													%>
													<a class="link_tab" onclick="boardTypeClick(this)">
														<span class="int_headText" data-boardtype="<%= boardType %>"><%= topTitle %></span>
													</a>
													<%
												}
											%>
											</div>
										</div>
										<div class="intList">
											<a class="link_cont" id="link"><h2 class="screen_out" id="board_choice"></h2></a>
											<div class="int_top">
												
											</div>
										</div>
									</div>
									<div class="doneList">
										<a class="link_cont" id="listLink"><h2 class="screen_out">인증</h2></a> <!-- 여긴 최신글로 -->
										<div class="done_top">
										
										</div>
									</div>
								</div>
								<%
							}
						%>
					<div class="seekPeople"></div>
				</div>
				<div class="articleRight">
					<div class="logmein">
						<div id="login-form">
						<%
							if(user == null){
								%>
								<button type="button" class="btn btn-dark login-btn" href="../goal/goalTimer.jsp" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">시작하기</button>
								
								<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  	<div class="modal-dialog">
								    	<div class="modal-content">
								      		<div class="modal-header">
								        		<h1 class="modal-title fs-5" id="exampleModalLabel">Login</h1>
								        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      		</div>
								      		<div class="modal-body">
								        		<form>
									        		<div class="login-container">
									       				<h1>로그인</h1>
											            <label for="username">아이디</label>
											            <input type="text" id="username" name="username" placeholder="아이디를 입력하세요" value="admin">
											            <div id="username-feedback" class="feedback"></div>
										
											            <label for="password">비밀번호</label>
											            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" value="1234">
											            <div id="password-feedback" class="feedback"></div>
										
											            <button type="button" id="submit" class="login">로그인</button>
												        <div class="alternate-option">
											            	<p>계정이 없으신가요? <a href="../signup/signup.jsp">회원가입</a></p>
											        	</div>
								  		 			</div>
									        	</form>
									      </div>
									    </div>
									  </div>
									</div>
									<p class="desc_login">더 많은 기능을 이용해 보세요!</p>
									<%
								}else{
									%>
									<h2 class="screen_out">나의 스토리</h2>
									<div class="user_profile">
										<span><%= user.getNick() %>님 환영합니다</span>
									</div>
									<%
								}
							%>
							</div>
						</div>
						<div class="weathers">
							<h2 class="screen_out">날씨</h2>
							<div class="weather_list">
								<div>
							      	<span class="place"></span>
						      	</div>
								<div>
									<img class="weatherImg" src="">
									<span>현재온도</span>
									<span class="temp"></span>
									<span>°</span>
								</div>
								<div class="weatherBox">
									<div>
								      	<span>날씨</span><br>
								      	<span class="weather"></span>
							      	</div>
							      	<div id="windBox">
								      	<span>풍속</span><br>
								      	<span class="wind"></span>
							      	</div>
								</div>
							</div>
						</div>					
						<div class="screen_out" id="chatting">
							<h2 class="screen_out"><a href="../chat/chatlist.jsp">채팅</a></h2>
							<div class="chat_list">
							<%
								if(user != null){
									for(int i = 0; i < clist.size(); i++){
										ChatroomVO crvo = clist.get(i);
										String chatroomno = crvo.getChatroomno();
										String chatname = crvo.getChatname();
										%>
											<a class="content" href="../chat/chatroom.jsp?no=<%= chatroomno %>"><%= chatname %></a><br>
										<%
									}
								}
							%>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script> 
		//onclick="location.href='../board/board.jsp?boardType='"	
		

		function boardTypeClick(obj){
			let choice = $(obj).children();
			let boardType = choice.data("boardtype");
			let text = choice.text();
			$("#link").attr("href", "../board/board.jsp?boardType=" + boardType);
			$("#board_choice").text(text);
			$("#listLink").attr("href", "../board/board.jsp?boardType=" + boardType + "&listType=1");
			$.ajax({
				url : "../main/homeBoard.jsp",
				type : "post",
				data : {
					boardType : boardType
				},
				success : function(result){
					let data = JSON.parse(result.trim());
					let html = "";
					for(let i = 0; i < data.length; i++){
						html += `<div class="item_group">
							<a class="link_cont" href="../board/post.jsp?bno=`+data[i].bno+`&boardType=` + data[i].boardType + `">
							<div class="wrap_int">
								<strong class="tit_int">`+data[i].title+`</strong>
								
								<div class="wrap_btn">
									<span class="done_txt">`+data[i].createDate.split(" ")[0]+`</span>
									<span class="int_btn">
										<span class="icon_like">추천수</span>
										<span class="int_txt">`+data[i].hit+`</span> <!-- 추천 수 가져오기 -->
									</span>
									<span class="int_btn">
										<span class="icon_comment">댓글수</span>
										<span class="int_txt">`+data[i].reply+`</span> <!-- 댓글 수 가져오기 -->
									</span>
								</div>
								<div class="wrap_desc">
									<p class="desc_int">`+data[i].content+`</p>
								</div>
							</div>
						</a>
					</div>`
					}
					
					$(".int_top").html(html);
				},
				error : function(){
					console.log("에러 발생")
				}	
			});
			
			$.ajax({
				url : "../main/secondboard.jsp",
				type : "post",
				data : {
					boardType : boardType
				},
				success : function(result){
					console.log(result);
					let data = JSON.parse(result.trim());
					let html = "";
					$(".doneList").css("display", "block");
					
					for(let i = 0; i < data.length; i++){
						html += `<div class="item_group">
							<a class="link_cont" href="../board/post.jsp?bno=` + data[i].bno + `&boardType=` + data[i].boardType + `">
							<div class="wrap_done">
								<strong class="tit_done">` + data[i].title + `</strong>
								<div class="wrap_btn">
									<span class="done_btn">
										<span class="icon_like">추천수</span>
										<span class="done_txt">` + data[i].hit + `</span> <!-- 추천 수 가져오기 -->
									</span>
									<span class="done_btn">
										<span class="icon_comment">댓글수</span>
										<span class="done_txt">` + data[i].replt + `</span> <!-- 댓글 수 가져오기 -->
									</span>
								</div>
								<div class="wrap_desc">
									<p class="desc_done">` + data[i].content + `</p>
								</div>
							</div>
						</a>
					</div>`
					}
					
					console.log(data);
					$(".done_top").html(html);
				},
				error : function(){
					console.log("에러 발생")
				}	
			});
			
			
			
			
		}
		
		
		
		
		
		
		if ("geolocation" in navigator) {
		  console.log("가능");
		} else {
			console.log("불가능");
		}
		navigator.geolocation.getCurrentPosition(function(position) {
			let x = position.coords.longitude;
			let y = position.coords.latitude;
			
			$.ajax({
				url : "https://dapi.kakao.com/v2/local/geo/coord2regioncode.json",
				type : "get",
				headers:{
					Authorization: "KakaoAK 9cecadb4f818e26ddd142e07a808bb21"
				},
				data : {
					x : x,
					y : y
				},
				success : function(result){
					let place = result.documents[0].region_2depth_name;
					place += " " + result.documents[0].region_3depth_name;
					const address = result.documents[0].region_1depth_name;
					weathers = weather(x, y);
					$(".place").text(place);
				},
				error : function(){
					console.log("에러 발생");
				}
			});
		}, function(error) {
			if(error){
				$(".weather_list").remove();
			}
		});
		
		let user = "<%= user == null ? null : user.getId() %>";
		
		if(user != "null"){
			$(".screen_out").removeClass();
		}
		
		$("#submit").click(function(){
			let id = $("#username");
			let idFeedback = $("#username-feedback");
			let pw = $("#password");
			let pwFeedback = $("#password-feedback");
			
			$.ajax({
				url : "../login/loginok.jsp",
				type : "post",
				data : {
					id : id.val().trim(),
					pw : pw.val().trim()
				},
				success : function(result){
					console.log(result)
					
					if(result.trim() != "0"){
						location.href = "../main/home.jsp";
					}else{
						if(id.val().trim() == ""){
							id.focus();
							id.val("");
							idFeedback.css("display", "block");
							idFeedback.text("아이디를 입력하여 주십시오.");
							return;
						}
						
						idFeedback.css("display", "none");
						
						if(pw.val().trim() == ""){
							pw.focus();
							pw.val("");
							pwFeedback.css("display", "block");
							pwFeedback.text("비밀번호를 입력하여 주십시오.");
							return;
						}
						
						pwFeedback.css("display", "block");
						pwFeedback.text("아이디 혹은 비밀번호를 잘못 입력하였습니다.");
						return;
					}
				},
				error : function(){
					console.log("에러 발생");
				}
			});
		});
		
		function weather(x, y){
			$.ajax({
				url : "https://api.openweathermap.org/data/2.5/weather",
				type : "get",
				data : {
					lang : "kr",
					lat : y,
					lon : x,
					units : "metric",
					appid : "a72a6761eb78a480e947d266de911cdc"
				},
				success : function(result){
					let img = "https://openweathermap.org/img/wn/";
					img += result.weather[0].icon;
					img += "@2x.png";
					$(".temp").text(result.main.temp);
					$(".weather").text(result.weather[0].description);
					$(".wind").text(result.wind.speed + " m/s");
					$(".weatherImg").attr("src", img);
					
				},
				error : function(){
					console.log("에러 발생");
				}
			});
		}
		
		
		
		
		/* //기상청 종관기상관측 api 호출 함수
		function callAsos(code){
			$.ajax({
				url : "https://apihub.kma.go.kr/api/typ01/url/kma_sfctm2.php",
				type : "get",
				data : {
					stn : code,
					authKey : "Tn9bEfk4SUC_WxH5OElAaw"
				},
				success : function(result){
					console.log(result);
				},
				error : function(){
					console.log("에러 발생");
				}
			});
		} */
		
	</script>
</html>
		