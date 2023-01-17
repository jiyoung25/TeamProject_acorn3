<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/views/qna/qnalist</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<%-- 네비바 --%>
	<c:choose>
		<c:when test="${empty sessionScope.id }">
        	<jsp:include page="/WEB-INF/include/navbar_sidebar_SessionX.jsp"/>
      	</c:when>
      	<c:otherwise>
	      	<c:choose>
	      		<c:when test="${dto.code eq 2 }">
	      	  		<jsp:include page="/WEB-INF/include/navbar_sessionO_seller.jsp"/>
	         		<jsp:include page="/WEB-INF/include/sidebar_seller.jsp"/>
	      		</c:when>
	      		<c:otherwise>
					<jsp:include page="/WEB-INF/include/navbar_sessionO_users.jsp"/>
			      	<jsp:include page="/WEB-INF/include/sidebar_user.jsp"/>
	      		</c:otherwise>
	      	</c:choose>
      	</c:otherwise>
   	</c:choose> 

	<div class="container">
      <table class="table table-striped">
         <thead class="table-dark">
            <tr>
               <th>글번호</th>
               <th>작성자</th>
               <th>제목</th>
               <th>조회수</th>
               <th>작성일</th>
            </tr>
         </thead>
         <tbody>
	         <c:forEach var="tmp" items="${list }">
	         	<tr>
	         		<td>${tmp.num }</td>
	         		<td>${tmp.writer }</td>
	         		<td>
	         			<a href="qnadetail?num=${tmp.num }&condition=${condition}&keyword=${encodedK}">${tmp.title }</a>
	         		</td>
	         		<td>${tmp.viewCount }</td>
	         		<td>${tmp.regdate }</td>
	         	</tr>
	         </c:forEach>
         </tbody>
      </table>
      <nav>
         <ul class="pagination">
            <%--
               startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
               &condition=${condition}&keyword=${encodedK}
            --%>
            <c:if test="${startPageNum ne 1 }">
               <li class="page-item">
                  <a class="page-link" href="qnalist?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${encodedK}">Prev</a>
               </li>
            </c:if>
            <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
               <li class="page-item ${pageNum eq i ? 'active' : '' }">
                  <a class="page-link" href="qnalist?pageNum=${i }&condition=${condition}&keyword=${encodedK}">${i }</a>
               </li>
            </c:forEach>
            <%--
               마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
             --%>
            <c:if test="${endPageNum lt totalPageCount }">
               <li class="page-item">
                  <a class="page-link" href="qnalist?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedK}">Next</a>
               </li>
            </c:if>
         </ul>
      </nav>
      
      <!-- 검색 폼 -->
		<form action="qnalist" method="get">
    		<label for="condition">검색조건</label>
    		<select name="condition" id="condition">
    			<option value="title_filename" ${condition eq 'title_content' ? 'selected' : '' }>제목 + 내용</option>
    			<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
    			<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
    		</select>
    		<input type="text" name="keyword" placeholder="검색어..." 
    			value="${keyword }" />
    		<button type="submit">검색</button>
		</form>
		<c:if test="${not empty condition }">
			<p>
				<strong>${totalRow }</strong> 개의 자료가 검색 되었습니다.
				<a href="qnalist">리셋</a>
			</p>
		</c:if>
   </div>
   
       <!-- footer include -->
	  <jsp:include page="/WEB-INF/include/footer.jsp"/>
</body>
</html>