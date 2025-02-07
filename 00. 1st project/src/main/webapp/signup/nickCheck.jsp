<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String nick = request.getParameter("nickCheck");
	
	UserDAO dao = new UserDAO();
	int result = dao.nickCheck(nick);
	out.print(result);
	
%>