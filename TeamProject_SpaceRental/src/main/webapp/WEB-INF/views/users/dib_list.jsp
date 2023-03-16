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
		<h1 class="mb-3 mt-3">�� ���</h1>
		<c:choose>
			<c:when test="${not empty list }">
				<div class="row">
					<c:forEach var="tmp" items="${list }">
						<div class="col-lg-3 mb-5">
							<div  class="card lift h-100">
								<a href="${pageContext.request.contextPath}/space/detail?cate_num=${tmp.cate_num}&space_num=${tmp.space_num}"
									style='text-decoration: none; color: black'>
									<img src="${pageContext.request.contextPath}${tmp.mainImagePath}" style="height: 155px; width:100%"/>
									<div class="card-body row">
										<div>
											<h6 class="small text-center">��Ƽ��</h6>
											<h4 class="card-title mb-2 text-center">${tmp.space_name }</h4>
											<p class="card-text">${tmp.addr }</p>
											<p class="card-text">${tmp.oneliner }</p>
										</div>
									</div>
								</a>
								<div class="card-footer bg-transparent border-top d-flex align-items-center justify-content-between">
									<div class="small">
										<span class="col-3 text-danger" id="dibBtn${tmp.dibson_num }" value="${tmp.dibson_num }" onClick="dibDelete(this.id)">��</span>
										<span class="vr"></span>
										<a href="${pageContext.request.contextPath}/space/detail?cate_num=${tmp.cate_num}&space_num=${tmp.space_num}">
											<span class="col-9 text-primary">�ڼ��� ����</span>
										</a>
									</div>
									<div class="small text-primary">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right">
											<line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline>
										</svg>
									</div>
								</div>
								<c:if test="${usersCode eq 1 }">
									<div>
										<a
											href="${pageContext.request.contextPath}/space/spaceDelete?space_num=${tmp.space_num }&cate_num=${cate_num }"
											onClick="deleteLink(); return false;">����</a>
									</div>
								</c:if>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:otherwise>
				<div class="alert alert-primary d-flex align-items-center" role="alert">
					<div>
						<h4>
							<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 22 22">
								<path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
							</svg>
							"��" ����� �̿��� �ּ���!
						</h4>
						<hr>
						<p> "��"�� ����ϸ� ����Ʈ�� �߰��˴ϴ�.</p>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

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
		<a href="${pageContext.request.contextPath}" class="btn btn-outline-secondary">�������� ����</a>
	</div>
	<script>
		const dibDelete = function(clickedId){
			const dib_num = clickedId.substr(6);
			fetch("${pageContext.request.contextPath}/space/dib_delete?dibson_num="+dib_num)
            .then(function(response){
                console.log(response);
                return response.text();
            })
            .then(function(data){
                   location.reload();
            })
		}
	</script>
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>	
</body>
</html>