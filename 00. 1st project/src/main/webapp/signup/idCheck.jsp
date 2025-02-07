<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	
	UserDAO dao = new UserDAO();
	int result = dao.idCheck(id);
	out.print(result);
	
%>