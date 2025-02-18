<%@page import="favorit.favoritDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String boardType = request.getParameter("boardType");
	
	if(id == null || boardType == null){
		out.print("fail");
		return;
	}
	
	if(id.isEmpty() || boardType.isEmpty()){
		out.print("fail");
		return;
	}
	
	favoritDAO fdao = new favoritDAO();
	fdao.clickFavorit(id, boardType);
	out.print("success");
	
	
%>