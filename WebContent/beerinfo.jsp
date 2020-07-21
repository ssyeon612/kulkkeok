<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>

	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
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
	
	
	//나라이름 클릭시 해당 나라의 맥주정보 가져오기
	$(function(){
		$('.origin li a').click(function(){
			var txt = $(this).text();
			location.href="beer.do?command=beerorigin&beerorigin="+txt;
			
		});
	}); 
	
	//종류 클릭시 해당 종류의 맥주정보 가져오기
	$(function(){
		$('.type li a').click(function(){
			var txt = $(this).attr('at');
			location.href="beer.do?command=beertype&beertype="+txt;
			
		});
	}); 
	
	

</script>


</head>
<body>

   <%@ include file="../form/header.jsp" %> 

    <section class="breadcrumb breadcrumb_bg bg_img_beerinfo">
      <div class="container">
            <div class="row">
                  <div class="col-lg-12">
                        <div class="breadcrumb_iner">
                              <div class="breadcrumb_iner_item text-center">
                                    <h2>맥주정보</h2>
                                    <p>Beer Information</p>
                              </div>
                        </div>
                  </div>
            </div>
      </div>
      </section>

<!--=========================  맥주 리스트 시작 ===========================--> 
    <section class="blog_area single-post-area section_padding">
        <div class="container" style="">
        	<c:if test="${user.userId eq 'ADMIN'}">
            <div>
                <input type="submit" class="genric-btn primary radius" style="width:120px; display: block;" value="글쓰기" onclick="location.href='admin.do?command=beerinsert'"/>
            </div>
            </c:if>

            <div class="row" style="position: relative;">
                <!-- beer list start -->
              <c:choose>
					<c:when test="${empty list }">
						<div class="col-lg-8 posts-list" style="float: left;">
	                    	<div class="blog-author" style="background-color:white;">
	                        	<div class="media align-items-center">
	                            	<div class="media-body">
	                                	    <h4> 맥주 정보가 존재하지 않습니다. </h4>
	                            	</div>
	                        </div>
	                    </div>
	                </div>
	                
					</c:when>     
					<c:otherwise> 
					<div style="display: inline-block !important; width:66.6666%;">       
					<div class="bg-light" style="margin:0 auto; width:450px; ">
                     <p style="text-align:center; font-family: 'Jua', sans-serif;" class="text-danger">총 ${list.size() } 개의 맥주가 검색되었습니다.</p>
                     </div>
						<c:forEach var="dto" items="${list }">
                <div class="col-lg-8 posts-list" id="bbeerlist" style="display: inline-block !important; max-width: none;">
                    <div class="blog-author">
                        <div class="media align-items-center">
                            <img src="img/beer/${dto.beerPic }.jpg" alt="">
                            <div class="media-body">
                                <a href="beer.do?command=beerdetail&beerno=${dto.beerNo }">
                                    <h4>${dto.beerKorName } &nbsp;|&nbsp;${dto.beerEngName }</h4>
                                </a>
                                <p>${dto.beerDetail }</p>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                </div> 
                </c:otherwise>
                </c:choose>
<!--=========================  맥주 리스트 끝 ===========================--> 



<!--=========================  맥주 검색 시작 ===========================--> 
                <div class="col-lg-4" style="float:right;" >
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <form action="beer.do" method="post">
                            <input type=hidden name=command value=searchbeername>
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder='이름으로 찾기' onfocus="this.placeholder = ''" onblur="this.placeholder = '이름으로 찾기'" name="beername">
                                        <div class="input-group-append">
                                            <button class="btn" type="button"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1" type="submit">Search</button>
                            </form>
                        </aside>
                        <aside class="single_sidebar_widget tag_cloud_widget">
                            <h4 class="widget_title">나라별 찾기</h4>
                            <ul class="list origin">
                                <li>
                                    <a href="#">KOREA</a>
                                </li>
                                <li>
                                    <a href="#">AMERICA</a>
                                </li>
                                <li>
                                    <a href="#">BELGIUM</a>
                                </li>
                                <li>
                                    <a href="#">CHINA</a>
                                </li>
                                <li>
                                    <a href="#">ENGLAND</a>
                                </li>
                                <li>
                                    <a href="#">GERMANY</a>
                                </li>
                                <li>
                                    <a href="#">CZECH</a>
                                </li>
                                <li>
                                    <a href="#">OTHERS</a>
                                </li>
                            </ul>
                        </aside>

                        <aside class="single_sidebar_widget tag_cloud_widget">
                            <h4 class="widget_title">종류별 찾기</h4>
                            <ul class="list type">
                                <li>
                                    <a href="#" at="라이트 라거">LIGHT</a>
                                </li>
                                <li>
                                    <a href="#" at="도펠복">DOPPEL</a>
                                </li>
                                <li>
                                    <a href="#" at="페일 라거">PALELAGER</a>
                                </li>
                                <li>
                                    <a href="#" at="필스너">PILSNER</a>
                                </li>
                                <li>
                                    <a href="#" at="람빅">LAMBIC</a>
                                </li>
                                <li>
                                    <a href="#" at="밀맥주">WHEAT</a>
                                </li>
                                <li>
                                    <a href="#" at="바이젠복">WEIZEN</a>
                                </li>
                                <li>
                                    <a href="#" at="벨지안 에일">BELGIAN</a>
                                </li>
                                <li>
                                    <a href="#" at="인디아 페일 에일">INDIA</a>
                                </li>
                                <li>
                                    <a href="#" at="스타우트">STOUT</a>
                                </li>
                                <li>
                                    <a href="#" at="쾰쉬">KOLSCH</a>
                                </li>
                                <li>
                                    <a href="#" at="OTHERS">OTHERS</a>
                                </li>
                            </ul>
                        </aside>

                    </div>
                </div>
            </div>
        </div>
    </section>
    
<!--=========================  맥주 검색 끝 ===========================--> 

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