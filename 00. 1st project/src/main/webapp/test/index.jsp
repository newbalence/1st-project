<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="pomo.css">
    <link rel="shortcut icon" href="img/tomato (2).ico" type="image/x-icon">
    <title>pomodoro</title>
    <style>
    	body {
		  background: url("https://static.pexels.com/photos/6663/desk-white-black-header.jpg") no-repeat center center fixed;
		  background-size: cover; 
		}
		.pomodoro {
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		  width: 500px;  
		  padding-top: 15px;
		  padding-bottom: 25px;  
		}
		p {
		  text-align: center;
		}
		.flip-clock-wrapper{
		  max-width: 460px;
		  margin: 3em auto 2em;
		  display: flex;
		  justify-content: center;
		}
		.col-md-4{
		  display: flex;
		  justify-content: center;
		}
		.col-md-2{
		  display: flex;
		  justify-content: center;
		  height: 34px;
		  align-items: center;
		}
		.counter{
		  display: flex;
		  justify-content: center;
		}
		.clock{
		  margin-top: 30px;
		}
		.container {
		  width: 500px;
		}
		.middle{
		    display:inline-block;
		}
		#btns{
		  display: flex;
		  justify-content: center;
		}
		#stop {
		  margin-left: 10px;
		  margin-right: 10px;
		}
		.btn {
		  background-color: #333333;
		  color: #CCCCCC;
		}
		#sessInc, #sessDec, #breakInc, #breakDec {  
		  font-weight: bold;
		}
		#stats {
		  background-color: #333333;
		  width: 220px;
		  height: 70px;  
		  border-radius: 10px;
		  color: #CCCCCC;
		  font-size: 45px;
		  text-align: center;
		}
		#statRow {
		  display: flex;
		  justify-content: center;
		  margin-bottom: 20px;
		}
    </style>
</head>

<body>
   <div class="pomodoro">
	  <div class="row">
	    <div class="col-md-6">
	      <div class="row"><p>session length<p></div>
	      <div class="row counter">
	        <div class="col-md-4">
	          <button class="btn btn-default" id="sessDec">-</button>        
	        </div>
	        <div class="col-md-2">
	          <div id="session"></div>
	        </div>
	        <div class="col-md-4">
	          <button class="btn btn-default" id="sessInc">+</button>
	        </div>
	      </div>
	    </div>
	
	    <div class="col-md-6">
	      <div class="row"><p>break length<p></div>
	      <div class="row counter">
	        <div class="col-md-4">
	          <button class="btn btn-default" id="breakDec">-</button>
	        </div>
	        <div class="col-md-2">
	          <div id="break"></div>
	        </div>
	        <div class="col-md-4">
	          <button class="btn btn-default" id="breakInc">+</button>        
	        </div>
	      </div>
	    </div>
	  </div>
	    
	  <div id="clock" class="row">
	    <div class="timer"><div class="middle"></div></div>
	  </div>
	  <div class="row" id="statRow">
	    <div id="stats"></div>
	  </div>
	  <div class="container">
	    <div class="row" id="btns">
	      <button class="btn btn-default btn-lg" id="start">start</button>
	      <button class="btn btn-default btn-lg" id="stop">stop</button>
	      <button class="btn btn-default btn-lg" id="clear">clear</button>
	    </div>
	  </div>
	     
	</div>

</body>
<script>
$(document).ready(function(){
	  var countS = 25;
	  $("#session").html(countS);
	  var countB = 5;
	  $("#break").html(countB);
	  var pos = "pomodoro";
	  var countLama;
	  var posLama;
	  var count;
	  $("#stats").html(pos);
	  var clock = $(".timer").FlipClock(0, {
	    countdown: true,
	    clockFace: 'MinuteCounter',
	    autoStart: false,
	    callbacks: {
	      interval: function(){
	        if (clock.getTime() == 0){
	          if (pos == "session"){
	            clock.setTime(countB*60);
	            clock.start();
	            pos = "break";
	            $("#stats").html(pos);
	          } else if (pos == "break"){
	            clock.setTime(countS*60);
	            clock.start();
	            pos = "session";
	            $("#stats").html(pos);
	          }
	        }        
	      }
	    }
	  })  
	  //SESSION
	  $("#sessInc").on("click", function(){
	    if ($("#session").html() > 0){
	      countS = parseInt($("#session").html());
	      countS+=1;
	      $("#session").html(countS);
	      //clock.setTime(countS*60);
	    }
	  });
	  $("#sessDec").on("click", function(){
	    if ($("#session").html() > 1){
	      countS = parseInt($("#session").html());
	      countS-=1;
	      $("#session").html(countS);
	      //clock.setTime(countS*60);
	    }
	  });
	  //BREAK
	  $("#breakInc").on("click", function(){
	    if ($("#break").html() > 0){
	      countB = parseInt($("#break").html());
	      countB+=1;
	      $("#break").html(countB);
	    }    
	  });
	  $("#breakDec").on("click", function(){
	    if ($("#break").html() > 1){
	      countB = parseInt($("#break").html());
	      countB-=1;
	      $("#break").html(countB);
	    }
	  });  
	  $("#start").on("click", function(){
	    if (count != countS || clock.getTime()==0){
	      clock.setTime(countS*60);
	      pos="session";
	      $("#stats").html(pos);
	    } else {
	      pos = posLama;
	      $("#stats").html(pos);
	    }
	    count = countS;    
	    clock.start();    
	  });
	  $("#stop").on("click", function(){
	    clock.stop();
	    countLama = clock.getTime();
	    posLama = $("#stats").html();
	  });
	  $("#clear").on("click", function(){
	    clock.stop();
	    pos = "pomodoro";
	    $("#stats").html(pos);
	    clock.setTime(0);
	  });
	});
</script>
</html>