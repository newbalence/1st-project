<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp" %>
<%
	if(user == null){
		response.sendRedirect("../main/main.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	    <meta charset="UTF-8" />
	    <title>갓 생 살기</title>
	    <style>
	    	html{
	    		height: 100%;
    		    margin: 0px;
    		    padding : 0px;
	    	}
	    	body{
	    		height: 100%;
	    		margin: 0px;
    		    padding : 0px;
	    	}
	    	.container{
    		    height: calc(100% - 65px);
	    		display: flex;
			    align-items: center;
			    justify-content: space-around;
	    	}
	    	.timer-box {
			  display: flex;
			  flex-direction: column;
			  align-items: center;
			}
			
			.timer {
			  font-size: 60px;
			  margin-bottom: 30px;
			  transition: all 1s;
			}
			.timer-form__Btn {
			  display: flex;
			  flex-direction: row;
			  justify-content: center;
			  text-align: center;
			  padding-bottom: 25px;
			}
			.timerBtn {
			  height: 30px;
			  width: 100px;
			  border-radius: 25px;
			  margin-left: 10px;
			  display: flex;
			  justify-content: center;
			  align-items: center;
			}
			
			.timerBtn i {
			  font-size: 22px;
			  transition: all 0.2s ease-in-out;
			  cursor: pointer;
			}
			.timerBtn i:active,
			.timerBtn i:hover {
			  font-size: 30px;
			}
			
			.start {
			  margin: 50px;
			  bottom: 30px;
			  font-size: 100px;
			  margin: 0px;
			  padding: 0px;
			}
			
			.start + div > .timerBtn:nth-child(1) {
			  display: none;
			}
			.stop + div > .timerBtn:nth-child(2) {
			  display: none;
			}
			
			.timer-list{
			    direction: rtl;
			    text-align: left;
				display:flex;
				flex-direction: column;
				overflow-y: scroll;
    			max-height: 500px;
			}
			
			.timer-list::-webkit-scrollbar-track{
			  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
			  border-radius: 10px;
			  background-color: #F5F5F5;
			}
			
			.timer-list::-webkit-scrollbar{
			  width: 12px;
			  background-color: #F5F5F5;
			}
			
			.timer-list::-webkit-scrollbar-thumb{
			  border-radius: 10px;
			  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
			  background-color: #555;
			}
			
			.timer-list > div{
				height : 50px;
				border : 1px solid black;
				background-color : black;
				color : white;
				margin : 5px;
				border-bottom-right-radius: 10px;
    			border-top-right-radius: 10px;
			}
			.check{
				text-align: left;
				direction: ltr;
			}
	    </style>
	</head>
	<body>
		<div class="container">
			<div class="timer-list">
				<% 
					for(int i = 0; i < 20; i ++){
						%>
						<div class="check">
							<div>2025-01-24</div>
							<span>13 : 48 - 15 : 35</span>
							<span>(1시간 20분)</span>
						</div>
						<%
					}
				%>
			</div>
			<div class="timer-box">
	      		<div class="timer js-timer stop">00:00:00</div>
	      		<div class="timer-form__Btn">
			        <div class="timerBtn js-timer__startBtn">
			        	<i class="fas fa-play"></i>
			        </div>
	        		<div class="timerBtn js-timer__stopBtn">
	          			<i class="fas fa-pause"></i>
	        		</div>
	        		<div class="timerBtn js-timer__resetBtn">
	          			<i class="fas fa-stop"></i>
	        		</div>
	      		</div>
	    	</div>
    	</div>
  	</body>
	<script>
	const timer = document.querySelector('.js-timer'),
	stopBtn = document.querySelector('.js-timer__stopBtn'),
	startBtn = document.querySelector('.js-timer__startBtn'),
	resetBtn = document.querySelector('.js-timer__resetBtn');
	
	let TIME = 0;
	let cron;
	let timeno = 0;
	let id = "<%= user.getId() %>";
	let timeNo = 0;
	
	function startButton() {
		if(TIME > 0){
			TIME--;
		}
	  updateTimer();
	  stopButton();
	  cron = setInterval(updateTimer, 1000);
	  timer.classList.add('start');
	  timer.classList.remove('stop');
	  
	  if(timeNo != 0 ){
		return;
	  }else{
		  $.ajax({
				url : "startTime.jsp",
				type : "post",
				data : {
					id : id
				},
				success : function(result){
					let no = result.trim()
					timeNo = no;
				},
				error : function(){
					console.log("에러 발생");
				}
			});
		    
	  }
	  
	  
	}
	
	function stopButton() {
	  clearInterval(cron);
	  timer.classList.add('stop');
	  timer.classList.remove('start');
	}
	
	function resetButton() {
	  timer.innerText = `00:00:00`;
	  stopButton();
	  timer.classList.add('stop');
	  timer.classList.remove('start');
	  if(timeNo == 0){
		  return;
	  }
	  $.ajax({
		 url : "endTime.jsp",
		 type : "post",
		 data : {
			 time : TIME,
			 timeNo : timeNo,
			 id : id
		 },
		 success : function(result){
			 console.log(result.trim());
			 if(result.trim() == "success"){
				 
				 let html = "";
				 html += "<div class='check'>";
				 html += 	"<div>기록된 날짜</div>"
				 html +=	"<span>12 : 48 - 14 : 08</span>"
				 html +=	"<span>(1시간 20분)</span>"
				 html += "</div>"
				 $(".timer-list").append(html);
				 
				 TIME = 0;
				 timeNo = 0;
				 
				 
			 }
		 },
		 error : function(){
			 console.log("에러 발생");
		 }
	  });
	  
	}
	
	function updateTimer() {
	  const hours = Math.floor(TIME / 3600);
	  const checkMinutes = Math.floor(TIME / 60);
	  const seconds = TIME % 60;
	  const minutes = checkMinutes % 60;
	  
	  timer.innerText = hours.toString().padStart(2,"0") + ":" + minutes.toString().padStart(2,"0") + ":" + seconds.toString().padStart(2,"0")
	
	  TIME++;
	  /* console.log(TIME - 1); */
	}
	
	function init() {
	  startBtn.addEventListener('click', startButton);
	  stopBtn.addEventListener('click', stopButton);
	  resetBtn.addEventListener('click', resetButton);
	}
	init();
	</script>
</html>