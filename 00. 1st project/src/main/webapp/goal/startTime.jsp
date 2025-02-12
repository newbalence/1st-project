<%@page import="timer.TimerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	
	if(id == null){
		out.print(0);
		return;
	}
	
	if(id.isEmpty()){
		out.print(0);
		return;
	}
	
	TimerDAO tdao = new TimerDAO();
	int timeNo = tdao.startTime(id);
	out.print(timeNo);
%>