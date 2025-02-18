<%@page import="goal.goalVO"%>
<%@page import="goal.goalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String goalTitle = request.getParameter("title");
	String goalCont = request.getParameter("content");
	String goalTime = request.getParameter("time");
	String id = request.getParameter("id");
	
	if(goalTitle == null || goalCont == null || goalTime == null || id == null ){
		out.print(0);
		return;
	}
	
	if(goalTitle.isEmpty() || goalCont.isEmpty() || goalTime.isEmpty() || id.isEmpty() ){
		out.print(0);
		return;
	}
	
	goalDAO dao = new goalDAO();
	goalVO vo = new goalVO();
	
	vo.setGoalTitle(goalTitle);
	vo.setGoalCont(goalCont);
	vo.setGoalTime(goalTime);
	vo.setId(id);
	
	int result = dao.goalAdd(vo);
	out.print(result);
	
%>