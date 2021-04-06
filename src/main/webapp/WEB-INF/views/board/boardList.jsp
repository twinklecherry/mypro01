<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	h1, nav, section, tr{text-align:center;}
	h1 {margin-top:20px; padding:20px; boarder:1px;}
	.cata {border:1px; width:100px; float:left; height:100px; background-color:gray; color:white;}
	NAV {margin:0 auto; padding:10px;}
	section {margin: 0 auto; padding:15px;}
	table {border:1px; width:700px; padding:10px; margin:0 auto;}
	.fbtn{float:right;font-weight:normal;opacity:0.8}
	td{width:5%;}
</style>

 	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<c:if test="${not empty sessionScope.id}">
				<a class="btn btn-secondary btn-sm" href="/mypro01/board/addBoardForm.do">글 작성</a>
		</c:if>
	</div>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
		
		<table class="tb">
			<tr height="10" bgcolor="lightyellow">
		    	<td>글번호</td>              
		     	<td>제목</td>
	    		<td>작성자</td>
				<td>작성일</td>
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
					<td width="5%">${board.boardNO}</td>
					<td align='left' width="35%">
		 			  <span style="padding-right:30px"></span>
		 			  <a class='cls1' href="/mypro01/board/boardView.do?boardNO=${board.boardNO}">${board.title}</a>
					</td>
					<td width="10%">${board.id }</td>
					<td width="10%"><fmt:formatDate value="${board.writeDate}" pattern="YYYY/MM/dd HH:mm:ss"/></td> 
				</tr>
			    </c:forEach>
		    </c:when>
		</c:choose>
		</table> 

      </div>
    </div>
  </div>


<script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript">
var tb = $(".tb");

$(".page-item a").on("click", function(e) {
	e.preventDefault();
	alert("paging");
	tb.find("input[name='pageNum']").val($(this).attr("href"));
	tb.submit();
});

</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
