<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
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

     <!-- jquery -->
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <script type="text/javascript">
    
	    var winList = new Array(); // 사용자가 선택한 번호를 저장할 배열
	    var i = 0; // 사용자가 클릭한 횟수
	    var gangOfIndex = 1;
	    var gang=0;
	    var nextGang=0;
	    
		    function next(winNo,winName){
		    	gang = '<c:out value="${gang }"></c:out>';
		    	nextGang = gang/2;
		    		winList[i] = winNo;
		    		i++;
		    		
		    		if(i==nextGang){
		    			// 다음 라운드
		    			if(nextGang==1||gang==2){
		    				var is = confirm(winName+"을/를 선택하시겠습니까?");
		    				if(is){
			    				location.href='worldcup.do?command=winBeer&win='+winList;		    					
		    				}else{return false;}
		    				
		    			}else{
		    				var is = confirm(winName+"을/를 선택하시겠습니까?");
			    			if(is){
			    				alert("다음 라운드");
			    				location.href="worldcup.do?command=nextRound&winList="+winList+"&gang="+nextGang;
			    			}
			    			else{return false;}
		    				
		    			}
		    			
		    		}else{
		    			var is = confirm(winName+"을/를 선택하시겠습니까?");
		    			if(is){nextBeer(i);}
		    			else{return false;}
		    		}
	
		    }
    
		    function nextBeer(index){
		    	
		    	$('#round').html('<span style="font-size: 2.5em;">월드컵 '+gang+'강 '+(index+1)+'/'+nextGang+'</span>');
		    	
		    	var htmls='';
		 
		    	$.ajax({
		    		url:"worldcup.do?command=vs&index="+index,
		    		success:function(data){
		    			
		    			var jsonInfo = JSON.parse(data);
		    			
		    			var htmls='';
		    			var htmls2='';
		    			
		    			for(var i in jsonInfo.beers){
		    			    htmls+='<button type="button" class="btm_image" id="img_btn" style="border-style: none;" onclick="next('+ jsonInfo.beers[i].beerNo +',\''+jsonInfo.beers[i].beerKorName+'\');">';
		    			    htmls+='<div style="background-image:url(\'img/beer/'+jsonInfo.beers[i].beerPic+'.jpg\'); background-size:contain; background-position:center center; background-repeat: no-repeat; width: 450px; height: 400px; display: inline-block;"></div>';
		    	            htmls+='</button>';
	                        
		    	            htmls2+='<div id="vs1_content" style="width: 450px; height: 100px; display: inline-block;">';
                            htmls2+='<b>';
                            htmls2+=jsonInfo.beers[i].beerKorName;
                            htmls2+='</b><br>';
                            htmls2+=jsonInfo.beers[i].beerDetail;
                        	htmls2+='</div>';
		    	            
		    			}
		    			$("#selectBeer").html(htmls);
		    			$("#selectBeerDetail").html(htmls2);
		    		},
		    		error:function(){
		    			alert("통신실패");
		    		}

		    	});
		    	
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
            	<div id="round"><span style="font-size: 2.5em;">월드컵 ${gang }강 1/<fmt:parseNumber value="${gang/2 }" integerOnly="true" /></span></div>            	            	
            
                
                <div class="mt-2">
                    <div id ="selectBeer">
                        <button type="button" class="btm_image" id="img_btn" style="border-style: none;" onclick="next(${beer1.beerNo },'${beer1.beerKorName }');">
                            <div style="background-image:url('img/beer/${beer1.beerPic}.jpg'); background-size:contain; background-position:center center; background-repeat: no-repeat; width: 450px; height: 400px; display: inline-block;"></div>
                        </button>
                        <button type="button" class="btm_image" id="img_btn" style="border-style: none;" onclick="next(${beer2.beerNo },'${beer2.beerKorName }');" >
                            <div  style="background-image:url('img/beer/${beer2.beerPic}.jpg'); background-size:contain; background-position:center center;  background-repeat: no-repeat; width: 450px; height: 400px;display: inline-block;"></div>
                        </button>
                    </div>

                    <div class="m-3" id="selectBeerDetail">
                        <div id="vs1_content" style="width: 450px; height: 100px; display: inline-block;">
                            <b>${beer1.beerKorName }</b><br>
                            ${beer1.beerDetail }
                        </div>
                        <div id="vs1_content" style="width: 450px; height: 100px; display: inline-block;">
                            <b>${beer2.beerKorName }</b><br>
                            ${beer2.beerDetail }
                        </div>
                    </div>

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