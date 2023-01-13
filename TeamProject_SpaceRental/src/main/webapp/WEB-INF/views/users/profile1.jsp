<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Space Rental</title>
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
  	<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.min.js"></script>
	
    <style>
        body {
            background-color: #b461c5;
        }
    </style>

    <!--프로필 사진 수정영역-->

    <div>
        <div class="row position-absolute top-50 start-50 translate-middle" style="margin: 0 auto;">
            <div class="col " style=" background-color: #c1b5dd">
                <div class="card-title mx-auto p-5">
                    <p class="fs-1 text-center fw-bold" style="color:#ffffff; ">My profile</p>
                </div>
                <!-- 사용자 프로필사진-->
                <div class=" text-center">
                    <img id="profileImage" class="img-fluid rounded-circle mb-1"
                        src="https://images.unsplash.com/photo-1565209704209-6a3a0119bcbb?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=MXwxfDB8MXxhbGx8fHx8fHx8fA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=500"
                        alt="..." style="max-width: 150px; max-height: 150px">
                </div>
                <!--사용자 이름-->
                <div class="text-center caption fst-italic text-muted mb-4 p-5">
                    <p>${sessionScope.id }</p>
                </div>
                <!-- 프로필사진 수정 버튼-->
                <div class="text-center">
                    <input type="file" id="file" onchange="uploadFile(this)" style="display:none" />
                    <button type="button" onclick="onclick=document.all.file.click()" class="btn"
                        style="color:white; background-color: blueviolet;">upload new picture</button>
                </div>
                <br>
            </div>
        
    

        <!--프로필 정보 영역-->
        <div class="col " style="background-color: rgb(255, 255, 255);">
            <form class="needs-validation" novalidate="">
                <div class="row g-3">
                    <div class="col-sm-6">
                        <label for="firstName" class="form-label">이름</label>
                        <input type="text" class="form-control" id="firstName" placeholder="" value="" required="">
                    </div>


                    <div class="col-12">
                        <label for="address2" class="form-label">id</span></label>
                        <input class="form-control" type="text" value="${id }" aria-label="readonly input example" readonly>
                        <p class="fst-italic" style="font-size: small; ">id는 변경할 수 없습니다</p>
                    </div>


                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Email</label>
                        <input type="email" class="form-control" id="exampleFormControlInput1"
                            placeholder="name@example.com">
                    </div>

                    <div class="col-12">
                        <label for="address2" class="form-label">sign up date</span></label>
                        <input class="form-control" type="text" value="${dto.regdate }" aria-label="readonly input example"
                            readonly>
                    </div>

                    <div class="col-12">
                        <div class="row">
                            <label for="address2" class="form-label">password</span></label>
                            <div class="col">

                                <input class="form-control" type="text" value="보안상 표시하지 않습니다"
                                    aria-label="readonly input example" readonly>
                            </div>
                            <div class="col">
                               
                                <!-- 비밀번호 변경 모달 -->
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    변경
                                </button>
                                
                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Message</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                        비밀번호를 변경하시겠습니까 ?
                                        </div>
                                        <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">continue</button>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            </div>    
                            </div>
                            </div>



                            <!--수정하기 모달 추가하기-->


                            <!-- 탈퇴모달 -->
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#staticBackdrop">
                                회원탈퇴
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                                tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Message</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">

                                            탈퇴하면 되돌릴 수 없습니다.
                                            <br>
                                            정말 탈퇴하시겠습니까 ?

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">no</button>
                                            <button type="button" class="btn btn-primary">Continue</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

            </form>
        </div>

    <script>

        const myModal = document.getElementById('myModal')
        const myInput = document.getElementById('myInput')

        myModal.addEventListener('shown.bs.modal', () => {
        myInput.focus()
        })

    </script>    


    <script type="text/javascript">
        $('#btn-add').click(function (e) {
            e.preventDefault();
            $('#file').click();
        });

        function uploadFile(e) {
            console.log("File Name : ", e.value);
        }

    </script>
    </body>

</html>