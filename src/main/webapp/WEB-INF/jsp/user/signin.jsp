<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
   <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>   
   
   	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div>
		
		<section class="container d-flex justify-content-center mt-5">
			<div>
				<img src="/static/picture/phone.png" height="411" width="303">
				<img src="/static/picture/image.png" height="350" width="160" class="position">
			</div>
			<div class="ml-2">
				<form class="border p-5 w400" id="loginForm">
					<img src="/static/picture/logo.png" width="175" height="50" class="mb-3">
					<div class="form-group">
					  <input type="text" class="form-control" placeholder="아이디를 입력해주세요." id="idInput">
					</div>
					<div class="form-group">
					  <input type="password" class="form-control" placeholder="비밀번호를 입력해주세요." id="passwordInput">
					</div>
					<button type="submit" class="btn btn-primary btn-block">로그인</button>
					<hr>
				</form>
				
				<div class="mt-4 border w400 h50 bg-color-gr text-center">
					<div class="mt-2">계정이 없으가요? <span class="mx-2">></span> <a href="/user/signup/view">회원가입</a></div>
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#loginForm").on("submit", function(e){
				e.preventDefault();
				
				let loginId = $("#idInput").val();
				let password = $("#passwordInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력해주세요.");
					return;
				}
				
				if(password == "") {
					alert("비밀번호를 입력해주세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/signin",
					data:{"loginId":loginId, "password":password},
					success:function(data){
						if(data.result == "success"){
							location.href = "/post/home/view";
						} else {
							alert("아이디 또는 비밀번호를 확인해주세요!");
						}
					},
					error:function(){
						alert("로그인 에러");
					}					
				});
				
			});
			
		});
	</script>
</body>
</html>