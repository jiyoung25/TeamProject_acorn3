<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
<title>Q&A 리스트보기 :Ubiquitous</title>
</head>
<body>
	<%-- 네비바 --%>
	<c:choose>
		<c:when test="${empty sessionScope.id }">
			<jsp:include page="/WEB-INF/include/navbar_sidebar_SessionX.jsp"/>
	    </c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${usersCode eq 2 }">
					<jsp:include page="/WEB-INF/include/navbar_sessionO_seller.jsp"/>
					<jsp:include page="/WEB-INF/include/sidebar_seller.jsp"/>
				</c:when>
	            <c:when test ="${usersCode eq 3 }">
					<jsp:include page="/WEB-INF/include/navbar_sessionO_users.jsp"/>
					<jsp:include page="/WEB-INF/include/sidebar_user.jsp"/>
	            </c:when>
	            <c:when test = "${usersCode eq 1 }">
					<jsp:include page="/WEB-INF/include/navbar_sessionO_admin.jsp"/>
					<jsp:include page="/WEB-INF/include/sidebar_admin.jsp"/>
	            </c:when>
			</c:choose>
		</c:otherwise>
	</c:choose>

	<div class="container">
      <table class="table align-middle mb-0 bg-white">
         <thead class="bg-light">
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
         <ul class="pagination justify-content-center">
            <%--
               qnaStartPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
               &condition=${condition}&keyword=${encodedK}
            --%>
            <c:if test="${qnaStartPageNum ne 1 }">
               <li class="page-item">
                  <a class="page-link" href="detail?cate_num=${cate_num }&space_num=${space_num}&qnaPageNum=${qnaStartPageNum-1 }&condition=${condition}&keyword=${encodedK}">Prev</a>
               </li>
            </c:if>
            <c:forEach var="i" begin="${qnaStartPageNum }" end="${qnaEndPageNum }">
               <li class="page-item ${qnaPageNum eq i ? 'active' : '' }">
                  <a class="page-link" href="detail?cate_num=${cate_num }&space_num=${space_num}&qnaPageNum=${i }&condition=${condition}&keyword=${encodedK}">${i }</a>
               </li>
            </c:forEach>
            <%--
               마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
             --%>
            <c:if test="${qnaEndPageNum lt qnatotalPageCount }">
               <li class="page-item">
                  <a class="page-link" href="detail?cate_num=${cate_num }&space_num=${space_num}&qnaPageNum=${qnaEndPageNum+1 }&condition=${condition}&keyword=${encodedK}">Next</a>
               </li>
            </c:if>
         </ul>
      </nav>
	      
		<!-- 검색 폼 -->
		<form action="detail" method="get">
    		<label for="condition">검색조건</label>
    		<select name="condition" id="condition">
    			<option value="title_content" ${condition eq 'title_content' ? 'selected' : '' }>제목 + 내용</option>
    			<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
    			<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
    		</select>
    		<input type="text" name="keyword" placeholder="검색어..." 
    			value="${keyword }" />
    		<input type="hidden" name="cate_num" value=${cate_num }>
    		<input type="hidden" name="space_num" value=${space_num }>
    		<button type="submit">검색</button>
		</form>
		<c:if test="${not empty condition }">
			<p>
				<strong>${qnatotalRow }</strong> 개의 자료가 검색 되었습니다.
				<a href="${pageContext.request.contextPath}/space/detail?cate_num=${cate_num}&space_num=${space_num}">리셋</a>
			</p>
		</c:if>
	</div>
   
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
</body>
</html>