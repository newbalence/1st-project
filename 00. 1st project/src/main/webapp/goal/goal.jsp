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
	double cal = dao.goalCal(user.getId());
	
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
		cursor: pointer;
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
        width: 100%;
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
      	width: 20px;
      	text-align: -webkit-center;
      	margin-right: 10px;
      	z-index: 1;
      	cursor: pointer;
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
     	min-width: 600px;
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
	    left: calc(50% + 175px);
	    transform: translate(calc(-50%), 0%);
	    font-size: 35px;
	    margin-top: 20px;
	    border: 1px solid black;
	    border-radius: 50%;
	    padding: 3px 4px 0px 3px;
      }
      
      .editBtn {
      	display: none;
      	position: absolute;
      	z-index: 1;
      	left: calc(50% + 185px);
      	cursor: pointer;
      }
      
      .editBtn a {
      	display: block;
      	font-size: 10px;
      	text-decoration: none;
      	padding: 10px 32px;
      	background-color: #dfdfdf;
      	color: black;
      }
      
      .editBtn a:hover {
      	background-color: #c40000;
      	color: white;
      }
      
      .editCom{
      	display: none;
      }
      .modify-input{
      	width: auto;
      	display: inline;
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
						<div class="percentage">전체 목표의 <%= cal %>%</div>
						<progress id="progress" class="whole-per mypage-progress" value="<%= cal %>" min="0" max="100" style="position: relative; margin-top: 10px"></progress>
						<h2 class="user-name"><%= user.getName() %></h2>
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
						int goalTimeNum = Integer.parseInt(goalTime);
						String goalTitle = vo.getGoalTitle();
						String goalCont = vo.getGoalCont();
						int cnt = vo.getCnt();
						%>
							<div class="each-goal" onclick="location.href='../goal/goalTimer.jsp?no=<%= goalNo %>'">
								<i class="goal-edit fa-solid fa-ellipsis-vertical" onclick="event.stopPropagation(); editMenu(this)"></i>
								<div class="editBtn" >
									<a onclick="event.stopPropagation(); modifyGoal(<%= goalNo %>, this)">수정</a>
									<a onclick="event.stopPropagation(); removeGoal(<%= goalNo %>, this)">삭제</a>
								</div>
								<button class="editCom">완료</button>
								<div class="contents">
									<div class="goal-pic"></div>
									<h3 class="goal-title"><%= goalTitle %></h3>
									<div class="goal-cont"><%= goalCont %></div>
									<div class="goal-time"><%= goalTime %></div>
									<progress id="progress" class="goal-per" value="<%= goalTimeNum != 0 ? (cnt / (double)(goalTimeNum * 60 * 60)) * 100 : 0 %>" min="0" max="100"></progress>
								</div>
							</div>
						<%
					}
				%>
				
				<i class="fa-solid fa-plus ic-plus" id="goal-add"></i>
				
			</div>
		</div>
		</div> 
	</div>
</body>
<script>
	function removeGoal(goalNo, obj){	/* 목표를 삭제하다 */
		let result = confirm("목표를 삭제하시겠습니까?");
		if(result == true){
			$.ajax({
				url: "goalDelete.jsp",
				type: "post",
				data: {
					goalNo: goalNo
				},
				success: function(result){
					if(result.trim() == "success"){
						$(obj).parent().parent().remove();
					} else {
						alert("삭제 실패");
					}
				},
				error: function(){
					console.log("에러 발생");
				}
			});
		}
	}
	
	//수정 확인버튼 클릭 시 동작하는 함수
	function modify(no, obj){
		//no가 수정 할 목표 번호
		//수정버튼 클릭 할 때 준다.
		
		//ajax 데이터 전송 4개
		//1. 번호 -> 첫번째 파라미터로
		//2. 제목 -> 내 이전, 이전, 이전 형제
		//3. 내용 -> 내 이전, 이전 형제
		//4. 시간 -> 내 이전 형제
		let title = $(obj).prev().prev().prev().val();
		//목표 제목
		
		let cont = $(obj).prev().prev().val();
		//목표 본문
		
		let time = $(obj).prev().val();
		//목표 시간
		
		console.log(no);
		console.log(title);
		console.log(cont);
		console.log(time);
		if(title.trim() == "" || cont.trim() == "" || time.trim() == ""){
			alert("제목 또는 본문, 시간은 필수 입력입니다.");
			return;
		}
		
		$.ajax({
			url : "goalModify.jsp",
			type : "post",
			data : {
				no : no,
				title : title,
				cont : cont,
				time : time
			},
			success : function(result){
				//result가 goalModify.jsp에서 out.print로 출력한 텍스트
				//성공시 success
				console.log(result.trim());
				if(result.trim() == "success"){
					//수정된 내용을 목표에 반영
					$(obj).parent().prev().children(".contents").children(".goal-title").text(title);
					$(obj).parent().prev().children(".contents").children(".goal-cont").text(cont);
					$(obj).parent().prev().children(".contents").children(".goal-time").text(time);
					//수정 입력창을 삭제
					$(obj).parent().remove();
				}
			}
		});
	}

	//수정버튼 클릭 시 동작하는 함수
	//첫번째 파라미터는 목표 번호. 파라미터를 받는 이유는 수정버튼 클릭 시 동적으로 생성되는 html의 확인 버튼에 번호를 넘겨주기 위해서
	function modifyGoal(no, obj){	/* input 타입을 추가해서 값을 입력 받는 방식 */
		console.log(obj);
			
		//수정버튼 클릭 시 modify-form 클래스를 가진 div를 전부 삭제
		//여러개 수정 한번에 못하게
		$(".modify-form").remove();
	
		const title = $(obj).parent().next().next().children(".goal-title").text();
		const cont = $(obj).parent().next().next().children(".goal-cont").text();
		const time = $(obj).parent().next().next().children(".goal-time").text();
		if($(obj).parent().parent().next("div.modify-form").length == 0){
			
			let html = "";
			html += "<div class='modify-form'>";
			html += 	"<input class='modify-input' type='text' value='"+title+"'>";
			html +=		"<input class='modify-input' type='text' value='"+cont+"'>";
			html += 	"<input class='modify-input' type='number' value='"+time+"'>";
			html += 	"<input class='modify-input' type='button' value='확인' onclick='modify("+no+", this)'>";
			html += 	"<input class='modify-input' type='button' value='취소' onclick='removeModify(this)'>";
			html += "</div>";
			
			$(obj).parent().parent().after(html);
		}
		$(".editBtn").css("display", "none");
		
		
		
		/* 항목 자체를 input 타입으로 만들어서 값을 입력 받는 방식 */
		/* input 타입에서 다시 h3, div로 변경도 해 줘야 함...... */
		/* const title = $(obj).parent().parent().children(".contents").children(".goal-title");
		title.replaceWith("<input type='text' value='"+title.text()+"'>");
		
		const cont = $(obj). parent().parent().children(".contents").children(".goal-cont");
		cont.replaceWith("<input type='text' value='"+cont.text()+"'>");
		
		const time = $(obj).parent().parent().children(".contents").children(".goal-time");
		time.replaceWith("<input type='number' value='"+time.text()+"'>");
		
		$(obj).parent().parent().children(".editCom").css("display", "block");
		
		$(".editBtn").css("display", "none"); */
	}
	
	function removeModify(obj){		/* 수정 - 취소 버튼 누르면 수정 input 삭제 */
		$(obj).parent().remove();
	}

	
	$("#goal-add").click(function(){

		//ajax로 다른 jsp에 데이터 전달하고 해당 jsp에서 insert
		$.ajax({
			url : "goalAdd.jsp",
			type : "post",
			data : {
				title : "목표",
				content : "목표 설명",
				time : 0,
				id : "<%= user.getId() %>"
			},
			success : function(result){
				console.log(result.trim());
				let html = '<div class="each-goal" onclick="location.href=`../goal/goalTimer.jsp?no='+result.trim()+'`">';
				html +=			'<i class="goal-edit fa-solid fa-ellipsis-vertical" onclick="event.stopPropagation(); editMenu(this)"></i>';
				html += 			'<div class="editBtn">';
				html +=					'<a onclick="event.stopPropagation(); modifyGoal('+result.trim()+', this)">수정</a>';
				html +=					'<a onclick="event.stopPropagation(); removeGoal(' + result.trim() + ', this)">삭제</a>';
				html +=				'</div>';
				html += 			'<button class="editCom">완료</button>';
				html +=			'<div class="contents">';
				html +=				'<div class="goal-pic"></div>';
				html +=				'<h3 class="goal-title">목표</h3>';
				html +=				'<div class="goal-cont">목표 설명</div>';
				html +=				'<div class="goal-time">0</div>';
				html +=				'<progress id="progress" class="goal-per" value="0" min="0" max="100"></progress>';
				html +=			'</div>'
				html +=		'</div>';
				
				$("#goal-add").before(html);
			},
			error : function(){
				console.log("error");
			}
		
		})
	});
	
	function editMenu(obj){
		
		if ($(obj).next().css("display") === 'none'){
			$(".editBtn").css("display", "none");
			$(obj).next().css("display", "block");
		} else {
			$(obj).next().css("display", "none");
		}
	}
</script>
</html>