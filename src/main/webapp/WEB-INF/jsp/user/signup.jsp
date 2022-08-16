<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
   <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>   
   
   	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
		<div class="container text-center mt-3">
			<div class="d-flex justify-content-center">
				<section>
					<form class="border p-5 w400">
						<img src="/static/picture/logo.png" width="175" height="50" class="mb-3">
						<div class="txt-color-gr mb-3 ft-22">친구들의 사진과 동영상을 보려면 가입하세요.</div>
						<div class="form-group d-flex">
							<input type="text" class="form-control" placeholder="휴대폰 번호 또는 이메일 주소" id="loginIdInput">
							<button type="button" class="btn ml-2 btn-primary" id="check">중복확인</button>
						</div>
						<div class="d-flex flex-row">
							<div id="duplicateText" class="d-none"><small class="text-danger ">중복된 ID입니다.</small></div>
							<div id="possibleText" class="d-none"><small class="text-success ">사용가능한 ID입니다.</small></div>							
						</div>
						<div class="form-group">
						  <input type="text" class="form-control" placeholder="성명" id="nameInput">
						</div>
						<div class="form-group">
						  <input type="text" class="form-control" placeholder="사용자 이름" id="userNameInput">
						</div>
						<div class="form-group">
						  <input type="password" class="form-control" placeholder="비밀번호" id="passwordInput">
						</div>
						<button type="button" class="btn btn-primary btn-block" id="signUpBtn">가입</button>
						<hr>
					</form>
					
					<div class="mt-4 border w400 h50 bg-color-gr text-center">
						<div class="mt-2">계정이 있으신가요? <span class="mx-2">></span> <a href="/user/signin/view">로그인</a></div>
					</div>
				</section>
			</div>
		</div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	
		<script>
			$(document).ready(function(){
				
				var isDuplicateCheck = false;
				var isDuplicateId = true;
				
				$("#loginIdInput").on("input", function() {
					inDuplicateCheck = false;
					isDuplicateId = true;
					
					$("#possibleText").addClass("d-none");
					$("#duplicateText").addClass("d-none");
					
				});
				
				$("#check").on("click", function(){
					var loginId = $("#loginIdInput").val();
					
					if(loginId == "") {
						alert("아이디를 입력하세요.");
						return;
					}
					
					$.ajax({
						type:"get",
						url:"/user/check",
						data:{"loginId":loginId},
						success:function(data){
							
							//중복체크 여부 판단
							isDuplicateCheck = true;
							
							if(data.is_duplicate){ //	중복된 경우
								$("#duplicateText").removeClass("d-none");
								$("#possibleText").addClass("d-none");
								isDuplicateId = true;
							} else {
								$("#possibleText").removeClass("d-none");
								$("#duplicateText").addClass("d-none");
								isDuplicateId = false;
							}
							
						},
						error:function(){
							alert("중복확인 에러!");
						}
						
						
					});
					
				});
				
				$("#signUpBtn").on("click", function(){
					var loginId = $("#loginIdInput").val();
					var name = $("#nameInput").val();
					var password = $("#passwordInput").val();
					var userName = $("#userNameInput").val();
					
					if(loginId == "") {
						alert("아이디를 입력하세요.");
						return;
					}
					
					// 중복체크 여부 유효성 검사
					if(!isDuplicateCheck) {
						alert("중복여부 체크를 진행해주세요.");
						return;
					}
					
					if(isDuplicateId) {
						alert("중복체크를 해주세요.");
						return;
					}
					
					if(name == "") {
						alert("이름을 입력하세요.");
						return;
					}
					
					if(userName == "") {
						alert("사용하실 이름을 입력하세요.");
						return;
					}
					
					if(password == "") {
						alert("비밀번호를 입력하세요.");
						return;
					}
					
					
					$.ajax({
						type:"post",
						url:"/user/signup",
						data:{"loginId":loginId, "name":name, "password":password, "userName":userName},
						success:function(data){
							if(data.result == "success"){
								location.href = "/user/signin/view";
							} else {
								alert("회원가입 실패!");
							}
							
						},
						error:function(){
							alert("회원가입 에러!");
						}
						
						
					});
					
				});
				
			});
		
		</script>
</body>
</html>