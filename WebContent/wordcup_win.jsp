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

    <!--::header part start::-->
    <%@ include file="../form/header.jsp" %>
    <!-- Header part end-->
    
    
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg" style="background-image: url('beer_image/img19.jpg'); background-repeat: no-repeat;">
      <div class="container">
            <div class="row">
                  <div class="col-lg-12">
                        <div class="breadcrumb_iner">
                              <div class="breadcrumb_iner_item text-center">
                                    <h2>맥주 월드컵</h2>
                                    <p>Beer World Cup</p>
                              </div>
                        </div>
                  </div>
            </div>
      </div>
      </section>
      <!-- breadcrumb start-->

   <section class="container p-5" style="margin: 0px auto; text-align: center;">
       <div id ="World_cup" style="padding: 50px; border-radius: 20px 20px 20px 20px; box-shadow: 0 10px 30px 0 #CFD8DC; ">
            <div>
                <div><span style="font-size: 2.5em;">결 과</span></div>
                <div class="mt-2">

                    <div id="vs1" style="margin: 0px auto; background-image:url('img/beer/${winBeer.beerPic }.jpg'); background-size:contain; background-position:center center; background-repeat: no-repeat; width: 450px; height: 400px;"></div>
 
                    <div class="m-3" style="margin: 0px auto;">
                    	<b>${winBeer.beerKorName }</b><br>
                           	${winBeer.beerDetail }
                        <div class="p-3">
                            <input type="button" class="genric-btn primary" value="맥주 보러가기" onclick="location.href='beer.do?command=beerdetail&beerno=${winBeer.beerNo }'">
                            <input type="button" class="genric-btn primary" value="순위" onclick="window.open('worldcup.do?command=ranking', '','width=400px, height=600px, left=100, top=50');">
                       
                        </div>
	                        <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
						    <div style="width: 250px; height: 40px; background-color: #F8F8FF; margin: 0 auto;">
						    <a href="javascript:;" id="kakao-link-btn" >
							<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" width="40px" />
							&nbsp;&nbsp;
							<span style="font-weight: bold;">카카오톡으로 공유하기</span>
							</a>
							</div>
                    </div>
                </div>
            </div>
       </div>
   </section>
   
   
   <!--  카카오톡 공유하기 -->
   <script type="text/javascript">
   		
		Kakao.init('a882bfbb712bc453a746c73aed7f06e7');
		
		Kakao.Link.createDefaultButton({
			container: '#kakao-link-btn',
			objectType: 'feed',
			content:{
				title: '꿀꺽꿀꺽',
				description: '당신의 선택은 라거 vs 에일 vs 람빅?!',
				imageUrl: 'http://localhost:8787/KULKKEOK/WebContent/beer_image/img1.jpg',
				link: {
			          webUrl: 'http://localhost:8787/KULKKEOK/worldcup.do?command=start'
			        }
			      },
			      buttons: [
			          {
			            title: '자세히 보기',
			            link: {
			             // mobileWebUrl: 'https://m.naver.com',
			              webUrl: 'http://localhost:8787/KULKKEOK/worldcup.do?command=start'
			            }
			          },
			        ]
		});
	</script>
   
    
    
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