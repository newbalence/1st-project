<%@page import="chatuser.ChatuserDAO"%>
<%@page import="chatroom.ChatroomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	
	String id = request.getParameter("id");
	String chatTitle = request.getParameter("chatTitle");
	
	if(id == null || chatTitle == null){
		out.print(0);
		return;
	}
	
	if(id.isEmpty() || chatTitle.isEmpty()){
		out.print(0);
		return;
	}
	
	ChatroomDAO crdao = new ChatroomDAO();
	String cno = crdao.insertChatRoom(chatTitle);
	ChatuserDAO cudao = new ChatuserDAO();
	cudao.insertChatUser(id, cno);
	out.print(cno);
	
%>