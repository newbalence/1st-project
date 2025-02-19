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
	}
	
	.menu-search {
		border: none;
		outline: none;
		margin: 0;
		padding-left: 20px;
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
	    height: 50px;
	}
	
    .lnb>ul {display: flex;
      justify-content: center;
      text-align: center;
    }
    
    .lnb a {
    	display: block;
        width: 150px;
        height: 50px; 
        text-align: center; 
        line-height: 50px;
        background-color: white;
        color: black;
    }
    
    .subMenu { 
    	display: none; position: absolute;
    }
    
    .lnb>ul>li:hover .subMenu {
    	display: block;
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
    	height: 50px;
    	justify-content: flex-end;
    }
    
    .search-icon {
    	height: 50px;
    	line-height: 50px;
    	font-size: 18px;
    	background-color: white;
    	padding-right: 10px;
    }
    
    input {
    	border-radius: 0;
    	height: 50px;
    }
	
</style>
</head>
<body>
	<div class="lnb">
		
		<div class="search-box">
			<input type="text" id="search" class="menu-search" autocomplete="off">
			<i onclick="searchMenu()" class="fa fa-search search-icon"></i>
		</div>
		
		<ul>
						
			<li><a href="#">전체</a>
				<ul class="subMenu">
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
				</ul>
			</li>
			
			<li><a href="#">실내취미</a>
				<ul class="subMenu">
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
				</ul>
			</li>
			
			<li><a href="#">실외취미</a>
				<ul class="subMenu">
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
				</ul>
			</li>
			
			<li><a href="#">수집취미</a>
				<ul class="subMenu">
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
				</ul>
			</li>
			
			<li><a href="#">경쟁취미</a>
				<ul class="subMenu">
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
				</ul>
			</li>
			
			<li><a href="#">관찰취미</a>
				<ul class="subMenu">
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
				</ul>
			</li>
			
			<li><a href="#">기타</a>
				<ul class="subMenu">
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
				</ul>
			</li>
			
		</ul>
	
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