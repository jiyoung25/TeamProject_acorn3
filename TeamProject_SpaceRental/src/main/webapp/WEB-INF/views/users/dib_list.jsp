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
<style>
div{
	background-color: #info
 }
</style>
</head>
<body>
	<div class="container">
		<h1>���� �� ���</h1>
		<ul>
			<c:forEach var="tmp" items="${list }">
				<li>
					<a href="${pageContext.request.contextPath}/space/detail?cate_num=${tmp.cate_num}&space_num=${tmp.space_num}">���� �̸�: ${tmp.space_name }
				</li>
			</c:forEach>
		</ul>
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
</body>
</html>