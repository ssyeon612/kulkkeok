<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>KULKKEOK KULKKEOK</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/gijgo.min.css">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="css/nice-select.css">
    <!-- slick CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
	<%@ include file="../form/header.jsp" %>

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg bg_img_beerstory">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>맥주이야기</h2>
                            <p>beerstory write</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!--body-->
    <!--================start writing area =================-->
        <div class="freeboard_detail" role="main">
            <h1>맥주이야기</h1>
            <h2>글쓰기</h2>
            <br><br>
            <div id="freeboard_form">
			<form action="beerStory.do" name="form" id="form" role="form" method="post" enctype="multipart/form-data">
				<input type="hidden" name="command" value="beerStory_write">
				<div class="mb-3">
					<label for="storyName"><b>제목</b></label>
					<input type="text" id="storyName" class="form-control" name="storyName" placeholder="제목을 입력해 주세요" autofocus />
                </div>
                
				<div class="mb-3">
					<label for="storyLink"><b>링크</b></label>
					<input type="text" id="storyLink" class="form-control" name="storyLink" placeholder="링크를 입력해 주세요">
				</div>
				
				<div class="mb-3">
					<label for="storyImg"><b>이미지</b></label>
					<input type="file" id="storyImg" class="form-control" name="storyImg" value="이미지 선택">
				</div>
				
				<div style="text-align: right;">
					<button type="submit" class="genric-btn primary radius" id="btnSave">저장</button>
					<button type="button" class="genric-btn primary radius" id="btnCancel" onclick="location.href='beerStory.do?command=beerStory'">취소</button>
            	</div>
			</form>
			<!-- form 태그 안에 submit이 있어야 넘어간다. -->
			
            </div>
		</div>
    <!--================end writing area=================-->
	<%@ include file="form/footer.jsp" %>

    <!-- footer part end-->

    <!-- jquery plugins here-->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="js/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>
    <script src="js/contact.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>
</body>

</html>