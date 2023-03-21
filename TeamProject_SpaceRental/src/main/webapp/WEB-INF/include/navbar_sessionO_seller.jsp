<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	@media only screen and (max-width: 767px) {
	.navbar .btn {
		font-size: 14px;
		padding: 5px 10px;
	}
  
}
</style>
<!--로그인 된 상태 -->
<!--네비바-->
<nav class="navbar bg-body-tertiary">
	<div class="container-fluid">
    	<div class="ml-3" >
        	<a class="navbar-brand" href="${pageContext.request.contextPath}/"><p class="fs-3 fw-semibold  " >Ubiquitous</p></a>
        </div>
      	<div class="row">
      		<p class="fs-6">
     			<button class="btn btn-dark" onClick="location.href='${pageContext.request.contextPath}/seller/spaceinfo'">내 공간 등록하기</button>
        		<strong>${sessionScope.id }</strong>님
     			<a class="navbar-brand" href="${pageContext.request.contextPath}/users/logout"><small>로그아웃</small></a>
       			<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
        			<span class="navbar-toggler-icon"></span>
       			</button>
        	</p>
    	</div>
	</div>
</nav>  