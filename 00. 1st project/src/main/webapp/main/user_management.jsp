<%@page import="java.util.List"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/navbar.jsp" %>
<%
	//로그인을 안했거나, 관리자가 아니라면 board.jsp로 이동
	if(user == null || !user.getUserType().equals("0")){
		response.sendRedirect("../main/home.jsp");
		return;
	}

	UserDAO dao = new UserDAO();
	List<UserVO> list = dao.getAllUser();
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>회원 관리</title>
	    <script src="../js/jquery-3.7.1.js"></script>
	    <style>
	        body {
	            font-family: 'Arial', sans-serif;
	            background: linear-gradient(135deg, #ffffff, #e8f0fe);
	            margin: 0;
	            padding: 0;
	            color: #333;
	        }
	        .user-container {
	            padding: 20px;
	            max-width: 900px;
	            margin: 40px auto;
	            background: white;
	            border-radius: 10px;
	            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	        }
	        h2 {
	            color: #2575fc;
	            text-align: center;
	            margin-bottom: 20px;
	        }
	        table {
	            width: 100%;
	            border-collapse: collapse;
	            margin-top: 20px;
	        }
	        th, td {
	            text-align: left;
	            
	            border: 1px solid #ddd;
	        }
	        th {
	       	 	padding: 10px;
	            background-color: #f4f4f4;
	            color: #333;
	        }
	        .action-buttons {
	            text-align: center;
	        }
	        .action-buttons button {
	            background: #2575fc;
	            color: white;
	            border: none;
	            padding: 5px 10px;
	            border-radius: 5px;
	            cursor: pointer;
	            font-size: 0.9rem;
	            margin-right: 5px;
	            transition: background 0.3s ease;
	        }
	        .action-buttons button:hover {
	            background: #1a5fc4;
	        }
	        .action-buttons button.delete {
	            background: #fc4d4d;
	        }
	        .action-buttons button.delete:hover {
	            background: #d43b3b;
	        }
	        select {
			   text-align-last: center;
			   text-align: center;
			   -ms-text-align-last: center;
			   -moz-text-align-last: center;
			}
			.select{
				text-align : center;
			}
	    </style>
	</head>
	<body>
	    <div class="user-container">
	        <h2>회원 관리</h2>
	        <table>
	            <thead>
	                <tr>
	                    <th>아이디</th>
	                    <th>이름</th>
	                    <th>닉네임</th>
	                    <th>이메일</th>
	                    <th>취미</th>
	                    <th>유저타입</th>
	                    <th>관리</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<%
	            		for(int i  = 0; i < list.size(); i++){
	            			UserVO vo = list.get(i);
	            			String id = vo.getId();
	            			String email = vo.getEmail();
	            			String nick = vo.getNick();
	            			String name = vo.getName();
	            			String hobby = vo.getHobby();
	            			String userType = vo.getUserType();
	            			%>
			                <tr style="color:<%= userType.equals("99") || userType.equals("2")  ? "red" : "black"%>">
			                    <td><%= id %></td>
			                    <td><%= name %></td>
			                    <td><%= nick %></td>
			                    <td><%= email %></td>
			                    <td class="select">
						            <select name="hobby">
										<option value="1" <%= hobby.equals("1") ? "selected" : "" %>>공부</option>
										<option value="2" <%= hobby.equals("2") ? "selected" : "" %>>독서</option>
										<option value="3" <%= hobby.equals("3") ? "selected" : "" %>>축구</option>
										<option value="4" <%= hobby.equals("4") ? "selected" : "" %>>런닝</option>
										<option value="5" <%= hobby.equals("5") ? "selected" : "" %>>헬스</option>
										<option value="6" <%= hobby.equals("6") ? "selected" : "" %>>여행</option>
						            </select>
			                    </td>
			                    <td class="select">
						            <select name="userType">
						            	<option value="1" <%= userType.equals("1") ? "selected" : "" %>>일반</option>
						            	<option value="2" <%= userType.equals("2") ? "selected" : "" %>>탈퇴</option>
						            	<option value="99" <%= userType.equals("99") ? "selected" : "" %>>차단</option>
						            	
						            </select>
			                    </td>
			                    <td class="action-buttons">
			                        <button class="modify-btn" onclick="modify(this)">수정</button>
			                    </td>
			                </tr>            			
	            			<%
	            		}
	            	%>
	
	            </tbody>
	        </table>
	    </div>
	</body>
	<script>
		
		function modify(obj){
			let index = $(".modify-btn").index(obj);
			let tr = $("tbody > tr").eq(index);
			let id = tr.children().eq(0).text();
			let hobby = tr.children().eq(4).children().val();
			let type = tr.children().eq(5).children().val();
			let firm = confirm(id + " 님의 정보를 수정하시겠습니까?");
			
			if(firm == true){
				$.ajax({
					url : "userUpdate.jsp",
					type : "post",
					data : {
						id : id,
						hobby : hobby,
						type : type
					},
					success : function(result){
						if(result.trim() == "success"){
							alert(id + " 님의 정보를 수정하였습니다.");
							if(type == "2" || type == "99"){
								tr.css("color", "red");
							}else{
								tr.css("color", "black");
							}
						}
					},
					error : function(){
						console.log("에러 발생");
					}
				});
			}
		}
		
	
		/* function deleteUser(userId, obj){
			let result = confirm(userId + "을 탈퇴하시겠습니까?");
			if(result == true && userId != null){
				$.ajax({
					url : "userOut.jsp",
					type : "post",
					data : {
						userId : userId
					},
					success : function(result){
						if(result.trim() == "success"){
							$(obj).parent().parent().css("color", "red");
							alert("탈퇴되었습니다.");
						}
					},
					error : function(){
						console.log("에러 발생");
					}
				});
			}
		} */
	</script>
</html>
