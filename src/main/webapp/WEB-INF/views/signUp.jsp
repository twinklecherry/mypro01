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
						<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/mypro01/member/myInfo.do?id=${sessionScope.id}'">????????????</button>
						<button type="button" class="btn btn-light btn-sm" onclick="location.href='logout.do'">????????????</button>
						<c:if test="${sessionScope.id=='cherry'}">
							<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/mypro01/admin/admin.do?id=${sessionScope.id}'">??????????????????</button>
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
  <header class="masthead" style="background-color:white;">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">

      <h2 style="text-align:center;">????????????</h2>
      
      		<form name="frmSignUp">
		<table>
			<tr>
				<td><input type="text" name="id" id="id" autofocus placeholder="???????????????"></td>
				<td><input type="button" class="btn btn-light btn-sm" id="idChecked" value="ID????????????" onClick="idCheck()"/></td>
			</tr>
			<tr>
				<td><div id="message"></div></td>
			</tr>
			<tr>
				<td><input type="password" name="password" id="password" onChange="PwCheck()" placeholder="??????????????????"></td>
			</tr>
			<tr>
				<td><input type="password" name="pwCheck" id="pwCheck" placeholder="?????????????????????"></td>
			</tr>
			<tr>
				<td>
					<div class="equal" id="equals">??????????????? ???????????? ???????????? ???????????????.</div>
					<div class="not_equal" id="not_equals">??????????????? ???????????????????????? ????????????????????????.</div>
				</td>
			</tr>
			<tr>
				<td><input type="text" name="name" placeholder="??????????????????"></td>
			</tr>
			<tr>
				<td><input type="tel" name="phoneNO" placeholder="?????????????????????"></td>
			</tr>
			<tr>
				<td><input type="email" name="email" placeholder="?????????????????? ?????? ???????????????"></td>
			</tr>
		</table>
		<br>
		<input type="button" class="btn btn-secondary btn-sm" value="??????" onclick="sendMember()">
		<input type="hidden" name="signUp" onclick="sendMember()">
		<input type="reset" class="btn btn-light btn-sm" value="????????????">
		<hr>
		<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='http://localhost:8080/mypro01/login.do'">????????????????????? ??????</button>
	</form>
        
        <hr>
				
          </div>
        </div>
      </div>
    </div>
  </header>
</body>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>	
	<script type="text/javascript">
		function sendMember() {
			var frmSignUp=document.frmSignUp;
			var id=frmSignUp.id.value;
			var password=frmSignUp.password.value;
			var name=frmSignUp.name.value;
			var phoneNO=frmSignUp.phoneNO.value;
			var email=frmSignUp.email.value;
			if(id.length==0 || id=="") {
				alert("???????????? ???????????????.");
			} else if(password.length==0 || password=="") {
				alert("??????????????? ???????????????.");
			} else if(name.length==0 || name=="") {
				alert("????????? ???????????????.");
			} else if(phoneNO.length==0 || phoneNO=="") {
				alert("?????????????????? ???????????????.");
			} else if(email.length==0 || email=="") {
				alert("???????????? ???????????????.");
			} else {
				frmSignUp.method="post";
				frmSignUp.action="/mypro01/member/addMember.do";
				frmSignUp.submit();
			}
		}
		
		function idCheck() {
			var _id = frmSignUp.id.value;
			if(_id=='') {
				alert("ID??? ???????????????.");
				return;
			}
			
			$.ajax({
				type:"post",
				async:true,
				url:"http://localhost:8080/mypro01/member/isIdcheck.do",
				data:{id:_id},
				dataType:"text",
				success:function(data,textStatus) {
					if(data=='usable') {
						$('#message').text("????????? ??? ?????? ID?????????.");
						$('#id').prop("disable",true);
					} else {
						$('#message').text("????????? ??? ?????? ID?????????.");
					}
				},
				error:function(data,textStatus) {
					alert("????????? ??????????????????.");
				},
				complete:function(data,textStatus) {
					$('#message').append(data);
					//alert("complete ??????");
				}
			});
		}
		
		function PwCheck() {
			var password=frmSignUp.password.value;
			var pwCheck=frmSignUp.pwCheck.value;
			
			if(password.length>=6 && password.length<=10) {
				//window.alert("??????????????? ?????? ??????");
			} else {
				window.alert("??????????????? 6????????????, 10?????? ????????? ?????????????????????.");
				$('#password').focus();
			}
			
		}
		
		$(function(){
			$("#equals").hide();
			$("#not_equals").hide();
			$("input").keyup(function(){
				var password=$("#password").val();
				var pwCheck=$("#pwCheck").val();
				if(password !="" || pwCheck!="") {
					if(password==pwCheck) {
						$("#equals").show();
						$("#not_equals").hide();
						$("#submit").removeAttr("disabled");
					} else {
						$("#equals").hide();
						$("#not_equals").show();
						$("#submit").attr("disabled","disabled");
					}
				}
			});
		});
	</script>
</html>