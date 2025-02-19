<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src=https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js></script>
	<link rel="stylesheet" href=https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
	<script src="https://kit.fontawesome.com/ed2cfa7d40.js"></script>
<title>Insert title here</title>
<style>
	* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
	}
	
	.lnb {
		display: flex;
		margin: 0 auto;
		justify-content: center;
  		flex-wrap: nowrap;
    	background: white;
	}
	
	.menu-search {
		border: none;
		outline: none;
		margin: 0;
		padding-left: 20px;
		width: auto;
	}
	
	.menu-search:focus {
		outline: none;
		box-shadow: none;
	}
	
	a, a:active, a:visited {
	    text-decoration: none;
	    color: inherit;
	}
	
	a:hover {
	    color: inherit;
	    text-decoration: underline;
	}
	
	li {
	    list-style-type: none;
	    height: 60px;
	}
	
    .lnb>ul {
    	display: flex;
	      justify-content: center;
	      text-align: center;
	      padding-left: 0px;
      	background: transparent;
      	margin-bottom : 0px;
    }
    
    .lnb > ul > li{
    	background: transparent;
    }
    
    .lnb a {
    	display: block;
        width: 150px;
        height: 60px; 
        text-align: center; 
        background-color: transparent;
        color: black;
    }
    
    .com-menu {
	    line-height: 60px;
    }
    
    .subMenu { 
    	display: none; position: absolute;
    }
    
    .subMenu > li {
    	display : block;
    }
    
    .lnb>ul>li:hover .subMenu {
    	display: block;
    	padding-left : 0px;
    }
    
    .lnb>ul>li:hover>a { 
    	background-color: #c40000;
    	color: white;
    }
    
    .subMenu a:hover { 
    	background-color: #c40000;
    	color: white;
    }
    
    .search-box {
    	display: flex;
    	height: 60px;
    	justify-content: flex-end;
    }
    
    .search-icon {
    	height: 60px;
    	line-height: 60px;
    	font-size: 18px;
    	background-color: white;
    	padding-right: 10px;
    }
    
    input {
    	border-radius: 0;
    	height: 60px;
    }
	
	.box {
	    background-color: white;
	    width: 100%;
	    height: 60px;
	}
</style>
</head>
<body>
	<div class="lnb">
		<div class="box"></div>
		<div class="search-box">
			<input type="text" id="search" class="menu-search" autocomplete="off">
			<i onclick="searchMenu()" class="fa fa-search search-icon"></i>
		</div>
		
		<ul>
						
			<li><a href="#" class="com-menu" class="com-menu">전체</a>
				<ul class="subMenu">

				</ul>
			</li>
			
			<li><a href="#" class="com-menu" class="com-menu">실내취미</a>
				<ul class="subMenu">
					<li><a href="#" class="com-menu" class="com-menu">보드 게임</a></li>
					<li><a href="#" class="com-menu">캘리그래피</a></li>
					<li><a href="#" class="com-menu">요리</a></li>
					<li><a href="#" class="com-menu">코스프레</a></li>
					<li><a href="#" class="com-menu">영화/드라마</a></li>
					<li><a href="#" class="com-menu">뜨개질</a></li>
					<li><a href="#" class="com-menu">음악 감상</a></li>
					<li><a href="#" class="com-menu">종이접기</a></li>
				</ul>
			</li>
			
			<li><a href="#" class="com-menu">실외취미</a>
				<ul class="subMenu">
					<li><a href="#" class="com-menu">하이킹</a></li>
					<li><a href="#" class="com-menu">승마</a></li>
					<li><a href="#" class="com-menu">등산</a></li>
					<li><a href="#" class="com-menu">암벽등반</a></li>
					<li><a href="#" class="com-menu">러닝</a></li>
					<li><a href="#" class="com-menu">스쿠버 다이빙</a></li>
					<li><a href="#" class="com-menu">수영</a></li>
					<li><a href="#" class="com-menu">스키</a></li>
				</ul>
			</li>
			
			<li><a href="#" class="com-menu">수집취미</a>
				<ul class="subMenu">
					<li><a href="#" class="com-menu">피규어</a></li>
					<li><a href="#" class="com-menu">트레이딩 카드</a></li>
					<li><a href="#" class="com-menu">골동품 수집</a></li>
					<li><a href="#" class="com-menu">우표 수집</a></li>
					<li><a href="#" class="com-menu">주화 수집</a></li>
					<li><a href="#" class="com-menu">금속 탐지</a></li>
				</ul>
			</li>
			
			<li><a href="#" class="com-menu">경쟁취미</a>
				<ul class="subMenu">
					<li><a href="#" class="com-menu">축구</a></li>
					<li><a href="#" class="com-menu">야구</a></li>
					<li><a href="#" class="com-menu">체스</a></li>
					<li><a href="#" class="com-menu">바둑</a></li>
					<li><a href="#" class="com-menu">배드민턴</a></li>
					<li><a href="#" class="com-menu">당구</a></li>
					<li><a href="#" class="com-menu">포커</a></li>
					<li><a href="#" class="com-menu">마작</a></li>
				</ul>
			</li>
			
			<li><a href="#" class="com-menu">관찰취미</a>
				<ul class="subMenu">
					<li><a href="#" class="com-menu">여행</a></li>
					<li><a href="#" class="com-menu">타로</a></li>
					<li><a href="#" class="com-menu">천문</a></li>
				</ul>
			</li>
			
			<li><a href="#" class="com-menu">기타</a>
				<ul class="subMenu">
					<li><a href="#" class="com-menu">학습</a></li>
				</ul>
			</li>
			
		</ul>
		<div class="box"></div>
	</div>
</body>
<script>
	function searchMenu(){
		let search = $("#search");
		if(search.val().trim() == ""){
			return;
		}
		location.href = "../board/board.jsp?searchType=title&searchKeyword="+search.val();
	}
</script>
</html>