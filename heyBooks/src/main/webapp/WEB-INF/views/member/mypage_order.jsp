<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


		<div class="sub_right_box my_box_wrap mypage_order">
			<div class="sub_right_content">
					<h3 class="my_page_title" style="float: none;">주문 내역</h3>
					<div class="order_period">
						<form action="<c:url value='/mypage_order'/>" method="get">
							<p class="order_period_title">기간별 조회</p>
							<div class="order_period_box">
								<table class="sf-option-table">
									<colgroup>
										<col width="80">
										<col width="230">
										<col width="80">
										<col>
									</colgroup>
									<tbody>
										<tr>  
											<td>
											<span class="btn small">  
												<input type="button" value="오늘" id="today" class="select_date"> 
											</span> 
											<span class="btn small">
												<input type="button" value="일주일" id="1week" class="select_date">
											</span> 
											<span class="btn small">
												<input type="button" value="1개월" id="1month" class="select_date">
											</span> 
											<span class="btn small">
												<input type="button" value="3개월" id="3month" class="select_date">
											</span>  
											<span class="btn small">
												<input type="button" value="전체" id="all_day" class="select_date">
											</span>
											</td>
										</tr>
										<tr>
											<td colspan="5"> 
												<input type="text" maxlength="10" size="10" value="" name="search_date" class="datepickers start_day" >
												<img class="ui-datepicker-trigger" src="/sh/resources/images/icon_calendar.gif"> &nbsp;
												<span class="gray">-</span>&nbsp;
												<input type="text" maxlength="10" size="10" value="" name="search_end_date" class="datepickers end_day">
												<img class="ui-datepicker-trigger" src="/sh/resources/images/icon_calendar.gif"> &nbsp;&nbsp; 
												<input type="submit" class="order_period_btn" value="검색">
											</td> 
										</tr> 
									</tbody> 
								</table>
							</div>
						</form> 
					</div> 
					<table class="order_table">
						<tbody>
							<tr>
								<th width="14%">주문번호</th>
								<th width="52%">상품정보</th>
								<th width="10%">주문일자</th>
								<th width="14%">결제 금액</th>
								<th width="12%">주문 상태</th>
							</tr>
							<c:forEach var="list" items="${order_list}">
								<tr>
								<td class="order_item_count">
									<p>${list.ORDER_NUM}</p>
								</td>
								<td class="order_item_info">
									<p class="order_item_img">
										<a href="<c:url value='/mypage_order_detail'/>">
										<img width="50" src="<c:url value='/resources/upload/${list.PRODUCT_IMG}'/>"></a>
									</p>  
									<div class="order_item_title"> 
										<p class="order_item_title_txt">
											<a href="<c:url value='/mypage_order_detail?order_num=${list.ORDER_NUM}'/>">${list.PRODUCT_NAME} ${list.TOTAL_COUNT}</a>
										</p>
									</div>  
								</td>  
								<td class="order_item_mileage">
										<c:set var="date" value="${list.ORDER_DATE}"/> 
										<%--  수정 등록일 날짜,시간 표시  --%> 
										<%  
											Date date = (Date) pageContext.getAttribute("date");
											SimpleDateFormat sdate = new SimpleDateFormat("yyyy.MM.dd");
											String date_txt = sdate.format(date);
											pageContext.setAttribute("date_txt", date_txt); 
											
										%> 
									<p>${date_txt}</p>
								</td>
								<td class="order_item_price">
									<p class="order_item_price_txt">${list.TOTAL_PRICE}원</p>
								</td>
								<td class="order_item_status">
									<p class="">${list.ORDER_STATUS}</p>
									<c:if test="${list.ORDER_STATUS eq '배송완료' }">
										<a class="select_order_btn" href="<c:url value='/order_status_update?order_num=${list.ORDER_NUM}&order_status=구매확정'/>">구매확정</a>
									</c:if>
									  
								</td>  
							</tr>   
							</c:forEach>
						</tbody>
					</table>
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




