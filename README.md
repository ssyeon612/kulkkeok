# KULKKEOK KULKKEOK (꿀꺽꿀꺽)
🍺 맥알못에서 벗어나고 싶은 사람 위한, 맥주를 사랑하는 사람하는 사람에 의해

* * *
🔖  **프로젝트 설명**
- 프로젝트 소개: 맥주 정보 제공 및 커뮤니티 사이트
- 개발기간: 2020. 05. 04 ~ 2020. 05. 19
- 팀 구성원: 4명
- 역할: Project Manager (프로젝트 총괄)
- 사용기술 및 개발환경
  - Language: Java, Javascript, HTML5, CSS3
  - Framework: Mybatis, jQuery, Bootstrap
  - DBMS: Oracle
  - Server: Apache Tomcat v9.0
  - IDE: Eclipse, Visual Studio Code
 
🔖 **담당 파트**
  - 이름별, 나라별, 종류별 맥주 검색
  - 리뷰를 통한 별점 매기기
  - 북마크
  - 소셜로그인 (네이버, 카카오)
  - 카카오 공유하기

* * *
✏️ _Beer (Controller, Service, Dao, Dto) & Review (Controller, Service, Dao, Dto)_
  
  - beerinfo.jsp : 맥주 게시판
    - 전체 및 검색 결과를 바탕으로 한 맥주 목록
    - 맥주 이름, 나라, 종류별 검색 (Ajax)
 
  - beerdetail.jsp : 맥주 상세 페이지
    - 맥주 상세정보 (사용자가 해당 맥주에 매긴 별점 평균도 포함)
    - 리뷰 목록 (CRUD)
    - 북마크 (Ajax)
    
  - beerdetail_review.jsp : 맥주 리뷰 작성

✏️ _login.jsp & callback.jsp_

  - Naver, Kakao 로그인 API를 이용한 간편 로그인 서비스

✏️ _worldcup_win.jsp & testBeer.jsp_
  - 맥주 월드컵, 맥주 취향 찾기 컨텐츠 페이지 공유 서비스 (방문유도)

