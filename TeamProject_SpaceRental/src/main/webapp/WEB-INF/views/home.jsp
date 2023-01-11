<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	
<body>

    <!--네비바-->
    <nav class="navbar bg-body-tertiary fixed-top ">
        <div class="container-fluid">
          <div class="ml-5" >
          <a class="navbar-brand" href="#"><p class="fs-3 fw-semibold  " >Space Rental</p></a>
        </div>
        <div class="mr-5">
          <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
            <span class="navbar-toggler-icon"></span>
          </button>
        </div>
    </div>
    </div>      


        <!--사이드바-->
          <div class="offcanvas offcanvas-end " tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header ">
              <h5 class="offcanvas-title mx-auto" id="offcanvasNavbarLabel">My Page</h5>
              <button type="button" class="btn-close " data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="container">
                    <div class="text-center m-5">
                        <!-- Profile picture image-->
                        <img class="img-fluid rounded-circle mb-1" src="https://source.unsplash.com/jSUsJWvnnEA/500x500" alt="..." style="max-width: 150px; max-height: 150px">
                        <!-- Profile picture help block-->
                        <div class="caption text-muted mb-4">
                            <p class="fw-bold">에이콘</p>
                        </div>
                        <!-- Profile picture upload button-->
                        <button type="button" class="btn btn-secondary" disabled>프로필 관리</button>
                    </div>
                </div>
                
              <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                <li class="nav-item">
                  <a class="nav-link " href="#">나의 예약</a>
                </li>

                <hr class="my-2">

                <li class="nav-item">
                  <a class="nav-link" href="#">나의 후기</a>
                </li>

                <hr class="my-2">

                <li class="nav-item">
                    <a class="nav-link" href="#">나의 Q&A</a>
                </li>

                <hr class="my-2">

                <li class="nav-item">
                    <a class="nav-link" href="#">프로필 수정</a>
                </li>
        
            </div>
          </div>
        </div>
      </nav>



	

	<!--carousel-->		
	<div id="carouselExampleCaptions" class="carousel slide bg-light" data-bs-ride="carousel">
		<div class="carousel-indicators">
		<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="https://images.unsplash.com/photo-1573164574511-73c773193279?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80" class="d-block w-100" alt="...">
			<div class="carousel-caption d-none d-md-block">
			<h5>First slide label</h5>
			<p>Some representative placeholder content for the first slide.</p>
			</div>
		</div>
		<div class="carousel-item">
			<img src="https://images.unsplash.com/photo-1537365587684-f490102e1225?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80" class="d-block w-100" alt="...">
			<div class="carousel-caption d-none d-md-block">
			<h5>Second slide label</h5>
			<p>Some representative placeholder content for the second slide.</p>
			</div>
		</div>
		<div class="carousel-item">
			<img src="https://images.unsplash.com/photo-1519671482749-fd09be7ccebf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" class="d-block w-100" alt="...">
			<div class="carousel-caption d-none d-md-block">
			<h5>Third slide label</h5>
			<p>Some representative placeholder content for the third slide.</p>
			</div>
		</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Next</span>
		</button>
	</div>

	<!--Product category-->	
	<div class="text-center m-5">
		<h2 class="section-heading text-uppercase">Services</h2>
		<h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
	</div>
	

	<div class="row">
		<div class="col-lg-4">
		  <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
  
		  <h2 class="fw-normal">Heading</h2>
		  <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
		  <p><a class="btn btn-secondary" href="#">View details »</a></p>
		</div><!-- /.col-lg-4 -->
		<div class="col-lg-4">
		  <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
  
		  <h2 class="fw-normal">Heading</h2>
		  <p>Another exciting bit of representative placeholder content. This time, we've moved on to the second column.</p>
		  <p><a class="btn btn-secondary" href="#">View details »</a></p>
		</div><!-- /.col-lg-4 -->
		<div class="col-lg-4">
		  <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
  
		  <h2 class="fw-normal">Heading</h2>
		  <p>And lastly this, the third column of representative placeholder content.</p>
		  <p><a class="btn btn-secondary" href="#">View details »</a></p>
		</div><!-- /.col-lg-4 -->
	  </div>
	  <div class="row">
		<div class="col-lg-4">
		  <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
  
		  <h2 class="fw-normal">Heading</h2>
		  <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
		  <p><a class="btn btn-secondary" href="#">View details »</a></p>
		</div><!-- /.col-lg-4 -->
		<div class="col-lg-4">
		  <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
  
		  <h2 class="fw-normal">Heading</h2>
		  <p>Another exciting bit of representative placeholder content. This time, we've moved on to the second column.</p>
		  <p><a class="btn btn-secondary" href="#">View details »</a></p>
		</div><!-- /.col-lg-4 -->
		<div class="col-lg-4">
		  <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
  
		  <h2 class="fw-normal">Heading</h2>
		  <p>And lastly this, the third column of representative placeholder content.</p>
		  <p><a class="btn btn-secondary" href="#">View details »</a></p>
		</div><!-- /.col-lg-4 -->
	  </div>
	

</body>
</html>