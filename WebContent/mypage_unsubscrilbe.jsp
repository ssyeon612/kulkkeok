<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html>
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
    <!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
    
    <!-- jquery -->
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
   	<script type="text/javascript">
   		$(function(){
   			$("#leaveForm").submit(function(){
   				var password = '<c:out value="${user.userPw }"></c:out>';
   				var password2 = $("#inputPassword").val();
   				
   				if(password != password2){alert("비밀번호가 일치하지 않습니다."); return false;}
   			});		
   		});
   		
   	</script>
   
</head>
<body>
	
	<%@ include file="../form/header.jsp" %>
	 
	 
    <!-- breadcrumb start-->

    <!--body-->
        <section class="banner_part">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="section-top-border">
                        <div class="mypage_un" style="overflow:auto">
                            <div class="mypagelogo mb-30" style="text-align: center; margin-top: 0px;"><span style="font-family: 'Permanent Marker', sans-serif; color: #0c3e72; font-size: 3em;">Leave the website?</span></div>
                            <div>
                                고객님의 소중한 개인정보를 위해서 계정 인증을 진행합니다.<br>
                                <b style="font-size: 18px;">비밀번호</b>를 입력해 주세요.
                            </div>
                            <br><br>
                            <form class="form-inline" action="mypage.do?command=leave" id="leaveForm" method="post">
                                <div class="form-group mb-2">
                                  <input type="text" readonly class="form-control-plaintext" value="비밀번호 확인" style="font-size: 18px; font-weight: bold; width: 160px; text-align: right;">
                                </div>
                                <div class="form-group mx-sm-3 mb-2">
                                  <input type="password" class="form-control" name="inputPassword" id="inputPassword" style="width: 300px;">
                                </div>
                                <button type="submit" class="btn btn-dark" style="margin-bottom: 10px;">확인</button>
                              </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    
	 
	 
	 <%@ include file="../form/footer.jsp" %> 
	 
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