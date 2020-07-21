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

	<script type="text/javascript">
		function changeSelect(){
			 var select = document.getElementById("gang");
		     
			    // select element에서 선택된 option의 value가 저장된다.
			    var selectValue = select.options[select.selectedIndex].value;
			 
			    document.getElementById("showGang").innerHTML=selectValue;
			    
		}
	
	</script>

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
                <div class="worldcup_logo"><i class="fas fa-trophy fa-6x" style="color: gainsboro;"></i></div>
                <div>
                    <div>
                        <span style="font-size: 3em;"><b style="color: gray; font-family: 'Permanent Marker', sans-serif;"> World Cup</b></span><br>
                    </div>
                    <form action="worldcup.do?command=play" method="post">
                    	<input type="hidden" name="round" value="1"/>
	                    <div class="mt-2">
	                          <select class="form-control" name="gang" style="width:100px; margin: 0px auto;" id="gang" onchange="changeSelect();" >
	                            <option value="32" selected>32강</option>
	                            <option value="16">16강</option>
	                            <option value="8">8강</option>
	                            <option value="4">4강</option>
	                          </select>
	                          <br>
	                        <i>총 195개의 후보 중 <span id="showGang">32</span>개의 맥주가 대결합니다.</i>
	                    </div>
	                    <div class="m-3">
	                        <input type="submit" class="genric-btn info" value="시작하기">
	                    </div>                    
                    </form>

                </div>
            </div>
       </div>
   </section>
    
    
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