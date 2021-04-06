<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>WE ARE STUDENTS</title>

  <!-- Bootstrap core CSS -->
  <link href="/mypro01/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="/mypro01/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="/mypro01/resources/css/clean-blog.min.css" rel="stylesheet">

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
						<div style="color:white;">welcome ${empty sessionScope.id ? "guest" : id}님</div>
						<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/mypro01/member/myInfo.do?id=${sessionScope.id}'">나의정보</button>
						<button type="button" class="btn btn-light btn-sm" onclick="location.href='http://localhost:8080/mypro01/logout.do'">로그아웃</button>
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

  <!-- Page Header -->
  <header class="masthead" style="background-color:darkgray;">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h1>WE ARE STUDENTS</h1>
            <span class="subheading">

				<h3>이 세상에 위대한 사람은 없다. 단지 평범한 사람들이 일어나 맞서는 위대한 도전이 있을 뿐이다.
					<br>There are no great people in this world, only great challenges which ordinary people rise to meet.</h3>
				<h3>&nbsp;&nbsp;&nbsp;- 윌리엄 프레데릭 홀시 William Frederick Halsey, Jr.</h3>	
				
			</span>
          </div>
        </div>
      </div>
    </div>
  </header>