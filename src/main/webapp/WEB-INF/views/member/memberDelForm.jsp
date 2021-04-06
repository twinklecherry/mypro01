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

		<h2 style="text-align:center;">${sessionScope.id}님 탈퇴</h2><br>

<form name="frmInfo" id="frmInfo" method="post" action="/mypro01/member/removeRequest.do">
	<table>
		<tr>
			<td class="cl">아이디</td>
			<td><input type="text" name="id" id="id" value="${sessionScope.id}" readonly="readonly"></td>
		</tr>
		<tr>
			<td class="cl">비밀번호</td>
			<td><input type="password" name="password" id="password" placeholder="현재 비밀번호를 입력해주세요"></td>
	
		</tr>
	</table>
	
	<input type="button" id="deleteRequest" class="btn btn-secondary btn-sm" value="탈퇴하기"> 
	
</form>
        
        <hr>
      </div>
    </div>
  </div>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>	
<script type="text/javascript">

	var id = $("#id").val();
	//var password = $("#password").val();

	$("#deleteRequest").on("click", function() {
		if($("#password").val()=="") {
			alert("비밀번호를 입력해주세요.");
			$("#password").focus();
			return false;
		}
		
		var password = $("#password").val();
		
		$.ajax({
			type:"post",
			url:"http://localhost:8080/mypro01/member/idPassCheck",
			dataType:"json",
			data:{id, password},
			success:function(data) {
				if(data==0){
					alert("패스워드가 정보와 맞지 않습니다. 다시한번 확인해주세요.");
					alert(password);
					return;
				} else {
				    if (confirm("탈퇴하시겠습니까")) {
				    	$("#frmInfo").submit();
				    } 
				} 
			}
		});
	});
	

	
	
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>