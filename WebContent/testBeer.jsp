<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>   
<!DOCTYPE html>
<html lang="en" class="no-js">
   <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
      <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
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
       <!-- style CSS -->
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <meta name="description" content="Creative Button Styles  - Modern and subtle styles &amp; effects for buttons" />
      <meta name="keywords" content="button styles, css3, modern, flat button, subtle, effects, hover, web design" />
      <meta name="author" content="Codrops" />
      <link rel="stylesheet" type="text/css" href="css/default.css" />
      <link rel="stylesheet" type="text/css" href="css/component.css" />
      <style type="text/css">
       @font-face { font-family: 'CookieRunOTF-Bold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/CookieRunOTF-Bold00.woff') format('woff'); font-weight: normal; font-style: normal; }
       
       div.text{
          position: relative; 
          height:200px; 
          padding: 100px; 
          color: black; 
          font-family: 'CookieRunOTF-Bold'; 
          font-size:25px;
          display: none;
       }
       div.img{
          color: black; 
          font-family: 'CookieRunOTF-Bold'; 
          font-size: 20px;
          display: none;
       }
       #again{
          font-family: 'CookieRunOTF-Bold';
          height: 60px; 
          font-size: 13px; 
          display:none; 
          margin-left: auto; 
          margin-right: auto;
       }
       #beer{
          font-family: 'CookieRunOTF-Bold';
          height: 60px; 
          font-size: 13px; 
          display:none; 
          margin-left: auto; 
          margin-right: auto;
       }
    </style>
    
    <script type="text/javascript">
         var img = document.createElement("img");
         
       function btn(v){
          
          if(v.id == "start"){
             document.getElementById("main").style.display = "none";
              document.getElementById("q1").style.display = "block";
              document.getElementById("q1yes").style.display = "inline-block";
              document.getElementById("q1no").style.display = "inline-block";
          }
          if(v.id == "q1yes"){
              document.getElementById("q1").style.display = "none";
              document.getElementById("q2").style.display = "block";
              document.getElementById("q1yes").style.display = "none";
              document.getElementById("q1no").style.display = "none";
              document.getElementById("q2yes").style.display = "inline-block";
              document.getElementById("q2no").style.display = "inline-block";
          }
          if(v.id == "q1no"){
             document.getElementById("q1").style.display = "none";
             document.getElementById("q3").style.display = "block";
             document.getElementById("q1yes").style.display = "none";
             document.getElementById("q1no").style.display = "none";
             document.getElementById("q3yes").style.display = "inline-block";
             document.getElementById("q3no").style.display = "inline-block";
          }
          if(v.id == "q2yes"){
             document.getElementById("q2").style.display = "none";
             document.getElementById("q2yes").style.display = "none";
             document.getElementById("q2no").style.display = "none";
             document.getElementById("again").style.display = "block";
             document.getElementById("beer").style.display = "block";
             document.getElementById("img1").style.display = "block";
             document.getElementById("kakao").style.display = "block";
          }
          if(v.id == "q2no"){
             document.getElementById("q2").style.display = "none";
             document.getElementById("q4").style.display = "block";
             document.getElementById("q2yes").style.display = "none";
             document.getElementById("q2no").style.display = "none";
             document.getElementById("q4yes").style.display = "inline-block";
             document.getElementById("q4no").style.display = "inline-block";
          }
          if(v.id == "q3yes"){
             document.getElementById("q3").style.display = "none";
             document.getElementById("q3yes").style.display = "none";
             document.getElementById("q3no").style.display = "none";
             document.getElementById("again").style.display = "block";
             document.getElementById("beer").style.display = "block";
             document.getElementById("img6").style.display = "block";
             document.getElementById("kakao").style.display = "block";
          }
          if(v.id == "q3no"){
             document.getElementById("q3").style.display = "none";
             document.getElementById("q6").style.display = "block";
             document.getElementById("q3yes").style.display = "none";
             document.getElementById("q3no").style.display = "none";
             document.getElementById("q6yes").style.display = "inline-block";
             document.getElementById("q6no").style.display = "inline-block";
          }
          if(v.id == "q4yes"){
             document.getElementById("q4").style.display = "none";
             document.getElementById("q4yes").style.display = "none";
             document.getElementById("q4no").style.display = "none";
             document.getElementById("again").style.display = "block";
             document.getElementById("beer").style.display = "block";
             document.getElementById("img2").style.display = "block";
             document.getElementById("kakao").style.display = "block";
          }
          if(v.id == "q4no"){
             document.getElementById("q4").style.display = "none";
             document.getElementById("q5").style.display = "block";
             document.getElementById("q4yes").style.display = "none";
             document.getElementById("q4no").style.display = "none";
             document.getElementById("q5yes").style.display = "inline-block";
             document.getElementById("q5no").style.display = "inline-block";
          }
          if(v.id == "q5yes"){
             document.getElementById("q5").style.display = "none";
             document.getElementById("q7").style.display = "block";
             document.getElementById("q5yes").style.display = "none";
             document.getElementById("q5no").style.display = "none";
             document.getElementById("q7yes").style.display = "inline-block";
             document.getElementById("q7no").style.display = "inline-block";
          }
          if(v.id == "q5no"){
             document.getElementById("q5").style.display = "none";
             document.getElementById("q5yes").style.display = "none";
             document.getElementById("q5no").style.display = "none";
             document.getElementById("again").style.display = "block";
             document.getElementById("beer").style.display = "block";
             document.getElementById("img5").style.display = "block";
             document.getElementById("kakao").style.display = "block";
          }
          if(v.id == "q6yes"){
             document.getElementById("q6").style.display = "none";
             document.getElementById("q6yes").style.display = "none";
             document.getElementById("q6no").style.display = "none";
             document.getElementById("again").style.display = "block";
             document.getElementById("beer").style.display = "block";
             document.getElementById("img7").style.display = "block";
             document.getElementById("kakao").style.display = "block";
          }
          if(v.id == "q6no"){
             document.getElementById("q6").style.display = "none";
             document.getElementById("q6yes").style.display = "none";
             document.getElementById("q6no").style.display = "none";
             document.getElementById("again").style.display = "block";
             document.getElementById("beer").style.display = "block";
             document.getElementById("img8").style.display = "block";
             document.getElementById("kakao").style.display = "block";
          }
          if(v.id == "q7yes"){
             document.getElementById("q7").style.display = "none";
             document.getElementById("q7yes").style.display = "none";
             document.getElementById("q7no").style.display = "none";
             document.getElementById("again").style.display = "block";
             document.getElementById("beer").style.display = "block";
             document.getElementById("img3").style.display = "block";
             document.getElementById("kakao").style.display = "block";
          }
          if(v.id == "q7no"){
             document.getElementById("q7").style.display = "none";
             document.getElementById("q7yes").style.display = "none";
             document.getElementById("q7no").style.display = "none";
             document.getElementById("again").style.display = "block";
             document.getElementById("beer").style.display = "block";
             document.getElementById("img4").style.display = "block";
             document.getElementById("kakao").style.display = "block";
          }
          if(v.id == "again"){
             for(var i=1; i<=7; i++){
                document.getElementById("q"+i).style.display = "none";
                document.getElementById("q"+i+"yes").style.display = "none";
                document.getElementById("q"+i+"no").style.display = "none";
                document.getElementById("img"+i).style.display = "none";
             }
             document.getElementById("img8").style.display = "none";
             document.getElementById("again").style.display = "none";
             document.getElementById("beer").style.display = "none";
             document.getElementById("main").style.display = "block";
             document.getElementById("kakao").style.display = "none";
            }
       }
    </script>   
   </head>
   <body>
      <%@ include file="../form/header.jsp" %>
      
         <section class="banner_part">
               <div class="container">
                  <div class="row align-items-center justify-content-center">
                       <div class="section-top-border">
                          <div class="join" style="margin-top: 140px; height: 520px;">
                          
                             <div id="main" class="text" style="display: block;'">
                           어떤 맥주가 마시고 싶어?
                           <input type="button"  class="btn btn-2 btn-2i" id="start" value="START" style="margin-top: 150px;" onclick="btn(this);">
                        </div>
                        
                        <div id="q1" class="text">
                           쓴 맥주가 좋아!
                        </div>
                        
                        <div id="q2" class="text">
                           달달한 맥주가 좋아!
                        </div>
                        
                        <div id="q3" class="text">
                           신 맛이 있는 맥주가 좋아!
                        </div>
                        
                        <div id="q4" class="text">
                           산뜻하고 가벼운 맥주가 좋아!
                        </div>
                        
                        <div id="q5" class="text">
                           깊이있고 향기로운 맥주가 좋아!
                        </div>
                        
                        <div id="q6" class="text">
                           향신료 냄새가 좋아!
                        </div>
                        
                        <div id="q7" class="text">
                           초코렛이나 커피맛이 좋아!
                        </div>
                        
                        <div id="img1" class="img"><img src="img/beer/65. 구스 아일랜드 비어.jpg" style="margin-right: -50px; width: 300px; height: 300px;">당신의 취향은 인디안 페일에일?!</div>
                     <div id="img2" class="img"><img src="img/beer/55. 피츠.jpg" style="width: 300px; height: 300px;"> 당신의 취향은 페일 라거?!</div>
                  <div id="img3" class="img"><img src="img/beer/72. 기네스 드래프트.jpg" style="margin-right: 17px; width: 300px; height: 300px;">당신의 취향은 스타우트?!</div>
                  <div id="img4" class="img"><img src="img/beer/117. 뉴캐슬 브라운 에일.jpg" style="margin-right: -45px; width: 300px; height: 300px;">당신의 취향은 브라운/마일드 에일?!</div>
                  <div id="img5" class="img"><img src="img/beer/15. 빅웨이브 골든 에일.jpg" style="margin-left: -20px; width: 300px; height: 300px;">당신의 취향은 골든 에일?!</div>
                  <div id="img6" class="img"><img src="img/beer/70. 귀즈.jpg" style="margin-left: -65px; width: 300px; height: 300px;">당신의 취향은 람 빅?!</div>
                  <div id="img7" class="img" ><img src="img/beer/115. 뉴 벨지움 팻 타이어 화이트.jpg" style="margin-right: -55px; width: 300px; height: 300px;">당신의 취향은 벨지안 화이트 에일?!</div>
                  <div id="img8" class="img"><img src="img/beer/49. 아인지들러 바이스비어.jpg" style="margin-left: -45px; margin-right: -20px; width: 300px; height: 300px;">당신의 취향은 바이젠?!</div>
                        
                        <input type="button" class="btn btn-2 btn-2i" id="q1yes" value="Yes" style="display:none; margin-top: 84px; font-family: 'CookieRunOTF-Bold';" onclick="btn(this);">
                        <input type="button" class="btn btn-2 btn-2j" id="q1no" value="No" style="display:none; margin-top: 84px; font-family: 'CookieRunOTF-Bold';" onclick="btn(this);">
                        
                        <input type="button" class="btn btn-2 btn-2i" id="q2yes" value="Yes" style="display:none; margin-top: 84px; font-family: 'CookieRunOTF-Bold';" onclick="btn(this);">
                        <input type="button" class="btn btn-2 btn-2j" id="q2no" value="No" style="display:none; margin-top: 84px; font-family: 'CookieRunOTF-Bold';" onclick="btn(this);">
                        
                        <input type="button" class="btn btn-2 btn-2i" id="q3yes" value="Yes" style="display:none; margin-top: 84px; font-family: 'CookieRunOTF-Bold';" onclick="btn(this);">
                        <input type="button" class="btn btn-2 btn-2j" id="q3no" value="No" style="display:none; margin-top: 84px; font-family: 'CookieRunOTF-Bold';" onclick="btn(this);">
                        
                        <input type="button" class="btn btn-2 btn-2i" id="q4yes" value="Yes" style="display:none; margin-top: 84px; font-family: 'CookieRunOTF-Bold';" onclick="btn(this);">
                        <input type="button" class="btn btn-2 btn-2j" id="q4no" value="No" style="display:none; margin-top: 84px; font-family: 'CookieRunOTF-Bold';" onclick="btn(this);">
                        
                        <input type="button" class="btn btn-2 btn-2i" id="q5yes" value="Yes" style="display:none; margin-top: 84px; font-family: 'CookieRunOTF-Bold';" onclick="btn(this);">
                        <input type="button" class="btn btn-2 btn-2j" id="q5no" value="No" style="display:none; margin-top: 84px; font-family: 'CookieRunOTF-Bold';" onclick="btn(this);">
                        
                        <input type="button" class="btn btn-2 btn-2i" id="q6yes" value="Yes" style="display:none; margin-top: 84px; font-family: 'CookieRunOTF-Bold';" onclick="btn(this);">
                        <input type="button" class="btn btn-2 btn-2j" id="q6no" value="No" style="display:none; margin-top: 84px; font-family: 'CookieRunOTF-Bold';" onclick="btn(this);">
                         
                         <input type="button" class="btn btn-2 btn-2i" id="q7yes" value="Yes" style="display:none; margin-top: 84px; font-family: 'CookieRunOTF-Bold';" onclick="btn(this);">
                        <input type="button" class="btn btn-2 btn-2j" id="q7no" value="No" style="display:none; margin-top: 84px; font-family: 'CookieRunOTF-Bold';" onclick="btn(this);">
                           
                        <button class="btn btn-3 btn-3e icon-arrow-right" id="again" onclick="btn(this)" >다시하기</button>
                        <button class="btn btn-3 btn-3e icon-arrow-right" id="beer" onclick="location.href='beer.do?command=beerinfo'">더 많은 맥주가 보고싶다면?</button>
                        
                         <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
                   <div id="kakao" style="width: 250px; height: 40px; background-color: white; margin: 0 auto; display: none;">
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
   
   <!--  카카오톡 공유하기 -->
   <script type="text/javascript">
         
      Kakao.init('a882bfbb712bc453a746c73aed7f06e7');
      
      Kakao.Link.createDefaultButton({
         container: '#kakao-link-btn',
         objectType: 'feed',
         content:{
            title: '꿀꺽꿀꺽',
            description: '당신의 맥주취향을 확인해보세요!',
            imageUrl: 'http://localhost:8787/KULKKEOK/WebContent/beer_image/img1.jpg',
            link: {
                   webUrl: 'http://localhost:8787/KULKKEOK/testBeer.jsp'
                 }
               },
               buttons: [
                   {
                     title: '자세히 보기',
                     link: {
                      // mobileWebUrl: 'https://m.naver.com',
                       webUrl: 'http://localhost:8787/KULKKEOK/testBeer.jsp'
                     }
                   },
                 ]
      });
   </script>
</html>