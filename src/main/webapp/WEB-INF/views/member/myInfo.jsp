<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session = request.getSession(true); 
	String id = request.getParameter("id");
	session.getAttribute("id");
%>
<style>
	h1, h2, table, tr{text-align:center;}
	table {border:1px; width:700px; padding:10px;}
	.fbtn{float:right;font-weight:normal;opacity:0.8}
	.cl{background-color:lightyellow; text-align:center;}
</style>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">

		<h2 style="text-align:center;">${memberVO.name}님 회원정보</h2><br>

<form name="frmInfo" id="frmInfo" method="post" action="/mypro01/member/modMember.do">
	<table>
		<tr>
			<td class="cl">아이디</td>
			<td><input type="text" name="id" id="id" value="${memberVO.id}" readonly></td>
		</tr>
		<tr>
			<td class="cl">비밀번호</td>
			<td><input type="password" name="password" id="password" value="${memberVO.password}"></td>
		</tr>
		<tr>
			<td class="cl">이름</td>
			<td><input type="text" name="name" id="name" value="${memberVO.name}" readonly></td>
		</tr>
		<tr>
			<td class="cl">연락처</td>
			<td><input type="text" name="phoneNO" id="phoneNO" value="${memberVO.phoneNO}"></td>
		</tr>
		<tr>
			<td class="cl">이메일</td>
			<td><input type="text" name="email" id="email" value="${memberVO.email}"></td>
		</tr>
		<tr>
			<td class="cl">가입일</td>
			<td><input type="text" name="joinDate" id="joinDate" value="${memberVO.joinDate}" disabled></td>
		</tr>
		<tr align="center">
			<td colspan="2" width="400">
				<input type="submit" class="btn btn-secondary btn-sm" value="수정">
				<input type="reset" class="btn btn-light btn-sm" value="다시입력">
			</td>
		</tr>
		<tr>
			<td>
				<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/mypro01/member/removeRequestForm.do'">탈퇴</button>
			</td>
		</tr>
	<c:if test="${sessionScope.id=='cherry'}">
		<tr align="center">
			<td colspan="2" width="400">
				<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/mypro01/admin/membersList.do'">회원 정보 관리</button>
			</td>
		</tr>
	</c:if>
	</table>
</form>
        
        <hr>
      </div>
    </div>
  </div>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>