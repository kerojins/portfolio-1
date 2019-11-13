<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<div id="header_top">
		<div id="header_content">
			<div class="container">
				<div id="header_content_box" class="wrapping">
					<div id="header_left" class="left">
						<h1>
							<a href="<c:url value='/admin_main'/>"> HEYBOOKS</a>
						</h1>
					</div>
					<div id="search_box">
						<form id="search_form">
							<fieldset class="search_feild">
								<legend>헤이북스 검색 </legend>
								<span><i class="fas fa-search" aria-hidden="true"></i></span> <input
									id="book_search_input" class="del_focus" type="search"
									role="search" placeholder="주문, 상품, 회원 검색" title="서점 전체 검색어 입력">
							</fieldset>
						</form>
					</div>
					<div id="header_right" class="right">
						<c:choose>
							<c:when test="${empty sessionScope.admin_id }">
								<span><a href="<c:url value='/admin'/>">로그인</a></span>
							</c:when>
							<c:otherwise>
								<span><a href="<c:url value='/admin_logout'/>">로그아웃</a></span>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="header_middle">
		<div class="container">
			<div id="header_middle_box" class="wrapping">
				<nav id="header_middle_category">
					<button id="category_btn">
						<span class="header_nav_icon"><i class="fas fa-bars"
							aria-hidden="true"></i></span> 전체보기
					</button>
					<ul class="admin_nav">
						<li><a href="<c:url value='/admin_main'/>">홈</a></li>
						<li><a href="<c:url value='/admin_order_list'/>">주문</a></li>
						<li><a href="<c:url value='/admin_item_list'/>">상품</a></li>
						<li><a href="<c:url value='/admin_user_list'/>">회원</a></li>
						<li><a href="<c:url value='/admin_board'/>">게시판</a></li>
						<li><a href="/sh/event_proceed">매출</a></li>
					</ul>
					<ul id="header_middle_right">
						<li><a href="<c:url value='/admin_editor_list'/>">작가관리</a></li>
						<li><a href="#">AD</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</header>
