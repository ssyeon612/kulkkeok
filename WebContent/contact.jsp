<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
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
    <!-- jquery -->
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    	$(function(){
    		$("#contactForm").submit(function(){
    			var form = document.getElementById("contactForm");
    			
    			var category = form.category.value;
    			var message = form.message.value;
    			var title = form.title.value;
    			var email = form.email.value;
    			
    			if(category == '말머리를 선택해 주세요'){
    				alert("말머리를 선택해 주세요.")
	    			return false;
    			}
    			
    			if(message =='' || message == null || email == '' || email == null || title == '' || title == null ){
    				alert("빈 칸이 존재합니다. 모든 폼을 채워주세요.");
    				return false;
    			}
    			
    			//return false;
    		});
    		
    		
    		$("#category").change(function(){
    			
    			var msg = $("#category option:selected").val();
    			
    			$("#title").val("["+msg+"]"+" 문의 드립니다.");
    			
    		});
    		
    		
    	});
    
    </script>
</head>

<body>
   <!--::header part start::-->
   <%@ include file="../form/header.jsp" %> 
    <!-- Header part end-->

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg bg_img_contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>문의하기</h2>
                            <p>Contact Us</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!-- ================ contact section start ================= -->
    <section class="">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 class="contact-title" style="margin-top: 50px;">문의하기</h2>
                </div>
                <div class="col-lg-8">
                    <form class="form-contact contact_form" action="contact.do" method="post" id="contactForm">
                    	<input type="hidden" name="command" value="contact">
                        <div class="row">
                            <div class="col-12">
                                    <div class="form-group">
                                        <select class="nc_select form-control" style="width:200px;" name="category" id="category" required> 
                                            <option selected >말머리를 선택해 주세요</option>
                                            <option value="로그인문제">로그인문제</option>
                                            <option value="맥주관련">맥주관련</option>
                                            <option value="기타">기타</option>
                                        </select>
                                    </div>
                                <div class="form-group ">
                                    <textarea class="form-control w-100 is-invalid" name="message" id="message" cols="30" rows="9" onfocus="this.placeholder = ''" onblur="this.placeholder = '내용을 입력해 주세요'" placeholder='내용을 입력해 주세요'></textarea>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input class="form-control is-invalid" name="title" type="text" id="title" onfocus="this.placeholder = ''" onblur="this.placeholder = '제목을 입력해 주세요'" placeholder='제목을 입력해 주세요'>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input class="form-control is-invalid" name="email" type="email" id="email" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일을 입력해 주세요'" placeholder='이메일을 입력해 주세요'>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mt-3">
                            <input type="submit" value="보내기" class="button button-contactForm btn_1" >
                        	<input type="hidden" name="to" value="kulkkeok@gmail.com">
                        	<input type="hidden" name="from" value="kulkkeok@gmail.com">
                        </div>  
                    </form>
                </div>
                 
                <div class="col-lg-4">
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-home"></i></span>
                        <div class="media-body">
                            <h3>서울시 강남구</h3>
                            <p>테헤란로 14길 6 남도빌딩 4F</p>
                        </div>
                    </div>
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                        <div class="media-body">
                            <h3>+82 1012345678</h3>
                            <p>   월요일 ~ 금요일</p>
                            <p> 오전 9시부터 오후 6시</p>
                        </div>
                    </div>
                    <div class="media contact-info">
                        <span class="contact-info__icon"><i class="ti-email"></i></span>
                        <div class="media-body">
                            <h3>kulkkeok@gmail.com</h3>
                            <p>언제든지 문의해 주세요</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ contact section end ================= -->

    <!-- footer part start-->
    <%@ include file="../form/footer.jsp" %>    
    <!-- footer part end-->

</body>

</html>