<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<div id="item_detail">
	<div class="container">
		<div class="item_detail_box">
			<div class="item_detail_head">
				<div class="item_detail_head_left">
					<p>
						<c:set var="img" value="${item_vo.product_picture}"/>
						<% 
							String img_txt = (String)pageContext.getAttribute("img");
							if(img_txt != null){
								String img_name = img_txt.split(",")[1];
								pageContext.setAttribute("img_name", img_name);
							}
						%>
						<img src="<c:url value='/resources/upload/${img_name}'/>">
					</p>
					<span class="preview_btn">미리보기</span>
				</div>
				<div class="item_detail_head_right">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">${cate_info_list[1].cate_name}</a></li>
							<li class="breadcrumb-item active" aria-current="page">${cate_info_list[2].cate_name}</li>
						</ol>
					</nav>
					<h2>${item_vo.product_name}</h2>
					<p class="star_box">
						<span class="star_before detail_item_star_before">
							<input hidden="hidden" class="detail_item_star_val" value="${item_vo.product_grade}">
							<span class="star_after"></span> 
						</span> 
						<span class="item_starCount">${item_vo.product_grade}점</span> 
						<span class="item_reviewCount"> (${review_cnt}명)</span>
					</p>
					<p class="item_detail_editor">
						<span>${editor_vo.editor_name}</span>저
					</p>
					<p class="item_detail_publishing">
						<span>${item_vo.product_publish}</span>출판
					</p>
					<p class="item_detail_pageCount">
						<span>페이지</span> ${item_vo.product_page}p
					</p>
					<table class="item_detail_table">
						<tbody>
							<tr>
								<th rowspan="4">구매</th>
								<td>배송료</td>
								<td>${item_vo.product_shipping_charge}원</td>
							</tr>
							<tr>
								<td>적립금</td>
								<td class="detail_mileage_txt">
									<input class="detail_price_val" value="${item_vo.product_discount_price}" hidden="hidden">
								</td>
							</tr>
							<tr>
								<td>판매가</td>
								<td><p class="book_price">
										<span class="book_buy_price"><span>${item_vo.product_discount_price}</span>원</span><span
											class="discount_percent">(<span>${item_vo.product_discount}%</span>↓)
										</span><span class="origin_price"><span>${item_vo.product_price}</span>원</span>
									</p></td>
							</tr>
							<tr>
								<td style="padding-bottom: 15px;">수량</td>
								<td>
									<p class="item_select_option">
										<input type="text" hidden="hidden" value="${item_vo.product_num}" class="item_num">
										<input type="text" name="qnt" value="1" class="num" size="2" maxlength="2" onkeydown="onlyNumber();" onkeyup="">
										<span class="item_quantity">  
											<a class="item_quantity_plus">
												<i class="fas fa-caret-up" aria-hidden="true"></i>
											</a>
											<a class="item_quantity_minus">
												<i class="fas fa-caret-down" aria-hidden="true"></i>
											</a>
										</span>
									</p>
								</td>  
							</tr>
						</tbody>
					</table>
					<div class="button_wrap">
						<a class="wishlist_btn" sel-id="detail_buy">
							<i class="fas fa-heart"></i>
						</a> 
						<a class="cart_btn" sel-id="detail_buy">
							<i class="fas fa-shopping-cart"></i>
						</a>
						<a class="buy_btn" sel-id="detail_buy">구매하기</a>
					</div> 
				</div>
			</div>
			<div class="item_detail_content">
				<div class="item_detail_middle_box book_about resize_box">
					<h3>책 소개</h3>
					<div>
						${item_vo.product_discription}
					</div>
				</div>
				<div class="item_detail_middle_box editor_info">
					<h3>저자 프로필</h3>
					<div class="editor_info_content">
						<h4>${editor_vo.editor_name}</h4>
						<ul>
							<li>
								<span class="editor_info_list_title">국적</span> 
								<span class="editor_info_list_content">${editor_vo.editor_nation}</span>
							</li>
							<li>
								<span class="editor_info_list_title">출생</span> 
								<span class="editor_info_list_content">
								<c:choose>
									<c:when test="${editor_birth_arr != null}">
										${editor_birth_arr[0]}년 ${editor_birth_arr[1]}월 ${editor_birth_arr[2]}일
									</c:when>
									<c:otherwise>
										불명
									</c:otherwise>
								</c:choose>
								</span>
							</li>
							<c:if test="${eidtor_school ne ''}">
								<li>
									<span class="editor_info_list_title">학력</span> 
									<span class="editor_info_list_content"> 
										${editor_school}
									</span> 
								</li>
							</c:if>
							<c:if test="${eidtor_award ne ''}">
							<li> 
								<span class="editor_info_list_title">수상</span> 
								<span class="editor_info_list_content"> 
									${editor_award}
								</span> 
							</li> 
							</c:if> 
						</ul>
					</div>
					<div class="editor_book_list">
						<h5>대표 저서</h5> 
						<ul>
							<c:forEach var="list" items="${editor_item_list}" begin="0" end="5">
							<li>   
								<div class="vertical_item_box"> 
										<p class="favorite_item_img"> 
											<c:if test="${list.PRODUCT_PICTURE != null}">
												<c:set var="img" value="${list.PRODUCT_PICTURE}"/>
												<% 
													String img_txt2 = (String)pageContext.getAttribute("img");
													if(img_txt2 != null){
														String img_name = img_txt2.split(",")[0];
														pageContext.setAttribute("img_name", img_name); 
													}
												%>   
											</c:if>
											<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">
												<img src="<c:url value='/resources/upload/${img_name}'/>" style="width:80px; heigth: 118px">
											</a> 
										</p> 
										<div>
											<h4 class="vertical_item_title">
												<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">${list.PRODUCT_NAME}</a>
											</h4> 
											<p class="vertical_item_editor">
												<a href="#">${list.EDITOR_NAME }</a>
											</p>
											<p class="vertical_item_rate">
												<span class="star_before item_list_star_before"> 
													<input hidden="hidden" class="item_star_val" value="${list.PRODUCT_GRADE}" >
													<span class="star_after"></span>
												</span>  
												<span class="item_reviewCount">${list.REVIEW_CNT}명</span>
											</p>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>

					</div>
				</div>
				<div class="item_detail_middle_box editor_about">
					<h3>저자 소개</h3>
					<div>${editor_vo.editor_introduce }</div>
				</div>
				<div class="item_detail_middle_box book_index">
					<h3>목차</h3>
					<div>${item_index}</div>
				</div> 
				<div class="book_review">
					<h3>리뷰</h3> 
						<div class="book_review_box">
								<%-- 리뷰 등록 --%>
								<c:choose>
									<c:when test="${review_vo == null }">
										<form class="review_form" action="<c:url value='/review_insert'/>" method="post">
											<div class="book_review_write">
												<input hidden="hidden" name="product_num" value="${item_vo.product_num}">
												<input hidden="hidden" name="members_num" value="${member_vo.members_num}">
												<div class="star_box">
													<p class="small_caption">이 책의 별점</p>
													<p class="count_txt">${item_vo.product_grade}</p>
													<span class="star_before review_item_star_before" style="width:90px; height:18px">
														<input hidden="hidden" class="review_item_star_val" value="${item_vo.product_grade}">
														<span class="star_after"></span>
													</span>  
												</div>
												<div class="reviewStars-input">  
													<p class="caption">별점을 체크해주세요</p>
													<input id="star-4" type="radio" value="5" name="review_grade" /> 
													<label title="gorgeous" for="star-4"></label> 
													<input id="star-3" type="radio" value="4" name="review_grade" /> 
													<label title="good" for="star-3"></label> 
													<input id="star-2" type="radio" value="3" name="review_grade" /> 
													<label title="regular" for="star-2"></label> 
													<input id="star-1" type="radio" value="2" name="review_grade" /> 
													<label title="poor" for="star-1"></label> 
													<input id="star-0" checked ="checked"  type="radio" value="1" name="review_grade" />
													<label title="bad" for="star-0"></label>  
												</div>  
												<div class="textarea_wrap"> 
													<textarea class="review_write" name="review_content"></textarea>
													<p class="item_select_option">
														<input type="checkbox" id="check_spoiler" name="review_spoiler" value="있음" class="item_checking">
														<label for="check_spoiler" class="input_label"></label>
														<label for="check_spoiler" style="font-size: 14px; margin-right: 5px; margin-top: 2px; color: #595e63;">
															스포일러가 있습니다. 
														</label>
														<button type="submit" class="btn review_btn">리뷰 남기기</button>
													</p>
												</div>
											</div>
										</form> 
									</c:when>
									<c:otherwise>
										<%-- 리뷰 남긴 경우 --%>
										<div class="book_review_write my_review_write">
											<div class="star_box">
												<p class="small_caption">이 책의 별점</p>
												<p class="count_txt">${item_vo.product_grade}</p>
												<span class="star_before review_item_star_before" style="width:90px; height:18px">
														<input hidden="hidden" class="review_item_star_val" value="${item_vo.product_grade}">
														<span class="star_after"></span>
												</span>  
											</div>
											<div class="reviewStars-input">
												<p class="caption">
													<input hidden="hidden" class="review_grade_val" value="${review_vo.review_grade}">
													내가 남긴 별점
													<span>${review_vo.review_grade }.0</span>
												</p>
												<span class="star_before review_star_before" >
													<span class="star_after"></span>
												</span>
											</div> 
										</div> 
										<div class="review_list_box my_review_box">
											<div class="review_list_box_content">
												<div class="review_list_left">
													<p>   
													<c:set var="date1" value="${review_vo.review_date}"/>
													<%  
														Date date1 = (Date) pageContext.getAttribute("date1");
														SimpleDateFormat sdate1 = new SimpleDateFormat("yyyy.MM.dd");
														String date_txt1 = sdate1.format(date1);
														pageContext.setAttribute("date_txt1", date_txt1); 
													%> 
													<span class="review_date">${date_txt1}</span>
													</p>
												</div>
												<div class="review_list_right">
													<p class="review_content">${review_vo.review_content}</p>
													<p class="review_list_btn review_btn_left">
														<span class="review_modi_btn">
															<a>수정</a>
														</span>  
														<span class="review_del_btn">
															<a href="<c:url value='/review_delete?review_num=${review_vo.review_num}&product_num=${item_vo.product_num}'/>">삭제</a>
														</span> 
													</p> 
													<p class="review_list_btn">
														<span class="review_reply_btn" list_num="${review_vo.review_num}" member_num="${member_vo.members_num}">
															<i class="fas fa-comment"></i> 댓글 
														</span> 
														<span><i class="fas fa-thumbs-up"></i>1</span> 
													</p>
													<%-- 리뷰 대댓글 추가 --%> 
													<div class="add_reply" data-type="hide">
														<form class="review_reply_insert_form">
															<input hidden="hidden" name="product_num" value="${item_vo.product_num}">
															<input hidden="hidden" name="members_num" value="${member_vo.members_num}">
															<input hidden="hidden" name="review_num" value="${review_vo.review_num}">
															<ul class="add_reply_list" url="badf"> 
																<%-- ajax 삽입 --%> 
															</ul>
															<textarea name="review_reply_content" class="review_reply_write"></textarea>
															<input type="button" class="btn review_btn" list_num="${review_vo.review_num}" member_num= "${member_vo.members_num}" value="댓글 달기">
														</form>
													</div>
												</div> 
											</div>
											<div class="review_modify_box">
												<form class="review_modify_form" action="<c:url value='/review_update'/>" method="post">
													<input hidden="hidden" name="review_num" value="${review_vo.review_num}">
													<input hidden="hidden" name="product_num" value="${item_vo.product_num}">
													<input hidden="hidden" name="members_num" value="${member_vo.members_num}">
													<div class="review_list_left"> 
														<div class="reviewStars-input">
														<input id="star-4" type="radio" <c:if test="${review_vo.review_grade eq 5}">checked="checked"</c:if> value="5" name="review_grade"> 
														<label title="gorgeous" for="star-4"></label> 
														<input id="star-3" type="radio" <c:if test="${review_vo.review_grade eq 4}">checked="checked"</c:if> value="4" name="review_grade">  
														<label title="good" for="star-3"></label> 
														<input id="star-2" type="radio" <c:if test="${review_vo.review_grade eq 3}">checked="checked"</c:if> value="3" name="review_grade">  
														<label title="regular" for="star-2"></label>
														<input id="star-1" type="radio" <c:if test="${review_vo.review_grade eq 2}">checked="checked"</c:if> value="2" name="review_grade">  
														<label title="poor" for="star-1"></label> 
														<input id="star-0" type="radio" <c:if test="${review_vo.review_grade eq 1}">checked="checked"</c:if> value="1" name="review_grade">
														<label title="bad" for="star-0"></label>   
													</div>        
														<p>   
														<c:set var="date2" value="${review_vo.review_date}"/>
															<%  
																Date date2 = (Date) pageContext.getAttribute("date2");
																SimpleDateFormat sdate2 = new SimpleDateFormat("yyyy.MM.dd");
																String date_txt2 = sdate2.format(date2);
																pageContext.setAttribute("date_txt2", date_txt2); 
															%> 
															<span class="review_date">${date_txt2}</span>
														</p>
													</div>  
													<div class="review_list_right modify_review">
														<p class="review_content">
															<textarea rows="5" name="review_content"></textarea>
														</p>
														<p class="item_select_option"> 
															<input type="checkbox" id="check_spoiler2" name="review_spoiler" class="item_checking" value="있음" <c:if test="${review_vo.review_spoiler eq '있음'}">checked="checked"</c:if>>
															<label for="check_spoiler2" class="input_label"></label>    
															<label for="check_spoiler2" style="font-size: 14px; margin-right: 5px; margin-top: 2px; color: #595e63;">스포일러가 있습니다.</label>
														</p> 
														<p class="review_list_btn ">  
															<span class="review_del_btn">  
																<a>취소</a> 
															</span> 
															<span class="">	  
																<input type="submit" value="수정완료">
															</span>
														</p> 
													</div> 
												</form>
											</div>  
										</div>
									</c:otherwise>
								</c:choose>
							<div class="review_list_top">
								<p>
									전체 <span>${review_cnt}개</span>의 댓글이 있습니다.
								</p>
								<div class="array_select_list">
									<ul>
										<li><a>최신순</a></li>
										<li><a>공감순</a></li>
									</ul>
								</div>
							</div>
							<%-- 리뷰 댓글 리스트 --%>
							<ul class="review_list">
								<c:forEach var="vo" items="${review_list}" varStatus="status">
									<li class="review_list_box"> 
										<div class="review_list_left">
											<div class="star_box">
												<input hidden="hidden" class="grade_list_val" value="${vo.review_grade}">
												<span class="star_before review_list_star_before"><span class="star_after"></span></span>
											</div>
											<span class="review_id">${member_list[status.index].members_id}</span>
											<%--  수정 등록일 날짜,시간 표시  --%> 
											<c:set var="date" value="${vo.review_date}"/>
											<%  
												Date date = (Date) pageContext.getAttribute("date");
												SimpleDateFormat sdate = new SimpleDateFormat("yyyy.MM.dd");
												String date_txt = sdate.format(date);
												pageContext.setAttribute("date_txt", date_txt); 
												
											%> 
											<p> 
												<span class="review_date">${date_txt}</span><span
													class="review_report">신고</span>
											</p>
										</div>
										<div class="review_list_right">
											<p class="review_content">${vo.review_content}</p>
											<p class="review_list_btn">
												<span class="review_reply_btn" onclick="review_reply_list(this)" list_num="${vo.review_num}" member_num= "${member_vo.members_num}">
													<i class="fas fa-comment"></i> 댓글
												</span>  
												<span><i class="fas fa-thumbs-up"></i>${vo.review_recommend}</span>
											</p> 
											<div class="add_reply" data-type="hide">
												<form class="review_reply_insert_form"  method="post">
													<input hidden="hidden" name="product_num" value="${item_vo.product_num}">
													<input hidden="hidden" class="member_num" name="members_num" value="${member_vo.members_num}">
													<input hidden="hidden" name="review_num" value="${vo.review_num}">
													<ul class="add_reply_list" url="dddd">  
														<%-- ajax 삽입 --%>  
													</ul>
													<textarea name="review_reply_content" class="review_reply_write"></textarea>
													<input type="button" class="btn review_btn" onclick="review_reply_insert(this)" list_num="${vo.review_num}" member_num= "${member_vo.members_num}" value="댓글 달기">
												</form>  
											</div>
										</div>  
									</li> 
								</c:forEach> 
							</ul>
							<c:if test="${review_cnt > 10}">
								<input hidden="hidden" value="${review_cnt }" class="review_total">
								<button class="more_review">댓글 더보기</button>
							</c:if>
						</div>
					
					<span></span>
				</div>
			</div>
		</div>
		<aside id="item_detail_aside">
			<div id="category_best">
				<h4>
					<span>${cate_info_list[2].cate_name}</span> 베스트 셀러
				</h4>
				<ul class="book_item_list">
					<c:forEach var="list" items = "${cate_item_list}" varStatus="status">
						<li class="item_other_list"><span>${status.count}</span>
							<p>
								<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">${list.PRODUCT_NAME}</a>
							</p> 
						</li>
					</c:forEach>
				</ul>
			</div>
			<span class="item_detail_category_more"><i
				class="fas fa-angle-double-right"></i> <a href="#">더보기</a></span>
		</aside>
	</div>
</div>
<c:if test="${preview_list != null}">
	<div id="item_preview_box">
		<div class="item_preview_content"> 
			<i onclick="slide_hide()" class="fas fa-times slide_cancle"></i>
			<div class="item_preview_slide"  onclick="slide_hide()">
				<c:forEach var="list" items="${preview_list}" varStatus="status">
					<div class="preview_slide_item">   
						<p class="preview_slide_head">
							<span class="img_title">${item_vo.product_name}(${status.count}/${fn:length(preview_list)})</span>
						<p>  
						<p class="img_box" style="margin: 0 auto; padding: 10px;"> 
							<img src="<c:url value='/resources/upload/${list}'/>">  
						</p>   
					</div>    
				</c:forEach>
			</div> 
		</div> 
	</div>
</c:if>