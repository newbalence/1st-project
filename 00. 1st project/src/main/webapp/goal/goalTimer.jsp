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
	    	.timer-box {
			  display: flex;
			  flex-direction: column;
			  align-items: center;
			  margin-top: 125px;
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
	    </style>
	</head>
	<body>
		<div class="timer-box">
      		<div class="timer js-timer">00:00:00</div>
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
  	</body>
	<script>
	const timer = document.querySelector('.js-timer'),
	stopBtn = document.querySelector('.js-timer__stopBtn'),
	startBtn = document.querySelector('.js-timer__startBtn'),
	resetBtn = document.querySelector('.js-timer__resetBtn');
	
	let TIME = 0;
	let cron;
	let timeno = 0;
	
	function startButton() {
		if(TIME > 0){
			TIME--;
		}
	  updateTimer();
	  stopButton();
	  cron = setInterval(updateTimer, 1000);
	  timer.classList.add('start');
	}
	
	function stopButton() {
	  clearInterval(cron);
	  timer.classList.remove('start');
	}
	
	function resetButton() {
	  timer.innerText = `00:00:00`;
	  stopButton();
	  timer.classList.remove('start');
	  return (TIME = 0);
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