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
    
   <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a882bfbb712bc453a746c73aed7f06e7&libraries=services"></script>

    <style>
        #viewForm{
            margin-top: 0px;
            padding: 50px; 
            background-color: rgba(235, 168, 26, 0.103)
        }

        #viewForm #chgposition div table tr th{
            color: #fe5c24;
        }
    </style>
    <style>
       .updateView, .replyView{
         display: none;
      }
    </style>
   
   <!-- 댓글 리스트 AJAX -->
   <script type="text/javascript">
   
      function showReplyList(){
         var url = "moimComment.do?command=commentlist&moimNo="+${dto.moimNo};
         
         var today = new Date();
         
         var year = today.getFullYear();
         var month = today.getMonth() + 1;
         var date = today.getDate();
         var currentDay = year+'/'+month+'/'+date;
         
         
         $.ajax({
            type: 'post',
            url: url,
            //data : 요청과 함께 서버로 데이터를 전송 할 string 또는 map
            success: function(data){
                 var userId = '<c:out value="${user.userId }"></c:out>';

                 
                 var htmls= "";
                 htmls +='<div id="commentList">';
                 if(data.length < 1){
                    //등록된 댓글이 없습니다.
                    
                 }else{
                    var jsonInfo = JSON.parse(data);
                    for(var i in jsonInfo.comments){
                                  
                       /* commentView start*/
                       
                       /************************reply comment ********************************/
                       if(jsonInfo.comments[i].replyId != null){
                          
                       /*************** commentView start ***************/
                          htmls += '<div class="commentView view';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += '"  style="margin-left: 20px;"  >';
                          htmls += '<h5>';
                          htmls += '<i class="fas fa-reply fa-rotate-180" style="color: #fe5c24;"></i> ';
                          htmls += '<i class="fas fa-user-circle" style="color: #fe5c24;" ></i> ';
                          htmls += '<strong style="color: #fe5c24;" >';
                          htmls += jsonInfo.comments[i].userId;
                          htmls += '</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                          htmls += '<span style="color:grey; font-size: 14px;">';
                          htmls += jsonInfo.comments[i].mmDate;
                          htmls += '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                          
                  
                        if(userId != ""){
                             htmls += '<input type="button" class="genric-btn info-border radius small replybtn" style="padding-right:15px; padding-left: 15px;" value="답글" onclick="replyComment(';
                             htmls += jsonInfo.comments[i].mmNo;
                             htmls += ');">';   
                             
                             if(userId == jsonInfo.comments[i].userId){
                                htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="수정" onclick="updateComment(';
                                htmls += jsonInfo.comments[i].mmNo;
                                htmls += ');">';
                             }
                                if(userId == jsonInfo.comments[i].userId || userId == 'ADMIN'){
                                   htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="삭제" onclick="deleteComment(';                                
                                   htmls += jsonInfo.comments[i].moimNo;
                                   htmls += ',';
                                   htmls += jsonInfo.comments[i].mmNo;
                                   htmls += ');">';                             
                                }
                        }
                        
                          htmls += '</h5>';
                          htmls += '<table class="table">';
                          htmls += '<tr>';
                          
                          htmls += '<td>';
                          htmls += '<div>';
                          htmls += '<span style="color:gray;"><strong> @'+jsonInfo.comments[i].replyId +'</strong></span> '+jsonInfo.comments[i].mmContent;
                          htmls += '</div>';
                          htmls += '</td>';
                          
                          htmls += '</tr>';
                          htmls += '</table>';
                          htmls += '</div>';   
                       /*************** commentView end ***************/

                          
                       /*************** updateView start ***************/
                          htmls += '<div class="updateView uview';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += '" style ="border-radius: 10px 10px 10px 10px; box-shadow: 10px 10px 10px 10px rgba(0,0,0,0.06); padding:13px; margin-bottom:15px; margin-left: 20px;" >';
                          htmls += '<form name="uview'+ jsonInfo.comments[i].mmNo +'">';
                          htmls += '<input type="hidden" name="moimNo" value="';
                          htmls += jsonInfo.comments[i].moimNo;
                          htmls += '"/>';
                          htmls += '<input type="hidden" name="mmNo" value="';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += '"/>';
                          htmls += '<h5>';
                          htmls += '<i class="fas fa-user-circle" style="color: #fe5c24;" ></i> ';
                          htmls += '<strong style="color: #fe5c24;" >';
                          htmls += jsonInfo.comments[i].userId;
                          htmls += '</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                          htmls += '<span style="color:grey; font-size: 14px;">';
                          htmls += jsonInfo.comments[i].mmDate;
                          htmls += '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                          
                          htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="수정완료" onclick="update(';
                          htmls += jsonInfo.comments[i].moimNo;
                          htmls += ',';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += ');" />';
                          
                          htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="취소" onclick="rollbackComment(';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += ');">';
                          htmls += '</h5>';
                          htmls += '<table class="table">';
                          htmls += '<tr>';
                          htmls += '<td><textarea class="form-control" style=" resize: none; background-color: white;" rows="2" cols="30" name="mmContent">';
                          htmls += jsonInfo.comments[i].mmContent;
                          htmls += '</textarea></td>';
                          htmls += '</tr>';
                          htmls += '</table>';
                          htmls += '</form>';
                          htmls += '</div>';
                        /*************** updateview end ***************/
                        
                          /*************** replyView start ***************/
                          htmls += '<div class="replyView rview';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += '" style="margin-left: 20px;  border-radius: 10px 10px 10px 10px; box-shadow: 10px 10px 10px 10px rgba(0,0,0,0.06); padding:13px; margin-bottom:15px;  "  >';
                          
                          htmls += '<form name="rview'+ jsonInfo.comments[i].mmNo +'">';
                          htmls += '<input type="hidden" name="moimNo" value="';
                          htmls += jsonInfo.comments[i].moimNo;
                          htmls += '"/>';
                          htmls += '<input type="hidden" name="mmNo" value="';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += '"/>';
                          
                          htmls += '<input type="hidden" name="userId" value="';
                          htmls += userId; /*대댓글 작성자*/
                          htmls += '"/>';
                          
                          htmls += '<h5>';
                          htmls += '<i class="fas fa-reply fa-rotate-180" style="color: #fe5c24;"></i> ';
                          htmls += '<i class="fas fa-user-circle" style="color: #fe5c24;" ></i> ';
                          htmls += '<strong style="color: #fe5c24;" >';
                          
                          htmls += userId; /*대댓글 작성자*/
                          
                          htmls += '</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                          htmls += '<span style="color:grey; font-size: 14px;">';
                          htmls += currentDay;
                          htmls += '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                          htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="답글달기" onclick="reply(';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += ');">';
                          htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="취소" onclick="rollbackreply(';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += ');">';
                          htmls += '</h5>';
                          htmls += '<table class="table">';
                          htmls += '<tr>';
                          htmls += '<td><textarea class="form-control" style=" resize: none; background-color: white;" rows="2" cols="30" name="mmContent">';
                          htmls += '</textarea></td>';
                          htmls += '</tr>';
                          htmls += '</table>';
                          htmls += '</form>';
                          htmls += '</div>';                  
                          /*************** replyview end ***************/
                       }
                       else{   
                          
                          /*************** normal comment ***************/
                          
                          
                          /*************** commentView start ***************/
                          htmls += '<div class="commentView view';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += '">';
                          htmls += '<h5>';
                          htmls += '<i class="fas fa-user-circle" style="color:#415094;"></i> ';
                          htmls += '<strong style="color:#415094;">';
                          htmls += jsonInfo.comments[i].userId;
                          htmls += '</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                          htmls += '<span style="color:grey; font-size: 14px;">';
                          htmls += jsonInfo.comments[i].mmDate;
                          htmls += '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                          
                          if(userId != ""){
                  
                             htmls += '<input type="button" class="genric-btn info-border radius small" style="padding-right:15px; padding-left: 15px;" value="답글" onclick="replyComment(';
                             htmls += jsonInfo.comments[i].mmNo;
                             htmls += ');">';
                             
                             if(userId == jsonInfo.comments[i].userId){
                                htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="수정" onclick="updateComment(';
                                htmls += jsonInfo.comments[i].mmNo;
                                htmls += ');">';
                                }
                             if(userId == jsonInfo.comments[i].userId || userId == 'ADMIN'){
                                htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="삭제" onclick="deleteComment(';
                                htmls += jsonInfo.comments[i].moimNo;
                                htmls += ',';
                                htmls += jsonInfo.comments[i].mmNo;
                                htmls += ');">';      
                             }
                          
                          }
                          htmls += '</h5>';
                          htmls += '<table class="table">';
                          htmls += '<tr>';
                          
                          htmls += '<td>';
                          htmls += '<div>';
                          htmls += jsonInfo.comments[i].mmContent;
                          htmls += '</div>';
                          htmls += '</td>';
                          
                          htmls += '</tr>';
                          htmls += '</table>';
                          htmls += '</div>';
                          /*************** commentView end ***************/
                          
                             
                          /*************** updateView start ***************/
                          htmls += '<div class="updateView  uview';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += '" style ="border-radius: 10px 10px 10px 10px; box-shadow: 10px 10px 10px 10px rgba(0,0,0,0.06); padding:13px; margin-bottom:15px;" >';
                          htmls += '<form name="uview'+ jsonInfo.comments[i].mmNo +'">';
                          htmls += '<input type="hidden" name="moimNo" value="';
                          htmls += jsonInfo.comments[i].moimNo;
                          htmls += '"/>';
                          htmls += '<input type="hidden" name="mmNo" value="';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += '"/>';
                          htmls += '<h5>';
                          htmls += '<i class="fas fa-user-circle" style="color:#415094;" ></i> ';
                          htmls += '<strong style="color:#415094;" >';
                          htmls += jsonInfo.comments[i].userId;
                          htmls += '</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                          htmls += '<span style="color:grey; font-size: 14px;">';
                          htmls += jsonInfo.comments[i].mmDate;
                          htmls += '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                          
                          htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="수정완료" onclick="update(';
                          htmls += jsonInfo.comments[i].moimNo;
                          htmls += ',';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += ');" />';
                          
                          htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="취소" onclick="rollbackComment(';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += ');">';
                          htmls += '</h5>';
                          htmls += '<table class="table">';
                          htmls += '<tr>';
                          htmls += '<td><textarea class="form-control" style=" resize: none; background-color: white;" rows="2" cols="30" name="mmContent">';
                          htmls += jsonInfo.comments[i].mmContent;
                          htmls += '</textarea></td>';
                          htmls += '</tr>';
                          htmls += '</table>';
                          htmls += '</form>';
                          htmls += '</div>';
                        /*************** updateview end ***************/
                        
                          /*************** replyView start ***************/
                          htmls += '<div class="replyView rview';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += '" style="margin-left: 20px;  border-radius: 10px 10px 10px 10px; box-shadow: 10px 10px 10px 10px rgba(0,0,0,0.06); padding:13px; margin-bottom:15px;  " >';
                          
                          htmls += '<form name="rview'+ jsonInfo.comments[i].mmNo +'">';
                          htmls += '<input type="hidden" name="moimNo" value="';
                          htmls += jsonInfo.comments[i].moimNo;
                          htmls += '"/>';
                          htmls += '<input type="hidden" name="mmNo" value="';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += '"/>';
                          
                          
                          htmls += '<input type="hidden" name="userId" value="';
                          htmls += userId; /*대댓글 작성자*/
                          htmls += '"/>';
                          
                          
                          
                          htmls += '<h5>';
                          htmls += '<i class="fas fa-reply fa-rotate-180" style="color: #fe5c24;"></i> ';
                          htmls += '<i class="fas fa-user-circle" style="color: #fe5c24;" ></i> ';
                          htmls += '<strong style="color: #fe5c24;" >';
                          htmls += userId; //대댓글 작성자
                          htmls += '</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                          htmls += '<span style="color:grey; font-size: 14px;">';
                          htmls += jsonInfo.comments[i].mmDate;
                          htmls += '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                          htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="답글달기" onclick="reply(';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += ');">';
                          htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="취소" onclick="rollbackreply(';
                          htmls += jsonInfo.comments[i].mmNo;
                          htmls += ');">';
                          htmls += '</h5>';
                          htmls += '<table class="table">';
                          htmls += '<tr>';
                          htmls += '<td><textarea class="form-control" style=" resize: none; background-color: white;" rows="2" cols="30" name="mmContent">';
                          htmls += '</textarea></td>';
                          htmls += '</tr>';
                          htmls += '</table>';
                          htmls += '</form>';
                          htmls += '</div>';                  
                          /*************** replyview end ***************/
                          
                       }
                    }      
                    htmls += "</div>";
                    $('#result').html(htmls);
                 }
            },
            error: function(){
               alert("실패");
            }
         });
      }
      window.onload = showReplyList();
   </script>
   
   <!-- 댓글 작성 Ajax -->
   <script type="text/javascript">
   
   $(function(){
      $("#commentForm").submit(function(){

         var userId = document.forms["commentForm"].elements["userId"].value;
         var moimNo = document.forms["commentForm"].elements["moimNo"].value;
         var mmContent = document.forms["commentForm"].elements["mmContent"].value;
         
         var allData = { "moimNo":moimNo, "userId":userId,"mmContent":mmContent };
         
         $.ajax({
              type:'POST',
              url : "moimComment.do?command=writeComment",
              data: allData,   
              success : function(data){
                 
                 if(data=="true"){
                    alert("댓글등록 성공");
                    $("#inputComment").val("");
                    showReplyList();
                    
                    }else{
                       alert("댓글등록 실패");
                       }
              },
              error:function(){
                  //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                  alert("ajax: 실패");
             }                 
          });                  
         return false;   
      });
   });
   </script>
   
      <!-- 댓글 삭제 AJAX -->
   <script type="text/javascript">
      function deleteComment(moimNo,mmNo){
         //alert("postNo : "+postNo +" , commentNo : "+commentNo);
         var chk = confirm("댓글을 삭제하시겠습니까?");
         if(chk){
   
            $.ajax({
                  type:'POST',
                  url:"moimComment.do?command=delete",
                  data: {"moimNo":moimNo, "mmNo":mmNo},
                  success : function(data){
                     if(data=="true"){
                        alert("댓글이 삭제되었습니다.");
                        showReplyList();
                     }else{
                        alert("댓글 삭제 실패.");
                     }
                     
                  },
                  error:function(){
                     alert("ajax : 통신 실패 ");
                  }
            });
            
         //location.href='comment.do?command=delete&postNo='+postNo+'&commentNo='+commentNo+'&boardCode=FREE';      
   
         
         }else{
            return false;
         }
      }
   
   </script>

   <!-- 댓글 수정 AJAX -->
   <script type="text/javascript">
      function update(moimNo,mmNo){
         var formName = "uview"+mmNo;
         var mmContent = document.forms[formName].elements["mmContent"].value;
         //alert(comment);
         if(mmContent==""||mmContent==null){
            alert("댓글 내용을 입력해주세요.");
         }else{
            var allData = { "moimNo": moimNo,"mmNo":mmNo, "mmContent":mmContent };
            
            $.ajax({
                type:'POST',
                 url : "moimComment.do?command=update",
                    data: allData,   
                    success:function(data){
                       if(data=="true"){
                          //alert(data);
                          alert("댓글을 수정하였습니다.");
                          showReplyList();
                       }else{
                          alert("댓글 수정에 실패하였습니다.");
                          showReplyList();   
                       }
                    },
                    error:function(){
                       alert("ajax : 통신실패");
                    }
            });
            
         }
            
      }
      
   </script>

   <!-- 대댓글 달기 AJAX -->
   <script type="text/javascript">
      
      function reply(mmNo){
         //alert("check");
         var formName = "rview"+mmNo;
         
         var moimNo = document.forms[formName].elements["moimNo"].value;
         var mmNo = document.forms[formName].elements["mmNo"].value;
         var mmContent = document.forms[formName].elements["mmContent"].value;
         var userId = document.forms[formName].elements["userId"].value;
         
         //alert("postNo : "+ postNo + " , commentNo : "+commentNo+", comment: "+comment+", boardCode : "+boardCode);
         
         if(mmContent==""||mmContent==null){
            alert("댓글 내용을 입력해주세요.");
         }else{
            var allData = { "moimNo": moimNo,"mmNo":mmNo, "mmContent":mmContent,"userId":userId };
            
            $.ajax({
                type:'POST',
                 url : "moimComment.do?command=reply",
                    data: allData,   
                    success:function(data){
                     if(data == "true"){
                        alert("댓글 등록 성공");
                        showReplyList();
                     }else{
                        alert("댓글 등록 실패");
                     }
   
                    },
                    error:function(){
                       alert("ajax : 통신실패");
                    }
            });
         }
      }
   
   </script>   
   

</head>

<body>
<%@ include file="../form/header.jsp" %>

<c:set var="moimPlaceName" value="${dto.moimPlaceName}" />
<c:set var="moimPlaceAdd" value="${dto.moimPlaceAdd}" />
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
    <!--================start writing area =================-->
    <jsp:useBean id="userDto" class="com.kulkkeok.model.dto.UserDto" scope="request"></jsp:useBean>
            <form id="viewForm" name="viewForm" method="post">
                <div id="chgposition">
                    <h2 style="text-align: center;">모임</h2>
                    <div class="mt-5">
                        <table style="margin: 0px auto;">
                            <tr>
                                <th style="margin-right: 10px;">말머리</th>
                                <td><input style="width: 300px" type="text" class="single-input" id="category" name="categoryNo" value="${dto.categoryNo }" readonly/></td>
                                <td colspan="4" rowspan="5" style="width: 500px; height: 300px;">
                                    <div id="map" style="background-color: whitesmoke; width:490px; height:300px; margin: 0px auto;">
                                    </div>
                                </td>
                            </tr>
                            
                            <tr>
                                <th>제목</th>
                                <td><input style="width: 300px" type="text"  class="single-input" id="moimTitle" name="moimTitle" value="${dto.moimTitle }" readonly/></td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td><input style="width: 300px" type="text"  class="single-input" id="userId" name="userId" value="${dto.userId }" readonly/></td>
                            </tr>
                            <tr>
                                <th>작성 일자</th>
                                <td><input style="width: 300px" type="date"  class="single-input" id="moimWriteDate" name="moimWriteDate" value="${dto.moimWriteDate }" readonly/></td>
                            </tr>
                            <tr>
                                <th>모임 일자</th>
                                <td><input style="width: 300px" type="date"  class="single-input" id="moimDate" name="moimDate" value="${dto.moimDate }" readonly/></td>
                            </tr>

                            <tr>
                                <th>내용</th>
                                <td colspan="4">
                                    <textarea style=" height:300px; resize: none;" rows="10" cols="40"  class="single-input" id="moimContent" name="moimContent" readonly>${dto.moimContent }</textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div id="board_view_btn" class="mt-3" style="margin: 0 auto; text-align: right;" >
                                    
                                       <c:if test="${user.userId eq dto.userId }">
                                           <input type="button" class="genric-btn primary radius" id="btnUpdate" value="수정" onclick="location.href='moim.do?command=moim_edit&moimNo=${dto.moimNo}'">
                                        </c:if>
                                        
                                        <c:if test="${user.userId eq dto.userId || user.userId eq 'ADMIN' }">
                                           <a class="genric-btn primary radius" style="cursor: pointer;" onclick="return confirm('정말로 삭제하시겠습니까?')" href="moim.do?command=delete&moimNo=${dto.moimNo }">삭제</a>
                                        </c:if>
                                        
                                        <button type="button" class="genric-btn primary radius" id="btnList" onclick="location.href='moim.do?command=moim_more'">목록</button>
                                        
                                        <c:if test="${!empty user && (user.userId ne dto.userId) }">
                                 <button type="button" class="genric-btn primary radius" id="btnList" onclick="window.open('moim.do?command=applyform&moimTitle=${dto.moimTitle}&moimNo=${dto.moimNo }', 'window', 'width=600, height=680'); return false">신청하기</button>
                                        </c:if>
                                        
                                        
                                        <c:if test="${empty user }">
                                           <button type="button" class="genric-btn primary radius" id="btnList" onclick="apply();">신청하기</button>
                                        </c:if>
                                        
                                        <script type="text/javascript">
                                           function apply(){
                                              alert('회원만 이용할 수 있습니다.');
                                              //회원가입 페이지로 이동하기
                                              //location.href="";
                                           }
                                        </script>
                                        
                                    </div>
                                </td>

                            </tr>
                        </table>

                    </div>                    

                </div>
          </form>
   
    <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  

    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption); 

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    var moimPlaceName = '<c:out value="${dto.moimPlaceName}" />'; 
    var moimPlaceAdd = '<c:out value="${dto.moimPlaceAdd}" />'; 

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(moimPlaceAdd, function(result, status) {

        // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">'+moimPlaceName+'</div>'
            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        } 
    });    
    </script>
       
       
             <!-- ============== Start Comment Area ==============-->
             
            
            
             <div class="container">
                <form action="moimComment.do?command=writeComment" id="commentForm" name="commentForm" method="post">
                   <input type="hidden" name="userId" value="${user.userId }" /> <!-- 댓글 작성자 -->
                   <input type="hidden" name="moimNo" value="${dto.moimNo }"/>
                    <div>
                        <div style="margin-top: 50px;">
                            <span><strong>Comments</strong></span> <span id="cCnt"></span>
                        </div>
                        <div>
                            <table class="table">                    
                                <tr>
                                    <td>
                                       <c:choose>
                                          <c:when test="${!empty user }">
                                              <textarea class="form-control" style="width: 1100px; resize: none;" rows="2" cols="30" id="inputComment" name="mmContent" placeholder="댓글을 입력하세요"></textarea>
                                              <br>
                                              <div style="text-align: right;">
                                                 <input type="submit" class="btn pull-right btn-success" value="등록">
                                              </div>
                                          </c:when>
                                          <c:otherwise>
                                               <textarea class="form-control" style="width: 1100px; resize: none;" rows="2" cols="30" id="inputComment" name="mmContent" placeholder="회원만 댓글작성이 가능합니다." readonly="readonly"></textarea>
                                              <br>
                                              <div style="text-align: right;">
                                                 <input type="submit" class="btn pull-right btn-success" value="등록" disabled="disabled">
                                              </div>                                      
                                          </c:otherwise>
                                       </c:choose>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>    
                </form>
            </div>
            <!-- Comment 등록 버튼 end -->
            
            <br><br>
            <div class="container" style="margin-bottom: 70px;">
                    <div id="result">
                       <!-- commentList start -->
                       
                      <!-- commentList end -->    
                    </div>
            </div>
            
            
   
    <!-- ============== End Comment Area ==============-->
    <!--================end writing area=================-->

   <%@ include file="../form/footer.jsp" %> 
    <!-- function script -->
   <script>      
      // 답글버튼
      function replyComment(no){
         var replyform = document.getElementsByClassName("rview"+no)[0];
         replyform.style.display="block";
   
      }
      
      // 답글달 때 취소버튼
      function rollbackreply(no){
         var replyform = document.getElementsByClassName("rview"+no)[0];
         replyform.style.display="none";
      }
      
      //수정 버튼 눌렀을 때
      function updateComment(no){
         //alert("check");
         
         var commentform = document.getElementsByClassName("view"+no)[0];
         var updateform = document.getElementsByClassName("uview"+no)[0];
         
         commentform.style.display="none";
         updateform.style.display="block";

      }
      
      // 수정시 취소버튼 눌렀을 때
      function rollbackComment(no){
         var commentform = document.getElementsByClassName("view"+no)[0];
         var updateform = document.getElementsByClassName("uview"+no)[0];
         
         commentform.style.display="block";
         updateform.style.display="none";
         
      }
      
   </script>    
    <!-- ============== End Comment Area ==============-->


    <!-- footer part start-->
</body>

</html>
   