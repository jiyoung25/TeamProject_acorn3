<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>Login form</title>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet"/>
<!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
<style>
.gradient-custom-2 {
/* fallback for old browsers */
background: #fccb90;

/* Chrome 10-25, Safari 5.1-6 */
background: -webkit-linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);

/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
background: linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
}

@media (min-width: 768px) {
.gradient-form {
height: 100vh !important;
}
}
@media (min-width: 769px) {
.gradient-custom-2 {
border-top-right-radius: .3rem;
border-bottom-right-radius: .3rem;
}
}
</style>  
</head>
<body>
<section class="h-100 gradient-form" style="background-color: #eee;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-10">
        <div class="card rounded-3 text-black">
          <div class="row g-0">
            <div class="col-lg-6">
              <div class="card-body p-md-5 mx-md-4">

                <div class="text-center">
                  <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/lotus.webp"
                    style="width: 185px;" alt="logo">
                  <h4 class="mt-1 mb-5 pb-1">Acorn Rental</h4>
                </div>

                <form>
                  <p>아이디/비밀번호 입력</p>

                  <div class="form-outline mb-4">
                  <form action="${pageContext.request.contextPath}/users/login" method="post">
                    <input type="text" name="id" id="id" class="form-control" value="${cookie.savedId.value }"
                      placeholder="" />
                    <label class="form-label" for="form2Example11">아이디</label>
                    <input type="checkbox" name="remember" value="true" ${not empty cookie.savedId? 'checked':''  } />아이디 기억하기
                  </div>

                  <div class="form-outline mb-4">
                    <input type="password" id="Pwd" name="inputPwd" class="form-control" />
                    <label class="form-label" for="form2Example22">비밀번호</label>
                  </div>

                  <div class="text-center pt-1 mb-5 pb-1">
                    <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="button">Log
                      in</button>
                    <a class="text-muted" href="#!">비밀번호를 잊으셨나요?</a>
                  </div>

                  <div class="d-flex align-items-center justify-content-center pb-4">
                    <p class="mb-0 me-2">아이디가 없으신가요?</p>
                    <button type="button" class="btn btn-outline-danger"><a href="${pageContext.request.contextPath}/users/signupform">회원가입</a></button>
                  </div>

                </form>

              </div>
            </div>
            <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
              <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                <h4 class="mb-4">AcornRental 에 오신것을 환영합니다.</h4>
                <p class="small mb-0">공간대여서비스입니다.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>

</html>