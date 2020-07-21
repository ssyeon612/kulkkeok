<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!doctype html>
<html lang="en">

<head>
<style type="text/css">

/* .text-box {
    margin-bottom: 50px;
} */ \

.click:link,
.click:visited {
    text-transform: uppercase;
    text-decoration: none;
    padding: 15px 40px;
    display: inline-block;
    border-radius: 100px;
    transition: all .2s;
    position: absolute;
}

.click:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.click:active {
    transform: translateY(-1px);
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}

.click-white {
    background-color: #fff;
    color: #777;
}

.click::after {
    content: "";
    display: inline-block;
    height: 100%;
    width: 100%;
    border-radius: 100px;
    position: absolute;
    top: 0;
    left: 0;
    z-index: -1;
    transition: all .4s;
}

.btn-white::after {
    background-color: #fff;
}

.btn:hover::after {
    transform: scaleX(1.4) scaleY(1.6);
    opacity: 0;
}

.btn-animated {
    animation: moveInBottom 5s ease-out;
    animation-fill-mode: backwards;
}

/* @keyframes moveInBottom {
    0% {
        opacity: 0;
        transform: translateY(30px);
    }

    100% {
        opacity: 1;
        transform: translateY(0px);
    }
} */

</style>

</head>


<body>

<!-- sessionScope 에 저장된 user정보 선언. -->
<c:set var="user" value="${sessionScope.user }" />
    <!--::header part start::-->
    <header class="main_menu">
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="main.do?command=main"> <img src="img/logo.png" alt="logo" width="100px" height="100px"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            
                           

                            <div class="collapse navbar-collapse main-menu-item justify-content-center"
                                id="navbarSupportedContent">
                                
                            <div class="text-box">
    						<img src="img/chat.png" style="width:60px; cursor:pointer" class="btn btn-white btn-animate click" onclick="location.href='chat.jsp'">
							</div>
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="beerStory.do?command=beerStory">맥주이야기</a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link" href="beer.do?command=beerinfo">맥주정보</a>
                                    </li>
    
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle"  id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false" style="cursor:pointer;">커뮤니티</a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="free.do?command=list">자유게시판</a>
                                            <a class="dropdown-item" href="moim.do?command=moim">모임</a>
                                        </div>
                                    </li>

                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle"  id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false" style="cursor:pointer;">고객센터</a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="notice.do?command=list">공지사항</a>
                                            <a class="dropdown-item" href="contact.do?command=contactForm">문의하기</a>
                                        </div>
                                    </li>
                                    <c:if test="${!empty user }">
	                                     <li class="nav-item dropdown">
	                                        <a class="nav-link dropdown-toggle" id="navbarDropdown"
	                                            role="button" data-toggle="dropdown" aria-haspopup="true"
	                                            aria-expanded="false" style="cursor:pointer;">
	                                            		마이페이지
	                                        </a>
	                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	                                            <a class="dropdown-item" href="mypage.do?command=myInfo">내 정보 수정</a>
	                                            <a class="dropdown-item" href="mypage.do?command=myBookmark">북마크 보기</a>
	                                            <a class="dropdown-item" href="mypage.do?command=myReview">내가 쓴 리뷰</a>
	                                            <a class="dropdown-item" href="mypage.do?command=myMoim">내 모임 보기</a>
	                                            <c:if test="${user.userId eq 'ADMIN' }">
	                                            	<a class="dropdown-item" href="admin.do?command=userMng">관리자 페이지</a>
	                                            </c:if>
	                                            <a class="dropdown-item" href="mypage.do?command=unsubscrilbe">탈퇴하기</a>
	                                        </div>
	                                    </li>                    
                                    </c:if>
                                </ul>
                            </div>
                            <c:choose>
                            	<c:when test="${empty user }">
		                            <a href="#" class="btn_1 d-none d-lg-block" onclick="location.href='login.do?command=loginPage'">LOG IN</a>
                            	</c:when>
                            	<c:otherwise>
                            		<a href="#" class="btn_1 d-none d-lg-block" onclick="location.href='login.do?command=logout'">LOGOUT</a>
                            	</c:otherwise>
                            </c:choose>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
        <!— Header part end—>

</body>

</html>