<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/navbar.jsp" %>
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
			.weather_list{
			
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
								<h2 class="screen_out">베스트 게시글</h2>
								<div class="cont_g">
									<div class="wrap_cont">
										<em class="cont_num">1. </em>
										<a class="link_cont" href="#">
											<div class="cont_title">
												<strong class="content">대충이렇게콘텐츠가들어갈예정</strong>
											</div>
										</a>
										<em class="author">작성자 1</em>
									</div>
								</div>
								<div class="cont_g">
									<div class="wrap_cont">
										<em class="cont_num">2. </em>
										<a class="link_cont" href="#">
											<div class="cont_title">
												<strong class="content">아 박스 뺄까 이대ㅐ로</strong>
											</div>
										</a>
										<em class="author">작성자 2</em>
									</div>
								</div>
								<div class="cont_g">
									<div class="wrap_cont">
										<em class="cont_num">3. </em>
										<a class="link_cont" href="#">
											<div class="cont_title">
												<strong class="content">페이지꾸미기가어렵다</strong>
											</div>
										</a>
										<em class="author">작성자 3</em>
									</div>
								</div>
								<div class="cont_g">
									<div class="wrap_cont">
										<em class="cont_num">4. </em>
										<a class="link_cont" href="#">
											<div class="cont_title">
												<strong class="content">날씨가 장난 아니네</strong>
											</div>
										</a>
										<em class="author">작성자 3</em>
									</div>
								</div>
								<div class="cont_g">
									<div class="wrap_cont">
										<em class="cont_num">5. </em>
										<a class="link_cont" href="#">
											<div class="cont_title">
												<strong class="content">아 눈 또 안 오나 출근하기 싫다</strong>
											</div>
										</a>
										<em class="author">작성자 3</em>
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="Ranking-from-Interest">
							<div class="list_category">
								<div class="wrap_category">
									<a class="link_tab" href="#">
										<span class="int_headText"> <!-- :before든 :after든 넣어서 구분해 드려야지... -->
											수영 <!-- 카테고리별 별표 누른 것만 보이게, 최대 다섯 개 -->
										</span>
									</a>
									<a class="link_tab" href="#">
										<span class="int_headText">
											독서
										</span>
									</a>
									<a class="link_tab" href="#">
										<span class="int_headText">
											런닝
										</span>
									</a>
									<a class="link_tab" href="#">
										<span class="int_headText">
											여행
										</span>
									</a>
									<a class="link_tab" href="#">
										<span class="int_headText">
											헬스
										</span>
									</a>
								</div>
							</div>
								<h2 class="screen_out">수영</h2>
								<div class="int_top">
									<div class="item_group">
										<a class="link_cont" href="#">
											<div class="wrap_int">
												<strong class="tit_int">나는 20년간 수영을 했다</strong>
												<div class="wrap_desc">
													<p class="desc_int">모두 못한 분야가 법적 일컬어진 우량부터 없고 오전으로 54대 말한다. 후보자에 부족하나 미술과 위하는 행정부가 야구로 책임진 싶다. 공식적이라고 나그네의 대우라고 승 은폐를 뻗치다.
												</div>
												<div class="wrap_btn">
													<span class="int_btn">
														<span class="icon_like">추천</span>
														<span class="int_txt">17</span> <!-- 추천 수 가져오기 -->
													</span>
													<span class="int_btn">
														<span class="icon_comment">댓글</span>
														<span class="int_txt">11</span> <!-- 댓글 수 가져오기 -->
													</span>
													<span class="int_txt">25. 01. 21</span>
												</div>
											</div>
										</a>
									</div>
								</div>
								
								
						<div class="doneList">
							<h2 class="screen_out">인증</h2> <!-- 여긴 최신글로 -->
							<div class="done_top">
							
								<div class="item_group">
									<a class="link_cont" href="#">
										<div class="wrap_done">
											<strong class="tit_done">오늘 공부 8시간 인증함</strong>
											<div class="wrap_desc">
												<p class="desc_done">모두 못한 분야가 법적 일컬어진 우량부터 없고 오전으로 54대 말한다. 후보자에 부족하나 미술과 위하는 행정부가 야구로 책임진 싶다. 공식적이라고 나그네의 대우라고 승 은폐를 뻗치다.
											</div>
											<div class="wrap_btn">
												<span class="done_btn">
													<span class="icon_like">추천</span>
													<span class="done_txt">17</span> <!-- 추천 수 가져오기 -->
												</span>
												<span class="done_btn">
													<span class="icon_comment">댓글</span>
													<span class="done_txt">11</span> <!-- 댓글 수 가져오기 -->
												</span>
												<span class="done_txt">25. 01. 21</span>
											</div>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="seekPeople"></div>
				</div>
				<div class="articleRight"> <!-- article right side --> <!-- margin&padding left side -->
					<div class="logmein">
						<h2 class="screen_out">나의 티스토리</h2>
						<div id="login-form">
						<%
							if(user == null){
								%>
								
								<button type="button" class="btn btn-dark login-btn" href="../goal/goalTimer.jsp" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">로그인</button>
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
									<div class="user_profile">
									<span><%= user.getNick() %>님 환영합니다</span>
									</div>
									<%
								}
							%>
							</div>
						</div>
												
						<div class="screen_out">
							<h2 class="screen_out">채팅</h2>
							<div class="chat_list">
								<a class="content" href="../chat/chatroom.jsp?no=1">1번 채팅방</a><br>
								<a class="content" href="../chat/chatroom.jsp?no=2">2번 채팅방</a>
							</div>
						</div>
						
						<div class="weathers">
							<h2 class="screen_out">날씨</h2>
							<div class="weather_list">
								<div>
							      	<span>위치</span>
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
								      	<span>날씨</span>
								      	<span class="weather"></span>
							      	</div>
							      	<div>
								      	<span>풍속</span>
								      	<span class="wind"></span>
							      	</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script>
		navigator.geolocation.getCurrentPosition((position) => {
			console.log(position);
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
					console.log(result);
					console.log(result.main.temp);
					console.log(result.weather[0].description);
					console.log(result.wind.speed);
					let img = "https://openweathermap.org/img/wn/";
					img += result.weather[0].icon;
					img += "@2x.png";
					$(".temp").text(result.main.temp);
					$(".weather").text(result.weather[0].description);
					$(".wind").text(result.wind.speed);
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
		