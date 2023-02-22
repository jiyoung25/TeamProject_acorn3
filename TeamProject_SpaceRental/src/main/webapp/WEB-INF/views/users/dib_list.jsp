<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �� ���</title>
<%-- ��Ʈ��Ʈ�� --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet"/>
<!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
</head>
<body>
	<%-- �׺�� --%>
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
	      		</c:when>
	      	</c:choose>
      	</c:otherwise>
   	</c:choose>
   	
   	<%-- �� ����Ʈ --%>
	<div class="container">
		<h1>���� ���</h1>
		<table class="table align-middle mb-0 bg-white">
			<thead class="bg-light">
				<tr>
					<th>��ü��</th>
					<th>�̹���</th>
					<th>�ּ�</th>
					<th>ī�װ� �̸�</th>
		    	</tr>
		  	</thead>
		  	<tbody>
		  		<c:forEach var="tmp" items="${list }">
		  			<tr>
		    			<td>
		    				<a href="${pageContext.request.contextPath}/space/detail?cate_num=${tmp.cate_num}&space_num=${tmp.space_num}&path=dib">${tmp.space_name }</a>
		    			</td>
		      			<td>
		        			<div class="d-flex align-items-center">
		          				<img
		             				src="${pageContext.request.contextPath}/${tmp.mainImagePath}"
		              				alt="" style="width: 45px; height: 45px" class="rounded-circle"/>
							</div>
						</td>
						<td>
							${tmp.addr }
						</td>
						<td>
							${tmp.cate_name }
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- �˻� �� 
		<form action="list" method="get">
			<label for="condition">�˻�����</label>	
			<select name="condition" id="condition">
				<option value="spaceName" ${condition eq 'spaceName' ? 'selected' : '' }>���� �̸�</option>
			</select>
			<input type="text" name="keyword" placeholder="�˻���..." value="${keyword }"/>
			<button type="submit">�˻�</button>
		</form>
		<c:if test="${not empty condition }">
			<p>
				<strong>${totalRow }</strong> ���� �ڷᰡ �˻� �Ǿ����ϴ�.
				<a href="list">����</a>
			</p>
		</c:if>
		-->
		<br>
		
		<%-- ���������̼� --%>
		<nav>
			<ul class="pagination">
				<%--
					startPageNum �� 1 �� �ƴ� ��쿡�� Prev ��ũ�� �����Ѵ�. 
					&condition=${condition}&keyword=${encodedK}
				 --%>
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="dib_list?pageNum=${startPageNum-1 }">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li class="page-item ${pageNum eq i ? 'active' : '' }">
						<a class="page-link" href="dib_list?pageNum=${i }">${i }</a>
					</li>
				</c:forEach>
				<%--
					������ ������ ��ȣ�� ��ü �������� �������� ������ Next ��ũ�� �����Ѵ�. 
				 --%>
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="dib_list?pageNum=${endPageNum+1 }">Next</a>
					</li>
				</c:if>				
			</ul>
		</nav>
	</div>
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>	
</body>
</html>