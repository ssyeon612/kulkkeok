<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
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
    <!-- style CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
   <link rel="stylesheet" href="path/to/line-awesome/css/line-awesome-font-awesome.min.css">

</head>

<body>
<%@ include file="../form/header.jsp" %>

    <!-- banner part start-->
    <section class="banner_part" id="bannerbg">
        <div class="container" >
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-10">
                    <div class="banner_text text-center">
                        <div class="banner_text_iner">
                            <h1>KULKKEOK KULKKEOK</h1><br>
                            <p>세상은 넓고 맥주는 많다</p>
                            <a href="#" class="btn_1" id="searchBeer">맥주찾아보기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- banner part start-->
    <jsp:useBean id="dto" class="com.kulkkeok.model.dto.BeerDto" scope="request"></jsp:useBean>

    <!-- booking part start-->
    <!-- Header part end-->
    <br><br><br>
    <!--top place start-->
    <section class="top_place section_padding" >
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>BEST 3</h2>
                        <p style="font-style: italic;">가장<b style="color=red;"> 평점이 높은</b> 맥주들을 확인해 보세요!</p>
                    </div>
                </div>
            </div>
        <div style="text-align: center; margin-left: 70px;">
            <div class="row">
               <c:choose>
                  <c:when test="${empty bestStar }">
                     순위가 존재하지 않습니다.
                  </c:when>
                  <c:otherwise>
                     <c:forEach var="bestStar" items="${bestStar }">
                        
                         <div class="col-lg-6 col-md-6 rankimg" style="max-width: 30%;">
                             <a href="beer.do?command=beerdetail&beerno=${bestStar.beerNo }"><img src="img/beer/${bestStar.beerPic }.jpg" alt=""></a>
                             <div class="hover_Text d-flex align-items-end justify-content-between">
                                 <div class="beer_align">
                                     <br>
                                     <h3><a href="beer.do?command=beerdetail&beerno=${bestStar.beerNo }">${bestStar.beerKorName }</a></h3>
                                     <p>${bestStar.beerAbv }%</p>
                                
                                     <div class="place_review">
                                        <c:forEach begin="1" end="${bestStar.intStarAvg }">
                                            <i class="fas fa-star checked"></i>
                                         </c:forEach>
                                         <c:if test="${beerStar.intStarAvg ne 5 }">
                                            <c:forEach begin="1" end="${5 - bestStar.intStarAvg }">
                                               <i class="fas fa-star" style="color: #e0ded8;"></i>
                                            </c:forEach>
                                         </c:if>
                              </div>
                                     <span>(${bestStar.countReview }개의 리뷰)</span>                             
                                 </div>
                             </div>
                         </div>
                
                     </c:forEach>
                  </c:otherwise>
               </c:choose>
            </div>
        </div>
        </div>
        
        
        
        <div class="container" style="margin-top: 170px;">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>BEST 3</h2>
                        <p style="font-style: italic;">가장<b style="color=red;"> 리뷰가 많은</b> 맥주들을 확인해 보세요!</p>
                    </div>
                </div>
            </div>
        <div style="text-align: center; margin-left: 100px;">
            <div class="row">
               <c:choose>
                  <c:when test="${empty countReviews }">
                     순위가 존재하지 않습니다.
                  </c:when>
                  <c:otherwise>
                     <c:forEach var="countReviews" items="${countReviews }">
                        
                         <div class="col-lg-6 col-md-6 rankimg" style="max-width: 30%;">
                             <a href="beer.do?command=beerdetail&beerno=${countReviews.beerNo }">
                                <img src="img/beer/${countReviews.beerPic }.jpg" alt="">
                             </a>
                              <div class="hover_Text d-flex align-items-end justify-content-between">
                                  <div class="beer_align">
                                   <br>
                                   <h3><a href="beer.do?command=beerdetail&beerno=${countReviews.beerNo }">${countReviews.beerKorName }</a></h3>
                                   <p>${countReviews.beerAbv }%</p>
                                   
                                   <div class="place_review">
                                      <c:forEach begin="1" end="${countReviews.intStarAvg }">
                                         <i class="fas fa-star checked"></i>
                                      </c:forEach>
                                      <c:if test="${countReviews.intStarAvg ne 5 }">
                                         <c:forEach begin="1" end="${5 - countReviews.intStarAvg }">
                                            <i class="fas fa-star" style="color: #e0ded8;"></i>
                                         </c:forEach>
                                      </c:if>
                                   </div>
                                   
                                <span>(${countReviews.countReview }개의 리뷰)</span>                             
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
 

    <div id="scroll" style="height:300px;">
    </div>
    <section class="booking_part">
        <div class="container" style="width: 950px; ">
            <div class="row">
                <div class="col-lg-12">
                    <div class="booking_menu" style="background-color: rgba(178, 213, 241, 0.39);">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                            <a class="nav-link active" id="hotel-tab" data-toggle="tab" href="#hotel" role="tab" aria-controls="hotel" aria-selected="true">NAME</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" id="tricket-tab" data-toggle="tab" href="#tricket" role="tab" aria-controls="tricket" aria-selected="false">COUNTRY</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" id="place-tab" data-toggle="tab" href="#place" role="tab" aria-controls="place" aria-selected="false">TYPE</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="booking_content">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="hotel" role="tabpanel" aria-labelledby="hotel-tab">
                                <div class="booking_form">
                                    <form action="beer.do" method="post">
                                       <input type="hidden" name="command" value="searchbeername">
                                        <div class="form-row">
                                            <div class="form_colum">
                                                <input type="text" id="beername" name="beername" placeholder="이름으로 검색해 주세요." style= "width: 700px; height:50px; " class="form-control"> 
                                            </div>
                                           <div class="form_btn">
                                                <button class="btn btn-outline-primary">search</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="tricket" role="tabpanel" aria-labelledby="tricket-tab">
                                <div class="booking_form">
                                    <form action="beer.do" method="post">
                                       <input type="hidden" name="command" value="beerorigin">
                                        <div class="form-row">
                                            <div class="form_colum">
                                                <select class="nc_select" name="beerorigin">
                                                    <option selected class="form-control form-control-lg">나라를 선택해 주세요 </option>
                                                    <option value="KOREA">한국</option>
                                                    <option value="AMERICA">미국</option>
                                                    <option value="JAPAN">일본</option>
                                                    <option value="BELGIUM">벨기에</option>
                                                    <option value="ENGLAND">영국</option>
                                                    <option value="GERMANY">독일</option>
                                                    <option value="CZECH">체코</option>
                                                </select>
                                            </div>
                                            <div class="form_btn">
                                                <button class="btn btn-outline-primary">search</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="place" role="tabpanel" aria-labelledby="place-tab">
                                <div class="booking_form">
                                    <form action="beer.do" method="post">
                                       <input type="hidden" name="command" value="beertype">
                                        <div class="form-row">
                                            <div class="form_colum">
                                                <select class="nc_select" name="beertype">
                                                    <option selected >종류를 선택해 주세요 </option>
                                                    <option value="람빅">람빅</option>
                                                    <option value="라거">라거</option>
                                                    <option value="다크라거">다크 라거</option>
                                                    <option value="라이트 라거">라이트 라거</option>
                                                    <option value="복">복</option>
                                                    <option value="필스너">필스너</option>
                                                    <option value="에일">에일</option>
                                                    <option value="밀맥주">밀맥주</option>
                                                    <option value="페일 에일">페일 에일</option>
                                                    <option value="인디아 페일 에일">인디아 페일 에일</option>
                                                </select>
                                            </div>
                                            <div class="form_btn">
                                                <button class="btn btn-outline-primary">search</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!--top place end-->
    <br><br><br><br><br><br><br>
    <!--top place start-->
    <section class="client_review section_padding">
        <div class="container">
            <div class="row ">
                <div class="col-xl-6">
                    <div class="section_tittle">
                        <h2>Reviews</h2>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="client_review_slider owl-carousel">

                  <c:choose>
                     <c:when test="${empty review }">
                        리뷰가 존재하지 않습니다.
                     </c:when>
               
                     <c:otherwise>
                        <c:forEach var="review" items="${review }">
                        
                                 <div class="single_review_slider" style="height:333px; text-align: center;">
                                     <a href="beer.do?command=beerdetail&beerno=${review.beerNo }">
                                        <h4 style="margin-top: 0px; margin-bottom: 15px; font-weight: bold; color: orangered; text-align:center;" >
                                        <i style="color:white;" class="las la-beer la-2x"></i> ${review.beerKorName }</h4>
                                      </a>
                                      
                                      <div class="place_review" style="text-align:center; margin: 0 auto;">
                                         <c:forEach begin="1" end="${review.reviewStar }">
                                            <i class="fas fa-star checked"></i>
                                         </c:forEach>
                                         <c:if test="${review.reviewStar ne 5 }">
                                            <c:forEach begin="1" end="${5 - review.reviewStar }">
                                               <i class="fas fa-star" style="color: #e0ded8;"></i>
                                            </c:forEach>
                                         </c:if>
                                      </div><br><br>
                                      <div style="margin-top: 20px; margin-bottom: 10px; color: white; text-align:center; font-style: oblique;"><c:out value=" ${review.reviewContent } "></c:out></div><br><br>
                                      
                                      <div class="place_review">
                                         <c:if test="${review.reviewStar eq 1 }">
                                               <h5 style="font-style: italic; color:lightblue;"> <i class="lar la-angry la-2x"></i> ${review.userId }</h5> <h5>(<fmt:formatDate value="${review.reviewDate }" pattern="yyyy-MM-dd HH:mm:ss"/>)</h5>
                                         </c:if>
                                         <c:if test="${review.reviewStar eq 2 }">
                                           <h5 style="font-style: italic; color:lightblue;"> <i class="las la-grin-beam-sweat la-2x"></i> ${review.userId }</h5> <h5> (<fmt:formatDate value="${review.reviewDate }" pattern="yyyy-MM-dd HH:mm:ss"/>)</h5>
                                         </c:if>
                                         <c:if test="${review.reviewStar eq 3 }">
                                            <h5 style="font-style: italic; color:lightblue;"> <i class="lar la-smile-wink la-2x" ></i> ${review.userId }</h5> <h5> (<fmt:formatDate value="${review.reviewDate }" pattern="yyyy-MM-dd HH:mm:ss"/>)</h5>
                                         </c:if>
                                         <c:if test="${review.reviewStar eq 4 }">
                                            <h5 style="font-style: italic; color:lightblue;"> <i class="lar la-grin-squint la-2x"></i> ${review.userId }</h5> <h5> (<fmt:formatDate value="${review.reviewDate }" pattern="yyyy-MM-dd HH:mm:ss"/>)</h5>
                                         </c:if>
                                         <c:if test="${review.reviewStar eq 5 }">
                                            <h5 style="font-style: italic; color:lightblue;"> <i class="lar la-kiss-wink-heart la-2x"></i> ${review.userId }</h5> <h5> (<fmt:formatDate value="${review.reviewDate }" pattern="yyyy-MM-dd HH:mm:ss"/>)</h5>
                                         </c:if>
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

    <!--top place end-->

    <!--::industries start::-->
    <section class="best_services section_padding"  style="padding:150px;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>KKKK</h2>
                        <h3>(KULKKEOK KULKKEOK)</h3><br>
                        <h3>꿀꺽-꿀꺽</h3>
                    </div>
                </div>
            </div>
            <p style="text-align: center;">
                현대인들에게 있어 술이 아닌 일상의 생활음료가 된 맥주!
                <br>
                어제 마신 맥주가 기억이 안 나시나요?
                <br>
               편의점 네 캔 만원 맥주, 뭘 고를지 망설여지시나요?
                <br>
                맥알못에서 벗어나고 싶진 않으세요?
                <br>
                걱정마세요. Don't worry!
                <br>
                저희 KKKK가 빠르고 쉽게 도와드리겠습니다.
            </p>
            <br><br><br><br><br><br><br>
            <div  style="text-align: center; font-size: 20px;"><a href="worldcup.do?command=start"> <i class="las la-trophy la-2x"></i> 맥주월드컵 GO!!!</a></div>
            <br>
           <div  style="text-align: center; font-size: 20px;"><a href="testBeer.jsp"> <i class="lar la-hand-point-up la-2x"></i> 내 취향에 맞는 맥주 찾으러가기 GO!!!</a></div>
            </div>
        </div>
    </section>
    <!--::industries end::-->

<%@ include file="../form/footer.jsp" %>
    <!-- footer part end-->

    <!-- jquery -->
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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

    <!-- searching beer btn jquery start -->
        <script>
            $(document).ready(function(){
                $('#searchBeer').click(function(){
                    var offset = $('#scroll').offset(); //선택한 태그의 위치를 반환
                        //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
                    $('html').animate({scrollTop : offset.top}, 400);
                    $('#beername').focus();
                });
            });
            
        
   
   
   
   
   //나라별 맥주정보 가져오기
   $(function(){
      $('.origin').click(function(){
         var txt = $('#origin').find('option:selected').val();
         //alert(txt);
         location.href="beer.do?command=beerorigin&beerorigin="+txt;
         
      });
      
   });
   
   //종류별 맥주정보 가져오기
   $(function(){
      $('.type').click(function(){
         var txt = $('#type').find('option:selected').val();
         //alert(txt);
         location.href="beer.do?command=beertype&beertype="+txt;
         
      });
   }); 
   

</script>
<div id="frogue-container" class="position-right-bottom" data-chatbot="c0102775-0ee0-43ad-b8b4-95aea45855b9" data-user="kulkkeok@gmail.com" data-init-key="value"></div>

<script>
(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'frogue-embed'));
</script> 
        
        
</body>

</html>