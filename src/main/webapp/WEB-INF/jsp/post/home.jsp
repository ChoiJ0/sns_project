<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
   <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
   
   
   	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="d-flex justify-content-center">
			
			<div class="col-4">
			
					<div class="border p-0">
						<textarea class="form-control border-0" placeholder="내용을 입력하세요." id="textContent"></textarea>
						<div class="d-flex justify-content-between m-2">
							<div><a href="#"><img src="/static/picture/icon.png" width="30"></a></div>
							<div><button type="button" class="btn btn-info" id="uploadBtn">업로드</button></div>					
						</div>
					</div>
					
					<c:forEach var="postDetail" items="${list}"> 
					<!-- 피드들 -->
					<div class="border reounded p-2 mt-3">
						<!-- 피드 -->
						<div class="bg-gr mt-3 h40 round p-1">
							<div class="d-flex justify-content-between mx-1">
								<div class="font-weight-bold mt-1">${postDetail.user.loginId}</div>
								<div><i class="bi bi-three-dots"></i></div>
							</div>
						</div>
						
						<div class="text-center">
							<img src="/static/picture/mainImage.png">
						</div>
						
						<div class="mb-6rem h40 round">
							<div class="pt-2 pl-1">
								<a href="#" class="n_op"><img src="/static/picture/heart.png" class="img_size">  <span>좋아요 11개</span></a>
								<a href="#" class="ml-2"><img src="/static/picture/speech.png" class="img_size"></a>
								<a href="#" class="ml-2"><img src="/static/picture/share.png" class="img_size"></a>
							</div>
							
							<!-- comment -->
							<div class="my-3">
								<b>${postDetail.user.loginId}</b> <span id="userComment">${postDetail.post.content}</span>
							</div>
							
							<div class="bg-gr h30 round my-3">
								<span class="ml-2 font-weight-bold">댓글</span>
							</div>
						</div>
						
						<div>
							<table>
								<thead></thead>
								<tbody>
									<tr>
										<td>
											<img src="/static/picture/profil_Image.png" width="30" height="30">
											<span class="ml-2">귀엽네요~~</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="mt-4 d-flex">
							<input type="text" class="form-control" placeholder="내용을 입력해주세요.">
							<button type="button" class="btn btn-info ml-3">게시</button>
						</div>
					</div>
					</c:forEach>
					
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#uploadBtn").on("click", function(){
				let content = $("#textContent").val().trim();
				
				if(content == "") {
					alert("내용을 입력해주세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/post/comment",
					data:{"content":content, "imagePath": ""},
					success:function(data){
						location.href = "/post/home/view";
					},
					error:function(){
						alert("입력 에러!!");
					}
					
					
				});
				
				
			});
			
			
		});	
	
	
	</script>
	
</body>
</html>