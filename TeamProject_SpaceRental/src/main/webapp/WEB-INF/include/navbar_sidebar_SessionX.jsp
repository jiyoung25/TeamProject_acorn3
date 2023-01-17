<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Space Rental</title>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="icon" type="image/x-icon" href="assets/ficon.ico" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
   

<%--로그인 되지 않은 상태 --%>
<%--네비바--%>
<nav class="navbar bg-body-tertiary">
	<div class="container-fluid">
		<div class="ml-5" >
			<a class="navbar-brand" href="${pageContext.request.contextPath}/"><p class="fs-3 fw-semibold" >Ubiquitous</p></a>
        </div>
	    <div class="row">
	         <div class="col">
	            <a class="navbar-brand" href="${pageContext.request.contextPath}/users/loginform"><p class="fs-6 text-secondary " >Login</p></a>
	         </div>
	         <div class="col">
	            <a class="navbar-brand" href="${pageContext.request.contextPath}/users/signupform"><p class="fs-6 text-secondary " >Signup</p></a>
	         </div>
	         <div class="col">
	           <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
	            <span class="navbar-toggler-icon"></span>
	           </button>
	         </div>
		</div>
	</div>
     

    <%--사이드바--%>
	<div class="offcanvas offcanvas-end " tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
		<div class="offcanvas-header ">
          	<h5 class="offcanvas-title mx-auto" id="offcanvasNavbarLabel">My Page</h5>
          	<button type="button" class="btn-close " data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <div class="container">
                <div class="text-center m-5">
                    <!-- 로그인 안 되어있을때 사진-->
                    <img class="img-fluid rounded-circle mb-1" src="https://cdn-icons-png.flaticon.com/512/61/61205.png" alt="..." style="max-width: 150px; max-height: 150px">
                </div>
            
                <p class="text-center fst-italic">로그인 또는 회원가입이 필요합니다.</p>
                
                <br>
                
                <%-- 로그인 및 회원가입 버튼 --%>
                <div class=" container">
                	<!-- 로그인버튼 -->
                    <div class="row mx-auto" style="width: 200px;">
                    	<button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/users/loginform' ">login</button>
                    </div>
                        
                    <br>
                    <%-- 회원가입버튼 --%>
                    <div class="row mx-auto " style="width: 200px;">
                    	<button type="button" class="btn btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/users/signupform' ">sign up</button>
                    </div>
                </div>
        	</div>
        </div>
    </div>
</nav>