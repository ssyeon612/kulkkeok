<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  
<script type="text/javascript">
	$(function(){
		$('#pageSize').change(function(){
			location.href="moim.do?command=moim_more&pageSize="+this.value;
		});
	});



</script>




</head>

<body>
    <%@ include file="../form/header.jsp" %>
    <!-- Header part end-->

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg bg_img_class">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>모임</h2>
                            <p>Let's Gather Up</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!--body-->
    <!--================Blog Area =================-->
    <jsp:useBean id="dto" class="com.kulkkeok.model.dto.MoimDto" scope="request"></jsp:useBean>
    <div id="class_more">
     <section class="blog_area section_padding">
        <div class="container">
            <div class="row">
				<div class="col-lg-8 mb-5 mb-lg-0 div11" style="align-items: center;">
                    <div class="blog_left_sidebar">
						
						<c:choose>
							<c:when test="${empty list }">
								게시글이 존재하지 않습니다.
							</c:when>
							
							
							<c:otherwise>
								<form action="moim.do?command=moim_more">
									<div class="input-group-prepend mr-1" style="float:right; z-index: 9999 !important;">
                            			<select id="pageSize" name="pageSize" style="width:150px; height:45px; margin-bottom:20px; float:right;  z-index: 9999 !important;" class="custom-select">
                                			<option value="" selected>글 개수 선택</option>
                                			<option value="5">5개씩 보기</option>
                                			<option value="10">10개씩 보기</option>
                                			<option value="15">15개씩 보기</option>
                          				</select>
                        			</div>
                        		</form>
                        		
                        		
							
								<c:forEach var="dto" items="${list }">
								
			                        <article class="blog_item">
                            			<div class="blog_item_img">
                            				<c:choose>
                            					<c:when test="${dto.moimNo mod 10 eq 1 }">
                            						<img class="card-img rounded-0" src="img/moim/moim1.jpg" alt="">
                            					</c:when>
                            					<c:when test="${dto.moimNo mod 10 eq 2 }">
                            						<img class="card-img rounded-0" src="img/moim/moim2.jpg" alt="">
                            					</c:when>
                                          		<c:when test="${dto.moimNo mod 10 eq 3 }">
                            						<img class="card-img rounded-0" src="img/moim/moim3.jpg" alt="">
                            					</c:when>
                            					<c:when test="${dto.moimNo mod 10 eq 4 }">
                            						<img class="card-img rounded-0" src="img/moim/moim4.jpg" alt="">
                            					</c:when>
                            					<c:when test="${dto.moimNo mod 10 eq 5 }">
                            						<img class="card-img rounded-0" src="img/moim/moim5.jpg" alt="">
                            					</c:when>
                            					<c:when test="${dto.moimNo mod 10 eq 6 }">
                            						<img class="card-img rounded-0" src="img/moim/moim6.jpg" alt="">
                            					</c:when>
                            					<c:when test="${dto.moimNo mod 10 eq 7 }">
                            						<img class="card-img rounded-0" src="img/moim/moim7.jpg" alt="">
                            					</c:when>
                            					<c:when test="${dto.moimNo mod 10 eq 8 }">
                            						<img class="card-img rounded-0" src="img/moim/moim8.jpg" alt="">
                            					</c:when>
                            					<c:when test="${dto.moimNo mod 10 eq 9 }">
                            						<img class="card-img rounded-0" src="img/moim/moim9.jpg" alt="">
                            					</c:when>
                            					<c:when test="${dto.moimNo mod 10 eq 0 }">
                            						<img class="card-img rounded-0" src="img/moim/moim10.jpg" alt="">
                            					</c:when>
                            				</c:choose>
                                			<a href="moim.do?command=view&moimNo=${dto.moimNo }" class="blog_item_date">
                                    			<h4 style="color:white; text-align:center;">[${dto.categoryNo}]</h4>
                                    			<!-- <p><fmt:formatDate value="${dto.moimDate }" pattern="M"/></p> -->
                                    			<p>
                                    				<fmt:setLocale value="en_us"/>
                                    				<fmt:formatDate value="${dto.moimDate }" type="date" />
                                    			</p>
                                    			
                                    			
                                			</a>
                            			</div>

                            			<div class="blog_details">
                                			<a class="d-inline-block" href="moim.do?command=view&moimNo=${dto.moimNo }">
                                    			<h2>${dto.moimTitle }</h2>
                                			</a>
                                			<p>${dto.moimPlaceName } (${dto.moimPlaceAdd })</p>
                                			<ul class="blog-info-link">
                                    			<li><i class="far fa-user"></i>${dto.userId }</li>
                                    			<li><i class="far fa-comments"></i> 댓글 
                                    			
                                    			<c:if test="${!empty cmtCnt[dto.moimNo] }">
                                    				${cmtCnt[dto.moimNo] }
                                    			</c:if>
                                    			<c:if test="${empty cmtCnt[dto.moimNo] }">
                                    			0
                                    			</c:if>
                                    			
                                    		
                                    			 </li>
                                			</ul>
                            			</div>
                        			</article>
								
								</c:forEach>
							</c:otherwise>
						</c:choose>                        




                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                            	<c:if test="${startPage>blockSize }">
                            		<li class="page-item">
                            			<a href="moim.do?command=moim_more&pageNum=1" class="page-link">
                            				<i class="ti-angle-double-left"></i>
                            			</a>
                            		</li>
                            		<li class="page-item">
                                    	<a href="moim.do?command=moim_more&pageNum=${startPage-blockSize }" class="page-link" aria-label="Previous">
                                        	<i class="ti-angle-left"></i>
                                    	</a>
                            		</li>
                            	</c:if>

								<c:forEach var="i" begin="${startPage }" end="${endPage }">
									<c:if test="${pageNum ne i }">
										<li class="page-item">
											<a href="moim.do?command=moim_more&pageNum=${i }" class="page-link">${i }</a>
										</li>
									</c:if>
									<c:if test="${pageNum eq i }">
										<li class="page-item">
											<span class="page-link" style="background: lightblue;">${i }</span>
										</li>
									</c:if>
								</c:forEach>

								<c:if test="${endPage ne totalPage }">
									<li class="page-item">
										<a href="moim.do?command=moim_more&pageNum=${startPage+blockSize }" class="page-link" aria-label="Next">
                                        	<i class="ti-angle-right"></i>
                                    	</a>
                                    </li>
                                
                                    <li class="page-item">
                                    	<a href="moim.do?command=moim_more&pageNum=${totalPage }" class="page-link">
                                    		<i class="ti-angle-double-right"></i>
                                    	</a>
									</li>
								</c:if>
								
                            </ul>
                        </nav>
                        
                        
                    </div>
                </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </div>
    <!--================Blog Area =================-->

    <!-- footer part start-->
<%@ include file="../form/footer.jsp" %>
</body>

</html>