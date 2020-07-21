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
    
        
     <!-- jquery -->
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <style>
    	.updateView, .replyView{
			display: none;
		}
    </style>
	
    <!-- 게시물 삭제 -->
	<script type="text/javascript">

			function deleteChk(postNo){
				
				var chk = confirm("게시물을 삭제하시겠습니까?");
				if(chk){
					location.href="notice.do?command=delete&no="+postNo;
				}else{ return false;}
				
			}

	</script>
			
	<!-- 댓글 리스트 AJAX -->
	<script type="text/javascript">

		function showReplyList(){
					var url = "comment.do?command=commentlist&boardCode=NOTICE&postNo="+${post.postNo};
					
					var today = new Date();   

					var year = today.getFullYear(); // 년도
					var month = today.getMonth() + 1;  // 월
					var date = today.getDate();  // 날짜
					var currentDay = year+'/'+month+'/'+date;
					
					
					$.ajax({
				        type: 'post',
				        url: url,
				        success: function(data) {
				        	
				        	var userId = '<c:out value="${user.userId }"></c:out>';

				        	//alert(userId);
				        	
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
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += '"  style="margin-left: 20px;"  >';
						        		htmls += '<h5>';
						        		htmls += '<i class="fas fa-reply fa-rotate-180" style="color: #fe5c24;"></i> ';
						        		htmls += '<i class="fas fa-user-circle" style="color: #fe5c24;" ></i> ';
						        		htmls += '<strong style="color: #fe5c24;" >';
						        		htmls += jsonInfo.comments[i].userId;
						        		htmls += '</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
						        		htmls += '<span style="color:grey; font-size: 14px;">';
						        		htmls += jsonInfo.comments[i].commentDate;
						        		htmls += '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
						        		
						      
										if(userId == "ADMIN"){
							        		htmls += '<input type="button" class="genric-btn info-border radius small replybtn" style="padding-right:15px; padding-left: 15px;" value="답글" onclick="replyComment(';
							        		htmls += jsonInfo.comments[i].commentNo;
							        		htmls += ');">';	

								        	htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="수정" onclick="updateComment(';
								        	htmls += jsonInfo.comments[i].commentNo;
								        	htmls += ');">';
								        	htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="삭제" onclick="deleteComment(';						        		
								        	htmls += jsonInfo.comments[i].postNo;
								        	htmls += ',';
								        	htmls += jsonInfo.comments[i].commentNo;
								        	htmls += ');">';				        					
										}
										
						        		htmls += '</h5>';
						        		htmls += '<table class="table">';
						        		htmls += '<tr>';
						        		
						        		htmls += '<td>';
						        		htmls += '<div>';
						        		htmls += '<span style="color:gray;"><strong> @'+jsonInfo.comments[i].replyId +'</strong></span> '+jsonInfo.comments[i].commentContent;
						        		htmls += '</div>';
						        		htmls += '</td>';
						        		
						        		htmls += '</tr>';
						        		htmls += '</table>';
						        		htmls += '</div>';	
						        	/*************** commentView end ***************/
	
						        		
						        	/*************** updateView start ***************/
						        		htmls += '<div class="updateView uview';
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += '" style ="border-radius: 10px 10px 10px 10px; box-shadow: 10px 10px 10px 10px rgba(0,0,0,0.06); padding:13px; margin-bottom:15px; margin-left: 20px;" >';
						        		htmls += '<form name="uview'+ jsonInfo.comments[i].commentNo +'">';
						        		htmls += '<input type="hidden" name="postNo" value="';
						        		htmls += jsonInfo.comments[i].postNo;
						        		htmls += '"/>';
						        		htmls += '<input type="hidden" name="commentNo" value="';
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += '"/>';
						        		htmls += '<input type="hidden" name="boardCode" value="';
						        		htmls += 'NOTICE';
						        		htmls += '"/>';
						        		htmls += '<h5>';
						        		htmls += '<i class="fas fa-user-circle" style="color: #fe5c24;" ></i> ';
						        		htmls += '<strong style="color: #fe5c24;" >';
						        		htmls += jsonInfo.comments[i].userId;
						        		htmls += '</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
						        		htmls += '<span style="color:grey; font-size: 14px;">';
						        		htmls += jsonInfo.comments[i].commentDate;
						        		htmls += '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
						        		
						        		htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="수정완료" onclick="update(';
						        		htmls += jsonInfo.comments[i].postNo;
						        		htmls += ',';
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += ');" />';
						        		
						        		htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="취소" onclick="rollbackComment(';
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += ');">';
						        		htmls += '</h5>';
						        		htmls += '<table class="table">';
						        		htmls += '<tr>';
						        		htmls += '<td><textarea class="form-control" style=" resize: none; background-color: white;" rows="2" cols="30" name="comment">';
						        		htmls += jsonInfo.comments[i].commentContent;
						        		htmls += '</textarea></td>';
						        		htmls += '</tr>';
						        		htmls += '</table>';
						        		htmls += '</form>';
						        		htmls += '</div>';
										/*************** updateview end ***************/
										
						        		/*************** replyView start ***************/
						        		htmls += '<div class="replyView rview';
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += '" style="margin-left: 20px;  border-radius: 10px 10px 10px 10px; box-shadow: 10px 10px 10px 10px rgba(0,0,0,0.06); padding:13px; margin-bottom:15px;  "  >';
						        		
						        		htmls += '<form name="rview'+ jsonInfo.comments[i].commentNo +'">';
						        		htmls += '<input type="hidden" name="postNo" value="';
						        		htmls += jsonInfo.comments[i].postNo;
						        		htmls += '"/>';
						        		htmls += '<input type="hidden" name="commentNo" value="';
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += '"/>';
						        		htmls += '<input type="hidden" name="boardCode" value="';
						        		htmls += 'NOTICE';
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
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += ');">';
						        		htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="취소" onclick="rollbackreply(';
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += ');">';
						        		htmls += '</h5>';
						        		htmls += '<table class="table">';
						        		htmls += '<tr>';
						        		htmls += '<td><textarea class="form-control" style=" resize: none; background-color: white;" rows="2" cols="30" name="comment">';
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
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += '">';
						        		htmls += '<h5>';
						        		htmls += '<i class="fas fa-user-circle" style="color:#415094;"></i> ';
						        		htmls += '<strong style="color:#415094;">';
						        		htmls += jsonInfo.comments[i].userId;
						        		htmls += '</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
						        		htmls += '<span style="color:grey; font-size: 14px;">';
						        		htmls += jsonInfo.comments[i].commentDate;
						        		htmls += '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
						        		
						        		if(userId == "ADMIN"){
						      
							        		htmls += '<input type="button" class="genric-btn info-border radius small" style="padding-right:15px; padding-left: 15px;" value="답글" onclick="replyComment(';
							        		htmls += jsonInfo.comments[i].commentNo;
							        		htmls += ');">';
							        		
								        	htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="수정" onclick="updateComment(';
								        	htmls += jsonInfo.comments[i].commentNo;
								        	htmls += ');">';
								        	htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="삭제" onclick="deleteComment(';
								        	htmls += jsonInfo.comments[i].postNo;
								        	htmls += ',';
								        	htmls += jsonInfo.comments[i].commentNo;
								        	htmls += ');">';		
							     
						        		
						        		}
						        		htmls += '</h5>';
						        		htmls += '<table class="table">';
						        		htmls += '<tr>';
						        		
						        		htmls += '<td>';
						        		htmls += '<div>';
						        		htmls += jsonInfo.comments[i].commentContent;
						        		htmls += '</div>';
						        		htmls += '</td>';
						        		
						        		htmls += '</tr>';
						        		htmls += '</table>';
						        		htmls += '</div>';
						        		/*************** commentView end ***************/
						        		
						        			
						        		/*************** updateView start ***************/
						        		htmls += '<div class="updateView  uview';
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += '" style ="border-radius: 10px 10px 10px 10px; box-shadow: 10px 10px 10px 10px rgba(0,0,0,0.06); padding:13px; margin-bottom:15px;" >';
						        		htmls += '<form name="uview'+ jsonInfo.comments[i].commentNo +'">';
						        		htmls += '<input type="hidden" name="postNo" value="';
						        		htmls += jsonInfo.comments[i].postNo;
						        		htmls += '"/>';
						        		htmls += '<input type="hidden" name="commentNo" value="';
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += '"/>';
						        		htmls += '<input type="hidden" name="boardCode" value="';
						        		htmls += 'NOTICE';
						        		htmls += '"/>';
						        		htmls += '<h5>';
						        		htmls += '<i class="fas fa-user-circle" style="color:#415094;" ></i> ';
						        		htmls += '<strong style="color:#415094;" >';
						        		htmls += jsonInfo.comments[i].userId;
						        		htmls += '</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
						        		htmls += '<span style="color:grey; font-size: 14px;">';
						        		htmls += jsonInfo.comments[i].commentDate;
						        		htmls += '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
						        		
						        		htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="수정완료" onclick="update(';
						        		htmls += jsonInfo.comments[i].postNo;
						        		htmls += ',';
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += ');" />';
						        		
						        		htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="취소" onclick="rollbackComment(';
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += ');">';
						        		htmls += '</h5>';
						        		htmls += '<table class="table">';
						        		htmls += '<tr>';
						        		htmls += '<td><textarea class="form-control" style=" resize: none; background-color: white;" rows="2" cols="30" name="comment">';
						        		htmls += jsonInfo.comments[i].commentContent;
						        		htmls += '</textarea></td>';
						        		htmls += '</tr>';
						        		htmls += '</table>';
						        		htmls += '</form>';
						        		htmls += '</div>';
										/*************** updateview end ***************/
										
						        		/*************** replyView start ***************/
						        		htmls += '<div class="replyView rview';
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += '" style="margin-left: 20px;  border-radius: 10px 10px 10px 10px; box-shadow: 10px 10px 10px 10px rgba(0,0,0,0.06); padding:13px; margin-bottom:15px;  " >';
						        		
						        		htmls += '<form name="rview'+ jsonInfo.comments[i].commentNo +'">';
						        		htmls += '<input type="hidden" name="postNo" value="';
						        		htmls += jsonInfo.comments[i].postNo;
						        		htmls += '"/>';
						        		htmls += '<input type="hidden" name="commentNo" value="';
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += '"/>';
						        		htmls += '<input type="hidden" name="boardCode" value="';
						        		htmls += 'NOTICE';
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
						        		htmls += jsonInfo.comments[i].commentDate;
						        		htmls += '</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
						        		htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="답글달기" onclick="reply(';
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += ');">';
						        		htmls += '<input type="button" class="genric-btn danger-border radius small" style="padding-right:15px; padding-left: 15px;" value="취소" onclick="rollbackreply(';
						        		htmls += jsonInfo.comments[i].commentNo;
						        		htmls += ');">';
						        		htmls += '</h5>';
						        		htmls += '<table class="table">';
						        		htmls += '<tr>';
						        		htmls += '<td><textarea class="form-control" style=" resize: none; background-color: white;" rows="2" cols="30" name="comment">';
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
				          
					});	// Ajax end
			
			}
		
		window.onload = showReplyList();
		
	</script>

	<!-- 댓글 등록 AJAX -->
	<script type="text/javascript">
	
		$(function(){
			$("#commentForm").submit(function(){
	
				var boardCode = "NOTICE";
				var userId = document.forms["commentForm"].elements["userId"].value;
				var postNo = document.forms["commentForm"].elements["postNo"].value;
				var comment = document.forms["commentForm"].elements["comment"].value;
				
				if(comment == "" || comment == null){
					alert("내용을 입력해주세요.");
					return false;
				}
				
				var allData = { "postNo": postNo, "boardCode": boardCode, "userId":userId,"comment":comment };
				
				$.ajax({
			        type:'POST',
			        url : "comment.do?command=writeComment",
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
		function deleteComment(postNo,commentNo){
			//alert("postNo : "+postNo +" , commentNo : "+commentNo);
			var chk = confirm("댓글을 삭제하시겠습니까?");
			if(chk){
	
				$.ajax({
						type:'POST',
						url:"comment.do?command=delete",
						data: {"postNo":postNo, "commentNo":commentNo, "boardCode":"NOTICE"},
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
			
			}else{
				return false;
			}
		}
	
	</script>

	<!-- 댓글 수정 AJAX -->
	<script type="text/javascript">
		function update(postNo,commentNo){
			var formName = "uview"+commentNo;
			var comment = document.forms[formName].elements["comment"].value;
			
			
			//alert(comment);
			if(comment==""||comment==null){
				alert("댓글 내용을 입력해주세요.");
			}else{
				var allData = { "postNo": postNo,"commentNo":commentNo, "boardCode": "NOTICE", "comment":comment };
				
				$.ajax({
					 type:'POST',
				     url : "comment.do?command=update",
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
		
		function reply(commentNo){
			//alert("check");
			var formName = "rview"+commentNo;
			
			var postNo = document.forms[formName].elements["postNo"].value;
			var commentNo = document.forms[formName].elements["commentNo"].value;
			var comment = document.forms[formName].elements["comment"].value;
			var boardCode = document.forms[formName].elements["boardCode"].value;
			var userId = document.forms[formName].elements["userId"].value;
			
			//alert("postNo : "+ postNo + " , commentNo : "+commentNo+", comment: "+comment+", boardCode : "+boardCode);
			
			if(comment==""||comment==null){
				alert("댓글 내용을 입력해주세요.");
			}else{
				var allData = { "postNo": postNo,"commentNo":commentNo, "boardCode": boardCode, "comment":comment,"userId":userId };
				
				$.ajax({
					 type:'POST',
				     url : "comment.do?command=reply",
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

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg bg_img_notice">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>공지사항</h2>
                            <p>Notice</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!--body-->
    <!--================start writing area =================-->
        <div >
            <form id="viewForm" name="viewForm" action="notice.do?command=updateform" method="post">
                <input type="hidden" name="postNo" value="${post.postNo }">
                <div id="chgposition">
                    <h2 style="text-align: center;">공지사항</h2><br>
                    <div>
                        <table style="margin: 0px auto;">
                            <tr>
                                <th>제목</th>
                                <td><input class ="form-control" style="width: 700px; background-color: white;" type="text" id="title" name="title" value="${post.postTitle }" readonly/></td>
                            </tr>
                            <tr>
                                <th>작성자&nbsp;&nbsp;&nbsp;</th>
                                 <td><input class ="form-control" style="width: 700px; background-color: white;" type="text" id="writer" name="writer" value="${post.userId }" readonly/></td>
                            </tr>
                            
                            <tr>
                                <th>내용</th>
                                <td><textarea class ="form-control" style="width: 700px; height:300px; resize: none; background-color: white; " rows="10" cols="10" id="content" name="content" readonly>${post.postContent }</textarea></td>
                            </tr>
                        </table>
                        <div id="board_view_btn" class="mt-2" style="width: 757px; margin: 0 auto; text-align: right;" >
                            <c:if test="${user.userId eq 'ADMIN' }">
                            <button type="submit" class="genric-btn primary radius" id="btnUpdate">수정</button>
                            <button type="button" class="genric-btn primary radius" id="btnDelete" onclick="deleteChk(${post.postNo});">삭제</button>
                            <button type="button" class="genric-btn primary radius" id="btnReply" onclick="location.href='notice.do?command=answerform&parentNo='+${post.postNo}">답변</button>
                        </c:if>
                            <button type="button" class="genric-btn primary radius" id="btnList" onclick="location.href='notice.do?command=list'">목록</button>
                        </div>
                    
                    </div>
                </div>
            </form>
       </div>
       
             <!-- ============== Start Comment Area ==============-->
             <div class="container">
               <form action="comment.do?command=writeComment" id="commentForm" name="commentForm" method="post">
                   	<input type="hidden" name="userId" value="${user.userId }" /> <!-- 댓글 작성자 -->
                	<input type="hidden" name="postNo" value="${post.postNo }"/>
                    <div>
                        <div style="margin-top: 50px;">
                            <span><strong>Comments</strong></span> <span id="cCnt"></span>
                        </div>
                        <div>
                            <table class="table">                    
                                <tr>
                                    <td>
                                        <c:choose>
	                                    	<c:when test="${user.userId eq 'ADMIN' }">
		                                        	<textarea class="form-control" style="width: 1100px; resize: none;" rows="2" cols="30" id="inputComment" name="comment" placeholder="댓글을 입력하세요"></textarea>
			                                        <br>
			                                        <div style="text-align: right;">
			                                        	<input type="submit" class="btn pull-right btn-success" value="등록">
			                                        </div>
	                                    	</c:when>
	                                    	<c:otherwise>
	                                         	<textarea class="form-control" style="width: 1100px; resize: none;" rows="2" cols="30" id="inputComment" name="comment" placeholder="관리자만 접근이 가능합니다." readonly="readonly"></textarea>
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
            
            <br><br>
            
            <div class="container" style="margin-bottom: 70px;">
               <div id="result">
               </div>
            </div>
    <!-- ============== End Comment Area ==============-->
    <!--================end writing area=================-->


	<%@ include file="../form/footer.jsp" %> 
    <!-- function script -->
	<script>		
		// 답글버튼
		function replyComment(no){
			//var table = document.getElementsByClassName("view"+no)[0];
			var replyform = document.getElementsByClassName("rview"+no)[0];
			//table.style.display="none";
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