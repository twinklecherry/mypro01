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
	form, table{text-align:center; margin:0 auto; padding:0;}
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
            <a href="/mypro01/board/boardList.do">???????????????</a>
          </li>
          <li class="nav-item">
          	<form class="hbtn" method="get">
				<c:choose>
					<c:when test="${sessionScope.id==null}">
						<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='http://localhost:8080/mypro01/login.do'">?????????</button>
						<button type="button" class="btn btn-light btn-sm" onclick="location.href='http://localhost:8080/mypro01/signUp.do'">????????????</button>
					</c:when>
					<c:otherwise>
						welcome ${empty sessionScope.id ? "guest" : id}???
						<button type="button" class="btn btn-light" onclick="location.href='/mypro01/member/myInfo.do?id=${sessionScope.id}'">????????????</button>
						<button type="button" onclick="location.href='logout.do'">????????????</button>
						<c:if test="${sessionScope.id=='cherry'}">
							<button type="button" onclick="location.href='/mypro01/admin/admin.do?id=${sessionScope.id}'">??????????????????</button>
						</c:if>
					</c:otherwise>
				</c:choose>
			</form>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <header class="masthead" style="background-color:darkgray;">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">

			<c:if test="${param.msg =='signUp'}"><h2>??????????????? ??????????????? ???????????????.<br>?????????????????????.</h2></c:if>
			<br>
			<h2 style="text-align:center;">?????????</h2>

<form name="frmLogin" method="get">
	<table>
		<tr>
			<td>
				<c:if test="${param.msg=='logout'}">???????????????????????????.</c:if>
			</td>
		</tr>
		<tr>
			<td>
				<c:if test="${param.msg=='delete'}">???????????????????????????.</c:if>
			</td>
		</tr>
		<tr>
			<td>
				<c:if test="${param.msg =='message'}">???????????? ??????????????? ?????? ??????????????????.</c:if>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" id="id" name="id" autofocus placeholder="???????????????" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				<%-- <%=(String)session.getAttribute("id") %> --%>
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" id="password" name="password" placeholder="??????????????????" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</td>
		</tr>
	</table>
	<hr>
		<button type="button" id="loginBtn" class="btn btn-secondary btn-sm">?????????</button>
		&nbsp;<input type="reset" class="btn btn-light btn-sm" value="?????????">
	<hr>
		<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='http://localhost:8080/mypro01/signUp.do'">????????????</button>
</form>
				
          </div>
        </div>
      </div>
    </div>
  </header>
</body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	var frmLogin = $("#frmLogin");
	
	$("#loginBtn").on("click", function(e) {
		e.preventDefault();
		
		var id = $("#id").val();
		var password = $("#password").val();
		
		if(id.length==0 || id=="") {
			alert("???????????? ???????????????.");
	        return;
		} else if(password.length==0 || password=="") {
			alert("??????????????? ???????????????.");
	         return;
		} else {
			
		 	$.ajax({
				type : "post",
				async : true,
				url : "http://localhost:8080/mypro01/member/idPassCheck",
				data : {id, password},
				dataType : 'JSON',
			    success : function(data) { 
			    	   if(data==0) {
							alert("????????? ?????? ??????????????? ??????????????????.");
						} else {
							alert("????????????????????????. ???????????????.");
							
							if((id=="cherry") && (password=="000000")) {
								alert("???????????????. ???????????? ????????????????????????.");
								location.href='http://localhost:8080/mypro01/main?id=${sessionScope.id}';
									
							} else {
								location.href='http://localhost:8080/mypro01/main?id=${sessionScope.id}';
							}
						}
					},
				error:function(data,textStatus) {
					alert("????????? ??????????????????.");
					console.log(data);
					
				}
			});
		}	
	});
	
</script>
</html>