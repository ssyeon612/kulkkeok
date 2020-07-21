<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <script type="text/javascript">
    function confirm(bool){
		if(bool=='true'){
			opener.document.getElementsByName("pw")[0].focus();
			opener.document.getElementsByName("id")[0].title="y";
		}
		else{
			opener.document.getElementsByName("id")[0].focus();
		}
		self.close();
	}
    </script>
</head>

<!--body-->
<!--================start writing area =================-->
<body style="margin: 0 auto;">
<%
	String idnotused = request.getParameter("idnotused");
%>
    <section class="">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="section-top-border" style="padding: 30px;">
                    <div class="">
                        <form action="register.do?command=join" method="post">
                            <h4 style="text-align: center;">아이디 중복 확인</h4>
                            <div style="height:10px;">

                            </div>
                            <div class="mt-10 form-group" style="text-align: center; font-size: 15px;">
                            	<%=idnotused.equals("true")?"생성 가능한 아이디입니다.":"이미 존재하는 아이디입니다." %>
                            </div>

                            <div style="height:3px;">

                            </div>
                            <input type="button" class="genric-btn primary-border radius" style="width:80px; height:40px; margin-top: 5px;" value="확인" onclick="confirm('<%=idnotused%>');">
                            <input type="button" class="genric-btn primary-border radius" style="width:80px; height:40px; margin-top: 5px; margin-left: 30px;" value="취소" onclick="window.close();">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
