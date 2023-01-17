<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<style>
		.space_list{
			border: 1px solid black;
			display: inline-block;
		}
	</style>
<title>느어엉</title>
</head>
<body>
	<div class="container">
		<h3>공간 리스트</h3>
		<section>
        	<div class="container px-5">
            	<div class="row gx-5 align-items-center">
                	<div class="col-lg-6">
                    	<div class="p-5"><img class="img-fluid rounded-circle" src="https://cdn-icons-png.flaticon.com/512/4599/4599564.png" alt="..."></div>
                	</div>
                	<div class="col-lg-6">
                    	<div class="p-5">
		                   	<h2 class="display-4">스터디룸</h2>
		                	<p>내용</p>
                    	</div>
                	</div>
            	</div>
        	</div>
    	</section>
    	<section class="cta">
        	<div class="cta-content">
            	<div class="container px-5">
                	<h2 class="text-white display-1 lh-1 mb-4">
                    	Stop waiting.
                    	<br>
                   		Start building.
                	</h2>
               		 <a class="btn btn-outline-light py-3 px-4 rounded-pill" href="https://startbootstrap.com/theme/new-age" target="_blank">Download for free</a>
            	</div>
        	</div>
    	</section>
    	<div class="row gx-5 mb-5 m-5">
    		<c:forEach var="tmp" items="${list }">
        		<div class="col-lg-3 mb-5 ">
            		<a class="card lift h-100" href="${pageContext.request.contextPath}/space/detail?cate_num=${cate_num}&space_num=${tmp.space_num}" >
            			<%--아래는 임시 이미지 --%>
                		<img class="card-img-top" src="https://source.unsplash.com/2d4lAQAlbDA/800x500" alt="..." />
                		<div class="card-body row">
                			<div class="col-8">
	                    		<h4 class="card-title mb-2">${tmp.space_name }</h4>
	                    		<p class="card-text">${tmp.addr }</p>
                    		</div>
                		</div>
                		<div class="card-footer bg-transparent border-top d-flex align-items-center justify-content-between">
		                    <div class="small text-primary">See more</div>
		                    <div class="small text-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></div>
		                </div>
		            </a>
		    	</div>
		   	</c:forEach>
		</div>
		
		<nav>
			<ul class="pagination">
				<%--
					startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
					&condition=${condition}&keyword=${encodedK}
				 --%>
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="list?cate_num=${cate_num }&pageNum=${startPageNum-1 }&condition=${condition}&keyword=${encodedK}">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li class="page-item ${pageNum eq i ? 'active' : '' }">
						<a class="page-link" href="list?cate_num=${cate_num }&pageNum=${i }&condition=${condition}&keyword=${encodedK}">${i }</a>
					</li>
				</c:forEach>
				<%--
					마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
				 --%>
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="list?cate_num=${cate_num }&pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedK}">Next</a>
					</li>
				</c:if>				
			</ul>
		</nav>
		
		<!-- footer include -->
	 	<jsp:include page="/WEB-INF/include/footer.jsp"/>	
		
		<!-- 검색 폼 
		<form action="list" method="get">
			<label for="condition">검색조건</label>	
			<select name="condition" id="condition">
				<option value="spaceName" ${condition eq 'spaceName' ? 'selected' : '' }>공간 이름</option>
			</select>
			<input type="text" name="keyword" placeholder="검색어..." value="${keyword }"/>
			<button type="submit">검색</button>
		</form>
		<c:if test="${not empty condition }">
			<p>
				<strong>${totalRow }</strong> 개의 자료가 검색 되었습니다.
				<a href="list">리셋</a>
			</p>
		</c:if>
		-->
		
	</div>
</body>
</html>