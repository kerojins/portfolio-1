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
							<a href="/sh/"> HEYBOOKS</a>
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
						<span><a href="/sh/join">회원가입</a></span> <span><a
							href="/sh/mypage">마이페이지</a></span><span><a href="/sh/login">로그인</a></span>
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
						<li><a href="/sh/weekly_best_seller">홈</a></li>
						<li><a href="/sh/new_book">주문</a></li>
						<li><a href="/sh/domestic_book">상품</a></li>
						<li><a href="/sh/oversea_book">회원</a></li>
						<li><a href="/sh/event_proceed">게시판</a></li>
						<li><a href="/sh/event_proceed">매출</a></li>
					</ul>
					<ul id="header_middle_right"> 
						<li><a href="/sh/order">작가관리</a></li>
						<li><a href="#">AD</a></li>
					</ul>
				</nav>

			</div>
		</div>
	</div>
	<div class="admin_home_content">
		<div class="container">
			<div class="admin_home_left">
				<div class="admin_brief">
					<div class="today_info brief_content">
						<span class="brief_title">오늘 <i
							class="fas fa-chevron-right"></i></span>
						<p>
							<span class="brief_subtitle">결제</span><i>3</i>건
						</p>
						<p>
							<span class="brief_subtitle">매출</span><i>3,0000</i>원
						</p>
						<p>
							<span class="brief_subtitle">가입</span><i>0</i>명
						</p>
						<p>
							<span class="brief_subtitle">방문</span><i>20</i>명
						</p>
					</div>
					<div class="total_info brief_content">
						<span class="brief_title">누적 <i
							class="fas fa-chevron-right"></i></span>
						<p>
							<span class="brief_subtitle">회원</span><i>13</i>명
						</p>
						<p>
							<span class="brief_subtitle">적립금</span><i>4324,343</i>원
						</p>
					</div>
				</div>
				<div class="admin_preview">
					<div class="col-md-3">
						<span><i class="fas fa-plus"></i></span>
						<h2>
							<i class="fas fa-truck"></i> 주문처리
						</h2>
					</div>
					<div class="col-md-3">
						<span><i class="fas fa-plus"></i></span>
						<h2>
							<i class="fas fa-book"></i> 상품현황
						</h2>
					</div>
					<div class="col-md-3">
						<span><i class="fas fa-plus"></i></span>
						<h2>
							<i class="far fa-comment-alt"></i> 1:1문의
						</h2>
					</div>
					<div class="col-md-3">
						<span><i class="fas fa-plus"></i></span>
						<h2>
							<i class="far fa-list-alt"></i> 리뷰관리
						</h2>
					</div>
				</div>
			</div>
			<div class="admin_home_right"></div>
		</div>
	</div>
</header>