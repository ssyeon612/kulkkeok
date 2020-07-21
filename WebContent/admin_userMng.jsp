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
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <script type="text/javascript">

        function allChk(bool){
            var chks = document.getElementsByName("chk");

            for(var i=0;i<chks.length;i++){
                chks[i].checked = bool;
            }
        }
        
        // check를 하나도 하지 않으면 submit 취소!
        // 유효값을 처리하는 것이다.
        $(function(){
            
            $("#muldelform").submit(function(){
                if($("#muldelform input:checked").length == 0){
                    alert("하나 이상 체크 해주세요.");
                    
                    return false;
                }
                
            });
            
            $("input[name='chk']").click(function(){
                
                if($("input[name='chk']").length==$("input[name='chk']:checked").length){
                    $("input[name='all']").prop("checked",true);
                }else{
                    $("input[name='all']").prop("checked",false);
                }
            });
            
        });
        
        
    
    </script>


    <style type="text/css">
        .adminpage {
            width: 1000px;
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

<body>
   <%@ include file="../form/header.jsp" %>
    <!-- Header part end-->

    <!-- breadcrumb start-->
    <!-- breadcrumb start-->

    <!--body-->
        <section class="banner_part">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="section-top-border">
                        <div class="adminpage">
                            <div class=" mypagelogo mb-30" style="text-align: center;  color: #0c3e72; font-size: 3em; margin-top: 0px; font-family: 'Permanent Marker', sans-serif;">
                                <span>Member Management</span>
                            </div>
                                    <form action="admin.do?command=muldel" method="post" id="muldelform">
                                        <input type="hidden" value="userdel" name="action">
                                        <table class="table" style="margin: 0px auto;">
                                            <col width="60px"><col width="150px">
                                            <col width="150px"><col width="170px">
                                            <col width="100px">
                                            <tr>
                                                <th><input type="checkbox" name="all" onclick="allChk(this.checked);"></th>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>email</th>
                                                <th >activity</th>
                                            </tr>
    										<c:choose>
    											<c:when test="${empty list }">
    												<tr>
    													<td colspan="5" style="text-align: center;">유저가 없습니다.</td>
    												</tr>
    											
    											</c:when>
    											<c:otherwise>
    												<c:forEach var="list" items="${list }">
				                                             
				                                             <tr>
				                                                <td><input type="checkbox" name="chk" value="${list.userId }"></td>
				                                                <td>${list.userId }</td>
				                                                <td>${list.userName }</td>
				                                                <td>${list.userEmail }</td>
				                                                <td><input type="button" class="genric-btn info-border radius small"  onclick="window.open('admin.do?command=activity&userId=${list.userId}', '','width=700px, height=900px, left=100, top=50');" value="활동보기"></td>
				                                            </tr> 												
    												
    												</c:forEach>
    														<tr>
				                                                <td colspan="5" style="text-align: right;"><input type="submit" class="genric-btn danger medium" value="탈퇴"/></td>
				                                            </tr>  
    											</c:otherwise>
    										
    										</c:choose>

                                        </table>
                                    </form>

                        </div>
                    </div>
                </div>
            </div>
        </section>


    <!-- footer part start-->
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