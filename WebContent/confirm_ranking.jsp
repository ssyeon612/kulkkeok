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

<!--body-->
<!--================start writing area =================-->
<body style="margin: 0 auto;">
    <section class="">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="section-top-border" style="padding: 30px;">
                    <div class="" style="margin:0px auto; text-align: center;">
                            <h4 style="text-align: center;">WorldCup Ranking</h4>
                                <table  class="table">
                                    <col width="100"><col width="350"><col width="100">
                                    <tr>
                                        <th>순위</th>
                                        <th>맥주이름</th>
                                        <th>표 수</th>
                                    </tr>
                                    <c:choose>
                                    	<c:when test="${empty ranking }">
                                    		<tr>
                                    			<td colspan="3" style="text-align: center">데이터가 없습니다.</td>
                                    		</tr>                                 	
                                    	</c:when>
                                    	<c:otherwise>
		                                    <c:forEach var="entry" items="${ranking }" varStatus="status">
			                                    <tr>
			                                        <td>${status.count }</td>
			                                        <td>${(entry.key).beerKorName }</td>
			                                        <td>${entry.value }</td>
			                                    </tr>
		                                    </c:forEach>                  	
                                    	</c:otherwise>                         
                                    </c:choose>
                                    
                                </table>
                            <input type="button" class="genric-btn primary-border radius" style="width:200px; margin-top: 15px;" height="" value="확인" onclick="window.close();"/>
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
