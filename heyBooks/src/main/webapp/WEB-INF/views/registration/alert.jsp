<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container login_box" id="container">
	<div class="form-container sign-in-container">
		<form action="#" class="login_form">
			<h3>Login</h3>
			<input type="text"
				placeholder="아이디" /> <input type="password"
				placeholder="비밀번호" /> <a href="#">아이디나 비밀번호를 잊으셨나요?</a>
			<button>로그인</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal
					info</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div> 
			<div class="overlay-panel overlay-right">
				<h3>Hey, Friend!</h3>
				<p>간단한 가입을 통해 헤이북스를 편리하게<br> 즐기실 수 있습니다, 시작해볼까요?</p>
				<button class="ghost" id="signUp">가입하기</button> 
			</div>
		</div>
	</div>
</div>