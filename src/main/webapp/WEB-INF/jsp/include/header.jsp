<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<header class="d-flex align-items-center justify-content-between mt-3">
		<div>
			<img src="/static/picture/logo.png" class="ml-3">
		</div>
		<c:choose>
				<c:when test="${not empty userId }">
					<div class="mr-3">${userLoginId}님 <a href="/user/signout">로그아웃</a></div>				
				</c:when>
				<c:otherwise>
					<div class="mr-3"><a href="/user/signin/view">로그인</a></div>
				</c:otherwise>
			</c:choose>
		
	</header>
	<hr>