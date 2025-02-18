<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="pomodoro.css">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>

	<div class="pomodoro-wrap">
	    <div class="timer-container">
	
	        <div id="timer" class="timer">
	            <div class="cover1"></div>
	
	            <div id="lines">
	
	            </div>
	
	            <div id="fins">
	
	            </div>
	
	            <div id="num-container">
	
	            </div>
	
	            <div class="cover2"></div>
	        </div>
	    </div>
	
	    <div class="time-container">
	        <div id="remain-time" class="remain-time"></div>
	        <div id="total-time" class="total-time"></div>
	    </div>
	
	    <div class="button-container">
	        <button id="control" class="control"><i class="fas fa-pause"></i></button>
	    </div>
    </div>

    <script src="pomodoro.js"></script>
</body>
</html>