<%@page import="timer.TimerVO"%>
<%@page import="java.util.List"%>
<%@page import="timer.TimerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp" %>
<%
	if(user == null){
		response.sendRedirect("../main/main.jsp");
		return;
	}
	
	TimerDAO tdao = new TimerDAO();
	List<TimerVO> list = tdao.selTime(user.getId());
	
%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
		<script src="https://cdn.jsdelivr.net/npm/dayjs@1/dayjs.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/dayjs@1/plugin/duration.js"></script>
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
			    justify-content: space-between;;
	    	}
	    	.timer-box {
			  display: flex;
			  flex-direction: column;
			  align-items: center;
		      margin: auto;
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
    			max-height: 70%;
    			display: flex;
				flex-direction: column;
				overflow: auto;
				font-size: 30px;
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
				height: 200px;
			    border: 1px solid #3C3C3C;
			    background-color: #3C3C3C;
			    color: white;
			    margin: 5px;
			    border-bottom-right-radius: 100px;
			    border-top-right-radius: 100px;
			}
			.check{
				text-align: left;
				direction: ltr;
				padding : 15px;
			}
	    </style>
	</head>
	<body>
		<div class="container">
			<div class="timer-list">
				<% 
					for(int i = 0; i < list.size(); i ++){
						TimerVO tvo = list.get(i);
						String tid = tvo.getId();
						String startTime = tvo.getStartTime();
						String endTime = tvo.getEndTime();
						int allTime = tvo.getAllTime();
						int addTime = tvo.getAddTime();
						String date = startTime.substring(0, 10);
						String sTime = startTime.substring(11, 19);
						String eTime = endTime != null ? endTime.substring(11, 19) : "";
						
						int allDay = allTime / 60 / 60 / 24;
						int allHour = (allTime / 60 / 60) - (allDay * 24);
						int allMinute = (allTime / 60) - (allDay * 24 + allHour) * 60; 
						int allSecond = allTime - ((allDay * 24 + allHour) * 60 + allMinute) * 60;
						
						int addDay = addTime / 60 / 60 / 24;
						int addHour = (addTime / 60 / 60) - (addDay * 24);
						int addMinute = (addTime / 60) - (addDay * 24 + addHour) * 60; 
						int addSecond = addTime - ((addDay * 24 + addHour) * 60 + addMinute) * 60;

						%>
						<div class="check">
							<div><%= date %></div>
							<div>
								<span><%= sTime %> - <%= eTime %></span>
								<span>(<%= allDay > 0 ? allDay : 0 %>일 <%= allHour > 0 ? allHour : 0 %>시간 <%= allMinute > 0 ? allMinute : 0 %>분 <%= allSecond > 0 ? allSecond : 0%>초)</span>
							</div>
							<span>총 합 시간 : <%= addDay > 0 ? addDay : 0 %>일 <%= addHour > 0 ? addHour : 0 %>시간 <%= addMinute > 0 ? addMinute : 0 %>분 <%= addSecond > 0 ? addSecond : 0%>초</span>
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
	
	$(document).ready(function(){
		$(".timer-list").scrollTop($(".timer-list")[0].scrollHeight);
	})
	
	dayjs.extend(window.dayjs_plugin_duration)
	
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
			 time : TIME - 1,
			 timeNo : timeNo,
			 id : id
		 },
		 success : function(result){
			 if(result.trim() != "fail"){
				 const data = JSON.parse(result.trim());
				 let html = "";
				 html += "<div class='check'>";
				 html += 	"<div>" + data.startTime.split(" ")[0] + "</div>"
				 html += 	"<div>"
				 html +=	"<span>" + data.startTime.split(" ")[1]+" - "+data.endTime.split(" ")[1] + "</span>&nbsp;"
				 html +=	"<span>(" + dayjs.duration(data.allTime, 'seconds').format('D[일] H[시간] m[분] s[초]') + ")</span>"
				 html +=	"</div>"
				 html +=	"<span>총 합 시간 : "+dayjs.duration(data.addTime, 'seconds').format('D[일] H[시간] m[분] s[초]')+"</span>"
				 html += "</div>"
				 $(".timer-list").append(html);
				 
				 TIME = 0;
				 timeNo = 0;
				 
				 $(".timer-list").scrollTop($(".timer-list")[0].scrollHeight);
				 
				 
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
	
	$(window).on('beforeunload', function() {
		resetButton();
	});
	
	
	</script>
</html>