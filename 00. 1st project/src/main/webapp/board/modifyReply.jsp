<%@page import="reply.ReplyVO"%>
<%@page import="reply.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String rcontent = request.getParameter("rcontent");
	String rno = request.getParameter("rno");
	
	if(rcontent == null || rno == null){
		out.print("fail");
		return;
	}
	
	if(rcontent.isEmpty() || rno.isEmpty()){
		out.print("fail");
		return;
	}
	
	ReplyDAO rdao = new ReplyDAO();
	ReplyVO rvo = new ReplyVO();
	
	rvo.setRno(rno);
	rvo.setRcontent(rcontent);
	
	
	rdao.modify(rvo);
	out.print("success");
	
%>