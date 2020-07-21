<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

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
    
   <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>    
   <script type="text/javascript">
   
   	$(function(){
   		
   		
   		
   		$("#beerInsertForm").submit(function(){
   			
   			var fileValue = $("#beer_img").val().split("\\");
   			var fileName = fileValue[fileValue.length-1]; // 파일명

   		
   			
   			if($("#beer_kor").val()==""||$("#beer_kor").val()==null){	
   				alert("맥주 한글이름을 입력하세요.");
   				return false;
   			}
   			if($("#beer_eng").val()==""||$("#beer_eng").val()==null){	
   				alert("맥주 영어이름을 입력하세요.");
   				return false;
   			}
   			
   			
   			if($("#beer_origin option:selected").val()=="나라 선택"){	
   				alert("나라를 선택해주세요.");
   				return false;
   			} 
   			
   			if($("#beer_type option:selected").val()=="종류 선택"){	
   				alert("종류를 선택해주세요.");
   				return false;
   			} 		
   			
   			if($("#beer_abv").val()==""||$("#beer_abv").val()==null){
   				alert("도수를 입력해주세요.");
   				return false;
   			}
   			
   			if($("#beer_detail").val()==""||$("#beer_detail").val()==null){
   				alert("맥주설명을 입력해주세요.");
   				return false;
   			}
   			
   			if(fileName==""||fileName==null){
   				alert("맥주 이미지를 입력해주세요.");
   				return false;
   			}
   			
   			var ext = $('#beer_img').val().split('.').pop().toLowerCase();

   	      		if(ext != 'jpg') {
		   		 alert('jpg 파일만 업로드 할수 있습니다.');		
		   		 return false;
   	      			}
   	      		

   		
   		});
   		
   		
   		$("#beer_img").on('change',function(){
   			var name="";
   			if(window.FileReader){
   				name = $(this)[0].files[0].name;
   			}else{
   				name = $(this).val().split('/').pop().split('\\').pop();
   			}
   			
   			$("#userfile").html(name);
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
                            <p>beer imformation</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  
         <div class="freeboard_detail" role="main">
            <h1>맥주정보</h1>
            <h2>글쓰기</h2>
            <br><br>
            <div id="freeboard_form">
			<form name="beerInsertForm" id="beerInsertForm" role="form" method="post" action="beerInsert.do" enctype="multipart/form-data">
			<input type="hidden" name="command" value="beerInsert">
				<div class="mb-3">
					<label for="beer_kor"><b>맥주 이름 한글 표기</b></label>
					<input type="text" class="form-control" name="beer_kor" id="beer_kor" placeholder="맥주이름 한글 표기" autofocus />
                </div>
                <div class="mb-3">
					<label for="beer_eng"><b>맥주 이름 영문 표기</b></label>
					<input type="text" class="form-control" name="beer_eng" id="beer_eng" placeholder="맥주이름 영어 표기" />
                </div>
                <div class="mb-3">
                    <label for="beer_Origin"><b>원산지</b></label>
                    <br>
					<select style="width:150px; height:45px;" class="custom-select" name="beer_origin" id="beer_origin">
                        <option selected >나라 선택</option>
                        <option value="BELGIUM" >벨기에</option>
                        <option value="GERMANY" >독일</option>
                        <option value="RUSSIA" >러시아</option>
                        <option value="AMERICA" >미국</option>
                        <option value="CHINA" >중국</option>
                        <option value="INDONESIA" >인도네시아</option>
                        <option value="ITALY" >이탈리아</option>
                        <option value="BRAZIL" >브라질</option>
                        <option value="ENGLAND" >영국</option>
                        <option value="DENMARK" >덴마크</option>
                        <option value="KOREA" >대한민국</option>
                        <option value="THAILAND" >태국</option>
                        <option value="MEXICO" >멕시코</option>
                        <option value="SPAIN" >스페인</option>
                        <option value="TURKEY" >터키</option>
                        <option value="AUSTRALIA" >호주</option>
                        <option value="CZECH" >체코</option>
                        <option value="NETHERLANDS" >네덜란드</option>
                        <option value="IRELAND" >아일랜드</option>
                        <option value="VIETNAM" >베트남</option>
                        <option value="JAPAN" >일본</option>
                        <option value="FRANCE" >프랑스</option>
                        <option value="SRILANKA" >스리랑카</option>
                        <option value="CANADA" >캐나다</option>
                        <option value="MYANMAR" >미얀마</option>
                        <option value="ESTONIA" >에스토니아</option>
                        <option value="PHILIPPINES" >필리핀</option>
                        <option value="SINGAPORE" >싱가포르</option>
                        <option value="KENYA" >케냐</option>
                        <option value="AUSTRIA" >오스트리아</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="beer_type"><b>종류</b></label>
                       <br>
                        <select style="width:300px; height:45px;" class="custom-select" name="beer_type" id="beer_type">
                            <option selected >종류 선택</option>
                            <option value="LAMBIC">람빅</option>
                            <option value="LAGER">라거</option>
                            <option value="DARK">라거/다크라거</option>
                            <option value="DUNKEL">라거/둔켈</option>
                            <option value="RAUCH">라거/라우흐비어</option>
                            <option value="MAREZEN">라거/메르첸비어</option>
                            <option value="LIGHT">라거/미국식 부가물 라거/라이트 라거</option>
                            <option value="BOCK">라거/복</option>
                            <option value="DOPPEL">라거/복/도펠복</option>
                            <option value="ICEBOCK">라거/복/아이스복</option>
                            <option value="SCHWARZ">라거/슈바르츠비어</option>
                            <option value="STEIM">라거/슈타인비어</option>
                            <option value="ICELAGER">라거/아이스 라거</option>
                            <option value="EXPORT">라거/엑스포트</option>
                            <option value="EMBLAGER">라거/엠버 라거</option>
                            <option value="ZWICKL">라거/츠비클비어</option>
                            <option value="PALELAGER">라거/페일 라거</option>
                            <option value="PILSNER">라거/필스너</option>
                            <option value="HELLES">라거/헬레스 라거</option>
                            <option value="AICOFREI">알콜프라이에스비어</option>
                            <option value="ALE">에일</option>
                            <option value="GOSEALE">에일/고제</option>
                            <option value="GOLDENALE">에일/골든 에일</option>
                            <option value="DAMP">에일/담프 비어</option>
                            <option value="REDALE">에일/레드 에일</option>
                            <option value="MILDALE">에일/마일드 에일</option>
                            <option value="WHEAT">에일/밀맥주</option>
                            <option value="GOSEWHEAT">에일/밀맥주/고제</option>
                            <option value="WEIZEN">에일/밀맥주/바이젠복</option>
                            <option value="BELWIT">에일/밀맥주/벨기에식 밀맥주</option>
                            <option value="CRYSTAL">에일/밀맥주/크리스탈 밀맥주</option>
                            <option value="BLACK">에일/밀맥주/흑밀맥주</option>
                            <option value="BELGIAN">에일/벨지안 에일</option>
                            <option value="BELWHITE">에일/벨지안 화이트 에일</option>
                            <option value="BROWN">에일/브라운 에일</option>
                            <option value="SCOTCH">에일/스카치 에일</option>
                            <option value="STOUT">에일/스타우트</option>
                            <option value="STRONG">에일/스트롱 에일</option>
                            <option value="AMEALE">에일/아메리칸 페일 에일</option>
                            <option value="ALT">에일/알트 비어</option>
                            <option value="KOLSCH">에일/쾰쉬</option>
                            <option value="PALE">에일/페일 에일</option>
                            <option value="PALEMIL">에일/페일 에일/밀맥주</option>
                            <option value="BLONDE">에일/페일 에일/블론드 에일</option>
                            <option value="AMBER">에일/페일 에일/엠버 에일</option>
                            <option value="INDIA">에일/페일 에일/인디아 페일 에일</option>
                            <option value="ENGLISH">에일/페일 에일/잉글리쉬 비터</option>
                        </select>
                        
                  </div>

                <div class="mb-3">
					<label for="beer_abv"><b>도수</b></label>
					<input type="text" class="form-control" name="beer_abv" id="beer_abv" placeholder="도수 입력"/>
                </div>

                 <div class="custom-file">
				    <input type="file" id="beer_img" name="beer_img" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
				    <label class="custom-file-label" for="inputGroupFile01" id="userfile">이미지 선택</label>
				  </div>
				  
                <div class="mb-3">
                    <label for="beer_detail"><b>정보</b></label>
                    <br>
					<textarea class="form-control" rows="10" cols="60" name="beer_detail" name="beer_detail" id="beer_detail" placeholder="내용을 입력해 주세요" style="resize:none;"></textarea>
                </div>
                <div style="text-align: right;">
                    <button type="submit" class="genric-btn primary radius" id="btnSave">저장</button>
                    <button type="button" class="genric-btn primary radius" id="btnCancel" onclick="location.href='beer.do?command=beerinfo'">취소</button>
                </div>
            </form>
            </div>
		</div> 
  
  
  
      <!--================end writing area=================-->
	<%@ include file="form/footer.jsp" %>
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