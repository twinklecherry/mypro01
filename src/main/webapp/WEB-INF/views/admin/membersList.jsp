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
<html>
<head>
<meta charset="UTF-8">
<title>WE ARE STUDENTS</title>
<style>
	h1, nav, section, table {text-align:center;}
	NAV {margin:0 auto; padding:10px;}
	section {margin: 0 auto; padding:15px;}
	table {border:1px; width:700px; padding:10px; margin:0 auto;}
	.fbtn{float:right;font-weight:normal;color:orange;opacity:0.8}
	td{width:5%;}
</style>
</head>
<body>
	<h1>관리자 페이지</h1>
<form class="fbtn" method="get" action="/mypro01/logout.do">
	<input type="submit" name="Logout" value="로그아웃"/>
</form>
<nav>
	<form>
		<button type="button" onclick="location.href='membersList.do'">회원 정보 관리</button>
		<button type="button" onclick="location.href='boardList.do'">게시글 관리</button>
		<button type="button" onclick="location.href='/mypro01/main?id=${sessionScope.id}'">메인페이지로 돌아가기</button>
	</form>
</nav>
<section>
	<h2>회원이름을 검색해주세요</h2>
	<form name="frmSearchName" method="post" action="/mypro01/admin/isIdFind.do">
		<input type="text" name="id" id="idFind" placeholder="아이디입력"/>
		<input type="submit" value="조회"/>
	</form>
	
	<table>		
	<c:choose>
		<c:when test="${empty membersList}">
			<tr>
				<td colspan=6>
					<strong>등록된 회원이 없습니다.</strong>
				</td>
			</tr>
		</c:when>
		<c:when test="${not empty membersList}">
			<tr bgcolor="lightyellow">
				<td>아이디</td>
				<td>비밀번호</td>
				<td>이름</td>
				<td>핸드폰번호</td>
				<td>이메일</td>
				<td>가입일</td>
				<td>삭제요청</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
			<c:forEach var="member" items="${membersList }">
			<tr>
				<td>${member.id }</td>
				<td>${member.password }</td>
				<td>${member.name }</td>
				<td>${member.phoneNO }</td>
				<td>${member.email }</td>
				<td>${member.joinDate }</td>
				<td>${member.delFlag }</td>
				<td>
					<form method="post" action="/mypro01/member/myInfo.do">
						<input type="hidden" name="id" value="${member.id}">
						<input type="submit" value="수정">
					</form>
				</td>
				<td>
					<form method="get" action="/mypro01/admin/removeMember.do">
						<input type="hidden" name="id" value="${member.id}">
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