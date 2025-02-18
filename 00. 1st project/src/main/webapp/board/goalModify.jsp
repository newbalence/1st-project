<%@page import="goal.goalDAO"%>
<%@page import="goal.goalVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//goal.jsp에서 전달한 4개의 데이터를 꺼낸다.
	//no, title, cont, time
	String no = request.getParameter("no");
	String title = request.getParameter("title");
	String cont = request.getParameter("cont");
	String time = request.getParameter("time");
	
	System.out.println(no);
	System.out.println(title);
	System.out.println(cont);
	System.out.println(time);
	
	goalVO vo = new goalVO();
	vo.setGoalNo(no);
	vo.setGoalTitle(title);
	vo.setGoalCont(cont);
	vo.setGoalTime(time);
	
	goalDAO dao = new goalDAO();
	dao.goalModify(vo);
	
	//ajax응답은 항상 텍스트
	out.print("success");
%>