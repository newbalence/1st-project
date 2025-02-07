<%@page import="jakarta.mail.MessagingException"%>
<%@page import="jakarta.mail.Transport"%>
<%@page import="jakarta.mail.Message"%>
<%@page import="jakarta.mail.internet.InternetAddress"%>
<%@page import="jakarta.mail.internet.MimeMessage"%>
<%@page import="jakarta.mail.PasswordAuthentication"%>
<%@page import="jakarta.mail.Authenticator"%>
<%@page import="jakarta.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	
	if(email == null){
		out.print("fail");
		return;
	}
	
	if(email.isEmpty()){
		out.print("fail");
		return;
	}
	
	String code = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuwxyz";
	String emailcode = "";
	
	for(int i = 0; i < 6 ; i++){
		int random = (int)(Math.random() * code.length());
		
		char text = code.charAt(random);
		emailcode += text;
	}
	
//	네이버 smtp 서버 주소
	String host = "smtp.naver.com";
	
//	네이버 메일 주소(발송자)
	String sender = "ehrud1218@naver.com";
	
//	네이버 계정 비밀번호(2차인증번호)
	String password = "QPR5CNKHEGGD";
	
//	메일 제목
	String title = "테스트 이메일";
	
//	메일 본문
	String body = "";
	body += "<div>";
	body += 	"<span>이메일 인증 번호는 : </span>";
	body += 	"<span style='color:red;'>" + emailcode + "</span>";
	body += "</div>";
	
//	메일 전송 정보를 담는 객체 생성
	Properties props = new Properties();
	
//	smtp서버 정보를 담기
	props.put("mail.smtp.host", host);
	props.put("mail.smtp.port", "465");
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.ssl.enable", "true");
	props.put("mail.smtp.ssl.trust", host);
	
	Session mailSession = Session.getInstance(props, new Authenticator() {
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(sender, password);
		}
	});
	
	
//	메일 발송
	MimeMessage message = new MimeMessage(mailSession);
	
	try {
//		발송자 정보
		message.setFrom(new InternetAddress(sender));
		
//		수신자 정보
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
		
//		메일 제목
		message.setSubject(title);
		
//		메일 내용
		message.setContent(body, "text/html; charset=utf-8");
		
//		전송
		Transport.send(message);
		out.print(emailcode);
		
	} catch (MessagingException e) {
		e.printStackTrace();
		out.print("fail");
	}
	
%>