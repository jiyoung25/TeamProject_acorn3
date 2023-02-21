<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--로그인 된 상태 -->
<!--네비바-->
<nav class="navbar bg-body-tertiary">
	<div class="container-fluid">
		<div class="ml-5" >
        	<a class="navbar-brand" href="${pageContext.request.contextPath}/"><p class="fs-3 fw-semibold  " >Ubiquitous</p></a>
    	</div>
      	<div class="row">
      		<p class="fs-6 text-secondary">
         		<div class="col">
            		<a class="navbar-brand" href="#"><strong>${sessionScope.id }</strong>님 반갑습니다.</a>
 					<a class="navbar-brand" href="${pageContext.request.contextPath}/users/logout"><small>로그아웃</small></a>      		
         	
           			<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
            			<span class="navbar-toggler-icon"></span>
           			</button>
         		</div>
         	</p>
    	</div>
	</div>
</nav>  