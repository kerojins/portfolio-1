<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
				<c:forEach var="oversea_vo" items="${oversea_vo}">
					<li><a href='<c:url value="/medium_category_book?cate_ref1=${oversea_vo.cate_ref1}&cate_name=${oversea_vo.cate_name}"/>'>${oversea_vo.cate_name}</a></li>
				</c:forEach> 
			</ul> 
		</aside> 
		<div class="sub_right_box">
			<div class="national_category_box">
				<div id="category_new_books">
					<h4>신간 도서</h4>
					<div class="category_new_books_slide">
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

							</div>
						</div>
					</div>
				</div>
				<div id="category_best"> 
					<h4>베스트 셀러</h4>
					<ul class="book_item_list">
						<li class="book_item_box">
							<div class="book_item_box_left">
								<div class="book_item_imgBox">
									<p class="book_item_rank">1</p>
									<a href="#"> <img width="60"
										src="/sh/resources/images/list_item1.jpg"></a>
								</div>
								<div class="book_item_content">
									<h6 class="list_book_title"><a>대도시의 사랑법</a></h6>
									<p class="book_info">
										<span class="book_editor">박상영</span>
										<span class="book_publising">창비</span> 
									</p>
									
									<p class="book_price">
										<span class="book_buy_price"><span>11,880</span>원</span>
									</p>
								</div>
							</div>
						</li>
						<li class="item_other_list"><span>2</span><p><a>빼앗긴 들에 봄은 오는가</a></p></li>
						<li class="item_other_list"><span>3</span><p><a>나의 라임 오렌지나무</a></p></li>
						<li class="item_other_list"><span>4</span><p><a>세상에 이런일이 있네</a></p></li>
						<li class="item_other_list"><span>5</span><p><a>세상에 이런일이 있네</a></p></li>
						<li class="item_other_list"><span>6</span><p><a>세상에 이런일이 있네</a></p></li>
					</ul> 
				</div> 
			</div>

			<div class="category_array_box">
				<h4>분야별 TOP5</h4>
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
											평점<span class="star_before"><span class="star_after"></span></span><span
												class="item_reviewCount">9명</span>
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
											평점<span class="star_before"><span class="star_after"></span></span><span
												class="item_reviewCount">9명</span>
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
											평점<span class="star_before"><span class="star_after"></span></span><span
												class="item_reviewCount">9명</span>
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
											평점<span class="star_before"><span class="star_after"></span></span><span
												class="item_reviewCount">9명</span>
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
											평점<span class="star_before"><span class="star_after"></span></span><span
												class="item_reviewCount">9명</span>
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







