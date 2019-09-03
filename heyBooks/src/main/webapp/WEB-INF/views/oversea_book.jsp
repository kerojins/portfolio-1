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
	<div class="content_full_wrap sub_wrap" id="best_seller_box">
		<div class="container overhidden">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">홈</a></li>
					<li class="breadcrumb-item active" aria-current="page">외국 도서</li>
				</ol>
			</nav>
			<aside>
				<h2>외국 도서</h2>
				<ul class="aside_menu_list">
					<li><a href="#">소설</a></li>
					<li><a href="#">시/에세이</a></li>
					<li><a href="#">경제/경영</a></li>
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
			</aside>
			<div class="sub_right_box">
				<div class="category_array_box">
					<h4>새로나온 책</h4>
					<div class="section on">
						<h5>
							<a>소설</a>
						</h5>
						<div class="section_content">
							<ul>
								<li><div class="vertical_item_box">
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
									</div></li>
								<li><div class="vertical_item_box">
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
									</div></li>
								<li><div class="vertical_item_box">
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
									</div></li>
								<li><div class="vertical_item_box">
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
									</div></li>
								<li><div class="vertical_item_box">
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
									</div></li>
							</ul>
						</div>
					</div>
					<div class="section">
						<h5>
							<a>시/에세이</a>
						</h5>
						<div class="section_content">
							<ul>
								<li>경제/인문 짜쟝</li>
							</ul>
						</div>
					</div>
					<div class="section">
						<h5>
							<a>경제/경영</a>
						</h5>
						<div class="section_content">
							<ul>
								<li>유아/인문 짜쟝</li>
							</ul>
						</div>
					</div>
					<div class="section">
						<h5>
							<a>자기계발</a>
						</h5>
						<div class="section_content">
							<ul>
								<li>유아/인문 짜쟝</li>
							</ul>
						</div>
					</div>
					<div class="section">
						<h5>
							<a>어린이</a>
						</h5>
						<div class="section_content">
							<ul>
								<li>유아/인문 짜쟝</li>
							</ul>
						</div>
					</div>
					<div class="section last_section">
						<h5>
							<a>종교</a>
						</h5>
						<div class="section_content">
							<ul>
								<li>유아/인문 짜쟝</li>
							</ul>
						</div>
					</div>
					<span class="more_view"><a>+더보기</a></span>
				</div>
				<div class="category_array_box">
					<h4>베스트 셀러</h4>
					<div class="section on">
						<h5>
							<a>소설</a>
						</h5>
						<div class="section_content">
							<ul>
								<li><div class="vertical_item_box">
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
									</div></li>
								<li><div class="vertical_item_box">
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
									</div></li>
								<li><div class="vertical_item_box">
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
									</div></li>
								<li><div class="vertical_item_box">
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
									</div></li>
								<li><div class="vertical_item_box">
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
									</div></li>
							</ul>
						</div>
					</div>
					<div class="section">
						<h5>
							<a>시/에세이</a>
						</h5>
						<div class="section_content">
							<ul>
								<li>경제/인문 짜쟝</li>
							</ul>
						</div>
					</div>
					<div class="section">
						<h5>
							<a>경제/경영</a>
						</h5>
						<div class="section_content">
							<ul>
								<li>유아/인문 짜쟝</li>
							</ul>
						</div>
					</div>
					<div class="section">
						<h5>
							<a>자기계발</a>
						</h5>
						<div class="section_content">
							<ul>
								<li>유아/인문 짜쟝</li>
							</ul>
						</div>
					</div>
					<div class="section">
						<h5>
							<a>어린이</a>
						</h5>
						<div class="section_content">
							<ul>
								<li>유아/인문 짜쟝</li>
							</ul>
						</div>
					</div>
					<div class="section last_section">
						<h5>
							<a>종교</a>
						</h5>
						<div class="section_content">
							<ul>
								<li>유아/인문 짜쟝</li>
							</ul>
						</div>
					</div>
					<span class="more_view"><a>+더보기</a></span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>







