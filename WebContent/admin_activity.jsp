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

    <!-- Jquery -->
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <script type="text/javascript">

        $(function(){
            
            //하나이상 선택
            $(".muldelform").submit(function(){   
                if($(this).find("input[name='chk']:checked").length==0){
                    alert("하나 이상 선택해주세요!");
                    return false;
                }
            });
            
            var form1 = document.getElementsByClassName("tab_box")[1];
            var form2 = document.getElementsByClassName("tab_box")[2];

            form1.style.display="none";
            form2.style.display="none";

            $(".all").change(function(){
            if($(".all").is(":checked")){
                $(this).parent("td").parent("tr").siblings().find("input[name='chk']").prop("checked",true);
                
            }else{
                $(this).parent("td").parent("tr").siblings().find("input[name='chk']").prop("checked",false);
            }
        });


     
        $('.tab_menu_btn').on('click',function(){
        //버튼 색 제거,추가
            $('.tab_menu_btn').removeClass('on');
            $(this).addClass('on')
            
            //컨텐츠 제거 후 인덱스에 맞는 컨텐츠 노출
            var idx = $('.tab_menu_btn').index(this);
            
            $('.tab_box').css({"display":"none"});
            $('.tab_box input[type=checkbox]').prop("checked",false);
            $('.tab_box').eq(idx).css({"display":"block"});
        });
     
     
     
        });
     
     </script>

<style>
    body{
        background-image: url('beer_image/img5.jpg');
        background-size: cover;
    }

   .tab_wrap{
   }

   button.tbtn {
       background-color: #00000000;
       border:0;
       outline:0;
       cursor:pointer;
       display: inline-block;
       margin-right: 0px;
   }


   .tab_menu_btn {
       width:120px;
       height:40px;
       transition:0.3s all;
   }

   .tab_menu_btn.on {
       border-bottom:2px solid #fe5c24;
       font-weight:700;
       color:#fe5c24;
   }
   .tab_menu_btn:hover {
       color:#fe5c24;
       }

   .tab_box {
       display:none;
       padding:20px;
   }
   .tab_box.on {
       display:block;
   }

    .memberAct {
        width: 600px;
        height: 800px;
        margin: 0 auto;
        background-color: white;
        opacity: 0.8;
        border-radius: 20px 20px 20px 20px;
        padding: 10px 50px;
        overflow: auto;
        }
</style>


</head>

<!--body-->
<!--================start writing area =================-->
<body style="margin: 0 auto;">
    <section class="">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="section-top-border" style="padding: 30px;">
                    <div class="memberAct">
                            <h3 style="text-align: center;" class="mt-3">${userId }님의 활동</h3>
                            <div class="tab_wrap">
 
                                <div class="tab_menu_container" style="text-align: center;">
                                  <button class="tbtn tab_menu_btn on mb-3" type="button">리뷰 목록</button>
                                  <button class="tbtn tab_menu_btn mb-3" type="button">게시글 목록</button>
                                  <button class="tbtn tab_menu_btn mb-3" type="button">댓글 목록</button>
                                  <button class="tbtn tab_menu_btn mb-3" type="button">모임 목록</button>
                                  <button class="tbtn tab_menu_btn mb-3" type="button">모임댓글 목록</button>
                                  
                                </div> 
                              
                                <div class="tab_box_container" >
                        
                                    <div class="tab_box on">
                                        <form action="admin.do?command=muldel" method="post" class="muldelform">
                                            <input type="hidden" value="reviewdel" name="action">
                                            <input type="hidden" value="${userId }" name="userId">
                                            <table class="table">
	                                               <col width="70px">
	                                               <col width="480px">
	                                               <tr class="table-warning">
	                                                   <td><input type="checkbox" name="all" class="all"></td>
	                                                   <td style="text-align: center;">내용</td>
	                                               </tr>
		                                              
		                                               <c:choose>
		                                               		<c:when test="${empty reviewList }">
		                                               			<tr>
		                                               				<td colspan="2" style="text-align: center;">작성한 리뷰가 없습니다.</td>
		                                               			</tr>
		                                               		</c:when>
		                                               		<c:otherwise>
		                                               			<c:forEach var="list" items="${reviewList }">
			                                               			<tr>
				                                                  		<td><input type="checkbox" name="chk" value="${list.reviewNo }"></td>
					                                               
					                                                   	<td style="text-align: center;"><a class="link" href="beer.do?command=beerdetail&beerno=${list.beerNo }" target="_blank">${list.reviewContent }</a></td>
			                                               			</tr>
		                                               			
		                                               			</c:forEach>
		                                               		</c:otherwise>
		                                               </c:choose>     

	                                            <tr>
	                                             <td colspan="5" style="text-align: right;"><input type="submit" class="genric-btn danger medium" value="삭제"/></td>
	                                         	</tr>

                                           </table> 
                                        </form>
                                    </div>
                                    
                                    
                        
                                    <div class="tab_box">
                                        <form action="admin.do?command=muldel" method="post" class="muldelform">
                                            <input type="hidden" value="postdel" name="action">
                                            <input type="hidden" value="${userId }" name="userId">
                                            <table class="table">
                                               <col width="70px">
                                               <col width="480px">
                                               <tr>
                                                   <td><input type="checkbox" name="all"  class="all" ></td>
                                                   <td style="text-align: center;">제목</td>
                                               </tr>
                                               <c:choose>
                                               		<c:when test="${empty postList }">
                                               			<tr>
                                               				<td colspan="2" style="text-align: center;">작성한 게시글이 없습니다.</td>
                                               			</tr>
                                               		</c:when>
                                               		<c:otherwise>
                                               			<c:forEach var="list" items="${postList }">
                                               				<tr>
				                                                   <td>
				                                                       <input type="checkbox" name="chk" value="${list.postNo }">
				                                                   </td>
				                                                   <td style="text-align: center;"><a class="link" href="free.do?command=detail&no=${list.postNo }" target="_blank">${list.postTitle }</a></td>                                               				                   				
                                               				</tr>
                                               			</c:forEach>
                                               		</c:otherwise>
                                               </c:choose>
                                               	<tr>
                                                <td colspan="5" style="text-align: right;"><input type="submit" class="genric-btn danger medium" value="삭제"/></td>
                                            	</tr>
                                           </table> 
                                        </form>
                        
                                    </div> 
                                    <div class="tab_box">
                                    <form action="admin.do?command=muldel" method="post" class="muldelform">
                                        <input type="hidden" value="commentdel" name="action">
                                        <input type="hidden" value="${userId }" name="userId">
                                        <table class="table">

                                           <col width="70px">
                                           <col width="480px">
                                           <tr>
                                               <td><input type="checkbox" name="all" class="all"></td>
                                               <td style="text-align: center;">내용</td>
                                           </tr>
                                           <c:choose>
                                           	<c:when test="${empty commentList  }">
	                                           	<tr>
	                                               	<td colspan="2" style="text-align: center;">작성한 댓글이 없습니다.</td>
	                                            </tr>	
                                           	</c:when>
                                           	<c:otherwise>
                                           		<c:forEach var="list" items="${commentList }">
		                                               <tr>
			                                               <td>
			                                                   <input type="checkbox" name="chk" value="${list.commentNo }">
			                                               </td>
			                                           
			                                               <td style="text-align: center;"><a class="link" href="free.do?command=detail&no=${list.postNo }" target="_blank">${list.commentContent }</a></td>
		                                           		</tr>
                                           		</c:forEach>
                                           	</c:otherwise>
                                           </c:choose>
     
                                           <tr>
                                            <td colspan="5" style="text-align: right;"><input type="submit" class="genric-btn danger medium" value="삭제"/></td>
                                        </tr>
                                       </table> 
                                    </form>                              
                                </div>
                                    <div class="tab_box">
                                    <form action="admin.do?command=muldel" method="post" class="muldelform">
                                        <input type="hidden" value="moimdel" name="action">
                                        <input type="hidden" value="${userId }" name="userId">
                                        <table class="table">

                                           <col width="70px">
                                           <col width="480px">
                                           <tr>
                                               <td><input type="checkbox" name="all" class="all"></td>
                                               <td style="text-align: center;">내용</td>
                                           </tr>
                                           <c:choose>
                                           	<c:when test="${empty moimList  }">
	                                           	<tr>
	                                               	<td colspan="2" style="text-align: center;">작성한 모임이 없습니다.</td>
	                                            </tr>	
                                           	</c:when>
                                           	<c:otherwise>
                                           		<c:forEach var="list" items="${moimList }">
		                                               <tr>
			                                               <td>
			                                                   <input type="checkbox" name="chk" value="${list.moimNo }">
			                                               </td>
			                                           
			                                               <td style="text-align: center;"><a class="link" href="moim.do?command=view&moimNo=${list.moimNo }" target="_blank">${list.moimTitle }</a></td>
		                                           		</tr>
                                           		</c:forEach>
                                           	</c:otherwise>
                                           </c:choose>
     
                                           <tr>
                                            <td colspan="5" style="text-align: right;"><input type="submit" class="genric-btn danger medium" value="삭제"/></td>
                                        </tr>
                                       </table> 
                                    </form>                              
                                </div>                                
                                </div>
                                    <div class="tab_box">
                                    <form action="admin.do?command=muldel" method="post" class="muldelform">
                                        <input type="hidden" value="moimcommentdel" name="action">
                                        <input type="hidden" value="${userId }" name="userId">
                                        <table class="table">

                                           <col width="70px">
                                           <col width="480px">
                                           <tr>
                                               <td><input type="checkbox" name="all" class="all"></td>
                                               <td style="text-align: center;">내용</td>
                                           </tr>
                                           <c:choose>
                                           	<c:when test="${empty moimCommentList  }">
	                                           	<tr>
	                                               	<td colspan="2" style="text-align: center;">작성한 모임이 없습니다.</td>
	                                            </tr>	
                                           	</c:when>
                                           	<c:otherwise>
                                           		<c:forEach var="list" items="${moimCommentList }">
		                                               <tr>
			                                               <td>
			                                                   <input type="checkbox" name="chk" value="${list.mmNo }">
			                                               </td>
			                                           
			                                               <td style="text-align: center;"><a class="link" href="moim.do?command=view&moimNo=${list.moimNo }" target="_blank">${list.mmContent }</a></td>
		                                           		</tr>
                                           		</c:forEach>
                                           	</c:otherwise>
                                           </c:choose>
     
                                           <tr>
                                            <td colspan="5" style="text-align: right;"><input type="submit" class="genric-btn danger medium" value="삭제"/></td>
                                        </tr>
                                       </table> 
                                    </form>                              
                                </div>                         
                           
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>
    </section>

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

</body>
</html>