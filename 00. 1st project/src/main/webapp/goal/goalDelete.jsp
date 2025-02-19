<%@page import="goal.goalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String goalNo = request.getParameter("goalNo");

	if(goalNo == null) {
		out.print("fail");
		return;
	}
	
	if(goalNo.isEmpty()){
		out.print("fail");
		return;
	}

	goalDAO dao = new goalDAO();
	dao.goalDelete(goalNo);
	out.print("success");
	
%>
