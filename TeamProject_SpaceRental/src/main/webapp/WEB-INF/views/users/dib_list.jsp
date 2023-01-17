<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>나의 찜 목록</title>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet"/>
<!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>찜한 목록</h1>
		<ul>
			<c:forEach var="tmp" items="${list }">
				<li>
					<a href="${pageContext.request.contextPath}/space/detail?cate_num=${tmp.cate_num}&space_num=${tmp.space_num}">공간 이름: ${tmp.space_name }
				</li>
			</c:forEach>
		</ul>
		<table class="table align-middle mb-0 bg-white">
		  <thead class="bg-light">
		    <tr>
		      <th>업체명</th>
		      <th>위치</th>
		      <th>전화번호</th>
		      <th>예약하기</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>
		        <div class="d-flex align-items-center">
		          <img
		              src="https://mdbootstrap.com/img/new/avatars/8.jpg"
		              alt=""
		              style="width: 45px; height: 45px"
		              class="rounded-circle"
		              />
		          <div class="ms-3">
		            <p class="fw-bold mb-1">00노래방</p>
		          </div>
		        </div>
		      </td>
		      <td>
		        <p class="fw-normal mb-1">행당동 xxx-xxx x층</p>
		      </td>
		      <td>
		        <span class="badge badge-success rounded-pill d-inline">1234-5678</span>
		      </td>
		      <td><a href="">예약하기</a></td>
		    </tr>
		    
		    <tr>
		      <td>
		        <div class="d-flex align-items-center">
		          <img
		              src="https://mdbootstrap.com/img/new/avatars/8.jpg"
		              alt=""
		              style="width: 45px; height: 45px"
		              class="rounded-circle"
		              />
		          <div class="ms-3">
		            <p class="fw-bold mb-1">00파티룸</p>
		          </div>
		        </div>
		      </td>
		      <td>
		        <p class="fw-normal mb-1">사당동 xxx-xxx x층</p>
		      </td>
		      <td>
		        <span class="badge badge-success rounded-pill d-inline">4444-4444</span>
		      </td>
		      <td><a href="">예약하기</a></td>
		    </tr>
		    
		    <tr>
		      <td>
		        <div class="d-flex align-items-center">
		          <img
		              src="https://mdbootstrap.com/img/new/avatars/8.jpg"
		              alt=""
		              style="width: 45px; height: 45px"
		              class="rounded-circle"
		              />
		          <div class="ms-3">
		            <p class="fw-bold mb-1">00스터디카페</p>
		          </div>
		        </div>
		      </td>
		      <td>
		        <p class="fw-normal mb-1">신당동 xxx-xxx x층</p>
		      </td>
		      <td>
		        <span class="badge badge-success rounded-pill d-inline">7777-7777</span>
		      </td>
		      <td><a href="">예약하기</a></td>
		    </tr>
		    
		  </tbody>
		</table>
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
</body>
</html>