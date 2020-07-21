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
   
</head>
<body>
	 <%@ include file="../form/header.jsp" %>
	 
	 
	 
    <!-- breadcrumb start-->

    <!--body-->
        <section class="banner_part">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="section-top-border">
                        <div class="mypage" style="overflow:auto">
                           <div class="mypagelogo mb-30" style="text-align: center; margin-top: 0px;"><span style="font-family: 'Permanent Marker', sans-serif; color: #0c3e72; font-size: 3em;">My Moim List</span></div>
                            <div>
                                <section class="blog_area single-post-area section_padding"  style="padding: 0px;">
                                    <div class="container">                            
                                        <div class="row">
                                            <div>
                                            	<c:choose>
                                            		<c:when test="${empty moims }">
 	                                            			<div class="mt-5" style="margin: 0px auto; text-align: center; width:900px;">
					                                                <span style="font-size: 1.5em;">
					                                                        There are no meetings you have opened.<br>                 
					                                                        Try to open <span style="color: #fe5c24;">your meetings.</span><br>
					                                                 </span>
					                                                <input class="genric-btn primary-border mt-3" style="width: 100px;" type="button" value="GO" onclick="location.href='moim.do?command=moim'">
					                                      	</div>                                            			
                                            		</c:when>
                                            		<c:otherwise>
                                            		<h3 style="text-align: center;">${user.userName } 님의 모임</h3>
                                            			<c:forEach items="${moims }" var="moim" varStatus="status">
				  												
				  												<div class="blog-author" style="margin-top: 0px; width:850px;">
				                                                    <div class="media align-items-center">
				                                                        <div class="media-body">
				                                                            <h4><a href="moim.do?command=view&moimNo=${moim.moimNo }"><span><b>[ ${moim.categoryNo } ]</b> </span> ${moim.moimTitle }</a></h4>
				                                               
				                                                                <p class="date">모임일자 : ${moim.moimDate } </p>
				                                                                <p class="date">작성일자 : ${moim.moimWriteDate } </p>
				                                                            
				                                                        </div>
				                                                    </div>
				                                                </div> 
				                                                                                         			
                                            			</c:forEach>
                                            		</c:otherwise>
                                            	</c:choose>
                                            

                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
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