<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String type = request.getParameter("type");
	
	if(id == null || type == null || id.isEmpty() || type.isEmpty()){
		out.print("fail");
		return;
	}
	
	UserDAO udao = new UserDAO();
	udao.delete(id, type);
	session.invalidate();
	out.print("success");
	
%>