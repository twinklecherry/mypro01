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
+ J-Query(ajax), Spring Rest API
+ Servlet/JSP Servlet 4.0
+ Spring- framework(AOP, MVC)  v5.2.13
   + Spring task/ Spring tx
+ Spring security
   + Oracle DatatBase 11g 기준
   + SQL/저장공간 구성

***
### ERD
![image](https://user-images.githubusercontent.com/69239555/114142788-522b4b80-994e-11eb-99fb-b2084c23951c.png)

***
### 목차
+ [스터디모집](https://github.com/twinklecherry/mypro01/blob/main/src/main/java/com/spring5/mypro01/board/controller/BoardControllerImpl.java)
  + 전체목록리스트
  + 게시글 등록
       + Image attach
  + 게시글 수정
       + [Image attach](https://github.com/twinklecherry/mypro01/blob/main/src/main/java/com/spring5/mypro01/common/FileDownloadController.java)
  + 게시글 삭제

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

<details>
  <summary>스터디모집</summary>
  <div markdown="1">

- 공지사항 게시글 목록(업체로그인)

![공지사항게시글목록(업체로그인)](https://user-images.githubusercontent.com/69239555/114134692-1ccd3080-9943-11eb-8ccb-04d3c536f3b9.png)

- 공지사항 게시글 목록(관리자로그인)

![공지사항게시글목록(관리자로그인)](https://user-images.githubusercontent.com/69239555/114134776-3b332c00-9943-11eb-8a02-864d5cb91aea.png)

- 공지사항 게시글 등록(관리자로그인)

![공지사항게시글등록(관리자로그인)](https://user-images.githubusercontent.com/69239555/114134868-6584e980-9943-11eb-8182-194662a99b2d.png)

- 공지사항 게시글 상세페이지(관리자로그인)

![공지사항게시글상세페이지(관리자로그인)](https://user-images.githubusercontent.com/69239555/114135035-9fee8680-9943-11eb-9b35-906b945d752a.png)

- 공지사항 게시글 상세페이지 수정(관리자로그인)

![공지사항게시글상세페이지수정(관리자로그인)](https://user-images.githubusercontent.com/69239555/114135118-bdbbeb80-9943-11eb-90e3-cf3d477831e5.png)
  </div>
</details>

     - 설명작성
     - 설명작성


<details>
  <summary>마이페이지</summary>
  <div markdown="1">

- 업체 마이페이지 목록

<img src="https://user-images.githubusercontent.com/69239555/114134185-489be680-9942-11eb-9060-00254aa43c19.png" title="업체마이페이지" alt="업체마이페이지"></img>

- 마이페이지 내정보 상세페이지

<img src="https://user-images.githubusercontent.com/69239555/114134273-6e28f000-9942-11eb-8eff-23b018f15b44.png" title="마이페이지내정보" alt="마이페이지내정보"></img>

- 판매글 목록

<img src="https://user-images.githubusercontent.com/69239555/114134332-8567dd80-9942-11eb-8e4a-c15d09309795.png" title="판매글목록" alt="판매글목록"></img>

- 업체 탈퇴

<img src="https://user-images.githubusercontent.com/69239555/114134473-c4962e80-9942-11eb-8308-cbe3f7840767.png" title="판매글목록" alt="판매글목록"></img>
  </div>
</details>

    - 설명작성
    - 설명작성

<details>
  <summary>관리자페이지</summary>
  <div markdown="1">

- 판매자와 채팅 연결

<img src="https://user-images.githubusercontent.com/69239555/114127399-4e3eff80-9935-11eb-9e51-66a1ebf63a19.png" title="판매자와채팅연결" alt="판매자와채팅연결"></img><br>
- 채팅방목록

<img src="https://user-images.githubusercontent.com/69239555/114126684-e3d98f80-9933-11eb-9d13-0e04ac07a103.png" title="채팅방목록" alt="채팅방목록"></img><br>
- 채팅

<img src="https://user-images.githubusercontent.com/69239555/114127554-7cbcda80-9935-11eb-905e-2d0d262450a8.png" title="채팅" alt="채팅"></img>
  </div>
</details>

    - 설명작성
    - 설명작성
