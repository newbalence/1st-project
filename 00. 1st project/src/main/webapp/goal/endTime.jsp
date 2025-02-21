<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="timer.TimerVO"%>
<%@page import="timer.TimerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String time = request.getParameter("time");
	String timeNo = request.getParameter("timeNo");
	String id = request.getParameter("id");
	String no = request.getParameter("no");
	
	if(time == null || timeNo == null || id == null || no == null){
		out.print("fail");
		return;
	}
	
	if(time.isEmpty() || timeNo.isEmpty() || id.isEmpty() || no.isEmpty()){
		out.print("fail");
		return;
	}
	
	TimerDAO tdao = new TimerDAO();
	TimerVO vo = tdao.endTime(timeNo, time, id, no);
	
	ObjectMapper mapper = new ObjectMapper();
	
	String jsonString = mapper.writeValueAsString(vo);
	
	out.print(jsonString);
	
%>