<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_list">
	<div class="login-page">
		<div class="form">
			<form method="post" action="<c:url value='/admin_login'/>" class="login-form">
				<input type="text" name="admin_id" placeholder="username" /> <input type="text"
					placeholder="password" name="admin_password" />
				<input type="submit" value="LOGIN">
				<p class="message"> 
					${vo.admin_password}
				</p>
			</form> 
		</div>
	</div>
</div>