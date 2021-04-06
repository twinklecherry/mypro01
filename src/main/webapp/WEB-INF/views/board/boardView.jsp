<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	h1, h2, nav, section{text-align:center;}
	h1 {margin-top:20px; padding:20px; boarder:1px;}
 	table {border:1px; width:80%; padding:10px; margin:0 auto;}
	#tr_btn_modify{display:none;}
	.tb{text-align:center;}
	.td1{text-align:center; background-color:lightyellow}
</style>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">

<form name="frmBoardView" method="post">
	<div class="mb-3">
		<input type="text" value="${board.boardNO }" disabled>
		<input type="hidden" name="boardNO" id="boardNO" value="${board.boardNO }">
	</div>
	<div class="mb-3">
		<input type="text" value="${board.id }" name="writer" disabled>
		<input type="hidden" name="id" id="id" value="${board.id }">
	</div>
	<div class="mb-3">
		<input type="text" value="${board.title }" name="title" id="_title" disabled>
	</div>
	<div class="mb-3">
		<textarea rows="20" cols="60" name="content" id="_content" disabled>${board.content}</textarea>
	</div>
	<div class="mb-3">
		<input type="text" value="<fmt:formatDate value='${board.writeDate}' pattern='YYYY/MM/dd HH:mm:ss'/>" disabled>
	</div>
		<c:if test="${not empty board.imageFileName && board.imageFileName!='null'}">
	<div class="mb-3">
		<input type= "hidden" name="originalFileName" value="${board.imageFileName}" >
		<img src="/mypro01/filedownload?boardNO=${board.boardNO }&imageFileName=${board.imageFileName}"
			id="preview" width="150px" height="150px" alt="이미지없음">
	</div>
		</c:if>	
	<div id="tr_btn_modify">
			<input type="button" class="btn btn-secondary" value="수정반영" onclick="modifyBoard(frmBoardView)">
			<input type="button" class="btn btn-light" value="취소" onclick="backToList(frmBoardView)">
							<input type="button" class="btn btn-light" value="삭제" onclick="location.href='/mypro01/board/removeBoardMember.do?boardNO=${board.boardNO}'">
				<input type="file" class="btn btn-secondary" name="imageFileName" id="_imageFileName" disabled onchange="readURL(this);">
			
			<input type="button" class="btn btn-secondary" value="리스트로 돌아가기" onclick="backToList(this.form)">
	</div>
	<div id="tr_btn">
			<c:if test="${sessionScope.id==board.id || sessionScope.id=='cherry'}">
				<input type="button" class="btn btn-secondary" value="수정" onclick="inputEnable(this.form)">
			</c:if>
			<input type="button" class="btn btn-secondary" value="리스트로 돌아가기" onclick="backToList(this.form)">
	</div>
</form>
<br><br><br>
<form name="frmComment" method="post">
	<table class="table">
	  <thead>
	    <tr align="center">
	      <th scope="col">#</th>
	      <th scope="col">답글번호</th>
	      <th scope="col">내용</th>
	      <th scope="col">작성자</th>
	      <th scope="col">답글 작성 날짜</th>
	    </tr>
	  </thead>
	  <tbody>
	<c:choose>
		<c:when test="${empty commentList}">
			<tr align="center">
				<td colspan=5>첫 답글의 주인공이 되주세요.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="comment" items="${commentList}" varStatus="commentNum">
					<tr align="center">
						<td width="5%">&rdsh;</td>
						<td width="5%">${comment.commentNO}</td>
						<td width="10%">${comment.content}</td>
						<td width="10%">${comment.id }</td>
						<td width="10%">${comment.writeDate }</td>
						
						<c:if test="${sessionScope.id==comment.id || sessionScope.id=='cherry'}">
							<td>
								<input type="hidden" name="boardNO" value="${board.boardNO}">
								<button type="button" class="btn btn-secondary" onclick="location.href='/mypro01/board/removeComment.do?commentNO=${comment.commentNO}'">댓글삭제</button>
							</td>
						</c:if>
					</tr>
				</c:forEach>
		</c:otherwise>
	</c:choose>
	  </tbody>
	</table>
</form>


<c:if test="${not empty sessionScope.id}">
	<form id="addCommentForm" method="get" action="/mypro01/board/addComment.do">
	  	<textarea rows="5" cols="50" id="content" name="content" placeholder="답글을 작성해주세요."></textarea>
	  	<input type="hidden" name="boardNO" value="${board.boardNO}">
		<input type="submit" class="btn btn-secondary" id="btnAddCmd" value="답글작성">
	</form>
</c:if>

      </div>
    </div>
  </div>
  
<script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript" >

	function backToList(obj) {
		obj.action="/mypro01/board/boardList.do";
		obj.submit();
	}
	
	function readURL(input) {
		if(input.files && input.files[0]) { 
			var reader = new FileReader();
			reader.onload = function(e) { 
				$("#preview").attr("src",e.target.result); 
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function inputEnable(obj){
		document.getElementById("_title").disabled=false;
		document.getElementById("_content").disabled=false;
//		document.getElementById("_imageFileName").disabled=false;
		document.getElementById("tr_btn_modify").style.display="inline";
		document.getElementById("tr_btn").style.display="none";
	}
	
	function modifyBoard(obj) {
//		obj.enctype="multipart/form-data";
		obj.action="/mypro01/board/modBoard.do";
		obj.submit();
	}
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
