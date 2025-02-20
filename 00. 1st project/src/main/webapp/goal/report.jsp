<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보고서</title>
<style>

	#article {
		padding-top: 41px;
		display: flex;
		justify-content: center;
	}
	
	.innerContents > * {
		display: inline-block;
		min-width: 496px;
		margin: auto 30px;
	}
	
	.eachItem > * {
		display: inline-block;
	}
	
	h1 {
		color: #c40000;
	}
	
	.reportAll {
		border: 2px solid black;
		border-radius: 5px;
		padding: 20px;
		margin: 20px auto;
	}
	
	.reportSub {
		border: 2px solid black;
		border-radius: 5px;
		padding: 20px;
	}
	
	.eachItem {
		display: flex;
		justify-content: space-between;
		margin: 20px auto;
    	font-size: 20px;
	}
	
/* 	.eachItem:after {
		content: "";
		position: absolute;
		display: block;
		width: 100%;
		height: 1px;
		background-color: #f0f0f0;
	}
	 */
	.eachItem:before {
		border: 1px solid #090909;
	}
	
	
</style>
</head>
<body>
	<div id="main">
		<div id="article" class="article">
			<div class="innerContents">
			
				<div class="leftTimer">
				
					<h1>타이머</h1>
					
					<div class="reportAll">
						<div class="eachItem">
							<div class="numAtt">집중횟수</div>
							<div class="countNum">N 회</div>
						</div>
						<div class="eachItem">
							<div class="timeAtt">집중시간</div>
							<div class="countTime">N 분</div>
						</div>
					</div>
					
					<div class="reportSub">
						<div class="eachItem">
							<div class="monthlyAtt">이번 달 집중 횟수</div>
							<div class="countMonthly">N 회</div>
						</div>					
						<div class="eachItem">
							<div class="monthlyTime">이번 달 집중 시간</div>
							<div class="count-MonTime">N 분</div>
						</div>					
						<div class="eachItem">
							<div class="monthlyDate">이번 달 집중한 날</div>
							<div class="countDate">N / N 회</div>
						</div>					
						<div class="eachItem">
							<div class="achiveNum">완료한 목표 개수</div>
							<div class="countAchive">N 개</div>
						</div>					
						<div class="eachItem">
							<div class="avgTime">평균 집중 시간</div>
							<div class="countAvg">N 분</div>
						</div>					
					</div>
				</div>
				
				
				<div class="rightPomodoro">
					<h1>뽀모도로</h1>
					
					<div class="reportAll">
						<div class="eachItem">
							<div class="numAtt">집중횟수</div>
							<div class="countNum">N 회</div>
						</div>
						<div class="eachItem">
							<div class="timeAtt">집중시간</div>
							<div class="countTime">N 분</div>
						</div>
					</div>
					
					<div class="reportSub">
						<div class="eachItem">
							<div class="monthlyAtt">이번 달 집중 횟수</div>
							<div class="countMonthly">N 회</div>
						</div>					
						<div class="eachItem">
							<div class="monthlyTime">이번 달 집중 시간</div>
							<div class="count-MonTime">N 분</div>
						</div>					
						<div class="eachItem">
							<div class="monthlyDate">이번 달 집중한 날</div>
							<div class="countDate">N / N 회</div>
						</div>					
						<div class="eachItem">
							<div class="sessionNum">완료한 목표 개수</div>
							<div class="countSession">N 개</div>
						</div>					
						<div class="eachItem">
							<div class="avgTime">평균 집중 시간</div>
							<div class="countAvg">N 분</div>
						</div>					
					</div>
				</div>
				
			</div>
		</div>		
	</div>
</body>
</html>