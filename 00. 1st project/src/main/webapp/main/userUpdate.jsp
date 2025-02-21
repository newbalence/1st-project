<%@page import="user.UserVO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String hobby = request.getParameter("hobby");
	String userType = request.getParameter("type");
	
	if(id == null || hobby == null || userType == null){
		out.print("fail");
		return;
	}
	
	if(id.isEmpty() || hobby.isEmpty() || userType.isEmpty()){
		out.print("fail");
		return;
	}
	
	UserDAO udao = new UserDAO();
	UserVO uvo = new UserVO();
	uvo.setId(id);
	uvo.setHobby(hobby);
	uvo.setUserType(userType);
	
	
	udao.delete(id, userType);
	udao.modify(uvo);
	out.print("success");
	
%>