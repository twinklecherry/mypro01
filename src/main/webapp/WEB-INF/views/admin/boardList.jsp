<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	session = request.getSession(true); 
	String id = request.getParameter("id");
	session.getAttribute("id");
%>
<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>WE ARE STUDENTS</title>

  <!-- Bootstrap core JavaScript -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="/mypro01/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/mypro01/resources/js/clean-blog.min.js"></script>

  <!-- Bootstrap core CSS -->
  <link href="/mypro01/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="/mypro01/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="/mypro01/resources/css/clean-blog.min.css" rel="stylesheet">

<style>
	h1, h2, form, table {text-align:center;}
	form {margin:0 auto; padding:0;}
	nav {margin:0 auto; padding:10px;}
	section {margin: 0 auto; padding:15px;}
	table {border:1px; width:80%; padding:5%; margin:0 auto;}
</style>

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="http://localhost:8080/mypro01/main">WE ARE STUDENTS</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a href="http://localhost:8080/mypro01/main">Home</a>
          </li>
          <li class="nav-item">
            <a href="/mypro01/board/boardList.do">스터디모집</a>
          </li>
          <li class="nav-item">
          	<form class="hbtn" method="get">
				<c:choose>
					<c:when test="${sessionScope.id==null}">
						<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='http://localhost:8080/mypro01/login.do'">로그인</button>
						<button type="button" class="btn btn-light btn-sm" onclick="location.href='http://localhost:8080/mypro01/signUp.do'">회원가입</button>
					</c:when>
					<c:otherwise>
						welcome ${empty sessionScope.id ? "guest" : id}님
						<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/mypro01/member/myInfo.do?id=${sessionScope.id}'">나의정보</button>
						<button type="button" class="btn btn-light btn-sm" onclick="location.href='/mypro01/logout.do'">로그아웃</button>
						<c:if test="${sessionScope.id=='cherry'}">
							<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/mypro01/admin/admin.do?id=${sessionScope.id}'">관리자페이지</button>
						</c:if>
					</c:otherwise>
				</c:choose>
			</form>
          </li>
        </ul>
      </div>
    </div>
  </nav>

	<h1 style="padding-top:10%;">관리자 페이지</h1>
<!-- <form class="fbtn" method="get" action="/mypro01/logout.do">
	<input type="submit" name="Logout" value="로그아웃"/>
</form> -->
<nav>
	<form>
		<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='membersList.do'">회원 정보 관리</button>
		<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='boardList.do'">게시글 관리</button>
		<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/mypro01/main?id=${sessionScope.id}'">메인페이지로 돌아가기</button>
	</form>
</nav>
<section>
	<h2>게시물제목을 검색해주세요</h2>
	<form name="frmSearchTitle" method="post" action="/mypro01/admin/isTitleFind">
		<input type="text" name="title" id="titleFind" placeholder="글제목입력">
		<input type="submit" class="btn btn-secondary btn-sm" value="검색">
	</form>

<table>
	<tr height="10" bgcolor="lightyellow">
    	<td>글번호</td>
    	<td>작성자</td>              
     	<td>제목</td>
		<td>작성일</td>
		<td>삭제여부</td>
		<td>수정</td>
		<td>삭제</td>
	</tr>
<c:choose>
	<c:when test="${empty boardList}">
    <tr height="10">
      <td colspan="4">
         <p align="center">
            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
        </p>
      </td>  
    </tr>
	</c:when>
	<c:when test="${not empty boardList}">
	    <c:forEach var="board" items="${boardList }" varStatus="boardNum">
	     <tr align="center">
			<td>${board.boardNO}</td>
			<td>${board.id }</td>
			<td align="left">
 			  <span style="padding-right:30px"></span>
 			  <a class='cls1' href="/mypro01/board/boardView.do?boardNO=${board.boardNO}">${board.title}</a>
			</td>
			<td><fmt:formatDate value="${board.writeDate}" pattern="YYYY/MM/dd HH:mm:ss"/></td> 
			<td>${board.delFlag}</td>
			<td>
				<form method="post" action="/mypro01/board/boardView.do">
					<input type="hidden" name="boardNO" value="${board.boardNO}">
					<input type="submit" value="수정">
				</form>
			</td>
			<td>
				<form method="get" action="/mypro01/board/removeBoard.do">
					<input type="hidden" name="boardNO" value="${board.boardNO}">
					<input type="submit" value="삭제">
				</form>
			</td>
		</tr>
	    </c:forEach>
    </c:when>
</c:choose>
</table> 

</section>
</body>
</html>