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
    
    <style type="text/css">
    	.alert-success,.alert-danger{
    		display: none;
    	}	
    </style>
    
	<script type="text/javascript">
		$(function(){
			
			// password1을 적어야 password2 abled.
			$("#password").keyup(function(){
				if($("#password").val()==""||$("#password").val()==null){
					$("#password2").prop("disabled",true);
				}else{
					$("#password2").prop("disabled",false);
				}
			});
			
			// password1 == password2 check.
			$("#password2").keyup(function(){
				var pwd1=$("#password").val();
				var pwd2=$("#password2").val();
				
				if(pwd1 != "" || pwd2 != ""){
					if(pwd1 == pwd2){
						$("#alert-success").css({"display":"block"});
						$("#alert-danger").css({"display":"none"});
						$("#submit").removeAttr("disabled");
						
						}else{ 
							$("#alert-success").css({"display":"none"});
							$("#alert-danger").css({"display":"block"});
							$("#submit").attr("disabled", "disabled");
						}
					}
				});	
			
			$("#infoForm").submit(function(){
				
				if($("#name").val()==""||$("#name").val()==null){
					alert("빈 칸이 존재합니다.");
					return false;
				}
				
				if($("#tel").val()==""||$("#tel").val()==null){
					alert("빈 칸이 존재합니다.");
					return false;
				}else{
					var tel = $("#tel").val();
					
					if(tel.substring(0,3)!="010" || tel.length != 11){
						alert("핸드폰번호 형식이 아닙니다.");
						return false;
					}
					
				}			
				
				if($("#email").val()==""||$("#email").val()==null){
					alert("빈 칸이 존재합니다.");
					return false;
				}
				
				if($("#password").val()==""||$("#password").val()==null||$("#password2").val()==""||$("#password2").val()==null){
					alert("비밀번호를 입력해주세요.");
					return false;
				}
	
			});
		});
	
	</script>


</head>
<body>
	 <%@ include file="../form/header.jsp" %>
    	<!--body-->
        <section class="banner_part">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="section-top-border">
                        <div class="mypage" style="height: auto;">
                            <div class="mypagelogo mb-30" style="text-align: center; margin-top: 0px;"><span style="font-family: 'Permanent Marker', sans-serif; color: #0c3e72; font-size: 3em;">My Information</span></div>
                                <div style="margin: 0px auto; width: 400px;">
                                    <form action="mypage.do?command=updateUser" method="post" name="infoForm" id="infoForm">
                                        <div class="form-group">
                                            <label for="id"><b>아이디</b></label>
                                            <input type="text" class="form-control" style="background-color: white;" name="id" id="id" value="${user.userId }" readonly="readonly"/>
                                        </div>

                                        <div class="form-group" >
                                            <label for="name"><b>이름</b></label>
                                            <input type="text" class="form-control" name="name" id="name" value="${user.userName }">
                                        </div>

                                        <div class="form-group">
                                            <label for="password"><b>비밀번호</b></label>
                                            <input type="password" class="form-control" name="password" id="password"/>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="password2"><b>비밀번호 확인</b></label>
                                            <input type="password" class="form-control" name="password2" id="password2" disabled="disabled"/>
                                        </div>
                                        
										<div class="mt-3 mb-3 alert alert-success" style="text-align: center;" id="alert-success">비밀번호가 일치합니다.</div>
										<div class="mt-3 mb-3 alert alert-danger" style="text-align: center;" id="alert-danger">비밀번호가 일치하지 않습니다.</div>

                                        <div class="form-group">
                                            <label for="tel"><b>핸드폰번호</b></label>
                                            <input type="tel" class="form-control" name="tel" id="tel" value="${user.userPhone }">
                                        </div>

                                        <div class="form-group">
                                            <label for="email"><b>이메일</b></label>
                                            <input type="email" class="form-control" name="email" id="email" value="${user.userEmail }">
                                        </div>  
                                        <div class="form-group">
                                            <input type="submit" class="genric-btn primary radius mb-2" id="submit" value="수정하기"/>
                                        </div> 
                                </form>
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