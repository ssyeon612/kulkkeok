<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
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
<style>
    .checked {
      color: orange;
    }
</style>

   <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>    
	<script type="text/javascript">

	$(function(){
		$("#reviewForm").submit(function(){
			if($("#content").val()==null || $("#content").val()==""){
				alert("리뷰 내용을 입력해주세요.");
				return false;
			}
		});			
	});


	</script>


<c:set var="star" value="${star }"></c:set>
<c:set var="user" value="${sessionScope.user }" />


<body style="margin: 0 auto;">
    <section class="">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="section-top-border" style="padding: 30px;">
                    <div class="">
                            <h4 style="text-align: center;">리뷰 작성</h4>
                            <div style="display: inline-block; margin: 0px;">
                                <form  method="post" action="review.do" id="reviewForm">
                                	<input type="hidden" name="command" value="beerreview" />
                                	<input type="hidden" name="beerno" value="${dto.beerNo }" />
                                	<input type="hidden" name="star" value="${star }" />
                                	<input type="hidden" name="writer" value="${user.userId } "/>
	                                    <div id="user_review" class="place_review" style="margin-top: 10px;">
	                                    <c:forEach begin="1" end="${star }">
                                	<i class="fas fa-star checked"></i>
                                		</c:forEach>
                               			 <c:if test="${star  ne 5 }">
                                		<c:forEach begin="1" end="${5-star }">
                                	<i class="fas fa-star"></i>
                                	</c:forEach>
                               			 </c:if> 
                                    </div>
                                    <div class="mb-3" style="margin-top: 10px;">
                                        <label for="content"><b>내용</b></label>
                                        <textarea class="form-control" rows="7" cols="30" name="reviewcontent" id="content" style="resize:none;"></textarea>
                                    </div>
			                            <input type="submit" class="genric-btn primary-border radius" style="width:150px; margin-top: 15px;" value="확인"/>
			                            <input type="button" class="genric-btn primary-border radius" style="width:150px; margin-top: 15px;" value="취소" onclick="window.close();"/>
                                </form>
                       		</div>
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
