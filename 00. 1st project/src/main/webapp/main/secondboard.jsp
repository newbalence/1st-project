<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String boardType = request.getParameter("boardType");
	
	if(boardType == null || boardType.isEmpty()){
		out.print("fail");
		return;
	}
	
	BoardDAO bdao = new BoardDAO();
	List<BoardVO> list = bdao.secondtBoard(boardType);
	
	if(list == null){
		out.print("fail");
		return;
	}
	
	ObjectMapper mapper = new ObjectMapper();
	String data = mapper.writeValueAsString(list);
	
	out.print(data);
%>