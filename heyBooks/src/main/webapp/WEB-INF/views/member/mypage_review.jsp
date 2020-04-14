<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="sub_right_box my_box_wrap">
	<div class="sub_right_content">
		<div class="join_recent_wrap">
			<h3 class="my_page_title">리뷰관리</h3>
			<ul class="review_list">
				<c:forEach var="list" items="${review_list}" varStatus="status">
					<li class="review_list_box"> 
						<div class="review_list_box_content">
							<div class="review_list_left"> 
								<span class="review_item">${item_list[status.index].product_name}</span>
								<div class="star_box">
									<span class="star_before review_list_star_before"> 
										<input hidden="hidden" class="grade_list_val" value="${list.review_grade}">
										<span class="star_after"></span>
									</span>  
								</div> 
								<p> 
									<c:set var="date" value="${list.review_date}"/> 
									<%--  수정 등록일 날짜,시간 표시  --%> 
									<%  
										Date date = (Date) pageContext.getAttribute("date");
										SimpleDateFormat sdate = new SimpleDateFormat("yyyy.MM.dd");
										String date_txt = sdate.format(date); 
										pageContext.setAttribute("date_txt", date_txt); 
										
									%> 
									<span class="review_date">${date_txt}</span>
								</p>
							</div>
							<div class="review_list_right">
								<p class="review_content">
									${list.review_content}
								</p>
								<p class="review_list_btn">
									<span class="review_modi_btn"><a>수정</a></span> 
									<span class="review_del_btn"><a href="<c:url value='/review_delete?review_num=${list.review_num}&product_num=${list.product_num}&update_from=mypage_review'/>">삭제</a></span>
								</p>
							</div>  
						</div> 
						<div class="review_modify_box">
							<form class="review_modify_form" action="<c:url value='/review_update'/>" method="post">
								<input hidden="hidden" name="review_num" value="${list.review_num}">
								<input hidden="hidden" name="product_num" value="${list.product_num}">
								<input hidden="hidden" name="members_num" value="${list.members_num}">
								<input hidden="hidden" name="update_from" value="mypage_review">
								<div class="review_list_left">     
									<span class="review_item">${item_list[status.index].product_name}</span>
									<div class="reviewStars-input">
										<input id="star${status.count}-4" type="radio" <c:if test="${list.review_grade eq 5}">checked="checked"</c:if> value="5" name="review_grade"> 
										<label title="gorgeous" for="star${status.count}-4"></label> 
										<input id="star${status.count}-3" type="radio" <c:if test="${list.review_grade eq 4}">checked="checked"</c:if> value="4" name="review_grade">  
										<label title="good" for="star${status.count}-3"></label> 
										<input id="star${status.count}-2" type="radio" <c:if test="${list.review_grade eq 3}">checked="checked"</c:if> value="3" name="review_grade">  
										<label title="regular" for="star${status.count}-2"></label>
										<input id="star${status.count}-1" type="radio" <c:if test="${list.review_grade eq 2}">checked="checked"</c:if> value="2" name="review_grade">  
										<label title="poor" for="star${status.count}-1"></label> 
										<input id="star${status.count}-0" type="radio" <c:if test="${list.review_grade eq 1}">checked="checked"</c:if> value="1" name="review_grade">
										<label title="bad" for="star${status.count}-0"></label>  
									</div>      
									<p>      
										<span class="review_date">${date_txt}</span> 
									</p> 
								</div> 
								<div class="review_list_right modify_review">
									<p class="review_content"> 
										<textarea name="review_content" rows="5">${list.review_content}</textarea>
									</p>   
									<p class="item_select_option"> 
										<input type="checkbox" id="check_spoiler${status.count}" name="review_spoiler" class="item_checking" value="있음" <c:if test="${list.review_spoiler eq '있음'}">checked="checked"</c:if>>
										<label for="check_spoiler${status.count}" class="input_label"></label>
										<label for="check_spoiler${status.count}" style="font-size: 14px; margin-right: 5px; margin-top: 2px; color: #595e63;">
											스포일러가 있습니다. 
										</label> 
									</p>    
									<p class="review_list_btn">
										<span class="review_del_btn"><a>취소</a></span> 
										<span class=""><input type="submit" value="수정완료"></span>
									</p>
								</div> 
							</form>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<%-- 페이지 네비게이션 --%> 
				<ul class="pagination item_pagenum">
					<li class="page-item">  
						<c:choose>
							<c:when test="${(util.startPageNum%util.pageBlockCount==1) && (util.startPageNum>util.pageBlockCount)}">
								<a class="page-link" aria-label="Previous" href="<c:url value='/mypage_review?pageNum=${util.startPageNum-1}&list_arr=${list_arr}&rowCount=${rowCount}'/>">
									<span aria-hidden="true">«</span>
								</a>
							</c:when>     
							<c:otherwise>
								<a class="page-link" aria-label="Previous" href="<c:url value='/mypage_review?pageNum=${util.pageNum-1}&list_arr=${list_arr}&rowCount=${rowCount}'/>">
								<span aria-hidden="true">«</span>
								</a> 
							</c:otherwise> 
						</c:choose>   
					</li> 
					<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
						<c:choose> 
							<c:when test="${util.pageNum==i }"> 
								<li class="page-item" id="page_ck" >
									<a class="page-link" href="<c:url value='/mypage_review?pageNum=${i}&list_arr=${list_arr}&rowCount=${rowCount}'/>">${i}</a>
								</li>
							</c:when> 
							<c:otherwise> 
								<li class="page-item">
									<a class="page-link" href="<c:url value='/mypage_review?pageNum=${i}&list_arr=${list_arr}&rowCount=${rowCount}'/>">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>   
					</c:forEach>     
					<li class="page-item">
						<c:choose>
							<c:when test="${util.pageNum < util.totalPageCount}">
								<a class="page-link"   href="<c:url value='/mypage_review?pageNum=${util.pageNum+1}&list_arr=${list_arr}&rowCount=${rowCount}'/>" aria-label="Next"> 
									<span aria-hidden="true">»</span>
								</a>
							</c:when>   
							<c:otherwise>
								<a class="page-link" href="">  
									<span aria-hidden="true">»</span>
								</a>  
							</c:otherwise> 
						</c:choose> 
					</li>    
				</ul>
	</div>
</div>




