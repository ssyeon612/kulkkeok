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
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <script type="text/javascript">
    function idChk(){
		var doc = document.getElementsByName("id")[0];
		if(doc.value.trim()=="" || doc.value==null){
			alert("아이디를 입력하세요");
		} else {
			var target = "register.do?command=idChk&id="+doc.value.trim();
			open(target, "window", "width=400, height=200" );
		}
	}
    function idChkConfirm(){
  	 	var chk = document.getElementsByName("id")[0].title;
		if(chk=="n"){
			alert("아이디 중복 체크를 해주세요");
			document.getElementsByName("id")[0].focus();
		}
    }
    function pwConfirm(){
    	var pwChk = document.getElementsByName("pw")[0];
		if(pwChk.value.trim()=="" || pwChk.value==null){
			alert("비밀번호를 먼저 입력하세요");
			document.getElementsByName("pw")[0].focus();
		}
    }
    function isSame(){
    	var submit = document.getElementById("submit");
    	if(document.getElementById('pw1').value != "" && document.getElementById('pw2').value != ""){
    		if(document.getElementById('pw1').value == document.getElementById('pw2').value) {
    			document.getElementById('same').innerHTML='비밀번호 일치';
    			document.getElementById('same').style.color='blue';
    			submit.disabled = false;
    		}
    		else{
    			document.getElementById('same').innerHTML='비밀번호 불일치';
    			document.getElementById('same').style.color='red';
    			submit.disabled = "disabled";
    		}
    	}
    }
    </script>
</head>

<body>
    
    <!--::header part start::-->
    <%@ include file="../form/header.jsp" %>

    <!-- breadcrumb start-->
    <!-- breadcrumb start-->

    <!-- join part start -->
        <section class="banner_part">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="section-top-border">
                        <div class="join">
                            <h3 class="mb-30">JOIN</h3>
                            <form action="register.do" method="post" >
                            <input type="hidden" name="command" value="join">
                                <div class="mt-10 form-group"  style="float:left;">
                                    <input type="text" name="id" title="n" placeholder="아이디를 입력해 주세요" required class="form-control" style="width:200px; margin-left: 150px;">
                                </div>
                                <div style="float:left; margin:12px;">
                                    <input type="button" class="btn pull-right btn-success" value="중복 확인" onclick="idChk()">
                                </div>
                                <div class="mt-10 form-group">
                                    <input type="password" id="pw1" name="pw"placeholder="비밀번호를 입력해 주세요" required class="form-control" onchange="isSame()" onclick="idChkConfirm();">
                                </div>
                                <div class="mt-10 form-group">
                                    <input type="password" id="pw2" name="chkPw" placeholder="비밀번호를 다시 입력해 주세요" required class="form-control" onchange="isSame()" onclick="pwConfirm();">
                                </div>
                                <span id="same"></span>
                                <div class="mt-10 form-group">
                                    <input type="text" name="name" placeholder="이름을 입력해 주세요" required class="form-control" >
                                </div>
                                <div class="mt-10 form-group">
                                    <input type="email" name="email" placeholder="이메일주소를 입력해 주세요" required class="form-control">
                                </div>
                                <div class="mt-10 form-group">
                                    <input type="text" name="phone" placeholder="핸드폰번호를 입력해 주세요" required class="form-control">
                                </div>
                                <!--<a href="#" class="genric-btn link radius" style="background:paleturquoise">LOGIN</a>-->
                                <input type="submit" id="submit" class="genric-btn primary radius" style="width:300px; margin-top: 15px;" value="회원가입" disabled="disabled">
                            </form>
                        </div>
                    </div>
                    <!--
                        아이디 비밀번호 이름 핸드폰 번호 메일주소
                    -->
                </div>
            </div>
        </section>
        <!-- join part end -->

    <!-- footer part start-->
    <%@ include file="../form/footer.jsp" %>
    <!-- footer part end-->

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