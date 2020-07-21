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
<%@ include file="../form/header.jsp" %>
<jsp:useBean id="dto" class="com.kulkkeok.model.dto.MoimDto" scope="request"></jsp:useBean>

    <!--event_part start-->
    <section class="event_part section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="event_slider owl-carousel" >

				<c:choose>
					<c:when test="${empty list }">
						<div class="single_event_slider">
                            <div class="row justify-content-end">
                                <div class="ol-lg-6 col-md-6">
                                    <div class="event_slider_content">
                                        <p>참여할 수 있는 모임이 존재하지 않습니다.</p>
                                        <p>새로운 모임을 만들어 보세요.</p>
                                    </div>
                                </div>
                            </div>
						</div>
					</c:when>
						
					<c:otherwise>
						<c:forEach var="dto" items="${list }">
						
                        <div class="single_event_slider">
                            <div class="row justify-content-end">
                                <div class="ol-lg-6 col-md-6">
                                    <div class="event_slider_content">
                                        <h5>[${dto.categoryNo }]</h5>
                                        <h2>${dto.moimTitle }</h2>
                                        <!-- <p>${dto.moimContent }</p> -->
                                        <p>모임 일자: <span>${dto.moimDate }</span> </p>
                                        <p>장소: <span>${dto.moimPlaceName }</span> </p>
                                        <a href="moim.do?command=view&moimNo=${dto.moimNo }" class="btn_1">자세히 보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--event_part end-->

    <!-- tour details content css start-->
    <section class="tour_details_content section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="content_iner">
                        <div class="tour_details_content_btn">
                            <input type="button" onclick="location.href='moim.do?command=moim_more'" class="btn_1" value="모임 더보기" />
                            	<c:if test="${!empty user }">
                            		<input type="button" onclick="location.href='moim.do?command=write'" class="btn_1" value="글쓰기" />
                            	</c:if>
                            	
                            	<c:if test="${empty user }">
                            	    <input type="button" onclick="apply();" class="btn_1" value="글쓰기" />
                            	</c:if>
                            	
                            	<script type="text/javascript">
                                    function apply(){
                                    	alert('회원만 이용할 수 있습니다.');
                                        //회원가입 페이지로 이동하기
                                        //location.href="";
                                        }
                                </script>
                            	
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- tour details content css end-->

    <!-- footer part start-->
<%@ include file="form/footer.jsp" %>

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