<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<div id="book_full_contents">
	<%--  메인배너  --%>
	<section id="main_banner">
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active" style="background: rgb(104, 89, 56)">
					<img title="책 토지 이벤트 배너" src="<c:url value='/resources/images/main_slide2.jpg'/>" class="d-block w-100" alt="책 토지 이벤트 배너">
				</div>
				<div class="carousel-item" style="background: rgb(29, 161, 243);">
					<img title="sns이벤트 배너" src="<c:url value='/resources/images/main_slide1.jpg'/>" class="d-block w-100" alt="sns이벤트 배너">
				</div>
				<div class="carousel-item" style="background: rgb(255, 252, 219)">
					<img title="익스프레스 시리즈" src="<c:url value='/resources/images/main_slide3.jpg'/>" class="d-block w-100" alt="책 토지 이벤트 배너">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"> 
				<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
				<span class="sr-only">Previous</span>
			</a> 
			<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"> 
				<span class="carousel-control-next-icon" aria-hidden="true"></span> 
				<span class="sr-only">Next</span>
			</a>
		</div>
	</section>
	<section id="book_contents">
		<%-- 광고배너 --%>
		<div class="content_full_wrap" style="padding-top: 13px">
			<article id="ad_banner" class="container">
				<p>
					<img src="<c:url value='/resources/images/ad_banner.jpg'/>">
				</p>
			</article>
		</div>
		<%-- 새로운 책 --%>
		<div class="content_full_wrap" style="padding-top: 13px">
			<div class="container overhidden">
				<article id="new_books" class="left">
					<h2>신간 도서</h2>
					<div class="new_books_slider">
						<c:forEach var="list" items="${new_item_list}">
							<div class="new_books_slideBox">
								<div class="book_item_box_left"> 
									<div class="new_books_img left">
										<a href="book_detail?product_num=${list.PRODUCT_NUM}"> 
											<c:set var="img" value="${list.PRODUCT_PICTURE}"/>
											<% 
												String img_txt = (String)pageContext.getAttribute("img");
												if(img_txt != null){
													String img_name = img_txt.split(",")[1];
													pageContext.setAttribute("img_name", img_name);
												}
											%>
											<img width="110" src="<c:url value='/resources/upload/${img_name}'/>">
										</a> 
									</div>
									<div class="book_item_content new_books_content">
										<p class="item_tag">
											<c:if test="${list.PRODUCT_DISCOUNT ne '0'}"> 
												<span class="discount_tag">할인도서</span>
											</c:if>
											<c:if test="${list.PRODUCT_SHIPPING_CHARGE eq '0'}">
												<span class="parcel_tag">무료배송</span>
											</c:if>  
										</p>  
										<h3 class="list_book_title">
											<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">${list.PRODUCT_NAME }</a>
										</h3>
										<p class="book_info"> 
											<span class="star_before item_list_star_before"> 
												<input hidden="hidden" class="item_star_val" value="${list.PRODUCT_GRADE}" >
												<span class="star_after"></span>
											</span>  
											<span class="item_reviewCount">${list.REVIEW_CNT}<c:if test="${list.REVIEW_CNT == null}">0</c:if>명</span> 
											<span class="book_editor"> 
												<a href="<c:url value='/editor_detail?editor_num=${list.PRODUCT_EDITOR_NUM}'/>">${list.EDITOR_NAME}</a> 
											</span> 
											<span class="book_publising">  
												<a>${list.PRODUCT_PUBLISH}</a>  
											</span>    
											<span class="category"> 
												<a href="<c:url value='/small_category_book?cate_num=${list.PRODUCT_CATE_NUM}&cate_name=${list.CATE_NAME}'/>">${list.CATE_NAME}</a>
											</span>     
										</p>  
										<p class="book_summary">${list.PRODUCT_DISCRIPTION}</p>
										<p class="book_price">가격 
											<span class="book_buy_price">
												<span>${list.PRODUCT_DISCOUNT_PRICE}</span>원
											</span>
											<span class="discount_percent">(<span>${list.PRODUCT_DISCOUNT}%</span>↓)</span>
											<span class="origin_price"><span>${list.PRODUCT_PRICE }</span>원</span>
										</p>   
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<p class="new_book_bookmark">
						<img src="<c:url value='/resources/images/new_book_mark.png'/>">
					</p>
				</article>
				<article id="news_event" class="right">
					<h2 id="news_event_title">이벤트</h2>
					<ul id="news_event_btn">
					<c:forEach var="i" begin="1" end="${fn:length(event_list)}">
						<li>
							<span>${i}</span>
						</li>
					</c:forEach> 
					</ul>
					<p id="news_event_img">
					<c:forEach var="list" items="${event_list}">
						<a href="<c:url value='/event_detail?event_num=${list.event_num}'/>"><img src="<c:url value='/resources/upload/editor/${list.event_thumbnail}'/>"></a>
					</c:forEach> 
					</p>
				</article>
			</div> 
		</div>
		<%-- 베스트셀러 --%>
		<div class="content_full_wrap">
			<div class="container">
				<article id="best_item">
					<div id="best_item_title" class="aticle_title_layout">
						<h2>주간 베스트셀러</h2>
						<span><a href="">전체보기</a></span>
					</div>
					<ul class="best_item_menu">
						<li class="weekly_item_tap" data-tap="weekly_item_tap">주간 베스트셀러</li>
						<li class="monthly_item_tap" data-tap="monthly_item_tap">월간 베스트셀러</li>
					</ul>
					<div id="weekly_best_item" class="best_item_list weekly_item_tap" data-content="weekly_item_tap">
						<c:forEach var="list" items="${weekly_item_list}" varStatus="status">
							<div class="best_item_box">
								<span class="best_item_rank">${status.count}</span>
								<p class="best_item_img">
									<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">
										<img src="<c:url value='resources/upload/${list.PRODUCT_PICTURE}'/>">
									</a> 
								</p>  
								<div>
									<h4 class="best_item_title">
										<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">${list.PRODUCT_NAME}</a>
									</h4>
									<p class="best_item_editor">
										<a href="#">${list.EDITOR_NAME}</a>
									</p>
									<p class="best_item_rate">
										<span class="star_before item_list_star_before"> 
											<input hidden="hidden" class="item_star_val" value="${list.PRODUCT_GRADE}" >
											<span class="star_after"></span>
										</span> 
										<span class="item_reviewCount">${list.REVIEW_CNT}명</span>
									</p>
								</div> 
							</div>  
						</c:forEach>
					</div>
					<div id="monthly_best_item" class="best_item_list monthly_item_tap" data-content="montly_item_tap">
						<c:forEach var="list" items="${monthly_item_list}" varStatus="status">
							<div class="best_item_box">
								<span class="best_item_rank">${status.count}</span>
								<p class="best_item_img">
									<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">
										<img src="<c:url value='/resources/upload/${list.PRODUCT_PICTURE}'/>">
									</a> 
								</p>
								<div> 
									<h4 class="best_item_title">
										<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">${list.PRODUCT_NAME}</a>
									</h4>
									<p class="best_item_editor">
										<a href="<c:url value='/editor_detail?editor_num=${list.PRODUCT_EDITOR_NUM}'/>">${list.EDITOR_NAME}</a>
									</p>
									<p class="best_item_rate">
										<span class="star_before item_list_star_before"> 
											<input hidden="hidden" class="item_star_val" value="${list.PRODUCT_GRADE}" >
											<span class="star_after"></span>
										</span> 
										<span class="item_reviewCount">${list.REVIEW_CNT}명</span>
									</p>
								</div>
							</div> 
						</c:forEach>
					</div> 
				</article>
			</div>
		</div>
		<%-- 연령별 많이 구매한 책 --%>
		<div class="content_full_wrap">
			<div class="container">
				<article id="age_item">
					<div id="age_item_box">
						<h2>
							<span>${members_years}대 ${members_gender}</span>이 많이 구매한 책
						</h2>
						<div class="age_item_slider"> 
							<c:forEach var="list" items="${years_item_list}" varStatus="status">
								<div class="age_slide_item">
									<span class="age_item_rank">${status.count}</span>
									<p class="age_item_imgBox"> 
										<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">
											<img width="60" src="<c:url value='/resources/upload/${list.PRODUCT_PICTURE}'/>">
										</a>
									</p> 
									<div class="age_item_description">
										<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">
											<h3 class="age_item_description_title">${list.PRODUCT_NAME}</h3>
										</a>
										<span class="age_item_description_editor">${list.EDITOR_NAME}</span><span
											class="age_item_description_cate">${list.CATE_NAME}</span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</article>
			</div>
		</div>
		<%-- MY 관심있는 책 --%>
		<div class="content_full_wrap">
			<div class="container">
				<article id="favorite_item">
					<div class="aticle_title_layout">
						<h2>MY 관심있는 분야</h2>
						<span class="allView_btn"><a href="#">전체보기</a></span> <span
							class="set_cate_btn"><button>분야 설정</button></span>
					</div>
					<ul class="cate_item_menu"> 
						<c:forEach var="list" items="${cate_list}" varStatus="status">
							<li class="cate_item_tap cate_tap${status.count}" data-tap="tap_item${status.count}">${list.cate_name}</li>
						</c:forEach>
					</ul>     
					<c:forEach var="i" begin="1" end="${fn:length(cate_list)}" varStatus="status">
						<c:set var="best" value="best_item_list${i}"/>
							<div class="favorite_item_list tap_item${i}">
							<c:forEach var="list" items="${requestScope[best]}" begin="0" end="11">
								<div class="vertical_item_box">
									<p class="favorite_item_img">
										<c:if test="${list.PRODUCT_PICTURE != null}">
											<c:set var="img" value="${list.PRODUCT_PICTURE}"/>
											<% 
												String img_txt = (String)pageContext.getAttribute("img");
												if(img_txt != null){
													String img_name = img_txt.split(",")[1];
													pageContext.setAttribute("img_name", img_name);
												} 
											%>  
										</c:if> 
										<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">
											<img src="<c:url value='/resources/upload/${img_name}'/>">
										</a>
									</p> 
									<div>  
										<h4 class="vertical_item_title">
											<a href="<c:url value='/book_detail?product_num=${list.PRODUCT_NUM}'/>">${list.PRODUCT_NAME }</a>
										</h4>
										<p class="vertical_item_editor">
											<a href="<c:url value='/editor_detail?editor_num=${list.PRODUCT_EDITOR_NUM}'/>">${list.EDITOR_NAME }</a>
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
						</c:forEach>
							</div>
					</c:forEach>
					<div class="cate_select_modal">
						<form action="<c:url value='/favorite_update'/>" method="post" id="favorite_form">
							<input hidden="hidden" value="${cate_basic}" id="cate_basic">
							<input hidden="hidden" value="${fn:length(cate_list)}" id="cate_size">
							<input hidden="hidden" value="${member_vo.members_favorite}" id="members_favorite">
							<input hidden="hidden" value="${scroll_top}" name="scroll_top" id="scroll_top">
							<p class="cate_select_box"> 
								<span></span>
								<span></span> 
								<span></span>
								<span></span> 
								<span></span>
							</p>
							<ul class="cate_select_list">
								<c:forEach var="list" items="${domestic_vo}" varStatus="status">
									<li>
										<input type="checkbox" id="cate_list${status.count}" name="members_favorite" value="${list.cate_num}">
										<label for="cate_list${status.count}" class="input_label"></label>
										<label for="cate_list${status.count}">${list.cate_name}</label>
									</li>  
								</c:forEach>   
							</ul>  
							<p class="cete_bnt_box">
								<input type="button" class="clear_cate left" value="초기화">
								<span class="right">
									<input type="button" class="cate_submit" value="적용">
									<input type="button" class="cate_cancle" value="취소">
								</span>
							</p>
						</form>
					</div>
				</article>
			</div>
		</div>
		<div class="content_full_wrap">
			<div class="container overhidden">
				<article id="notice_box">
					<div id="notice_title" class="aticle_title_layout">
						<h2>헤이북스 공지사항</h2>
						<span><a href=""><i class="fas fa-plus"></i></a></span>
					</div>
					<div class="notice_content">
						<div class="notice_content_top">
							<p class="left notice_recent_date">
								<c:set var="date" value="${notice_list[0].notice_date}"/>
								<%   
									Date date = (Date) pageContext.getAttribute("date");
									SimpleDateFormat sdate = new SimpleDateFormat("yyyy.MM,dd");
									String date_txt = sdate.format(date).split(",")[0];
									String day = sdate.format(date).split(",")[1];
									pageContext.setAttribute("date_txt", date_txt);
									pageContext.setAttribute("day", day);
								%> 
								${date_txt}<span>${day}</span>
							</p>
							<div class="left notice_recent_content">
								<h4>
									<a href="<c:url value='/notice_detail?notice_num=${notice_list[0].notice_num}'/>">${notice_list[0].notice_title}</a>
								</h4>
								<p>${notice_list[0].notice_content}</p>
							</div>
						</div>
						<div class="notice_content_bottom">
							<ul>
								<li>
									<c:set var="date2" value="${notice_list[1].notice_date}"/>
									<c:set var="date3" value="${notice_list[2].notice_date}"/>
									<%   
										Date date2 = (Date) pageContext.getAttribute("date2");
										Date date3 = (Date) pageContext.getAttribute("date2");
										SimpleDateFormat sdate2 = new SimpleDateFormat("yyyy.MM.dd");
										String date_txt2 = sdate2.format(date2);
										String date_txt3 = sdate2.format(date3);
										pageContext.setAttribute("date_txt2", date_txt2);
										pageContext.setAttribute("date_txt3", date_txt3); 
									%> 
									<a href="<c:url value='/notice_detail?notice_num=${notice_list[1].notice_num}'/>">${notice_list[1].notice_title}</a>
									<span>${date_txt2}</span>
								</li>
								<li>
									<a href="<c:url value='/notice_detail?notice_num=${notice_list[2].notice_num}'/>">${notice_list[2].notice_title}</a>
									<span>${date_txt3}</span>
								</li>
							</ul>
						</div>
					</div>
				</article>
				<article id="qna_box">
					<div id="qna_title" class="aticle_title_layout">
						<h2>헤이북스 상담하기</h2>
						<span><a href=""><i class="fas fa-plus"></i></a></span>
					</div>
					<div class="qna_content">
						<div class="qna_content_top">
							<p class="left qna_best_logo">
								QnA <span>BEST 6</span>
							</p>
							<form class="left qna_search_form" action="<c:url value='/mypage_qna_write'/>">
								<input type="search" name="counsel_title">
								<button>문의</button>
							</form> 
						</div>
						<div class="qna_content_bottom">
							<ul>
								<li><a href="<c:url value='/mypage_qna_write?counsel_type=이용문의'/>">이용 문의</a></li>
								<li><a href="<c:url value='/mypage_qna_write?counsel_type=배송문의'/>">배송 문의</a></li>
								<li><a href="<c:url value='/mypage_qna_write?counsel_type=환불문의'/>">환불 문의</a></li>
								<li><a href="<c:url value='/mypage_qna_write?counsel_type=이벤트문의'/>">이벤트 문의</a></li>
								<li><a href="<c:url value='/mypage_qna_write?counsel_type=오류문의'/>">오류 문의</a></li>
								<li><a href="<c:url value='/mypage_qna_write?counsel_type=기타문의'/>">기타 문의</a></li>
							</ul>
						</div>
					</div>
				</article>
			</div>
		</div>
	</section>
</div>
<script>
	
</script>