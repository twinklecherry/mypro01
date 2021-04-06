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
	h1, nav, section{text-align:center;}
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
<table class="tb">
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
	    <c:forEach  var="board" items="${boardList }" varStatus="boardNum">
	     <tr align="center">
			<td width="5%">${board.boardNO}</td>
			<td width="10%">${board.id }</td>
			<td align='left' width="35%">
 			  <span style="padding-right:30px"></span>
 			  <a class='cls1' href="/mypro01/board/boardView.do?boardNO=${board.boardNO}">${board.title}</a>
			</td>
			<td width="10%"><fmt:formatDate value="${board.writeDate}" pattern="YYYY/MM/dd HH:mm:ss"/></td> 
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

<nav aria-label="Page navigation">
  <ul class="pagination">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="">1</a></li>
    <li class="page-item active" aria-current="page">
      <a class="page-link" href="">2</a>
    </li>
    <li class="page-item"><a class="page-link" href="">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>

</section>
</body>
</html>