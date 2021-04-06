<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	session = request.getSession(true); 
	String id = request.getParameter("id");
	session.getAttribute("id");
%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<style>
	h3, h1, form, table {text-align:center;}
	h1 {margin-top:20px; padding:20px; boarder:1px;}
	table {border:1px; width:70%; padding:10px; margin:0 auto;}
</style>

 <!-- Main Content -->
<div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
		
	<h2 style="text-align:center;">새로운 글 작성</h2>

<form name="frmBoard" method="get" action="/mypro01/board/addBoard.do">
	
	<div class="mb-3">
		<input type="text" size="65" maxlength="500" id="id" value="${sessionScope.id}" readonly>
	</div>
	<div class="mb-3">
		<input type="text" size="65" maxlength="500" name="title" placeholder="제목을 작성하세요.">
	</div>
	<div class="mb-3">
		<textarea name="content" rows="10" cols="65" maxlength="4000" placeholder="내용을 작성하세요."></textarea>
	</div>
	<div class="mb-3">
		<input type="file" name="imageFileName" onChange="readURL(this);" class="btn btn-secondary btn-sm">
		<img id="preview" src="#" width="200px" height="200px" alt="이미지없음">
	</div>
	<div class="mb-3" valign="top"></div>
	<div class="mb-3">
		<input type="submit" class="btn btn-secondary btn-sm" value="글쓰기">
		<input type="button" class="btn btn-light btn-sm" value="목록보기" onclick="backToList(this.form)">
	</div>
	
</form>

      </div>
    </div>
</div>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>	
<script type="text/javascript">
	function readURL(input) {
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#preview").attr("src",e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function backToList(obj) {
		obj.action="/mypro01/board/boardList.do";
		obj.submit();
	}
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
