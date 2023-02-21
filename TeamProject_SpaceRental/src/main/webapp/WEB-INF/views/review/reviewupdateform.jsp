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
<%-- import from static folder --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/star.css">
<script src = "${pageContext.request.contextPath}/js/star.js"></script>
<title>/views/view/reviewupdateform.jsp</title>
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
	      		</c:when>
	      	</c:choose>
      	</c:otherwise>
   	</c:choose>
   	
	<div class="container">
		<h1>글 수정 폼 입니다.</h1>
		<form action="reviewupdate" method="post">
			<input type="hidden" name="review_num" value="${dto.review_num }" />
			<div>
				<label for="review_writer">작성자</label> 
				<input type="text" id="review_writer" value="${dto.review_writer }" disabled />
			</div>
			<div>
				<label for="review_title">제목</label> 
				<input type="text" name="review_title" id="review_title" value="${dto.review_title }" />
			</div>
			<div>
				<%-- 별점 --%>
				<label>별점</label>
				<span class="star">
				  ★★★★★
				  <span style="width:${dto.star * 10}%;">★★★★★</span>
				  <input type="range" name="star" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
				</span>
			</div>
			<div>
				<label for="review_content">내용</label>
				<textarea name="review_content" id="review_content">${dto.review_content }</textarea>
			</div>
			<button type="submit" onclick="submitContents(this);">수정확인</button>
			<button type="reset">취소</button>
		</form>
	</div>
	<!-- SmartEditor 에서 필요한 javascript 로딩  -->
	<script
		src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
	<script>
	   var oEditors = [];
	   
	   //추가 글꼴 목록
	   //var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
	   
	   nhn.husky.EZCreator.createInIFrame({
	      oAppRef: oEditors,
	      elPlaceHolder: "review_content",
	      sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",   
	      htParams : {
	         bUseToolbar : true,            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	         bUseVerticalResizer : true,      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	         bUseModeChanger : true,         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	         //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
	         fOnBeforeUnload : function(){
	            //alert("완료!");
	         }
	      }, //boolean
	      fOnAppLoad : function(){
	         //예제 코드
	         //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	      },
	      fCreator: "createSEditor2"
	   });
	   
	   function pasteHTML() {
	      var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	      oEditors.getById["review_content"].exec("PASTE_HTML", [sHTML]);
	   }
	   
	   function showHTML() {
	      var sHTML = oEditors.getById["review_content"].getIR();
	      alert(sHTML);
	   }
	      
	   function submitContents(elClickedObj) {
	      oEditors.getById["review_content"].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용됩니다.
	      
	      // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	      
	      try {
	         elClickedObj.form.submit();
	      } catch(e) {}
	   }
	   
	   function setDefaultFont() {
	      var sDefaultFont = '궁서';
	      var nFontSize = 24;
	      oEditors.getById["review_content"].setDefaultFont(sDefaultFont, nFontSize);
	   }
	</script>
</body>
</html>