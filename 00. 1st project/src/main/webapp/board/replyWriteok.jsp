<%@page import="reply.ReplyVO"%>
<%@page import="reply.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bno = request.getParameter("no");
	String rauthor = request.getParameter("rauthor");
	String rcontent = request.getParameter("rcontent");
	
	if(bno == null || rauthor == null || rcontent == null){
		out.print(0);
		return;
	}
	
	if(bno.isEmpty() || rauthor.isEmpty() || rcontent.isEmpty()){
		out.print(0);
		return;
	}
	
	ReplyDAO rdao = new ReplyDAO();
	ReplyVO rvo = new ReplyVO();
	rvo.setBno(bno);
	rvo.setRauthor(rauthor);
	rvo.setRcontent(rcontent);
	
	int result = rdao.write(rvo);
	out.print(result);
	
%>