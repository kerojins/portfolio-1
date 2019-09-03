<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%-- CSS --%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/main.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/sub.css'/>">
<link
	href="https://fonts.googleapis.com/css?family=Baloo+Tammudu&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<%-- SCRIPT --%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/38c8c99cb0.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="<c:url value='/resources/js/main.js'/>"></script>
<title>Hey Books</title>
</head>
<body>
	<%-- heaer시작 --%>
	<header>
		<div id="header_top">
			<div class="container">
				<p onclick="test()">책과 내가 만나는 공간</p>
			</div>
		</div>
		<div id="header_content">
			<div class="container">
				<div id="header_content_box" class="wrapping">
					<div id="header_left" class="left">
						<h1>
							<a href="<c:url value='/'/>"> HEYBOOKS</a>
						</h1>
					</div>
					<div id="search_box">
						<form id="search_form">
							<fieldset class="search_feild">
								<legend>헤이북스 검색 </legend>
								<span><i class="fas fa-search"></i></span> <input
									id="book_search_input" class="del_focus" type="search"
									role="search" placeholder="제목, 저자, 출판사 검색" title="서점 전체 검색어 입력">
							</fieldset>
						</form>
					</div>
					<div id="header_right" class="right">
						<span><a href="<c:url value='join.jsp'/>">회원가입</a></span> <span><a
							href="<c:url value='login.jsp'/>">로그인</a></span>
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
							<li><a href="<c:url value='/monthly_best_seller'/>">BEST</a></li>
							<li><a href="<c:url value='/new_book'/>">신간</a></li>
							<li><a href="<c:url value='/domestic_book'/>">국내도서</a></li>
							<li><a href="<c:url value='/oversea_book'/>">해외도서</a></li>
							<li><a href="#">EVENT</a></li>
						</ul>
					</nav>
					<ul id="header_middle_right" class="right">
						<li><a href="#">주문배송</a></li>
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
								<li><a href="#">소설</a></li>
								<li><a href="#">에세이</a></li>
								<li><a href="#">국내소설</a></li>
								<li><a href="#">시</a></li>
								<li><a href="#">어린이</a></li>
								<li><a href="#">가정생활</a></li>
								<li><a href="#">정치사회</a></li>
								<li><a href="#">경제경영</a></li>
								<li><a href="#">건강</a></li>
								<li><a href="#">유아</a></li>
								<li><a href="#">종교</a></li>
								<li><a href="#">아동만화</a></li>
								<li><a href="#">역사문화</a></li>
								<li><a href="#">자기계발</a></li>
								<li><a href="#">여행</a></li>
								<li><a href="#">만화</a></li>
							</ul>
						</div>
						<div id="header_bottom_right" class="col-md-6">
							<h3>외국도서</h3>
							<a href="#" class="all_view_rink"><i
								class="fas fa-angle-right"></i> 전체보기</a>
							<ul>
								<li><a href="#">문학</a></li>
								<li><a href="#">인문사회</a></li>
								<li><a href="#">유아/아동/청소년</a></li>
								<li><a href="#">경제경영</a></li>
								<li><a href="#">과학/기술</a></li>
								<li><a href="#">취미/실용/여행</a></li>
								<li><a href="#">교재</a></li>
								<li><a href="#">생활/요리/건강</a></li>
								<li><a href="#">예술/건축</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div id="book_full_contents">
		<%--  메인배너  --%>
		<section id="main_banner">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active"
						style="background: rgb(104, 89, 56)">
						<img title="책 토지 이벤트 배너"
							src="<c:url value='/resources/images/main_slide2.jpg'/>"
							class="d-block w-100" alt="책 토지 이벤트 배너">
					</div>
					<div class="carousel-item" style="background: rgb(29, 161, 243);">
						<img title="sns이벤트 배너"
							src="<c:url value='/resources/images/main_slide1.jpg'/>"
							class="d-block w-100" alt="sns이벤트 배너">
					</div>
					<div class="carousel-item" style="background: rgb(255, 252, 219)">
						<img title="익스프레스 시리즈"
							src="<c:url value='/resources/images/main_slide3.jpg'/>"
							class="d-block w-100" alt="책 토지 이벤트 배너">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</section>
		<section id="book_contents">
			<%-- 광고배너 --%>
			<div class="content_full_wrap">
				<article id="ad_banner" class="container">
					<p>
						<img src="<c:url value='/resources/images/ad_banner.jpg'/>">
					</p>
				</article>
			</div>
			<%-- 새로운 책 --%>
			<div class="content_full_wrap">
				<div class="container overhidden">
					<article id="new_books" class="left">
						<h2>신간 도서</h2>
						<div class="new_books_slider">
							<div class="new_books_slideBox">
								<div class="new_books_img left">
									<img src="<c:url value='/resources/images/new_books1.jpg'/>">
								</div>
								<div class="new_books_content left">
									<p id="new_books_comment">"돌아가는 길은 외로운 여행이 될듯 했다."</p>
									<dl>
										<dt>책 제목</dt>
										<dd>가격가격</dd>
										<dd>책내용내용내용책내용내용내용책내용내용내용책내용내용내용책내용내용내용</dd>
									</dl>
								</div>
							</div>
							<div class="new_books_slideBox">
								<div class="new_books_img left">
									<img src="<c:url value='/resources/images/new_books1.jpg'/>">
								</div>
								<div class="new_books_content left">
									<p id="new_books_comment">"돌아가는 길은 외로운 여행이 될듯 했다."</p>
									<dl>
										<dt>책 제목</dt>
										<dd>가격가격</dd>
										<dd>책내용내용내용책내용내용내용책내용내용내용책내용내용내용책내용내용내용</dd>
									</dl>
								</div>
							</div>
							<div class="new_books_slideBox">
								<div class="new_books_img left">
									<img src="<c:url value='/resources/images/new_books1.jpg'/>">
								</div>
								<div class="new_books_content left">
									<p id="new_books_comment">"돌아가는 길은 외로운 여행이 될듯 했다."</p>
									<dl>
										<dt>책 제목</dt>
										<dd>가격가격</dd>
										<dd>책내용내용내용책내용내용내용책내용내용내용책내용내용내용책내용내용내용</dd>
									</dl>
								</div>
							</div>
						</div>
					</article>
					<article id="news_event" class="right">
						<h2 id="news_event_title">NEWS &amp; EVENT</h2>
						<ul id="news_event_btn">
							<li><span>1</span></li>
							<li><span>2</span></li>
							<li><span>3</span></li>
							<li><span>4</span></li>
						</ul>
						<p id="news_event_img">
							<img src="<c:url value='/resources/images/news_event1.jpg'/>">
						</p>
					</article>
				</div>
			</div>
			<%-- 베스트셀러 --%>
			<div class="content_full_wrap">
				<div class="container">
					<article id="best_item">
						<div id="best_item_title" class="aticle_title_layout">
							<h2>주간 베스트셀러</h2>
							<span><a href="">전체보기</a></span>
						</div>
						<ul class="best_item_menu">
							<li class="weekly_item_tap" data-tap="weekly_item_tap">주간
								베스트셀러</li>
							<li class="monthly_item_tap" data-tap="monthly_item_tap">월간
								베스트셀러</li>
							<li class="steady_item_tap" data-tap="steady_item_tap">스테디셀러</li>
						</ul>
						<div id="weekly_best_item" class="best_item_list weekly_item_tap"
							data-content="weekly_item_tap">
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
						</div>
						<div id="monthly_best_item"
							class="best_item_list monthly_item_tap"
							data-content="montly_item_tap">
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
						</div>
						<div id="steady_best_item" class="best_item_list steady_item_tap"
							data-content="steady_item_tap">
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
							<div class="best_item_box">
								<span class="best_item_rank">1</span>
								<p class="best_item_img">
									<a><img
										src="<c:url value='resources/images/best_seller_1.jpg' />"></a>
								</p>
								<div>
									<h4 class="best_item_title">
										<a href="#">네이비씰 승리의기술</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">조코 윌링크, 레이프바빈</a>
									</p>
									<p class="best_item_rate">
										<span>평점</span><span class="best_item_reviewCount">9명</span>
									</p>
								</div>
							</div>
						</div>
					</article>
				</div>
				<div class="content_full_wrap">
					<div class="container">
						<article id="age_item">
							<div id="age_item_box">
								<h2>
									<span>20대 여성</span>이 많이 구매한 책
								</h2>
								<div class="age_item_slider">
									<div class="age_slide_item">
										<span class="age_item_rank">1</span>
										<p class="age_item_imgBox">
											<img width="60"
												src="<c:url value='/resources/images/age_item1.jpg'/>">
										</p>
										<div class="age_item_description">
											<h3 class="age_item_description_title">사업을 한다는 것</h3>
											<span class="age_item_description_editor">레이 크록</span> <span
												class="age_item_description_cate">경영일반</span>
										</div>
										<a class="age_item_rink" href="#"></a>
									</div>
									<div class="age_slide_item">
										<span class="age_item_rank">1</span>
										<p class="age_item_imgBox">
											<img width="60"
												src="<c:url value='/resources/images/age_item1.jpg'/>">
										</p>
										<div class="age_item_description">
											<h3 class="age_item_description_title">사업을 한다는 것</h3>
											<span class="age_item_description_editor">레이 크록</span> <span
												class="age_item_description_cate">경영일반</span>
										</div>
										<a class="age_item_rink" href="#"></a>
									</div>
									<div class="age_slide_item">
										<span class="age_item_rank">1</span>
										<p class="age_item_imgBox">
											<img width="60"
												src="<c:url value='/resources/images/age_item1.jpg'/>">
										</p>
										<div class="age_item_description">
											<h3 class="age_item_description_title">사업을 한다는 것</h3>
											<span class="age_item_description_editor">레이 크록</span> <span
												class="age_item_description_cate">경영일반</span>
										</div>
										<a class="age_item_rink" href="#"></a>
									</div>
									<div class="age_slide_item">
										<span class="age_item_rank">1</span>
										<p class="age_item_imgBox">
											<img width="60"
												src="<c:url value='/resources/images/age_item1.jpg'/>">
										</p>
										<div class="age_item_description">
											<h3 class="age_item_description_title">사업을 한다는 것</h3>
											<span class="age_item_description_editor">레이 크록</span> <span
												class="age_item_description_cate">경영일반</span>
										</div>
										<a class="age_item_rink" href="#"></a>
									</div>
									<div class="age_slide_item">
										<span class="age_item_rank">1</span>
										<p class="age_item_imgBox">
											<img width="60"
												src="<c:url value='/resources/images/age_item1.jpg'/>">
										</p>
										<div class="age_item_description">
											<h3 class="age_item_description_title">사업을 한다는 것</h3>
											<span class="age_item_description_editor">레이 크록</span> <span
												class="age_item_description_cate">경영일반</span>
										</div>
										<a class="age_item_rink" href="#"></a>
									</div>
									<div class="age_slide_item">
										<span class="age_item_rank">1</span>
										<p class="age_item_imgBox">
											<img width="60"
												src="<c:url value='/resources/images/age_item1.jpg'/>">
										</p>
										<div class="age_item_description">
											<h3 class="age_item_description_title">사업을 한다는 것</h3>
											<span class="age_item_description_editor">레이 크록</span> <span
												class="age_item_description_cate">경영일반</span>
										</div>
										<a class="age_item_rink" href="#"></a>
									</div>
								</div>
							</div>
						</article>
					</div>
				</div>
				<%-- MY 관심있는 책 --%>
				<div class="content_full_wrap">
					<div class="container">
						<article id="favorite_item">
							<div class="aticle_title_layout">
								<h2>MY 관심있는 책</h2>
								<span class="allView_btn"><a href="#">전체보기</a></span> <span
									class="set_cate_btn"><button>분야 설정</button></span>
							</div>
							<div id="favorite_item_list">
								<div class="vertical_item_box">
									<p class="favorite_item_img">
										<a><img
											src="<c:url value='resources/images/favorite_item1.jpg' />"></a>
									</p>
									<div>
										<h4 class="vertical_item_title">
											<a href="#">네이비씰 승리의기술</a>
										</h4>
										<p class="vertical_item_editor">
											<a href="#">조코 윌링크, 레이프바빈</a>
										</p>
										<p class="vertical_item_rate">
											<span>평점</span><span class="favorite_item_reviewCount">9명</span>
										</p>
									</div>
								</div>
								<div class="vertical_item_box">
									<p class="favorite_item_img">
										<a><img
											src="<c:url value='resources/images/favorite_item1.jpg' />"></a>
									</p>
									<div>
										<h4 class="vertical_item_title">
											<a href="#">네이비씰 승리의기술</a>
										</h4>
										<p class="vertical_item_editor">
											<a href="#">조코 윌링크, 레이프바빈</a>
										</p>
										<p class="vertical_item_rate">
											<span>평점</span><span class="favorite_item_reviewCount">9명</span>
										</p>
									</div>
								</div>
								<div class="vertical_item_box">
									<p class="favorite_item_img">
										<a><img
											src="<c:url value='resources/images/favorite_item1.jpg' />"></a>
									</p>
									<div>
										<h4 class="vertical_item_title">
											<a href="#">네이비씰 승리의기술</a>
										</h4>
										<p class="vertical_item_editor">
											<a href="#">조코 윌링크, 레이프바빈</a>
										</p>
										<p class="vertical_item_rate">
											<span>평점</span><span class="favorite_item_reviewCount">9명</span>
										</p>
									</div>
								</div>
								<div class="vertical_item_box">
									<p class="favorite_item_img">
										<a><img
											src="<c:url value='resources/images/favorite_item1.jpg' />"></a>
									</p>
									<div>
										<h4 class="vertical_item_title">
											<a href="#">네이비씰 승리의기술</a>
										</h4>
										<p class="vertical_item_editor">
											<a href="#">조코 윌링크, 레이프바빈</a>
										</p>
										<p class="vertical_item_rate">
											<span>평점</span><span class="favorite_item_reviewCount">9명</span>
										</p>
									</div>
								</div>
								<div class="vertical_item_box">
									<p class="favorite_item_img">
										<a><img
											src="<c:url value='resources/images/favorite_item1.jpg' />"></a>
									</p>
									<div>
										<h4 class="vertical_item_title">
											<a href="#">네이비씰 승리의기술</a>
										</h4>
										<p class="vertical_item_editor">
											<a href="#">조코 윌링크, 레이프바빈</a>
										</p>
										<p class="vertical_item_rate">
											<span>평점</span><span class="favorite_item_reviewCount">9명</span>
										</p>
									</div>
								</div>
								<div class="vertical_item_box">
									<p class="favorite_item_img">
										<a><img
											src="<c:url value='resources/images/favorite_item1.jpg' />"></a>
									</p>
									<div>
										<h4 class="vertical_item_title">
											<a href="#">네이비씰 승리의기술</a>
										</h4>
										<p class="vertical_item_editor">
											<a href="#">조코 윌링크, 레이프바빈</a>
										</p>
										<p class="vertical_item_rate">
											<span>평점</span><span class="favorite_item_reviewCount">9명</span>
										</p>
									</div>
								</div>
								<div class="vertical_item_box">
									<p class="favorite_item_img">
										<a><img
											src="<c:url value='resources/images/favorite_item1.jpg' />"></a>
									</p>
									<div>
										<h4 class="vertical_item_title">
											<a href="#">네이비씰 승리의기술</a>
										</h4>
										<p class="vertical_item_editor">
											<a href="#">조코 윌링크, 레이프바빈</a>
										</p>
										<p class="vertical_item_rate">
											<span>평점</span><span class="favorite_item_reviewCount">9명</span>
										</p>
									</div>
								</div>
								<div class="vertical_item_box">
									<p class="favorite_item_img">
										<a><img
											src="<c:url value='resources/images/favorite_item1.jpg' />"></a>
									</p>
									<div>
										<h4 class="vertical_item_title">
											<a href="#">네이비씰 승리의기술</a>
										</h4>
										<p class="vertical_item_editor">
											<a href="#">조코 윌링크, 레이프바빈</a>
										</p>
										<p class="vertical_item_rate">
											<span>평점</span><span class="favorite_item_reviewCount">9명</span>
										</p>
									</div>
								</div>
								<div class="vertical_item_box">
									<p class="favorite_item_img">
										<a><img
											src="<c:url value='resources/images/favorite_item1.jpg' />"></a>
									</p>
									<div>
										<h4 class="vertical_item_title">
											<a href="#">네이비씰 승리의기술</a>
										</h4>
										<p class="vertical_item_editor">
											<a href="#">조코 윌링크, 레이프바빈</a>
										</p>
										<p class="vertical_item_rate">
											<span>평점</span><span class="favorite_item_reviewCount">9명</span>
										</p>
									</div>
								</div>
								<div class="vertical_item_box">
									<p class="favorite_item_img">
										<a><img
											src="<c:url value='resources/images/favorite_item1.jpg' />"></a>
									</p>
									<div>
										<h4 class="vertical_item_title">
											<a href="#">네이비씰 승리의기술</a>
										</h4>
										<p class="vertical_item_editor">
											<a href="#">조코 윌링크, 레이프바빈</a>
										</p>
										<p class="vertical_item_rate">
											<span>평점</span><span class="favorite_item_reviewCount">9명</span>
										</p>
									</div>
								</div>
								<div class="vertical_item_box">
									<p class="favorite_item_img">
										<a><img
											src="<c:url value='resources/images/favorite_item1.jpg' />"></a>
									</p>
									<div>
										<h4 class="vertical_item_title">
											<a href="#">네이비씰 승리의기술</a>
										</h4>
										<p class="vertical_item_editor">
											<a href="#">조코 윌링크, 레이프바빈</a>
										</p>
										<p class="vertical_item_rate">
											<span>평점</span><span class="favorite_item_reviewCount">9명</span>
										</p>
									</div>
								</div>
								<div class="vertical_item_box">
									<p class="favorite_item_img">
										<a><img
											src="<c:url value='resources/images/favorite_item1.jpg' />"></a>
									</p>
									<div>
										<h4 class="vertical_item_title">
											<a href="#">네이비씰 승리의기술</a>
										</h4>
										<p class="vertical_item_editor">
											<a href="#">조코 윌링크, 레이프바빈</a>
										</p>
										<p class="vertical_item_rate">
											<span>평점</span><span class="favorite_item_reviewCount">9명</span>
										</p>
									</div>
								</div>
							</div>
							<div class="cate_select_modal">
								<form>
									<p class="cate_select_box">
										<span></span><span></span><span></span><span></span><span></span>
									</p>
									<ul class="cate_select_list">
										<li><input type="checkbox" id="cate_diction"
											value="diction"><label for="cate_diction"
											class="input_label"></label><label for="cate_diction">사전</label></li>
										<li><input type="checkbox" id="cate_literature"
											value="literature"><label for="cate_literature"
											class="input_label"></label><label for="cate_literature">문학</label></li>
										<li><input type="checkbox" id="cate_edu" value="edu"><label
											for="cate_edu" class="input_label"></label><label
											for="cate_edu">교육</label></li>
										<li><input type="checkbox" id="cate_child" value="child"><label
											for="cate_child" class="input_label"></label><label
											for="cate_child">아동</label></li>
										<li><input type="checkbox" id="cate_art" value="art"><label
											for="cate_art" class="input_label"></label><label
											for="cate_art">예체능</label></li>
										<li><input type="checkbox" id="cate_religion"
											value="religion"><label for="cate_religion"
											class="input_label"></label><label for="cate_religion">종교</label></li>
										<li><input type="checkbox" id="cate_magazine"
											value="magazine"><label for="cate_magazine"
											class="input_label"></label><label for="cate_magazine">잡지</label></li>
										<li><input type="checkbox" id="cate_politics"
											value="politics"><label for="cate_politics"
											class="input_label"></label><label for="cate_politics">정치</label></li>
										<li><input type="checkbox" id="cate_economy"
											value="economy"><label for="cate_economy"
											class="input_label"></label><label for="cate_economy">경제</label></li>
										<li><input type="checkbox" id="cate_humanities"
											value="humanities"><label for="cate_humanities"
											class="input_label"></label><label for="cate_humanities">인문</label></li>
										<li><input type="checkbox" id="cate_engineering"
											value="engineering"><label for="cate_engineering"
											class="input_label"></label><label for="cate_engineering">공학</label></li>
										<li><input type="checkbox" id="cate_nature"
											value="nature"><label for="cate_nature"
											class="input_label"></label><label for="cate_nature">자연</label></li>
										<li><input type="checkbox" id="cate_language"
											value="language"><label for="cate_language"
											class="input_label"></label><label for="cate_language">외국어</label></li>
										<li><input type="checkbox" id="cate_exam" value="exam"><label
											for="cate_exam" class="input_label"></label><label
											for="cate_exam">수험서</label></li>
									</ul>
									<p>
										<button class="clear_cate left" type="reset">초기화</button>
										<span class="right">
											<button class="cate_submit" type="submit">적용</button>
											<button class="cate_cancle">취소</button>
										</span>
									</p>
								</form>
							</div>
							<!-- 	<div class="cate_select_modal_wrap">
							</div> -->
						</article>
					</div>
				</div>
				<div class="content_full_wrap">
					<div class="container overhidden">
						<article id="notice_box">
							<div id="notice_title" class="aticle_title_layout">
								<h2>헤이북스 뉴스</h2>
								<span><a href=""><i class="fas fa-plus"></i></a></span>
							</div>
							<div class="notice_content">
								<div class="notice_content_top">
									<p class="left notice_recent_date">
										2019.11<span>23</span>
									</p>
									<div class="left notice_recent_content">
										<h4>
											<a>헤이북스 5주년 회원 수 3만명 돌파. 성원에 감사드립니다.</a>
										</h4>
										<p>헤이북스 5주년 회원 수 3만명 돌파. 성원에 감사드립니다.헤이북스 5주년 회원 수 3만명 돌파.</p>
									</div>
								</div>
								<div class="notice_content_bottom">
									<ul>
										<li><a>2019 상반기 이벤트 당첨자목록을 확인하세요.</a><span>2019-09-23</span></li>
										<li><a>2019 상반기 이벤트 당첨자목록을 확인하세요.</a><span>2019-09-23</span></li>
									</ul>
								</div>
							</div>
						</article>
						<article id="qna_box">
							<div id="qna_title" class="aticle_title_layout">
								<h2>자주묻는 질문</h2>
								<span><a href=""><i class="fas fa-plus"></i></a></span>
							</div>
							<div class="qna_content">
								<div class="qna_content_top">
									<p class="left qna_best_logo">
										QnA <span>BEST 5</span>
									</p>
									<form class="left qna_search_form">
										<input type="search">
										<button>검색</button>
									</form>
								</div>
								<div class="qna_content_bottom">
									<ul>
										<li><a>2019 상반기 이벤트 당첨자목록을 확인하세요.</a></li>
										<li><a>2019 상반기 이벤트 당첨자목록을 확인하세요.</a></li>
										<li><a>2019 상반기 이벤트 당첨자목록을 확인하세요.</a></li>
										<li><a>2019 상반기 이벤트 당첨자목록을 확인하세요.</a></li>
										<li><a>2019 상반기 이벤트 당첨자목록을 확인하세요.</a></li>
									</ul>
								</div>
							</div>
						</article>
					</div>
				</div>
			</div>
		</section>
		<footer> </footer>
	</div>
</body>
</html>







