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
					<li class="breadcrumb-item active" aria-current="page">신간 도서</li>
				</ol>
			</nav>
			<aside>
				<h2>신간 도서</h2>
				<div class="aside_content">
					<p>
						<a>국내 도서</a><i class="fas fa-plus" data-toggle="collapse"
							data-target="#collapseExample1" aria-expanded="false"
							aria-controls="collapseExample1"></i>
					</p>
					<ul class="collapse aside_menu_list" id="collapseExample1">
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
					<p>
						<a>외국 도서</a><i class="fas fa-plus" data-toggle="collapse"
							data-target="#collapseExample2" aria-expanded="false"
							aria-controls="collapseExample2"></i>
					</p>
					<ul class="collapse aside_menu_list" id="collapseExample2">
						<li><a href="#">일반 서적</a></li>
						<li><a href="#">전문 서적</a></li>
						<li><a href="#">컴퓨터</a></li>
					</ul>
				</div>
			</aside>
			<div class="sub_right_box">
				<h3 style="margin-bottom:0;">신간도서 </h3> 
				<div class="sub_right_content">
					<form class="new_book_form">
						<div class="itemList_top_menu">
							<div class="itemList_array_menu">
								<div class="array_select_list">
									<ul>
										<li><a>순위 높은 순</a></li>
										<li><a>전주대비 급상승</a></li>
										<li><a>발행일순</a></li>
										<li><a>상품명순</a></li>
										<li><a>평점순</a></li>
										<li><a>리뷰순</a></li>
									</ul>
								</div>
								<div class="item_all_choice">
									<span class="item_select_option"> 전체 <input
										type="checkbox" id="item_all_check"><label
										for="item_all_check" class="input_label"></label>
									</span> <a href="#" class="btn btn-primary">쇼핑카트 담기</a> <a href="#"
										class="btn btn-primary">서재 보관</a>
								</div>
							</div>

						</div>

						<div class="book_item_list_box">
							<ul class="book_item_list">
								<li class="book_item_box">
									<div class="book_item_box_left">
										<div class="book_item_imgBox">
											<p class="book_item_rank">1</p>
											<a href="#"> <img width="110"
												src="<c:url value='/resources/images/list_item1.jpg'/>"></a>
										</div>
										<div class="book_item_content">
											<h3 class="list_book_title">대도시의 사랑법</h3>
											<p class="book_info">
												<span class="review_icon"></span><span class="review_count">111명</span>
												<span class="book_editor">박상영</span> <span
													class="book_publising">창비</span> <span class="category">한국소설</span>
											</p>
											<p class="book_summary">여름밤, 나의 아름다운 도시, 어쩌면 너 때문에 젊은 소설의
												첨단, 박상영 신작 소설 2019년 젊은작가상 대상을 수상하고, 한권의 소설집(『알려지지 않은 예술가의
												눈물과 자이툰 파스타』)이 일약 수많은 독자들을 매료한 박상영의 연작소설 『대도시의...</p>
											<p class="book_price">
												가격 <span class="book_buy_price"><span>11,880</span>원</span><span
													class="discount_percent">(<span>10%</span>↓)
												</span><span class="origin_price"><span>13,200</span>원</span>
											</p>
										</div>
									</div>
									<div class="book_item_box_right book_item_check">
										<p class="item_select_option">
											<input type="checkbox" id="check_item1" class="item_checking"><label
												for="check_item1" class="input_label"></label><span
												style="font-size: 13px; margin-right: 5px; margin-top: 2px;">수량
											</span> <input type="text" id="cntVal" value="1" class="num"
												size="2" maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
												class="item_quantity"><a class="item_quantity_plus"><i
													class="fas fa-caret-up"></i></a><a class="item_quantity_minus"><i
													class="fas fa-caret-down"></i></a></span>
										</p>
										<a href="#" class="buy_btn item_right_btn">바로 구매</a> <a
											href="#" class="cart_btn item_right_btn">쇼핑카트 담기</a> <a
											href="#" class="library_btn item_right_btn">서재 보관</a>
									</div>
								</li>
							</ul>
						</div>
					</form>
					<ul class="pagination item_pagenum">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>  
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>







