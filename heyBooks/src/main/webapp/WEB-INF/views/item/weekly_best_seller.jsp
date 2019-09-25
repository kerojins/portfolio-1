<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="content_full_wrap sub_wrap" id="best_seller_box">
	<div class="container overhidden">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">홈</a></li>
				<li class="breadcrumb-item active" aria-current="page">베스트셀러</li>
			</ol>
		</nav>
		<aside>
			<h2>베스트셀러</h2>
			<div class="aside_content">
				<p>
					<a>종합 베스트</a>
				</p>
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
		<div class="sub_right_box best_seller_right">
			<h3>종합 베스트 셀러</h3>
			<ul class="nav nav-tabs best_seller_nav">
				<li class="nav-item"><a class="nav-link active"
					href="<c:url value='weekly_best_seller'/>">주간 베스트셀러</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='monthly_best_seller'/>">월간 베스트셀러</a></li>
			</ul>
			<div class="sub_right_content">
				<form class="best_seller_date_form">
					<div class="itemList_top_menu">
						<div class="best_seller_date">
							<select class="form-control">
								<option value="2018">2017년</option>
								<option value="2017">2018년</option>
								<option value="2019" selected>2019년</option>
							</select> <select class="form-control">
								<option selected>선택</option>
								<option value="6">6월</option>
								<option value="7">7월</option>
								<option value="8" selected>8월</option>
							</select> <select class="form-control">
								<option selected>선택</option>
								<option value="1">1주</option>
								<option value="2">2주</option>
								<option value="3" selected>3주</option>
							</select>
							<button type="submit" class="btn btn-primary">검색</button>
						</div>
						<div class="item_all_choice">
							<span class="item_select_option"> 전체 <input
								type="checkbox" id="item_all_check"><label
								for="item_all_check" class="input_label"></label>
							</span> <a href="#" class="btn btn-primary">쇼핑카트 담기</a> <a href="#"
								class="btn btn-primary">위시리스트</a>
						</div>
					</div>
					<div class="itemList_array_menu">
						<ul class="pagination pagination-sm">
							<li class="page-item active" aria-current="page"><span
								class="page-link"> 1~20위 <span class="sr-only">(current)</span>
							</span></li>
							<li class="page-item"><a class="page-link" href="#">21~40위</a></li>
							<li class="page-item"><a class="page-link" href="#">41~60위</a></li>
							<li class="page-item"><a class="page-link" href="#">61~80위</a></li>
							<li class="page-item"><a class="page-link" href="#">81~100위</a></li>
						</ul>
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
					</div>
					<div class="book_item_list_box">
						<ul class="book_item_list">
							<li class="book_item_box">
								<div class="book_item_box_left">
									<div class="book_item_imgBox">
										<p class="book_item_rank">1</p>
										<a href="<c:url value='/book_detail'/>"> <img width="110"
											src="<c:url value='/resources/images/list_item1.jpg'/>"></a>
									</div>
									<div class="book_item_content">
										<p class="item_tag">
											<span class="discount_tag">할인도서</span><span
												class="parcel_tag">무료배송</span>
										</p>
										<h3 class="list_book_title">
											<a href="<c:url value='/book_detail'/>">대도시의 사랑법</a>
										</h3>
										<p class="book_info">
											평점<span class="star_before"><span class="star_after"></span></span><span
												class="item_reviewCount">9명</span> <span class="book_editor"><a>박상영</a></span>
											<span class="book_publising"><a>창비</a></span> <span
												class="category"><a>한국소설</a></span>
										</p>
										<p class="book_summary">여름밤, 나의 아름다운 도시, 어쩌면 너 때문에 젊은 소설의
											첨단, 박상영 신작 소설 2019년 젊은작가상 대상을 수상하고, 한권의 소설집(『알려지지 않은 예술가의 눈물과
											자이툰 파스타』)이 일약 수많은 독자들을 매료한 박상영의 연작소설 『대도시의...</p>
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
										</span> <input type="text" name="qnt" value="1" class="num" size="2"
											maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
											class="item_quantity"><a class="item_quantity_plus"><i
												class="fas fa-caret-up"></i></a><a class="item_quantity_minus"><i
												class="fas fa-caret-down"></i></a></span>
									</p>
									<a href="#" class="buy_btn item_right_btn">바로 구매</a> <a
										href="#" class="cart_btn item_right_btn">쇼핑카트 담기</a> <a
										href="#" class="library_btn item_right_btn">위시리스트</a>
								</div>
							</li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>




