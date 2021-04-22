# mypro01(Study Room)
# 스터디 모집 게시판 

![ezgif com-gif-maker](https://user-images.githubusercontent.com/69239555/114146254-50fc1d80-9952-11eb-90c6-6153751c44df.gif)


### 2020.12.22. ~ 2021-01-07 (17일 주말 및 공휴일포함)
***

혼자하는 공부가 힘든 분들을 위해 스터디를 통해 공부의 열정을 더욱 일으키고자 만들었습니다.

***
### A.L.T 서비스 목적
- 회원
    - 스터디를 어디서 구해야할지 모르는 분들을 위해 쉽게 게시판을 통해 스터디모집을 할 수 있음
    - 다양한 스터디 모집을 보면서 공부의 열의를 키울 수 있음

***
### 사용버전(Version)

+ Java JDK 1.8
+ Mybatis 3.5 mybatis-spring
+ HTML5/CSS3/JavaScript
+ BootStrap 4
+ J-Query(ajax)
+ Servlet/JSP Servlet 4.0
+ Spring- framework(MVC)  v5.2.13
   + Spring tx
+ Spring security
   + Oracle DatatBase 11g 기준
   + SQL/저장공간 구성

***
### ERD
![image](https://user-images.githubusercontent.com/69239555/114142788-522b4b80-994e-11eb-99fb-b2084c23951c.png)

***
### 흐름도
![개인프로젝트_흐름도](https://user-images.githubusercontent.com/69239555/114159226-860f6c80-9960-11eb-83e0-50bd58604fdd.jpg)

***
### 목차
+ [스터디모집](https://github.com/twinklecherry/mypro01/blob/main/src/main/java/com/spring5/mypro01/board/controller/BoardControllerImpl.java)
  + 전체목록리스트
  + 게시글 등록
       + Image attach
  + 게시글 수정
       + [Image attach](https://github.com/twinklecherry/mypro01/blob/main/src/main/java/com/spring5/mypro01/common/FileDownloadController.java)
  + 게시글 삭제
  + 댓글 작성
  + 댓글 

+ [마이페이지](https://github.com/twinklecherry/mypro01/blob/main/src/main/java/com/spring5/mypro01/member/controller/MemberControllerImpl.java)
  + 회원 조회
  + 회원 수정
  + 회원 탈퇴

+ [관리자페이지](https://github.com/twinklecherry/mypro01/blob/main/src/main/java/com/spring5/mypro01/member/controller/MemberControllerImpl.java)
  + 전체 회원조회 목록
      + Search
      + 회원 탈퇴
  + 전체 게시판조회 목록

***

* 메인페이지
    - 부트스트랩을 이용해 header, footer 생성
    - HttpSession와 <c:if>태그를 이용해 로그인을 하게되면 index페이지에 로그인한 id를 표시
    - iframe을 이용해 YouTube의 동영상을 연결

* 스터디모집
     - 게시판 목록보기는 controller에서 ModelAndView 객체를 이용해 데이터를 받음
     - jsp페이지에 표현언어와 JSTL을 이용해 <c:forEach>구문을 사용해 테이블 구성
     - 관리자의 경우, 모든 페이지를 수정 및 삭제 가능

* 마이페이지
    - 주입된 sqlSession 빈의 select,insert,update 메소드에 실행할 SQL문의 id를 전달하여 호출하여 데이터베이스에 접속하여 SQL문을 처리 후 결과를 반환받아 변수에 저장
    - 회원 조회
        + MemberSerivce 클래스가 memberService id로 memberService 필드에 자동 주입되도록 설정
        + 조회한 회원 정보를 ModelAndView 의 addObject()메서드를 이용해 바인딩
	
    - 회원 등록
        + ModelAttribute를 사용해 회원 가입창에서 전송된 값들이 VO객체의 속성에 저장
        + 값들이 설정된 VO 객체를 SQL 문으로 전달해 회원등록

    - 회원 수정
         + 값들이 설정된 VO 객체를 SQL 문으로 전달해 회원수정

    - 회원 탈퇴
        + 탈퇴여부 Flag를 update문을 기본값인 'N'에서 'Y'값으로 변경 

* 관리자페이지
     - 회원과 게시글의 전체 목록을 불러와서 수정 및 삭제가능
     - 탈퇴여부나 삭제여부가 'Y'로 변한 회원 및 게시글 delete문으로 삭제
