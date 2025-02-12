<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Good Life</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<link rel="stylesheet" href=https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css>
	<link rel="stylesheet" href=https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js>
	<link rel="stylesheet" href=https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js>
	<link rel="stylesheet" href=https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/ed2cfa7d40.js" crossorigin="anonymous"></script>
	<style>
		.mb-5 {
		    margin-bottom: 0 !important;
		}
		
		.nav-container{
			background-color: white;
			height: 82px;
		}
		.bi-alarm {
			margin-left: 25px;
			margin-right: 25px;
			font-size: 2rem;
		}
		.bi-alarm:hover {
			color: #c40000;
		}
		.btn-dark {
			padding: 0 23px;
			box-sizing: border-box;
			font-size: 13px;
			height: 40px;
			min-width: 120px;
			line-height: 38px;
			border-radius: 30px;
			margin-left: 50px;
		}
		.btn-dark:hover {
			color: white;
			background-color: #c40000;
			border: none;
			line-height: 40px;
		}
		.nav-item {
			color:var(--bs-black);
			position: relative;
			margin: 0 5px 0 10px;
			padding: 4px 2px;
			font-size: 17px;
			font-weight: 600;
		}
		.nav-link {
			color: var(--bs-black);
		}
		.nav-link:hover {
			color: #c40000;
		}
		
		.input-box {
			position: relative;
			right: 60px;
		}

		.fa-search {
			position: absolute;
			left: 240px;
			bottom: 15px;
			top:11px;
			color:#ced4da;
		}
	
		.form-control {
			padding: .375rem 1.3rem;
			font-size: 0.8rem;
			width: 150%;
			height: 38px;
			background-color:#ffffff;
			border-radius: 30px;
		}
	
		.form-control:focus {
			background-color: #ffffff;
			box-shadow: none;
			border-color: #ced4da;
		}
		
		.bi-x-circle-fill {
			position: absolute;
			bottom: 8px;
			left: 212px;
			color: #5b5b5b;
		}
		
		.fa-bell {
			font-size: 1.5rem;
			margin-left: 4rem;
			margin-right: 2rem;
			margin-top: .13rem;
		}
		
		.fa-bell:hover {
			color: #c40000;
		}
		
		.bi-person-circle {
			font-size: 2.5rem;
			margin-right: 1rem;
			color: #7aabff;
		}
		
		.bi-person-circle:hover {
			color: #000000;
		}
		
	</style>
	</head>
		<body>
		
			<nav class="navbar navbar-expand-lg nav-container shadow-sm p-3 mb-5 rounded">
			
			  <div class="container-fluid">
			  
			    <a class="navbar-brand" href="#"><i class="bi-alarm"></i></a>
			    
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			    
			      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			      
			        <li class="nav-item">
			          <a class="nav-link" href="#">홈</a>
			        </li>
			        
			        <li class="nav-item">
			          <a class="nav-link" href="#">목표</a>
			        </li>
			        
			        <li class="nav-item">
			          <a class="nav-link" href="#">커뮤니티</a>
			        </li>
			        
			        <li class="nav-item">
			          <a class="nav-link" href="#">마켓</a>
			        </li>
			        
			      </ul>
			      
 				<div class="input-box">
	                <input type="text" class="form-control" placeholder="검색어 입력">
 					<i class="bi bi-x-circle-fill"></i>	                
	                <i class="fa fa-search"></i>                    
                </div>
			      
			    <!-- <a class="btn btn-dark" href="#" role="button">시작하기</a> -->

			    <i class="fa-solid fa-bell"></i>
			    <i class="bi bi-person-circle"></i>
			      
				</div>
				  
			    </div>
			    
			</nav>
			
		</body>
</html>












































