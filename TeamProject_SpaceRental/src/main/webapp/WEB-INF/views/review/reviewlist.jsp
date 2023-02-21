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
<title>/views/review/reviewlist</title>
</head>
<body>
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
	         <c:forEach var="tmp" items="${reviewlist }">
	         	<tr>
	         		<td>${tmp.review_num }</td>
	         		<td>${tmp.review_writer }</td>
	         		<td>
	         			<a href="reviewdetail?review_num=${tmp.review_num }">${tmp.review_title }</a>
	         		</td>
	         		<td>${tmp.viewcount }</td>
	         		<td>${tmp.review_regdate }</td>
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
                  <a class="page-link" href="reviewlist?pageNum=${startPageNum-1 }">Prev</a>
               </li>
            </c:if>
            <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
               <li class="page-item ${pageNum eq i ? 'active' : '' }">
                  <a class="page-link" href="reviewlist?pageNum=${i }">${i }</a>
               </li>
            </c:forEach>
            <%--
               마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
             --%>
            <c:if test="${endPageNum lt totalPageCount }">
               <li class="page-item">
                  <a class="page-link" href="reviewlist?pageNum=${endPageNum+1 }">Next</a>
               </li>
            </c:if>
         </ul>
      </nav>
   </div>
</body>
</html>