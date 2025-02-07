<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//ChatRoomDAO 호출 해서 insert
	int no = 1;
	response.sendRedirect("chatroom.jsp?no=" + no);
%>