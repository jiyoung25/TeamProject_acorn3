<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �� ���</title>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet"/>
<!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
</head>
<body>
	<!-- �׺�� include -->
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
		<h1>���� ���</h1>
		<ul>
			<c:forEach var="tmp" items="${list }">
				<li>
					<a href="${pageContext.request.contextPath}/space/detail?cate_num=${tmp.cate_num}&space_num=${tmp.space_num}">���� �̸�: ${tmp.space_name }
				</li>
			</c:forEach>
		</ul>
		<table class="table align-middle mb-0 bg-white">
		  <thead class="bg-light">
		    <tr>
		      <th>��ü��</th>
		      <th>��ġ</th>
		      <th>��ȭ��ȣ</th>
		      <th>�����ϱ�</th>
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
		            <p class="fw-bold mb-1">00�뷡��</p>
		          </div>
		        </div>
		      </td>
		      <td>
		        <p class="fw-normal mb-1">��絿 xxx-xxx x��</p>
		      </td>
		      <td>
		        <span class="badge badge-success rounded-pill d-inline">1234-5678</span>
		      </td>
		      <td><a href="">�����ϱ�</a></td>
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
		            <p class="fw-bold mb-1">00��Ƽ��</p>
		          </div>
		        </div>
		      </td>
		      <td>
		        <p class="fw-normal mb-1">��絿 xxx-xxx x��</p>
		      </td>
		      <td>
		        <span class="badge badge-success rounded-pill d-inline">4444-4444</span>
		      </td>
		      <td><a href="">�����ϱ�</a></td>
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
		            <p class="fw-bold mb-1">00���͵�ī��</p>
		          </div>
		        </div>
		      </td>
		      <td>
		        <p class="fw-normal mb-1">�Ŵ絿 xxx-xxx x��</p>
		      </td>
		      <td>
		        <span class="badge badge-success rounded-pill d-inline">7777-7777</span>
		      </td>
		      <td><a href="">�����ϱ�</a></td>
		    </tr>
		    
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
	</div>
		<nav>
			<ul class="pagination">
				<%--
					startPageNum �� 1 �� �ƴ� ��쿡�� Prev ��ũ�� �����Ѵ�. 
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
					������ ������ ��ȣ�� ��ü �������� �������� ������ Next ��ũ�� �����Ѵ�. 
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
</body>
</html>