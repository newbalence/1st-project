<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session.removeAttribute("user");
	String referer = request.getHeader("referer");
	
	session.invalidate();
	response.sendRedirect(referer);
%>