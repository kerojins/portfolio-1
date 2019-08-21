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
						<h1>HEYBOOKS</h1>
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
							<li><a href="#">BEST</a></li>
							<li><a href="#">신간</a></li>
							<li><a href="#">국내도서</a></li>
							<li><a href="#">해외도서</a></li>
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
								<li><a href="#">사전</a></li>
								<li><a href="#">문학</a></li>
								<li><a href="#">학습</a></li>
								<li><a href="#">아동(어린이)</a></li>
								<li><a href="#">예체능</a></li>
								<li><a href="#">종교</a></li>
								<li><a href="#">잡지</a></li>
								<li><a href="#">정치,법률</a></li>
								<li><a href="#">경제,경영</a></li>
								<li><a href="#">인문</a></li>
								<li><a href="#">외국어</a></li>
								<li><a href="#">공학</a></li>
								<li><a href="#">자연</a></li>
								<li><a href="#">수험서</a></li>
							</ul>
						</div>
						<div id="header_bottom_right" class="col-md-6">
							<h3>해외도서</h3>
							<a href="#" class="all_view_rink"><i
								class="fas fa-angle-right"></i> 전체보기</a>
							<ul>
								<li><a href="#">일반서적</a></li>
								<li><a href="#">전문서적</a></li>
								<li><a href="#">컴퓨터</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div id="books_contents">
		<%--  메인배너  --%>
		<section id="main_banner">
			<div id="carouselExampleIndicators" class="carousel2 slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active"
						style="background: rgb(29, 161, 243);">
						<img title="sns이벤트 배너"
							src="<c:url value='/resources/images/main_slide1.jpg'/>"
							class="d-block w-100" alt="sns이벤트 배너">
					</div>
					<div class="carousel-item" style="background: rgb(104, 89, 56)">
						<img title="책 토지 이벤트 배너"
							src="<c:url value='/resources/images/main_slide2.jpg'/>"
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
		<%-- 새로운 책 --%>
		<section id="book_contents" class="container">
			<article id="new_books" class="left">
				<h2>새로나온 책</h2>
				<div class="bxslider">
					<div>
						<div class="new_books_img left">
							<img src="<c:url value='/resources/images/new_books1.jpg'/>">
						</div>
						<dl class="new_books_content left">
							<dt>책 제목</dt>
							<dd>가격가격</dd>
							<dd>책내용내용내용책내용내용내용책내용내용내용책내용내용내용책내용내용내용</dd>
						</dl>
					</div>
					<div></div>
					<div></div>
				</div>

			</article>
			<article id="news_event" class="right">
				<h2>NEWS EVENT</h2>
			</article>
		</section>
	</div>
</body>
</html>







