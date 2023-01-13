<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="icon" type="image/x-icon" href="assets/ficon.ico" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
</head>

<body >

    <!--네비바-->
    <nav class="navbar bg-body-tertiary ">
        <!--기업이름-->
        <div class="container-fluid">
           <div class="ml-5" >
           <a class="navbar-brand" href="#"><p class="fs-3 fw-semibold" >Space Rental</p></a>
           </div>
		<div class="row">
            <!--로그인하기-->
			<div class="col">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/users/loginform"><p class="fs-6 text-secondary " >Login</p></a>
			</div>
            <!--회원가입하기-->
			<div class="col">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/users/signupform"><p class="fs-6 text-secondary " >Signup</p></a>
			</div>
            <!--마이페이지 버튼-->
			<div class="col">
			  <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
				<span class="navbar-toggler-icon"></span>
			  </button>
			</div>
		</div>
    </nav>
        


        <!--사이드바-->
          <div class="offcanvas offcanvas-end " tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header ">
              <h5 class="offcanvas-title mx-auto" id="offcanvasNavbarLabel">My Page</h5>
              <button type="button" class="btn-close " data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="container">
                    <div class="text-center m-5">
                        <!-- 사용자 프로필-->
                        <img class="img-fluid rounded-circle mb-1" src="https://source.unsplash.com/jSUsJWvnnEA/500x500" alt="..." style="max-width: 150px; max-height: 150px">
                        <!-- 사용자 이름-->
                        <div class="caption text-muted mb-4">
                            <p class="fw-bold">에이콘</p>
                        </div>
                        <!-- 프로필 관리-->
                        <button type="button" class="btn btn-secondary" disabled>프로필 관리</button>
                    </div>
                </div>
                
              <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                <li class="nav-item">
                  <a class="nav-link " href="#">나의 예약</a>
                </li>

                <hr class="my-2">

                <li class="nav-item">
                  <a class="nav-link" href="#">나의 찜</a>
                </li>

                <hr class="my-2">

                <li class="nav-item">
                    <a class="nav-link" href="#">나의 Q&A</a>
                </li>

                <hr class="my-2">

                <li class="nav-item">
                    <a class="nav-link" href="#">나의 후기</a>
                </li>
        
            </div>
          </div>
        </div>
      </nav>

     <!--공간사진 및 예약폼-->

     <!--네비바와 상단메뉴 겹치는부분 수정예정-->
     <div class="container"  >
        <div class="row">
            <!--공간사진-->
            <div class="col align-center">
                <div class="row">
                <img src="https://as2.ftcdn.net/v2/jpg/02/40/32/91/1000_F_240329133_inyyLY16TuwXtP0AVrbTvK0XGzEjxanV.jpg" alt="...">
                </div>

                <!--공간 메뉴탭-->
                <div class="row">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <!--공간소개 탭-->
                        <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">공간소개</button>
                        </li>
                        <!--편의시설 탭-->
                        <li class="nav-item" role="presentation">
                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">편의시설</button>
                        </li>
                        <!--위치탭-->
                        <li class="nav-item" role="presentation">
                        <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">위치</button>
                        </li>
                    </ul>
                      
                    <!--공간메뉴탭 내용-->
                      <div class="tab-content" id="myTabContent">
                        <!--공간소개 내용-->
                        <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                            판매자가 등록한 공간소개글
                        </div>
                        <!--편의시설 내용-->
                        <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                            판매자가 등록한 편의시설 정보 (주차가능, 반려동물입실가능, 대형모니터, cctv, wifi 등)
                        </div>
                        <!--위치 내용 / 지도 api 사용여부는 고민중-->
                        <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
                            판매자가 등록한 공간 주소
                        </div>
                      </div>

                </div>
            </div>




            <!--예약폼-->
            <div class="col">
                <div class="col-md-7 col-lg-8">

                    <!--공간이름-->
                    <p class="fs-1 text-center">이름</p>

                    <!--요금안내-->
                    <div class="row">
                        <div class="col-4 text-center">
                        <label for="staticEmail" class="col-form-label">2시간당</label>
                        </div>
                        <div class="col-8">
                            <input class="form-control" type="text" value="요금" aria-label="Disabled input example" disabled readonly>
                        </div>
                    </div>

                    <hr class="my-4">


                        <!--예약자-->
                        <div class="row">
                            <div class="col-4 text-center">
                            <label for="inputName" class="col-form-label ">예약자</label>
                            </div>
                            <div class="col-8 ">
                              <input type="Name" class="form-control" id="inputName">
                            </div>
                          </div>
            
                        
                        
                        <!--인원선택-->
                        <div class="row">
                            <div class="col-4 text-center">인원</div>
                            <div class="col-8">
                                <select class="form-select" aria-label="Default select example">
                                    <option selected>인원선택</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </div>
                        </div>


                        <hr class="my-4">

                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label">요청사항</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                          </div>

                    
                      <hr class="my-4">
            
                      <!--예약안내사항-->
                      <p class="fw-bold ">  2시간 단위로 예약가능합니다</p>
                      <p class="fw-bold ">  최대 예약정원은 10명입니다</p>
                      <p class="fw-bold ">  예약변경 및 취소는 판매자에게 문의 바랍니다</p>
                      <br>
                      <!--동의 체크박스-->
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="same-address">
                        <label class="form-check-label" for="same-address">공지사항 및 약관에 동의합니다.</label>
                      </div>
                      <br>
                      <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="save-info">
                        <label class="form-check-label" for="save-info">예약정보를 모두 확인했습니다.</label>
                      </div>
            
                      <hr class="my-4">
            
                      <button class="w-100 btn btn-primary btn-lg" type="submit">예약</button>
                    </form>
                  </div>
            </div>
     </div>
     


    <!--후기 / 수정중 -->
    <div class="card-body">
        <h6>Opinion</h6>
        <hr>
        <div class="d-flex mb-4">
            <div class="avatar avatar-lg"><img class="avatar-img" src="assets/img/illustrations/profiles/profile-1.png"></div>
            <div class="ms-3">
                <a class="text-dark" href="#!"><h6 class="mb-1">댓글</h6></a>
                <div class="small text-gray-500">
                    by
                    <a class="text-gray-500" href="#!">사용자</a>
                </div>
            </div>
        </div>
        <div class="d-flex mb-4">
            <div class="avatar avatar-lg"><img class="avatar-img" src="assets/img/illustrations/profiles/profile-2.png"></div>
            <div class="ms-3">
                <a class="text-dark" href="#!"><h6 class="mb-1">블라블라</h6></a>
                <div class="small text-gray-500">
                    by
                    <a class="text-gray-500" href="#!">사용자</a>
                </div>
            </div>
        </div>
        <div class="d-flex mb-4">
            <div class="avatar avatar-lg"><img class="avatar-img" src="assets/img/illustrations/profiles/profile-3.png"></div>
            <div class="ms-3">
                <a class="text-dark" href="#!"><h6 class="mb-1">ㅎㅎㅎ</h6></a>
                <div class="small text-gray-500">
                    by
                    <a class="text-gray-500" href="#!">사용자</a>
                </div>
            </div>
        </div>
        
        
    </div>



    


         
</body>
</html>