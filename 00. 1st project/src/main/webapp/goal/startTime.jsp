<%@page import="timer.TimerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String no = request.getParameter("no");
	
	if(id == null || no == null){
		out.print(0);
		return;
	}
	
	if(id.isEmpty() || no.isEmpty()){
		out.print(0);
		return;
	}
	
	TimerDAO tdao = new TimerDAO();
	int timeNo = tdao.startTime(id, no);
	out.print(timeNo);
%>