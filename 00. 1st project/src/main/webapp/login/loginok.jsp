<%@page import="user.UserVO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String referer = request.getHeader("referer");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	System.out.println(id);
	System.out.println(pw);
	
	if(id == null || pw == null){
		out.print(0);
		return;
	}
	
	if(id.isEmpty() || pw.isEmpty()){
		out.print(0);
		return;
	}
	
	UserDAO dao = new UserDAO();
	UserVO vo = new UserVO();
	vo.setId(id);
	vo.setPw(pw);
	
	UserVO user = dao.login(vo);
	if(user == null){
		out.print(0);
		return;
	}
	session.setAttribute("user", user);
	out.print(referer);
%>