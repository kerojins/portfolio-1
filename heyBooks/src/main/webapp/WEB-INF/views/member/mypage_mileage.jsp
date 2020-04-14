<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


		<div class="sub_right_box my_box_wrap mypage_order">
			<div class="sub_right_content">
					<h3 class="my_page_title" style="float: none;">포인트 적립</h3>
					<div class="order_period"> 
						<p class="order_period_title">기간별 조회</p>
						<div class="order_period_box">
							<form action="<c:url value='/mypage_mileage'/>" method="get">
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
							 </form> 
						</div> 
						<div class="my_mileage_count">
							<span class="my_mileage_count_title">적립 포인트</span>
							<input hidden="hidden" class="mileage_val" value="${mileage}">
							<p class="mileage_val_txt">${mileage}</p>
						</div>
					</div>  
					<div id="_listContentArea">
						<c:forEach var="month_list" items="${monthly_mile_list}" varStatus="status">
							<div class="tit_month">
								<h4>${year}.0${month_val_list[status.index]}</h4>
							</div>	  
							<ul class="list_area">  
								<c:forEach var="list" items="${month_list}" varStatus="status">
									<li class="list_item">    
										<div class="item
											<c:choose>
												<c:when test="${list.mileage_status eq '사용' }">sub</c:when>
												<c:when test="${list.mileage_status eq '적립' or list.mileage_status eq '취소'}">add</c:when>
												<c:when test="${list.mileage_status eq '적립예정' }">due</c:when>
											</c:choose>   
										 ">    
											<a href="<c:url value='/mypage_order_detail?order_num=${list.order_num}'/>" class="item_content">
												<div class="state_space point">
													<c:choose>   
														<c:when test="${list.mileage_status eq '사용' }">
															<span class="state _statusName">사용</span>
														</c:when>
														<c:when test="${list.mileage_status eq '적립' }">
															<span class="state _statusName">적립</span>
														</c:when>
														<c:when test="${list.mileage_status eq '취소' }">
															<span class="state _statusName">취소</span>
														</c:when>
														<c:otherwise>
													        <span class="state _statusName">적립예정</span>
														</c:otherwise>
													</c:choose> 
												</div>
												<div class="info_space">
													<c:set var="date" value="${list.mileage_date}"/> 
													<%--  수정 등록일 날짜,시간 표시  --%> 
													<%   
														Date date = (Date) pageContext.getAttribute("date");
														SimpleDateFormat sdate = new SimpleDateFormat("yyyy.MM.dd");
														String date_txt = sdate.format(date);
														pageContext.setAttribute("date_txt", date_txt); 
														
													%> 
													<span class="date">${date_txt}</span> 
														<c:choose>
															<c:when test="${list.mileage_status eq '사용' }">
																<strong class="title _titleName">결제 시 사용</strong>
															</c:when>
															<c:when test="${list.mileage_status eq '적립' }">
																<strong class="title _titleName">구매 적립</strong>
															</c:when>
															<c:when test="${list.mileage_status eq '취소' }">
																<strong class="title _titleName">사용 취소</strong>
															</c:when>
															<c:otherwise>
														       <strong class="title _titleName">구매 적립 예정</strong>
															</c:otherwise>
														</c:choose>
													<p class="subtext">상세</p>
												</div> 
											</a>
											<div class="amount_space">
												<div class="amount_inner">
													<input hidden="hidden" class="mileage_score_val" value="${list.mileage_score}">
													<span class="point">${list.mileage_score}원</span>
													<div class="func_area">
														<a href="<c:url value='/mileage_delete?mileage_num=${list.mileage_num}'/>" class="" >내역삭제</a>
													</div> 
												</div>  
											</div>
										</div> 
									</li>
								</c:forEach>
							</ul>
						</c:forEach>
				</div>
			</div>
		</div>

<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
 
<script type="text/javascript">
//마이페이지 - 주문 목록 조회 달력

$("#order_pre_date").datepicker({
    dayNamesMin:["일","월","화","수","목","금","토"], // 요일에 표시되는 형식 설정

    dateFormat:"yy-mm-dd", //날짜 형식 설정

    monthNames:["1월","2월","3월","4월","5월","6월","7월",

     "8월","9월","10월","11월","12월"], //월표시 형식 설정

    showAnim:"fold", //애니메이션효과

	maxDate: 0,
});

$("#order_ep_date").datepicker({
    dayNamesMin:["일","월","화","수","목","금","토"], // 요일에 표시되는 형식 설정

    dateFormat:"yy-mm-dd", //날짜 형식 설정

    monthNames:["1월","2월","3월","4월","5월","6월","7월",

     "8월","9월","10월","11월","12월"], //월표시 형식 설정

    showAnim:"fold", //애니메이션효과

	maxDate: 0, 
});


</script>




