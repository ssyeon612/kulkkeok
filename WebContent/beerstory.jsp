<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
</head>

<style type="text/css">
    .place_btn{
        margin: 4px;
    }
</style>

<body>
	<%@ include file="form/header.jsp" %>

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg bg_img_beerstory">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>맥주이야기</h2>
                            <p>Beer Story</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
    <jsp:useBean id="dto" class="com.kulkkeok.model.dto.BeerStoryDto" scope="request"></jsp:useBean>

    <!-- about us css start-->
    <section class="top_place section_padding">
        <div class="container">
        
        	<c:if test="${!empty user }">
        		<c:if test="${user.userId eq 'ADMIN' }">
        			<div>
                		<input type="button" class="genric-btn primary radius" style="width:120px; margin-bottom: 30px; display: block;" value="글쓰기" onclick="location.href='beerStory.do?command=writeform'"/>
            		</div>
        		</c:if>
        	</c:if>
            
            
            <div class="row">
            
                  <c:choose>
                  		<c:when test="${empty list }">
                  			작성된 글이 존재하지 않습니다.
                  		</c:when>
                  		
						<c:otherwise>
							<c:forEach var="dto" items="${list }">
								<div class="col-lg-6 col-md-6">
                    				<div class="single_place">
                        				<img src="img/beer_story/${dto.storyImg }" alt="">
                        				<div class="hover_Text d-flex align-items-end justify-content-between">
                            				<div class="hover_text_iner">
                                				<a href="${dto.storyLink }" class="place_btn" target='_blank'>자세히 보기</a>
                                				
                                				
                                				<c:if test="${user.userId eq 'ADMIN' }">
                                					<a href="beerStory.do?command=updateform&storyNo=${dto.storyNo }" class="place_btn">수정하기</a>
                                					<a class="place_btn" style="cursor: pointer;" onclick="return confirm('정말로 삭제하시겠습니까?')" href="beerStory.do?command=delete&storyNo=${dto.storyNo }">삭제하기</a>
                                				</c:if>
                                				
                                				
                                				<h3>${dto.storyName }</h3>
                            				</div>
                        				</div>
                    				</div>
                				</div>
							</c:forEach>
						</c:otherwise>
                  </c:choose>
                  
            </div>
        </div>
    </section>
    <!-- about us css end-->

	<%@ include file="form/footer.jsp" %>

</body>

</html>