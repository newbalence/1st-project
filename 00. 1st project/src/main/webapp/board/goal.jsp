<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#goal {
		padding-top: 41px;
	}
	
	#whole-wrap {
		display: flex;
		flex-wrap: nowrap;
		position: relative;
		width: 1216px;
		margin: 0 auto;	
		padding: 0 30px;
		flex-direction: row;
	}
	
	.mypage-wrap {
		align-items: flex-end;
		border: 1px solid black;
		margin-top: 10px;
		min-width: 300px;
		text-align: center;
	}
	
	.each-goal {
		display: flex;
		flex-wrap: wrap;
		position: relative;
		border: 1px solid black;
		padding-left: 10px;
		min-width: 600px; 
	}
	
	#progress {
        position: absolute;
        margin-bottom: 17px;
        appearance: none;
      }
    
    #progress::-webkit-progress-bar {
        background: white;
        border-radius: 12px;
        border: 1px solid black;
        height: 10px;
        width: 200px;
        overflow: hidden;
      }
      
     #progress::-webkit-progress-value {
        background: black;
        border-radius: 0px;
        height: 10px;
        width: 48px;
      }
</style>
</head>
<body>
	<div id="mypage-goal">
		<div id="goal">
		<div id="whole-wrap">
			
			<div class="mypage-wrap">
				<div class="profile-edit"></div>
				<div class="profile-pic"></div>
				<div class="percentage">전체 목표의 40%</div>
				<progress id=progress class="whole-per" value="40" min="0" max="100"></progress>
				<h2 class="user-name">성이름</h2>
				<div class="user-intro">자기소개</div>				
			</div>
			
			<div class="goal-wrap">
				<div class="each-goal">
					<div class="goal-edit"></div>
					<div class="goal-pic"></div>
					<h3 class="goal-title">목표1</h3>
					<div class="goal-cont">목표1설명</div>
					<progress id=progress class="goal-per" value="35" min="0" max="100"></progress>
				</div>
				<div class="each-goal">
					<div class="goal-edit"></div>
					<div class="goal-pic"></div>
					<h3 class="goal-title">목표2</h3>
					<div class="goal-cont">목표2설명</div>
					<progress id=progress class="goal-per" value="60" min="0" max="100"></progress>
				</div>
				<div class="each-goal">
					<div class="goal-edit"></div>
					<div class="goal-pic"></div>
					<h3 class="goal-title">목표3</h3>
					<div class="goal-cont">목표3설명</div>
					<progress id=progress class="goal-per" value="50" min="0" max="100"></progress>
				</div>
				<div class="each-goal">
					<div class="goal-edit"></div>
					<div class="goal-pic"></div>
					<h3 class="goal-title">목표4</h3>
					<div class="goal-cont">목표4설명</div>
					<progress id=progress class="goal-per" value="70" min="0" max="100"></progress>
				</div>
				
			</div>
		</div>
		</div>
	</div>
</body>
</html>