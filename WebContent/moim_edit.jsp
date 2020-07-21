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
  
  <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
  tinymce.init({
    selector: 'textarea#editor',
    menubar: false
  });
</script>
<script type="text/javascript">
	function getFormatDate(date){
		var year = date.getFullYear();              //yyyy
	 	var month = (1 + date.getMonth());          //M
		month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
		var day = date.getDate();                   //d
		day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
		return  year + '-' + month + '-' + day;
	}

	$(function(){
		$("#updateform").submit(function(){
			var categoryNoChk = document.getElementsByName("categoryNo")[0].value;
			var titleChk = document.getElementsByName("moimTitle")[0].value;
			var DateChk = document.getElementsByName("moimDate")[0].value;
			var placeChk = document.getElementsByName("moimPlaceAdd")[0].title;
			var moimContentChk = document.getElementsByName("moimContent")[0].value;
			
			var today = new Date();
			today = getFormatDate(today);
			
			if(today > DateChk){
				alert('잘못된 모임 일자입니다. 다시 입력해 주세요.');
				return false;
			}
			
			//기본으로 n인 상태
			if(placeChk == "n"){
				alert("장소를 선택해 주세요.");
				return false;
			}
			
			if(categoryNoChk == ""){
				alert("말머리를 선택해 주세요.");
				return false;
			}
			
			if(titleChk == "" || titleChk == null){
				alert("제목을 입력해 주세요.");
				return false;
			}
			
			if(DateChk == null){
				alert("모임 일자를 입력해 주세요.");
				return false;
			}
			
			if(moimContentChk == "" || moimContentChk == null){
				alert("내용을 입력해 주세요.");
				return false;
			}
			
		});
	});
	
	function map_window(){
		var target = "moim.do?command=selectPlaceWindow";
		window.open(target,'','width=700, height=400');
	}

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
                            <p>Let's gather up</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!--body-->
    <!--================Blog Area =================-->
        <div class="freeboard_detail" role="main">
            <h1>모임</h1>
            <h2>글 수정</h2>
            <br><br>
            <div id="freeboard_form">
                <form name="updateform" id="updateform" role="form" method="post" action="moim.do">
                	<input type="hidden" name="command" value="update">
                	<input type="hidden" name="moimNo" value="${dto.moimNo }">
                	
                    <div class="mb-3">
                        <label for="moimTitle"></label><b>제목</b></label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend mr-1">                            
                                <select id="categoryNo" name="categoryNo" style="width:150px; height:45px;" class="custom-select">
                                    <option value="TALK" <c:if test="${category eq 'TALK' }">selected</c:if>>강연</option>
                                    <option value="CLASS" <c:if test="${category eq 'CLASS' }">selected</c:if>>클래스</option>
                                    <option value="MOIM" <c:if test="${category eq 'MOIM' }">selected</c:if>>번개</option>
                                    <option value="ETC" <c:if test="${category eq 'ETC' }">selected</c:if>>기타</option>
                              </select>
                            </div>
                            <input type="text" name="moimTitle" class="form-control" value="${dto.moimTitle }" style="width:200px; height:45px;">
                          </div>
                    </div>
                    <div class="mb-3">
                        <label>
                            <b>모임 일자</b>
                            <input type="date" name="moimDate" class="form-control" value="${dto.moimDate }" style="width:300px; height:40px;">
                        </label>
                    </div>
                    <div class="mb-3">
                        <label>
                            <b>작성자</b>
                            <div><span>${dto.userId }</span></div>
                        </label>
                    </div>
                    <label for="moimPlace">
                        <b>장소</b><br>
                        <input type="text" class="form-control" name="moimPlaceAdd" style="width:400px; height:40px; display: inline-block;" value="${dto.moimPlaceAdd }" readonly>
                        <input type="button" class="genric-btn primary-border" style="display: inline-block;" value="주소검색" onclick="map_window();">
                    </label>
                    <div class="mb-3">
                        <label for="moimContent"><b>내용</b></label>
                        <textarea name="moimContent" class="form-control" rows="10" cols="60" name="content" id="content" style="resize:none;">${dto.moimContent }</textarea>
                    </div>
                    <div style="text-align: right;">
                        <input type="submit" class="genric-btn primary radius" id="btnSave" value="작성">
                        <button type="button" class="genric-btn primary radius" id="btnCancel" onclick="location.href='moim.do?command=view&moimNo=${dto.moimNo}'">취소</button>
                    </div>
                    <input type="hidden" name="moimPlaceName" value="${dto.moimPlaceName }">
                    
                </form>
            </div>
		</div>


    <!-- footer part start-->
<%@ include file="../form/footer.jsp" %>

</body>

</html>