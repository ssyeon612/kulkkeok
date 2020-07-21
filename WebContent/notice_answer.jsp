<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>      
    
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
</head>
<body>

 <%@ include file="../form/header.jsp" %>
 
     <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg bg_img_freeboard">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>공지사항</h2>
                            <p>Notice</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

  <!--body-->
    <!--================start writing area =================-->
        <div>
            <form action="notice.do" name="viewForm" method="post"  style="margin-bottom: 50px;">
					<input type="hidden" name="command" value="answer">
                    <input type="hidden" name="parentNo" value="${parentPost.postNo }"> 
                <div id="chgposition">
                    <div class="freeboard_detail" role="main">
                        <h1>공지사항</h1>
                        <h2>답글</h2>
                        <br><br>
                        <div id="freeboard_form">
                            <div class="mb-3">
                                <label for="title"><b>제목</b></label>
                                <input type="text" class="form-control" name="title" id="title" value="RE:${parentPost.postTitle}"/>
                            </div>
 							<div class="mb-3">
	                    		<label for="writer"><b>작성자</b></label>
	                    		<input type="text" class="form-control" name="userId" id="name" value="${user.userId }" readonly="readonly" style="background-color:white;"/>
	                		</div>                            
                            <div class="mb-3">
                                <label for="content"><b>내용</b></label>
                                <textarea class="form-control" rows="10" cols="60" name="content" id="content" style="resize:none;"></textarea>
                            </div>   
                                                
	                        <div style="text-align: right;">
	                            <button type="submit" class="genric-btn primary radius" id="btnSave">작성</button>
	                            <button type="button" class="genric-btn primary radius" id="btnCancel" onclick="location.href='notice.do?command=detail&no=${parentPost.postNo}'">취소</button>
	                        </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    <!--================end writing area=================-->

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