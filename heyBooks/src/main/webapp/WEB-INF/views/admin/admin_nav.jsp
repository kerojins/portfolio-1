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
						<form id="search_form" action="<c:url value='/admin_order_list'/>" method="get">
							<fieldset class="search_feild">
								<legend>헤이북스 검색 </legend> 
								<span class="search_icon">
									<button><i class="fas fa-search" aria-hidden="true"></i></button>
								</span> 
								<input id="search_input" class="search_input" autocomplete=off onkeyup="keyword_keyup(this)" name="keyword" type="search" role="search" placeholder="주문, 상품, 회원, 작가 검색" title="서점 전체 검색어 입력">
							</fieldset>
						</form>  
						<div class="search_layer"> 
							<ul>
								<li id="admin_order"><span class="search_layer_left">주문검색:</span><span class="search_layer_keyword"></span><span class="search_layer_right">- 주문찾기</span></li>
								<li id="admin_item"><span class="search_layer_left">상품검색:</span><span class="search_layer_keyword"></span><span class="search_layer_right">- 상품찾기</span></li>
								<li id="admin_user"><span class="search_layer_left">회원검색:</span><span class="search_layer_keyword"></span><span class="search_layer_right">- 회원찾기</span></li>
								<li id="editor"><span class="search_layer_left">작가검색:</span><span class="search_layer_keyword"></span><span class="search_layer_right">- 작가찾기</span></li>
							</ul> 
						</div> 
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
						<li><a href="<c:url value='/admin_chart'/>">매출</a></li>
					</ul>
					<ul id="header_middle_right">
						<li><a href="<c:url value='/editor_list'/>">작가관리</a></li>
						<li><a href="#">AD</a></li>
					</ul>
				</nav> 
			</div>
		</div>
	</div>
</header>
