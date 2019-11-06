<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_list">
	<div class="login-page">
		<div class="form">
			<form method="post" action="admin_login" class="login-form">
				<input type="text" name="admin_id" placeholder="username" /> <input type="password"
					placeholder="password" name="admin_password" />
				<button>login</button>
				<p class="message">
					Not registered? <a href="#">Create an account</a>
				</p>
			</form>
		</div>
	</div>
</div>