<%@page import="favorit.favoritDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String boardType = request.getParameter("boardType");
	
	if(id == null || boardType == null){
		out.print(5);
		return;
	}
	
	if(id.isEmpty() || boardType.isEmpty()){
		out.print(5);
		return;
	}
	
	favoritDAO fdao = new favoritDAO();
	int count = fdao.clickFavorit(id, boardType);
	out.print(count);
	
	
%>