<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>   
    
<!DOCTYPE html>
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
    <!--::header part start::-->
    <%@ include file="../form/header.jsp" %>
    <!-- Header part end-->

    <!-- login part start -->
        <section class="banner_part">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="section-top-border">
                        <div class="login" style="height: 500px;">
                            <h3 class="mb-30 login_logo">LOG IN</h3>
                            <form action="login.do" method="post">
                            <input type="hidden" name="command" value="login">
                                <div class="mt-10 form-group">
                                    <input type="text" name="id" placeholder="ID" required class="form-control">
                                </div>
                                <div class="mt-10 form-group">
                                    <input type="password" name="pw" placeholder="PASSWORD" required class="form-control">
                                </div>
                                
                                <input type="submit" class="genric-btn primary radius" style="width:300px; margin-top: 15px;" value="LOGIN">
                                <br><br><br>
                                <!-- 네이버아이디로로그인 버튼 노출 영역 -->
								<div id="naverIdLogin"></div>
                                <!-- //네이버아이디로로그인 버튼 노출 영역 -->
                                
                                <br>
                                <a id="kakao-login-btn" ></a>
                                <hr>
                                
                                <div>
                                	<a href="#" class="form_botton_span" onclick="location.href='register.do?command=joinPage'">회원가입</a>
                                	<a href="#" class="form_botton_span" onclick="location.href='login.do?command=findIdPage'">아이디 찾기</a>
                                	<a href="#" class="form_botton_span" onclick="location.href='login.do?command=findPwPage'">비밀번호 찾기</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    
    <!-- login part end -->
    
     <!-- 네이버 로그인 -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
    
    
								<!-- 네이버아이디로로그인 초기화 Script -->
								<script type="text/javascript">
									var naverLogin = new naver.LoginWithNaverId(
										{
											clientId: "2rgGm0EDyCztIN9m0foP",
											callbackUrl: "http://localhost:8787/KULKKEOK/callback.jsp",
											isPopup: false, 
											loginButton: {color: "green", type: 4, height: 48} /* 로그인 버튼의 타입을 지정 */
										}
									);
									
									naverLogin.init();
									
								</script>
								<!-- // 네이버아이디로로그인 초기화 Script -->
								
								
								
	<!-- 카카오톡 로그인 -->
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

								
								<!-- 카카오톡 아이디로로그인 초기화 Script -->
								<script type='text/javascript'>
							   //<![CDATA[
							    // 사용할 앱의 JavaScript 키를 설정해 주세요.
							    Kakao.init('a882bfbb712bc453a746c73aed7f06e7');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
							    
							    // 카카오 로그인 버튼을 생성합니다.
							    Kakao.Auth.createLoginButton({
							      container: '#kakao-login-btn',
							      success: function(authObj) {
							           Kakao.API.request({
							               url: '/v2/user/me',
							               success: function(res) {
							            	  var id	= res.id;
							              	  var name	= res.properties.nickname != undefined ? res.properties.nickname : '이름없음';
							              	  var email	= res.kaccount_email;

							              	  location.href = "login.do?command=klogin&kid="+id+"&kname="+name;
							                   }
							                 })
							               },
							               fail: function(error) {
							                 alert(JSON.stringify(error));
							               }
							    });
							</script>
								<!-- // 카카오톡 아이디로로그인 초기화 Script -->


								    

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