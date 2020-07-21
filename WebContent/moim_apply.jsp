<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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


    <!--body-->
    <!--================start writing area =================-->
        <h3 style="text-align: center; margin-top:5px;">모임 신청하기</h3>

         <form name="form" id="form" role="form" method="post" action="moim.do">
         	<input type="hidden" name="command" value="moim_apply">
            <div id="chgposition">
                <div class="" style="padding: 10px;">
                    <div id="freeboard_form">
                    
                        <div class="mb-3">
                            <label for="title"><b>제목</b></label>
                            <input type="text" class="form-control" name="moimTitle" value="[모임 신청] ${moimTitle }"/>
                        </div>
                        <div class="mb-3">
                            <label for="email"><b>모임 작성자 이메일</b></label>
                            <input type="email" class="form-control" name="userEmail" value="${userDto.userEmail }"/>
                            <!-- 테스트 후 readonly로 변경할 것 -->
                        </div>
                        <div class="mb-3">
                            <label for="content"><b>내용</b></label>
                            <textarea class="form-control" rows="10" cols="10" name="emailContent" id="emailContent">이름: <%="\r\n\n\n"%>핸드폰 번호:<%="\r\n\n\n"%>할 말:
                            </textarea>
                        </div>
                    	<div>
                        <input type="submit" class="genric-btn primary radius" value="신청">
                        <button type="button" class="genric-btn primary radius" onclick="window.close();">취소</button>
                    	</div>
                    
                    </div>
                 </div>
              </div>
           </form>
<script type="text/javascript">

var str = document.getElementById("textarea").value;
str = str.replace(/(?:\r\n|\r|\n)/g, '<br>');
document.getElementById("textarea").value = str;



</script>


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
