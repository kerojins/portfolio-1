<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="sub_right_box my_box_wrap">
	<div class="sub_right_content">
		<div class="my_box">
			<div class="account_box">
				<h3 class="account_name">${member_vo.members_name}님</h3>
				<p class="account_id">${member_vo.members_id}</p>
				<a href="<c:url value='/member_logout'/>" class="logout_btn">로그아웃</a>
			</div>
			<div class="my_info">
				<ul>
					<li>
						<h4 class="my_info_title">
							<span class="my_info_icon"><i class="fas fa-truck"></i></span> <span
								class="my_info_title_txt">주문목록</span>
						</h4>
						<p class="my_info_count">
							<span>${order_count}</span>건
						</p> 
						<a href="<c:url value='/mypage_order'/>">
							<span class="my_info_btn">목록확인</span> 
						</a> 
						

					</li> 
					<li>
						<h4 class="my_info_title">
							<span class="my_info_icon">
								<i class="fas fa-coins"></i>
							</span> 
							<span class="my_info_title_txt">My포인트</span>
						</h4>
						<p class="my_info_count">
							<input hidden="hidden" class="mileage_val" value="${mileage_vo.mileage_total}">
							<span class="mileage_val_txt">${mileage_vo.mileage_total}</span>
						</p> 
						<a href="<c:url value='/mypage_mileage'/>">
								<span class="my_info_btn">내역확인</span>
						</a>
						
					</li>
					<li>
						<h4 class="my_info_title">
							<span class="my_info_icon"><i class="fas fa-bell"></i></span> <span
								class="my_info_title_txt">신간알림</span>
						</h4>
						<p class="my_info_count">
							<span>${new_item_count}</span>권
						</p> 
						<a href="<c:url value='/mypage_book_notice'/>">
							<span class="my_info_btn">알림확인</span> 
						</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="join_recent_wrap">
			<div class="join_recent_title aticle_title_layout">
				<h4>최근 본 책</h4>
				<span><a href="<c:url value='/mypage_recent'/>">전체보기</a></span>
			</div>
			<ul class="join_recent_list">
				<c:forEach var="list" items="${item_list}" varStatus="status">
					<li>
						<div class="vertical_item_box">
							<p class="favorite_item_img">
								<a href="<c:url value='/book_detail?product_num=${list.product_num}'/>"><img src="<c:url value ='/resources/upload/${list.product_picture}'/>"></a>
							</p> 
							<div> 
								<h4 class="vertical_item_title">
									<a href="<c:url value='/book_detail?product_num=${list.product_num}'/>">${list.product_name}</a>
								</h4>
								<p class="vertical_item_editor">
									<a href="<c:url value='/editor_detail?editor_num=${list.product_editor_num}'/>">${editor_list[status.index]}</a>
								</p> 
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>




