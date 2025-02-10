<%@page import="push.PushDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bno = request.getParameter("bno");
	String userId = request.getParameter("uId");
	

	if(bno == ""){
		out.print("error");
		return;
	}
	
	if(bno.isEmpty()){
		out.print("error");
		return;
	}
	
	PushDAO pdao = new PushDAO();
	pdao.clickPush(userId, bno);

	out.print("success");
	
%>