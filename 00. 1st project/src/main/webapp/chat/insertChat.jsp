<%@page import="chatuser.ChatuserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String chatNo = request.getParameter("chatNo");
	if(id == null || chatNo == null){
		out.print("fail");
		return;
	}
	
	if(id.isEmpty() || chatNo.isEmpty()){
		out.print("fail");
		return;
	}
	
	ChatuserDAO cudao = new ChatuserDAO();
	cudao.insertChatUser(id, chatNo);
	out.print("success");
	
	
%>