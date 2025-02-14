<%@page import="chatuser.ChatuserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String chatNo = request.getParameter("chatNo");
	
	if(id == null || chatNo == null){
		out.print(-1);
		return;
	}
	
	if(id.isEmpty() || chatNo.isEmpty()){
		out.print(-1);
		return;
	}
	
	ChatuserDAO cudao = new ChatuserDAO();
	int count = cudao.userCheck(id, chatNo);
	
	out.print(count);
	
%>