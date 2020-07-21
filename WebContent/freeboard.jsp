<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

  <%@ include file="../form/header.jsp" %>

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg bg_img_freeboard">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>자유게시판</h2>
                            <p>General Discussion</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!--body-->
    <!--================ Free Board Area =================-->
    
        <div class="container" id="freeboard_table">
                <table class="table table-hover table-sm" id="freeboard_table2">
                  <thead>
                   		<tr>
	                        <th style="width: 100px;">NO</th>
	                        <th>Title</th>
	                        <th style="width: 230px;">Writer</th>
	                        <th style="width: 200px;">Date</th>
	                        <th style="width: 50px;">View</th>
                    	</tr>
                  </thead>
                <tbody>
                	<c:choose>
                		<c:when test="${empty list }">
                			<tr>
                				<td colspan="5" style="text-align: center">작성된 글이 없습니다.</td>
                			</tr>
                		</c:when> 	
                	<c:otherwise>
                		<c:if test="${!empty bestList }">
                			<c:forEach items="${bestList }" var="best">
	                			<tr class="table-warning">
	                				<td><span style="color:#fe5c24;"><strong>HOT</strong></span></td>
	                				<td>
			                        	<c:forEach begin="1" end="${best.titleTab }">
			                        		<span>&nbsp;&nbsp;</span>
			                        	</c:forEach>
			                        	<strong>
				                        	<a href="free.do?command=detail&no=${best.postNo }" style="cursor: pointer;">${best.postTitle }	                        
				                        	</a>
			                        	</strong>  
			                        </td>
			                        <td><strong style="color:#fe5c24;" >${best.userId }</strong></td>
			                        <td><strong style="color:#fe5c24;" ><fmt:formatDate value="${best.postDate }" pattern="yyyy-MM-dd"/></strong></td>
			                        <td><strong style="color:#fe5c24;" >${best.postViews }</strong></td>
	                			</tr>
                			</c:forEach>         		
                		</c:if>
                	
                		<c:forEach items="${list }" var="free" varStatus="status">
		    				<tr>
		                        <td>${number-status.index }</td>
		                        <td>
		                        	<c:forEach begin="1" end="${free.titleTab }">
		                        		<span>&nbsp;&nbsp;</span>
		                        	</c:forEach>
		                        
			                        <a href="free.do?command=detail&no=${free.postNo}" style="cursor: pointer;">${free.postTitle }
				                        <c:if test="${!empty cmtCnt }">
					                        <c:if test="${cmtCnt[free.postNo] ne null }">      
					                        	<span style="color:#fe5c24;">( <c:out value="${cmtCnt[free.postNo] }"></c:out> )</span>
					                        </c:if>				                        
				                        </c:if>
				                        
			                        </a>
		                        </td>
		                        <td>${free.userId }</td>
		                        <td><fmt:formatDate value="${free.postDate }" pattern="yyyy-MM-dd"/></td>
		                        <td>${free.postViews }</td>
		                    </tr>          	      	
                		</c:forEach>
                	</c:otherwise>	
                </c:choose>     
           </tbody>   
        </table>
        
                <br><br>
                <c:if test="${!empty user }">
	                <div class="text-right">
	                    <button type="button" class="genric-btn primary radius" name="freeboardbtn" onclick="location.href='free.do?command=writeform'" style="margin-right:0px;">글쓰기</button>
	                </div>
                </c:if>
            
                <div style="width: 100%; height:100%;  text-align: center;">
                    <div style="margin: 0 auto; display: inline-block;">
                    	<ul class="pagination" style="width:100%; text-align: center; ">
	                    	<li class="page-item">
								<a class="page-link" href="free.do?command=list&page=1" aria-label="Previous"><span aria-hidden="true" style="color: #fe5c24;">&laquo;</span></a>
							</li>
	                    	<c:if test="${startPage>blockSize }">
							<li class="page-item">
								<a class="page-link" href="free.do?command=list&page=${startPage-blockSize }" aria-label="Before"><span aria-hidden="true" style="color: #fe5c24;">&lt;</span></a>
							</li>
							</c:if>
						
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<c:if test="${page ne i }">
								<li class="page-item"><a href="free.do?command=list&page=${i }"><span class="page-link" style="color: #fe5c24;">${i }</span></a></li>
							</c:if>
							<c:if test="${page eq i }">
								<li class="page-item"><span class="page-link" style="background-color: #fe5c24; color: white;">${i }</span></li>
							</c:if>
						</c:forEach>
						
						<c:if test="${endPage ne totalPage }">
							 <li class="page-item">
							 	<a class="page-link" href="free.do?command=list&page=${startPage+blockPage }" aria-label="After" ><span aria-hidden="true" style="color: #fe5c24;">&gt;</span></a>
							 </li>
						</c:if> 
						    
							 <li class="page-item">
							 	<a class="page-link" href="free.do?command=list&page=${totalPage }" aria-label="Next" ><span aria-hidden="true" style="color: #fe5c24;">&raquo;</span></a>
							 </li>
                    	</ul>
                    </div>
                </div>
        </div>
    <!--================Blog Area =================-->

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