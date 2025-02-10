<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bno = request.getParameter("no");
	
	if(bno == null){
		response.sendRedirect("board.jsp");
		return;
	}
	
	if(bno.isEmpty()){
		response.sendRedirect("board.jsp");
		return;
	}
	
	BoardDAO bdao = new BoardDAO();
	bdao.deleteBoard(bno);
	response.sendRedirect("board.jsp");
	
%>