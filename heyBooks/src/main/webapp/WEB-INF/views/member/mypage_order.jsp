<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


		<div class="sub_right_box my_box_wrap mypage_order">
			<div class="sub_right_content">
				<form>
					<h3 class="my_page_title">주문 내역</h3>
					<div class="order_period">
						<p class="order_period_title">기간별 조회</p>
						<div class="order_period_box">
							<p class="order_period_btn">
								<a>최근 15일</a><a>1개월</a><a>2개월</a><a>3개월</a>
							</p>
							<input type="text" class="datepickers" placeholder="2019-09-22">
							~ <input type="text" class="datepickers" placeholder="2019-09-22">
							<a class="order_period_detail_btn" href="">조회</a>
						</div>
					</div>
					<table class="order_table">
						<tbody>
							<tr>
								<th width="17%">주문번호</th>
								<th width="42%">상품정보</th>
								<th width="10%">주문일자</th>
								<th width="16%">주문 금액</th>
								<th width="15%">주문 상태</th>
							</tr>
							<tr>
								<td class="order_item_count">
									<p>12164531</p>
								</td>
								<td class="order_item_info">
									<p class="order_item_img">
										<a href="<c:url value='/mypage_order_detail'/>"><img width="50"
											src="/sh/resources/images/list_item1.jpg"></a>
									</p> 
									<div class="order_item_title">
										<p class="order_item_title_txt">
											<a href="<c:url value='/mypage_order_detail'/>">대도시의 사랑법 외 3종</a>
										</p>

									</div>
								</td>
								<td class="order_item_mileage">
									<p>2019.09.30</p>
								</td>
								<td class="order_item_price">
									<p class="order_item_price_txt">53,320원</p>
								</td>
								<td class="order_item_allPrice">
									<p class="order_item_allPrice_txt">결제 완료</p>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>

<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<script type="text/javascript">
//마이페이지 - 주문 목록 조회 달력
	$(".datepickers").datepicker({
		 monthNamesShort:["1월","2월","3월","4월","5월","6월","7월",
	
			     "8월","9월","10월","11월","12월"], //월표시 형식 설정
			     
	    dayNamesMin:["일","월","화","수","목","금","토"], // 요일에 표시되는 형식 설정
	 
	    dateFormat:"yy-mm-dd", //날짜 형식 설정
	
	    showMonthAfterYear : true, // 년 뒤에 월 표시
	     
	    showAnim:"fold", //애니메이션효과
	    
	    changeMonth : true, // 월 변경가능
	    
	    changeYear : true, // 년 변경가능
	
		maxDate: 0,
	}); 
</script>




