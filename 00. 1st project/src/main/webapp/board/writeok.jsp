<%@page import="java.util.Enumeration"%>
<%@page import="board.BoardVO"%>
<%@page import="board.BoardDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/navbar.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String savePath = application.getRealPath("/upload");
	
	int maxFileSize = 1024 * 1024 * 10;
	
	File saveDir = new File(savePath);
	if(!saveDir.exists()){	//upload 폴더가 없으면
		saveDir.mkdirs();	//폴더를 생성한다.
	}
	
	MultipartRequest multi = new MultipartRequest(
		request,		//요청 객체
		savePath,		//저장 경로
		maxFileSize,	//파일 크기
		"utf-8",		//인코딩
		new DefaultFileRenamePolicy()
	);
	
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	String listType = multi.getParameter("type");
	
	if(title == null || content == null){
		response.sendRedirect("write.jsp");
		return;
	}
	
	if(title.isEmpty() || content.isEmpty()){
		response.sendRedirect("write.jsp");
		return;
	}
	
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	
	Enumeration files = multi.getFileNames();
	while(files.hasMoreElements()){
		String name = (String)files.nextElement();
		//write.jsp의 input file태그의 name 속성의 값들
		
		String fileName = multi.getFilesystemName(name);
		//업로드된 파일 이름
		
		String originFileName = multi.getOriginalFileName(name);
		//원본파일 이름
		
		vo.setLocation(savePath);
		//파일 업로드 경로
		
		vo.setUploadname(fileName);
		//업로드된 파일 이름
		
		vo.setOriginName(originFileName);
		//원본 파일 이름
		
		//파일 사이즈
		File uploadFile = new File(savePath + "/" + fileName);
		long fileSize = uploadFile.length();
		vo.setFileSize(fileSize);
		//바이트로 크기 변환

	}
	
	vo.setTitle(title);
	vo.setContent(content);
	vo.setBoardType(listType);
	vo.setAuthor(user.getId());
	
	int no = dao.insertBoard(vo);
	
	response.sendRedirect("post.jsp?bno="+ no + "&type=" + listType);
	
%>