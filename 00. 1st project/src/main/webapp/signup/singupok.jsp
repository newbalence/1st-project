<%@page import="user.UserDAO"%>
<%@page import="user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");	
	
	String id = request.getParameter("username");
	String pw = request.getParameter("password");
	String name = request.getParameter("name");
	String nick = request.getParameter("nickname");
	String email = request.getParameter("email");
	String hobby = request.getParameter("hobby");
	String gender = request.getParameter("gender");
	
	if(id == null || pw == null || name == null || nick == null || email == null || hobby == null || gender == null){
		response.sendRedirect("signup.jsp");
		return;
	}
	
	if(id.isEmpty() || pw.isEmpty() || name.isEmpty() || nick.isEmpty() || email.isEmpty() || hobby.isEmpty() || gender.isEmpty()){
		response.sendRedirect("signup.jsp");
		return;
	}
	
	UserVO vo = new UserVO();
	vo.setId(id);
	vo.setPw(pw);
	vo.setName(name);
	vo.setNick(nick);
	vo.setEmail(email);
	vo.setHobby(hobby);
	vo.setGender(gender);
	
	UserDAO dao = new UserDAO();
	dao.join(vo);
	
	response.sendRedirect("../main/home.jsp");
%>