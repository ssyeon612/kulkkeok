<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
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
    <!--::header part start::-->
    <%@ include file="../form/header.jsp" %>
    <!-- Header part end-->

    <!-- breadcrumb start-->
    <!-- breadcrumb start-->

    <!-- findId part start -->
        <section class="banner_part">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="section-top-border">
                        <div class="login">
                            <h3 class="mb-30">아이디 찾기</h3>
                            <form action="login.do" method="post" >
                            <input type="hidden" name="command" value="findId">
                                <div class="mt-10 form-group">
                                    <input type="text" name="name" placeholder="이름을 입력하세요" required class="form-control">
                                </div>
                                <div class="mt-10 form-group">
                                    <input type="email" name="email" placeholder="가입 시 등록한 이메일을 입력하세요" required class="form-control">
                                </div>
                                <input type="submit" class="genric-btn primary radius" style="width:300px; margin-top: 15px;" value="아이디 찾기"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <!-- findId part end -->

    <!-- footer part start-->
    <%@ include file="../form/footer.jsp" %>
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