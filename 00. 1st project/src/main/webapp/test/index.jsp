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
		  background-color: #1e213f;
		  color: #d7e0ff;
		}
		.container {
		  text-align: center;
		  width: 100%;
		  padding: 10px 0;
		}
		
		.timer {
		  display: inline-block;
		  padding: 10px;
		  width: 600px;
		  box-sizing: border-box;
		}
		h1 {
		  font-size: 2em;
		  width: 8ch;
		  margin: 20px auto;
		}
		.button-container {
		  margin-top: 20px;
		  display: flex;
		  justify-content: center;
		}
		.button {
		  background-color: #2e325a;
		  color: #fff;
		  border: none;
		  border-radius: 5px;
		  padding: 10px 20px;
		  margin: 5px;
		  cursor: pointer;
		}
		.button:hover {
		  background-color: #f87070;
		}
		.hidden {
		  display: block;
		}
		.timer-display {
		  font-size: 5em;
		  margin-top: 20px;
		  font-weight: bold;
		}
		#buttons {
		  margin-top: 20px;
		}
		#start,
		#stop,
		#reset {
		  background-color: #2e325a;
		  color: #fff;
		  border: none;
		  border-radius: 5px;
		  padding: 10px 20px;
		  margin: 10px;
		  cursor: pointer;
		}
		
		#reset:hover {
		  background-color: #808080;
		}
		
		#stop:hover {
		  background-color: tomato;
		}
		#start:hover {
		  background-color: #219a52;
		}
		 #timer-message {
		   color: white;
		   background-color: tomato;
		   display: none;
		   padding: .5em;
		   font-size: 1em;
		   text-align: center;
		   border-radius: 1em;
		      }
    </style>
</head>

<body>
    <div id="timer-message">Please select a timer before starting.</div>

	<div class="container">
	      <div class="timer">
	        <h1>🍅 Pomodoro Timer</h1>
	
	        <div class="button-container">
	          <button class="button" id="pomodoro-session">Pomodoro</button>
	          <button class="button" id="short-break">Short Break</button>
	          <button class="button" id="long-break">Long break</button>
	        </div>
	
	        <div id="pomodoro-timer" class="timer-display" data-duration="25.00">
	          25:00
	        </div>
	
	        <div id="short-timer" class="timer-display" data-duration="5.00">
	          5:00
	        </div>
	
	        <div id="long-timer" class="timer-display" data-duration="10.00">
	          10:00
	        </div>
	
	        <div id="buttons">
	          <button id="start">START</button>
	          <button id="stop">STOP</button>
	          <button id="reset">RESET</button>
	        </div>
	      </div>
	    </div>

</body>
<script>
let pomodoro = document.getElementById("pomodoro-timer");
let short = document.getElementById("short-timer");
let long = document.getElementById("long-timer");
let currentTimer = null;

function showDefaultTimer() {
  pomodoro.style.display = "block";
  short.style.display = "none";
  long.style.display = "none";
}

showDefaultTimer();

function hideAll() {
  let timers = document.querySelectorAll(".timer-display");
  timers.forEach((timer) => (timer.style.display = "none"));
}

document
  .getElementById("pomodoro-session")
  .addEventListener("click", function () {
    hideAll();

    pomodoro.style.display = "block";
    currentTimer = pomodoro;
  });
document
  .getElementById("short-break")
  .addEventListener("click", function () {
    hideAll();

    short.style.display = "block";
    currentTimer = short;
  });
document
  .getElementById("long-break")
  .addEventListener("click", function () {
    hideAll();

    long.style.display = "block";
    currentTimer = long;
  });

let myInterval = null;

function startTimer(timerdisplay) {
  if (myInterval) {
    clearInterval(myInterval);
  }

  timerDuration = timerdisplay
    .getAttribute("data-duration")
    .split(":")[0];
  console.log(timerDuration);

  let durationinmiliseconds = timerDuration * 60 * 1000;
  let endTimestamp = Date.now() + durationinmiliseconds;

  myInterval = setInterval(function () {
    const timeRemaining = new Date(endTimestamp - Date.now());

    if (timeRemaining <= 0) {
      clearInterval(myInterval);
      timerdisplay.textContent = "00:00";
      const alarm = new Audio(
        "https://www.freespecialeffects.co.uk/soundfx/scifi/electronic.wav"
      );
      alarm.play();
    } else {
      const minutes = Math.floor(timeRemaining / 60000);
      const seconds = ((timeRemaining % 60000) / 1000).toFixed(0);
      const formattedTime = `${minutes}:${seconds.toString().padStart(2, "0")}`;
      console.log(formattedTime);
      timerdisplay.textContent = formattedTime;
    }
  }, 1000);
}

document.getElementById("start").addEventListener("click", function () {
  if (currentTimer) {
      startTimer(currentTimer);
      document.getElementById("timer-message").style.display = "none"; 
  } else {
      document.getElementById("timer-message").style.display = "block";
  }
});

document.getElementById("stop").addEventListener("click", function () {
  if (currentTimer) {
    clearInterval(myInterval);
  }
});
</script>
</html>