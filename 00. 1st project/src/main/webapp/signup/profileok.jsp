<%@page import="user.UserVO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	UserVO user = (UserVO)session.getAttribute("user");
	
	String pw = request.getParameter("password");
	String nick = request.getParameter("nickname");
	String hobby = request.getParameter("hobby");
	String id = request.getParameter("username");
	
	if(id == null || id.isEmpty()){
		response.sendRedirect("../signup/myPage.jsp");
		return;
	}
	
	UserDAO udao = new UserDAO();
	UserVO uvo = new UserVO();
	
	uvo.setId(id);
	uvo.setPw(pw);
	uvo.setNick(nick);
	uvo.setHobby(hobby);
	
	udao.modify(uvo);
	
	if(pw != null || !pw.isEmpty()){
		user.setPw(pw);
	}
	
	if(nick != null || nick.isEmpty()){
		user.setNick(nick);
	}
	
	if(hobby != null || hobby.isEmpty()){
		user.setHobby(hobby);
	}
	
	session.setAttribute("user", user);
	response.sendRedirect("../main/main.jsp");
%>