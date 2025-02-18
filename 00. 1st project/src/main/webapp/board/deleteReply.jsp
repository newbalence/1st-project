<%@page import="reply.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String rno = request.getParameter("rno");
	
	if(rno == null){
		out.print("fail");
		return;
	}
	
	if(rno.isEmpty()){
		out.print("fail");
		return;
	}
	
	ReplyDAO rdao = new ReplyDAO();
	rdao.dropReply(rno);
	out.print("success");
	
%>