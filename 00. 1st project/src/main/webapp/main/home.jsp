<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
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
				padding: 0 20px;
			}
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
				width: 696px;
				padding: 0 20px;
				box-sizing: border-box;
			}
			
			.articleRight {
				position: relative;
				box-sizing: border-box;
				min-width: 460px;
				max-width: 460px;
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
									<div class="item_group">
										<a class="link_cont" href="#">
											<div class="wrap_int">
												<strong class="tit_int">듣지 중 군용으로 권고할 않다, 장 규모로 밀도는 오다.</strong>
												<div class="wrap_desc">
													<p class="desc_int">대선이나 아니다 일가를 준 요리가 예고하는데. 진료실이 생기게 있은 보아 초청할지 비닐하우스와 빠지면 문화가 거 마주치다 있다. 깨달음 있어야 건강한 극복하고자 장군, 인사가 나가자 발전부터 각목이 영원하다. 방의 바로 백골단이 회의까지 있는다.
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
									<div class="item_group">
										<a class="link_cont" href="#">
											<div class="wrap_int">
												<strong class="tit_int">신호등은 생각이라, 뉴스는 조선소와 절대, 차이를 하다.</strong>
												<div class="wrap_desc">
													<p class="desc_int">아닌 작으려고, 합디다 차장이 마음의 사라진다 많이 실팍하나 삶을 전위가 보세요. 말짱 요새에 시청자는 속담의 같는 들어가아 뻗치고 군댈, 발급받다. 거 컵이, 시집이고 길을 신체는, 친절한 전면은 학년 감독인 말한다.
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
									<div class="item_group">
										<a class="link_cont" href="#">
											<div class="wrap_int">
												<strong class="tit_int">전공도 한에 아프는 선달의 다가올 유행하다.</strong>
												<div class="wrap_desc">
													<p class="desc_int">나다 그러라 길일은 고장의 씨 빠르라. 할머니가 탄생의 한잔하려니와 그렇다 거 촉촉이 또래를 먹는다 생각되다 번거롭지. 대폭 위원장을 걸칠 식사한 둘까.
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
									<div class="item_group">
										<a class="link_cont" href="#">
											<div class="wrap_int">
												<strong class="tit_int">교황은 집처럼 감독으로 세계와 도중이 그러나 않다 받다.</strong>
												<div class="wrap_desc">
													<p class="desc_int">변덕쟁이가 그는 가하면 테이블이다 어떻으라면 다닐까. 대한 그렇다 연속극은 백자도 일도, 운영되라 망아지를 하다. 이 빚인 되다 상담을, 아득하여요.
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
								
								<div class="item_group">
									<a class="link_cont" href="#">
										<div class="wrap_done">
											<strong class="tit_done">결국에 대금의 공부를, 먹는 하에요.</strong>
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
								
								<div class="item_group">
									<a class="link_cont" href="#">
										<div class="wrap_done">
											<strong class="tit_done">다루어진 여자가 이렇고 그를 싶구나.</strong>
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
								
								<div class="item_group">
									<a class="link_cont" href="#">
										<div class="wrap_done">
											<strong class="tit_done">이 있어 범법이나 집념에, 산만한 맑은 있기, 전망합니다.</strong>
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
								
								<div class="item_group">
									<a class="link_cont" href="#">
										<div class="wrap_done">
											<strong class="tit_done">한 잘 관리가 보호할 마을부터 핵전쟁을 방법에 늦는다.</strong>
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
							<form method="post" action="#" id="login-form">
								<p class="desc_login">로그인하시고 더 많은 기능을 이용해 보세요!</p>
								<input type="text" name="userName" placeholder="아이디" autocomplete="off">
								<input type="password" name="userPassword" placeholder="비밀번호" autocomplete="off">
								<button type="button" class="login_btn">로그인</button>
								<button type="button" class="login_kkt">카카오 계정으로 시작하기</button>
								<div class="auth-container">
									<a class="findId" href="#">아이디/비밀번호 찾기</a>
									<a class="signup" href="#">회원가입</a>
								</div>
							</form>
						</div>
						
						<div class="weather">
							<h2 class="screen_out">날씨</h2>
							
						</div>
						
						<div class="chat_main">
							<h2 class="screen_out">채팅</h2>
							<div class="chat_list">
							
								<div class="chat_wrap">
									<a class="chat" href="#">
										<img src=""> <!-- 프로필 사진 -->
										<span class="chat_name">사용자</span>
										<span class="chat_cont">안녕하세요?</span>
									</a>								
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	</html>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	