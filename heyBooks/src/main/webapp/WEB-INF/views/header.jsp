<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<div id="header_top">
		<div class="container">
			<p onclick="test()">책과 내가 만나는 공간</p>
		</div>
	</div>
	<div id="header_content">
		<div class="container">
			<div id="header_content_box" >
				<div id="header_left" class="left">
					<h1>
						<a href="<c:url value='/'/>"> HEYBOOKS</a>
					</h1>
				</div>
				<div id="search_box"> 
					<form id="search_form">
						<fieldset class="search_feild">
							<legend>헤이북스 검색 </legend>
							<a class="search_btn">
								<i class="fas fa-search"></i>
							</a> 
							<input id="book_search_input" autocomplete="off" class="del_focus" type="search" role="search" onkeyup="search_preview(this)" placeholder="제목, 저자, 출판사 검색" value="${keyword}" title="서점 전체 검색어 입력">
						</fieldset>
					</form>
					<div class="search_preview">  
						<div class="search_editor_preview">
							<ul class="search_editor_preview_list">
								<!-- 검색 작가 리스트 ajax -->
							</ul>
						</div>
						<div class="search_item_preview">
							<ul class="search_item_preview_list">
								<!-- 검색 상품 리스트 ajax -->	
							</ul>
						</div>
					</div>
				</div>
				<div id="header_right" class="right">
					<c:choose>
						<c:when test="${sessionScope.member != null }">
							<span><a href="<c:url value='/mypage'/>">마이페이지</a></span>
							<span><a href="<c:url value='/cart'/>">장바구니</a></span>
							<span><a href="<c:url value='/member_logout'/>">로그아웃</a></span>
						</c:when>
						<c:otherwise>
							<span><a href="<c:url value='/member_join'/>">회원가입</a></span>
							<span><a href="<c:url value='/member_login'/>">로그인</a></span>
						</c:otherwise>
					</c:choose>
  
				</div>
			</div>
		</div>
	</div>
	<div id="header_middle">
		<div class="container">
			<div id="header_middle_box" class="wrapping">
				<nav id="header_middle_category">
					<button id="category_btn">
						<span class="header_nav_icon"><i class="fas fa-bars"></i></span>
						카테고리
					</button>
					<ul class="left">
						<li><a href="<c:url value='/weekly_best_seller'/>">BEST</a></li>
						<li><a href="<c:url value='/new_book'/>">신간</a></li>
						<li><a href="<c:url value='/domestic_book'/>">국내도서</a></li>
						<li><a href="<c:url value='/oversea_book'/>">외국도서</a></li>
						<li><a href="<c:url value='/event_proceed'/>">EVENT</a></li>
					</ul>
				</nav>
				<ul id="header_middle_right" class="right">
					<li><a href="<c:url value='/notice'/>">공지사항</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</div> 
			<div id="header_bottom">
				<div class="row">
					<div id="header_bottom_left" class="col-md-6">
						<h3>국내도서</h3>
						<a href="#" class="all_view_rink"><i
							class="fas fa-angle-right"></i> 전체보기</a>
						<ul>
							<c:forEach var="list" items="${domestic_cate_list}">
								<li><a href="#">${list.cate_name}</a></li>
							</c:forEach>
						</ul>  
					</div>
					<div id="header_bottom_right" class="col-md-6">
						<h3>외국도서</h3>
						<a href="#" class="all_view_rink"><i
							class="fas fa-angle-right"></i> 전체보기</a>
						<ul>
							<c:forEach var="list" items="${oversea_cate_list}">
								<li><a href="#">${list.cate_name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>