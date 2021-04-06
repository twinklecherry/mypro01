<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session = request.getSession(true); 
	String id = request.getParameter("id");
	session.setAttribute("id", id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WE ARE STUDENTS</title>
<style>
	h1, nav, section{text-align:center;}
	NAV {margin:0 auto; padding:10px;}
	section {margin: 0 auto; padding:15px;}
	.fbtn{float:right;font-weight:normal;color:orange;opacity:0.8}
</style>
</head>
<body>
	<h1>관리자 페이지</h1>
<form class="fbtn">
	<button type="button" onclick="location.href='/mypro01/logout.do'">로그아웃</button>
</form>
<nav>
	<form>
		<button type="button" onclick="location.href='membersList.do'">회원 정보 관리</button>
		<button type="button" onclick="location.href='boardList.do'">게시글 관리</button>
		<button type="button" onclick="location.href='/mypro01/main?id=${sessionScope.id}'">메인페이지로 돌아가기</button>
	</form>
</nav>
	<section>
		↑원하시는 버튼을 클릭하세요.
	</section>
</body>
</html>