<%@page import="timer.TimerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String time = request.getParameter("time");
	String timeNo = request.getParameter("timeNo");
	String id = request.getParameter("id");
	
	if(time == null || timeNo == null || id == null){
		out.print("fail");
		return;
	}
	
	if(time.isEmpty() || timeNo.isEmpty() || id.isEmpty()){
		out.print("fail");
		return;
	}
	
	TimerDAO tdao = new TimerDAO();
	tdao.endTime(timeNo, time, id);
	out.print("success");
	
	
	
%>