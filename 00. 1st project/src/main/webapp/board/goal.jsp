<%@page import="goal.goalVO"%>
<%@page import="java.util.List"%>
<%@page import="goal.goalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../main/navbar.jsp" %>
<%
	
	if(user == null){
		response.sendRedirect("../main/home.jsp");
		return;
	}

	goalDAO dao = new goalDAO();
	List<goalVO> list = dao.selectAll(user.getId());
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/ed2cfa7d40.js" crossorigin="anonymous"></script>
<style>
	#goal {
		padding-top: 41px;
	}
	
	#whole-wrap {
		justify-content: center;
		display: flex;
		flex-wrap: nowrap;
		position: relative;
		width: 1216px;
		margin: 0 auto;	
		padding: 0 30px;
		flex-direction: row;
	}
	
	.mypage{
		height: 100%;
		position: relative;
	}
	
	.mypage > div{
		position : absolute;
		bottom : 90px;
		left : 50%;
		transform:translate(-50%,0%);
	}
	
	.mypage-wrap {
		border: 1px solid black;
		border-radius: 10px;
		min-width: 300px;
		text-align: center;
		min-height: 500px;
		max-height: 500px;
	} 
	
	.profile-pic {
		font-size: 70px;
		border: 3px solid black;
	    border-radius: 50%;
	    padding: 15px 20px 18px 20px;
	}
	
	.percentage {
		margin-top: 30px;
	}
	
	.user-name {
		margin-top: 30px;
	}
	
	.user-intro {
		margin-top: 10px;
	}
	
	.each-goal {
		position:relative;
		display: block;
		flex-direction: column;
		border: 1px solid black;
		border-radius: 10px;
		padding-left: 10px;
		min-width: 600px; 
		min-height: 100px;
    	margin-bottom: 10px;
    	align-items: baseline;
    	padding-top: 18px;
    	padding-left: 30px;
	}
	
	#progress {
        position: absolute;
        appearance: none;
      }
      
    #progress::-webkit-progress-value {
        background: black;
        border-radius: 10px;
        height: 10px;
        width: 48px;
      }
    
    .whole-per::-webkit-progress-bar {
        background: white;
        border-radius: 12px;
        border: 1px solid black;
        height: 12px;
        width: 200px;
        overflow: hidden;
      }
      
      .goal-per::-webkit-progress-bar {
        background: white;
        border-radius: 12px;
        border: 1px solid black;
        height: 15px;
        width: 400px;
        overflow: hidden;
      }
      
      .goal-edit {
      	position: relative;
      	float: right;
      	margin: 0 10px 0 0;
      }
      
      .editCom {
      	position: relative;
      	float: right;
      	color: white;
      	background: #343A40;
      	border: none;
      	border-radius: 10%;
      }
      
      .editCom:hover {
      	background: #c40000;
      }
      
      .goal-wrap {
      	margin-left: 50px;
      }
      
      .goal-per { 	
      	margin: 45px auto;
      }
      
      .goal-cont {
      	margin-left: 10px;
      	font-size: 18px;
      	display: flex;
    	align-items: center;
      }
      
      .profile-edit {
      	float: right;
      	margin: 10px 10px 0 0 ;
      }
      
      .contents {
      	display: flex;
      }
      
      .ic-plus{
    	position: absolute;
	    left: calc(50% + 50px);
	    
	    transform: translate(calc(-50%), 0%);
	    font-size: 35px;
	    margin-top: 20px;
	    border: 1px solid black;
	    border-radius: 50%;
	    padding: 3px 4px 0px 3px;
      }
      
</style>
</head>
<body>
	<div id="mypage-goal">
		<div id="goal">
		<div id="whole-wrap">
			
			<div class="mypage-wrap">
				<div class="mypage">
					<i class="profile-edit fa-solid fa-ellipsis-vertical"></i>
					<div>
						<i class="profile-pic fa-regular fa-user"></i>
						<div class="percentage">전체 목표의 40%</div>
						<progress id="progress" class="whole-per mypage-progress" value="40" min="0" max="100" style="position: relative; margin-top: 10px"></progress>
						<h2 class="user-name">성이름</h2>
						<div class="user-intro">자기소개</div>
					</div>
				</div>				
			</div>
			
			
			<div class="goal-wrap">
			
				<%
					for(int i = 0; i < list.size(); i ++){
						goalVO vo = list.get(i);
						String goalNo = vo.getGoalNo();
						String goalTime = vo.getGoalTime();
						String goalTitle = vo.getGoalTitle();
						String goalCont = vo.getGoalCont();
						%>
							<div class="each-goal">
								<i class="goal-edit fa-solid fa-ellipsis-vertical"></i>
								<button class="editCom">완료</button>
								<div class="contents">
									<div class="goal-pic"></div>
									<h3 class="goal-title"><%= goalTitle %></h3>
									<div class="goal-cont"><%= goalCont %></div>
									<progress id="progress" class="goal-per" value="0" min="0" max="100"></progress>
								</div>
							</div>
						<%
					}
				%>
			
				<!-- <div class="each-goal">
					<i class="goal-edit fa-solid fa-ellipsis-vertical"></i>
					<button class="editCom">완료</button>
					<div class="contents">
						<div class="goal-pic"></div>
						<h3 class="goal-title">목표1</h3>
						<div class="goal-cont">목표1설명</div>
						<progress id="progress" class="goal-per" value="35" min="0" max="100"></progress>
					</div>
				</div> -->
				
				<i class="fa-solid fa-plus ic-plus" id="goal-add"></i>
				
			</div>
		</div>
		</div>
	</div>
</body>
<script>
	$("#goal-add").click(function(){

		//ajax로 다른 jsp에 데이터 전달하고 해당 jsp에서 insert
		$.ajax({
			url : "goaladd.jsp",
			type : "post",
			data : {
				title : "목표",
				content : "목표 설명",
				time : 0,
				id : "<%= user.getId() %>"
			},
			success : function(result){
				console.log(result);
			},
			error : function(){
				console.log("error");
			}
		
		})
		
		let html = '<div class="each-goal">';
		html +=			'<i class="goal-edit fa-solid fa-ellipsis-vertical"></i>';
		html +=			'<div class="contents">';
		html +=				'<div class="goal-pic"></div>';
		html +=				'<h3 class="goal-title">목표</h3>';
		html +=				'<div class="goal-cont">목표 설명</div>';
		html +=				'<progress id="progress" class="goal-per" value="0" min="0" max="100"></progress>';
		html +=			'</div>'
		html +=		'</div>';
		
		$("#goal-add").before(html);
	});
	
	
</script>
</html>