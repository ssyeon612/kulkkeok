<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import = "java.util.List" %>
<%@page import = "java.util.ArrayList" %>

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
    <!-- Font Awesome Icon Library -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<style>
    .checked {
      color: orange;
    }
</style>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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



// 하트클릭 (북마크 기능)
$(function(){
  $('#bul').click(function(){
	  
	  var userId = '<c:out value="${user.userId }"></c:out>';
	  
	  if(userId == null || userId == ""){
		  
		  alert("로그인이 필요합니다");
		  location.href="login.do?command=loginPage";
		  return false;
		  
	  }
	  
	  //북마크를 설정하지 않았을때 빈 하트가 보여진다
    if(  $('#bul').attr('class') == 'fas fa-heart' ){
        $('#bul').attr('class', 'far fa-heart');
        $('#msg').text('하트를 누르면 북마크 됩니다');
        
        var beerNo = '<c:out value="${dto.beerNo}"></c:out>';
        var userId = '<c:out value="${user.userId}"></c:out>';
        
        //북마크 해제
         $.ajax({
        	cache: false,
			url: "beer.do?command=removebookmarkbeer",
			type:'POST',
			data:{"bookMarkBeer":"N", "userId":userId, "beerNo":beerNo},
			success:function(data){
				alert('${dto.beerKorName}'+" 가 내 북마크에서 제거되었습니다");
				$('#bul').attr('class', 'far fa-heart');
				$('#msg').text('하트를 누르면 북마크 됩니다');
				
			},
			error: function(request,status,error){
					alert("ajax 통신 실패!");
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); 
			       
			}
		}); 
         
        
         location.reload();
        
    } else{
        $('#bul').attr('class', 'fas fa-heart');
        $('#msg').text('북마크 되었습니다');
        

        //북마크 추가
        $.ajax({
        	cache: false,
			url: "beer.do?command=bookmarkbeer",
			type:'POST',
			data:{"bookMarkBeer":"Y", "userId":"${user.userId}", "beerNo":"${dto.beerNo}"},
			success:function(data){
				alert('${dto.beerKorName}'+" 가 내 북마크에 추가되었습니다");
				$('#bul').attr('class', 'fas fa-heart');
		        $('#msg').text('북마크 되었습니다');
				
			},
			error: function(request,status,error){
					alert("ajax 통신 실패!");
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); 
			       
			}
		});
        
	  location.reload();
        
    }
	  
  });
});
 

var reviewStar = 0;

//별점 기능
$(function(){
    $('#user_review a').hover(function(){
        $(this).siblings().find("i").removeClass("checked");
        $(this).children("i").addClass("checked");
        $(this).prevAll("a").children("i").addClass("checked");
       
       reviewStar = $(this).attr("value");
      // alert(reviewStar);
       	 
    });
 
});

//별점 클릭시 뜨는 팝업창 (리뷰쓰기)
function review(){
	
	var userId = '<c:out value="${user.userId}"></c:out>';
	
	if(userId == null || userId == ""){
		alert("로그인이 필요합니다");
		location.href="login.do?command=loginPage";
		return false;
		
	}
	//alert(reviewStar);
	
    window.open('review.do?command=reviewdetail&beerno=${dto.beerNo}&reviewstar='+reviewStar, 'window', 'width=400, height=500');

}


//리뷰 수정 (팝업창)
function modifyReview(beerNo, reviewNo, reviewContent){
	
	window.open('review.do?command=reviewupdate&beerNo='+beerNo+'&reviewNo='+reviewNo+'&reivewContent='+reviewContent+'&reviewStar='+reviewStar, 'window', 'width=400, height=500');
}


//리뷰 삭제
function deleteReview(beerNo, reviewNo){
	
	 var msg = confirm("해당 리뷰를 삭제하시겠습니까?");
	
		  if(msg){
			
			$.ajax({
				url: "review.do?command=deleteReview",
				type:'POST',
				data:{"beerNo":beerNo, "reviewNo":reviewNo},
				success:function(data){
					if(data == "true"){
						alert("삭제되었습니다.")
						location.reload();
					}else {
						alert("삭제 실패하였습니다.")
					}
				},
				error: function(request,status,error){
						alert("ajax 통신 실패!");
				        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				       
				}
			});
		}else{
			return false; 
		
		}   
	}
	
	
</script>

<body>
  <%@ include file="../form/header.jsp" %>

    <section class="breadcrumb breadcrumb_bg bg_img_beerdetail">
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

    <!--=========================  맥주 정보 시작 ===========================-->
    <section class="blog_area single-post-area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 posts-list">
                    <div class="single-post">
                        <div>
                            <div class="beer-img">
                                <img src="img/beer/${dto.beerPic }.jpg" style="width: 250px; height:340px">
                            </div>
                            <div class="blog_details">
                                <h2>${dto.beerKorName }</h2>
                                <h2>${dto.beerEngName }</h2>
                                <div class="place_review" style="margin-top: 10px;">
                                <c:forEach begin="1" end="${star.starAvg }">
                                	<i class="fas fa-star checked"></i>
                                </c:forEach>
                                <c:if test="${star.starAvg ne 5 }">
                                	<c:forEach begin="1" end="${5-star.starAvg }">
                                	<i class="fas fa-star"></i>
                                	</c:forEach>
                                </c:if> 
   
                                    <p class="like-info"><span class="align-middle"><%-- ${dto.beerStar }.0 --%></span> &nbsp; </p>
                                </div>
                                <h4>원산지 ㅣ ${dto.originName }</h4>
                                <h4>종류 &nbsp;&nbsp;&nbsp;ㅣ ${dto.typeName }</h4>
                                <h4>도수 &nbsp;&nbsp;&nbsp;ㅣ ${dto.beerAbv } %</h4>

                            </div>
                            <div class="quote-wrapper">
                                <div class="quotes">
                                    ${dto.beerDetail }
                                </div>
                            </div>
                        </div>
                    </div>
<!--=========================  맥주 정보 끝 ===========================-->


<!--=========================  북마크 및 별점 시작 ===========================-->
                    <div class="navigation-top">
                        <div class="d-sm-flex justify-content-between text-center">
                            <p class="like-info"><span class="align-middle"><i class="fas fa-heart"></i></span> 
                            <c:choose>
                            	<c:when test="${empty bkCnt }">
                            		0
                            	</c:when>
                            	<c:otherwise>
                            		${bkCnt }
                            	</c:otherwise>
                            </c:choose>
                            			명의 회원이 이 맥주를 좋아합니다</p>
                            <div class="col-sm-4 text-center my-2 my-sm-0">
                            </div>
                            <ul class="social-icons">
                                <li><a href="https://www.facebook.com/Kulkkeok-Kulkkeok-106880191011621" target='_blank'><i class="fab fa-facebook-f" style="font-size:20px;"></i></a></li>
                                <li><a href="https://www.instagram.com/kulkkeok/" target='_blank'><i class="fab fa-instagram" style="font-size:20px;"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div>
                    
                    
                        <ul class="blog-info-link mt-3 mb-4">
                            <div id="user_review">
                            
                            	 <a href="#" value="1"><i class="fas fa-star" onclick="review();"></i></a>
                            	 <a href="#" value="2"><i class="fas fa-star" onclick="review();"></i></a>
                            	 <a href="#" value="3"><i class="fas fa-star" onclick="review();"></i></a>
                            	 <a href="#" value="4"><i class="fas fa-star" onclick="review();"></i></a>
                            	 <a href="#" value="5"><i class="fas fa-star" onclick="review();"></i></a>
                              
                                <p class="like-info"><span class="align-middle">당신의 별점을 남겨주세요</span> &nbsp; </p>
                            </div>
                            <p class="like-info">
                                <span class="align-middle">
	                                <c:choose>
	                                	<c:when test="${is eq false }">
	                                	<i id="bul" class="far fa-heart" style="cursor: pointer;"></i>
	                                	&nbsp; <b id="msg">하트를 누르면 북마크 됩니다</b>
	                                	</c:when>
	                                	<c:otherwise>
	                                	<i id="bul" class="fas fa-heart" style="cursor: pointer;"></i>
	                                	&nbsp; <b id="msg">북마크 되었습니다</b>
	                                	</c:otherwise>
	                                
	                                </c:choose>
                                </span> 
                            </p>
                        </ul>
                    </div>
 <!--=========================  북마크 및 별점 끝 ===========================-->  
 
 
 
 <!--=========================  리뷰 시작 ===========================-->                 
                    <div class="comments-area">
                        <h4>${list.size() }개의 리뷰</h4>
                        <c:choose>
                        	<c:when test="${empty list }">
                        		<div class="comment-list">
                            <div class="single-comment justify-content-between d-flex">
                                <div class="user justify-content-between d-flex">
                                    <div class="thumb">
                                    	<p> 작성된 리뷰가 없습니다.</p>
                                    </div>
                                    <div class="desc">
                                    </div>
                                </div>
                            </div>
                        </div>
                        	</c:when>
                        	<c:otherwise>
		                        <c:forEach var="review" items="${list }" varStatus="status">
			                        <div class="comment-list">
			                            <div class="single-comment justify-content-between d-flex">
			                                <div class="user justify-content-between d-flex">
			                                    <div class="thumb">
		                                        		<img src="img/comment/comment_${status.count }.png" alt="">
			                                    </div>
			                                    <div class="desc">
	                                				<c:forEach begin="1" end="${review.reviewStar }">
	                                					<i class="fas fa-star checked"></i>
	                                				</c:forEach>
					                                <c:if test="${review.reviewStar ne 5 }">
					                                	<c:forEach begin="1" end="${5-review.reviewStar }">
					                                	<i class="fas fa-star"></i>
				                 						</c:forEach>
				                                	</c:if> <br>
					                                <div id="reviewcon">${review.reviewContent }</div>
		                                       	    <div class="d-flex justify-content-between">
		                                            <div class="d-flex align-items-center">
		                                                <h5>${review.userId }</h5>
		                                                <p class="date">
		                                                <c:set var="now" value="<%= new java.util.Date() %>" />
		                                                <fmt:formatDate type="both" value="${review.reviewDate }" pattern="yyyy-MM-dd" /> </p>
		                                                	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		                                               <c:if test="${!empty user && (user.userId eq review.userId)  }">
                                                          <button id="modify" class="btn btn-outline-secondary" style="width: 50px; height:30px; font-size:10px;" onclick="return modifyReview(${dto.beerNo},${review.reviewNo },'${review.reviewContent }');">수정</button> &nbsp;
                                                      </c:if> 
                                                       <c:if test="${!empty user && ( (user.userId eq review.userId) || (user.userId eq 'ADMIN')) }">
                                                         <button id="delete" class="btn btn-outline-secondary" style="width: 50px; height:30px; font-size:10px;" onclick="deleteReview(${dto.beerNo},${review.reviewNo });">삭제</button>                                                        
                                                        
                                                       </c:if>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                       
		                        </div>
		                        </c:forEach>
	                       
                        </c:otherwise>
                        </c:choose>
                    </div>
                </div>
<!--=========================  리뷰 끝 ===========================-->  



<!--=========================  맥주 검색 시작 ===========================-->              
                <div class="col-lg-4">
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


    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!— bootstrap js —>
    <script src="js/bootstrap.min.js"></script>
    <!— magnific js —>
    <script src="js/jquery.magnific-popup.js"></script>
    <!— swiper js —>
    <script src="js/owl.carousel.min.js"></script>
    <!— masonry js —>
    <script src="js/masonry.pkgd.js"></script>
    <!— masonry js —>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/gijgo.min.js"></script>
    <!— contact js —>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>
    <script src="js/contact.js"></script>
    <!— custom js —>
    <script src="js/custom.js"></script>
</body>

</html>