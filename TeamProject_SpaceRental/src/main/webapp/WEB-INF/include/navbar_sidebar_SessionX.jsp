<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--로그인 되지 않은 상태 --%>
<%--네비바--%>
<nav class="navbar bg-body-tertiary">
	<div class="container-fluid">
		<div class="ml-3" >
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