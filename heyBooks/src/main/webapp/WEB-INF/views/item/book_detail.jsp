<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="item_detail">
	<div class="container">
		<div class="item_detail_box">
			<div class="item_detail_head">
				<div class="item_detail_head_left">
					<p>
						<img src="<c:url value='/resources/images/item_detail1.jpg'/>">
					</p>
					<span>미리보기</span>
				</div>
				<div class="item_detail_head_right">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">소설</a></li>
							<li class="breadcrumb-item active" aria-current="page">프랑스
								소설</li>
						</ol>
					</nav>
					<h2>루거 총을 든 할머니</h2>
					<p class="star_box">
						<span class="star_before"><span class="star_after"></span></span><span
							class="item_starCount">4.8점</span> <span class="item_reviewCount">
							(9명)</span>
					</p>
					<p class="item_detail_editor">
						<span>김영하</span>저
					</p>
					<p class="item_detail_publishing">
						<span>문학동네</span>출판
					</p>
					<p class="item_detail_pageCount">
						<span>페이지</span> 309p
					</p>
					<table class="item_detail_table">
						<tbody>
							<tr>
								<th rowspan="4">구매</th>
								<td>배송료</td>
								<td>2,500원</td>
							</tr>
							<tr>
								<td>적립금</td>
								<td>100원</td>
							</tr>
							<tr>
								<td>판매가</td>
								<td><p class="book_price">
										<span class="book_buy_price"><span>11,880</span>원</span><span
											class="discount_percent">(<span>10%</span>↓)
										</span><span class="origin_price"><span>13,200</span>원</span>
									</p></td>
							</tr>
							<tr>
								<td style="padding-bottom: 15px;">수량</td>
								<td><p class="item_select_option">
										<input type="text" name="qnt" value="1" class="num" size="2"
											maxlength="2" onkeydown="onlyNumber();" onkeyup=""><span
											class="item_quantity"><a class="item_quantity_plus"><i
												class="fas fa-caret-up" aria-hidden="true"></i></a><a
											class="item_quantity_minus"><i class="fas fa-caret-down"
												aria-hidden="true"></i></a></span>
									</p></td>
							</tr>
						</tbody>
					</table>
					<div class="button_wrap">
						<a class="lib_btn"><i class="fas fa-heart"></i></a><a
							class="cart_btn"><i class="fas fa-shopping-cart"></i></a><a
							class="buy_btn">구매하기</a>
					</div>
				</div>
			</div>
			<div class="item_detail_content">
				<div class="item_detail_middle_box book_about resize_box">
					<h3>책 소개</h3>
					<div>100년을 관통해온 킬러 할머니의 누아르 같은 삶이 밝혀진다 할머니의 지하실에서 발견된 뼈 무덤… 이
						할머니, 도대체 뭐지? 국내 첫 소개되는 브누아 필리퐁의 장편소설 『루거 총을 든 할머니』가 위즈덤하우스에서
						출간되었다. 이 소설은 노골적인 묘사와 거침없는 서사, 도전적인 주제 의식으로 프랑스 독자들을 충격에 빠뜨린
						스릴러이다. 주요 일간지 [피가로]지는 『루거 총을 든 할머니』에 대해 ‘그저 유머로만 보는 것을 경계해야 한다’고
						언급하며 이 소설의 흡인력 이면에 우리 시대의 현실을 관통하는 시선이 담겨 있다고 소개했다. 주인공인 베르트 할머니는
						그녀를 둘러싼 세계가 그녀를 궁지로 몰 때마다 거침없이 행동하며 자신을 지켜내고야 만다. 현실을 비유하는 배경과
						인물들을 떨게 만드는 베르트 할머니의 총구 끝에서 독자들은 통쾌한 대리 만족을 느낄 것이다. 브누아 필리퐁의 시작은
						영화이다. 우리나라에도 『루거 총을 든 할머니』에 앞서 그가 감독한 영화「어느 날 사랑이 걸어왔다(2010)」, 「뮨,
						달의 요정(2015)」이 먼저 소개되었다. 유년시절부터 만화와 영화에 심취했던 그는 특히 쿠엔틴 타란티노, 코엔 형제,
						베르트랑 블리에, 프랭크 밀러의 영화들에서 영향을 받아 무거운 주제를 블랙 유머로 가볍게 다룬 첫 범죄소설 『꺾인
						사람들』(국내 미출간)을 출간했다. 『꺾인 사람들』에서 잠시 등장하는 인물이었던 베르트의 이야기를 본격적으로 다룬 두
						번째 소설 『루거 총을 든 할머니』는 그의 작품세계의 정수를 엿볼 수 있는 장편소설이다. 브누아 필리퐁의 개성 있는
						캐릭터와 극적이고 비유적인 상황, 범죄소설의 코드를 적절히 활용하고 비트는 기교가 독자를 단숨에 이야기로 끌어들인다.
						그리고 이야기 안에서 시종일관 공들여 보여주는 베르트 할머니의 익살스러운 유머에는 여성에 대한 남성의 억압과 횡포,
						아동 학대, 사회적 약자 비하라는 주제가 고스란히 반영된 날카로운 통찰이 담겨 있다. 이 소설에는 베르트와 베르트를
						지켜보는 주변의 시선이 있다. 루거 총으로 무장한 이 여성이 스스로가 괴물인지 자문하는 모습에서 독자들은 허울 좋은
						도덕으로 무장한 사람들과 그녀 중에 과연 진짜 괴물은 누구인지 고민하게 만든다. 독자들에게 시원하고 통쾌한 즐거움과
						동시에 가볍지 않은 주제로 긴 여운을 남기는 작품이다.</div>
				</div>
				<div class="item_detail_middle_box editor_info">
					<h3>저자 프로필</h3>
					<div class="editor_info_content">
						<h4>브누아 필리퐁</h4>
						<ul>
							<li><span class="editor_info_list_title">국적</span> <span
								class="editor_info_list_content">대한민국</span></li>
							<li><span class="editor_info_list_title">출생</span> <span
								class="editor_info_list_content">1968년 11월 11일</span></li>
							<li><span class="editor_info_list_title">학력</span> <span
								class="editor_info_list_content"> 1993년 연세대학교 대학원 경영학 석사<br>
									1990년 연세대학교 경영학 학사<br> 잠실고등학교
							</span></li>
							<li><span class="editor_info_list_title">데뷔</span> <span
								class="editor_info_list_content"> 1995년 리뷰 소설 '거울에 대한 명상'</span>
							</li>
							<li><span class="editor_info_list_title">수상</span> <span
								class="editor_info_list_content">2018년 제26회 오영수 문학상 <br>
									2015년 제9회 김유정문학상<br> 2013년 제8회 에이어워즈 인텔리전트부문<br>
									2012년 제36회 이상문학상
							</span></li>
						</ul>
					</div>
					<div class="editor_book_list">
						<h5>대표 저서</h5>
						<ul>
							<li><div class="vertical_item_box">
									<p class="favorite_item_img">
										<a><img src="resources/images/favorite_item1.jpg"></a>
									</p>
									<div>
										<h4 class="vertical_item_title">
											<a href="#">네이비씰 승리의기술</a>
										</h4>
										<p class="vertical_item_rate">
											평점
											<span class="star_before item_list_star_before">
												<span class="star_after"></span>
											</span>
											<span class="item_reviewCount">9명</span>
										</p>
									</div>
								</div>
							</li>
						</ul>

					</div>
				</div>
				<div class="item_detail_middle_box editor_about">
					<h3>저자 소개</h3>
					<div>장편소설 『살인자의 기억법』 『너의 목소리가 들려』 『퀴즈쇼』 『빛의 제국』 『검은 꽃』 『아랑은
						왜』 『나는 나를 파괴할 권리가 있다』, 소설집 『오직 두 사람』 『무슨 일이 일어났는지는 아무도』 『오빠가 돌아왔다』
						『엘리베이터에 낀 그 남자는 어떻게 되었나』 『호출』, 산문집 삼부작 『보다』 『말하다』 『읽다』 등이 있다. F.
						스콧 피츠제럴드의 『위대한 개츠비』를 번역했다. 문학동네작가상 동인문학상 황순원문학상 만해문학상 현대문학상 이상문학상
						김유정문학상 오영수문학상 등을 수상했다.</div>
				</div>
				<div class="item_detail_middle_box book_index">
					<h3>목차</h3>
					<div>
						추방과 멀미<br> 상처를 몽땅 흡수한 물건들로부터 달아나기<br> 오직 현재<br>
						여행하는 인간, 호모 비아토르<br> 알아두면 쓸데없는 신비한 여행<br> 그림자를 판 사나이<br>
						아폴로 8호에서 보내온 사진<br> 노바디의 여행 <br>여행으로 돌아가다
					</div>
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
													<p class="count_txt">4.8</p>
													<span class="star_before review_item_star_before" style="width: 100px; height:15px">
														<span class="star_after"></span>
													</span> 
												</div>
												<div id="reviewStars-input">
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
												<p class="count_txt">4.8</p>
												<span class="star_before review_item_star_before"><span class="star_after"></span></span>
											</div>
											<div id="reviewStars-input">
												<p class="caption">
													<input hidden="hidden" class="review_grade_val" value="${review_vo.review_grade }">
													내가 남긴 별점<span>5.0</span>
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
														<span class="review_date">2019.03.05</span>
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
													<%-- 리뷰 댓글 추가 --%> 
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
												<input hidden="hidden" name="product_num" value="${item_vo.product_num}">
												<input hidden="hidden" name="members_num" value="${member_vo.members_num}">
												<input hidden="hidden" name="review_num" value="${review_vo.review_num}">
												<div class="review_list_left">
													<div id="reviewStars-input">
														<input id="star-4" type="radio" value="5" name="review_grade" /> 
														<label title="gorgeous" for="star-4"></label> 
														<input id="star-3" type="radio" value="4" name="review_grade" />  
														<label title="good" for="star-3"></label> 
														<input id="star-2" type="radio" value="3" name="review_grade" />  
														<label title="regular" for="star-2"></label>
														<input id="star-1" type="radio" value="2" name="review_grade" />  
														<label title="poor" for="star-1"></label> 
														<input id="star-0" checked ="checked" type="radio" value="1" name="review_grade" />
														<label title="bad" for="star-0"></label>  
													</div>
													<p>   
														<span class="review_date">2019.03.05</span>
													</p>
												</div>  
												<div class="review_list_right modify_review">
													<p class="review_content">
														<textarea rows="5" name="review_content"></textarea>
													</p>
													<p class="item_select_option">
														<input type="checkbox" id="check_spoiler"
															class="item_checking"><label for="check_spoiler"
															class="input_label"></label><label for="check_spoiler"
															style="font-size: 14px; margin-right: 5px; margin-top: 2px; color: #595e63;">
															스포일러가 있습니다. </label>
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
									전체 <span>9개</span>의 댓글이 있습니다.
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
											SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
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
											<span class="review_reply_btn" list_num="${vo.review_num}" member_num= "${member_vo.members_num}">
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
												<input type="button" class="btn review_btn" list_num="${vo.review_num}" member_num= "${member_vo.members_num}" value="댓글 달기">
											</form>  
										</div>
									</div>  
								</li> 
								</c:forEach> 
								
							</ul>
						</div>
					
					<span></span>
				</div>
			</div>
		</div>
		<aside id="item_detail_aside">
			<div id="category_best">
				<h4>
					<span>프랑스 소설</span> 베스트 셀러
				</h4>
				<ul class="book_item_list">
					<li class="item_other_list"><span>1</span>
						<p>
							<a>빼앗긴 들에 봄은 오는가</a>
						</p></li>
					<li class="item_other_list"><span>2</span>
						<p>
							<a>빼앗긴 들에 봄은 오는가</a>
						</p></li>
					<li class="item_other_list"><span>3</span>
						<p>
							<a>나의 라임 오렌지나무</a>
						</p></li>
					<li class="item_other_list"><span>4</span>
						<p>
							<a>세상에 이런일이 있네</a>
						</p></li>
					<li class="item_other_list"><span>5</span>
						<p>
							<a>세상에 이런일이 있네</a>
						</p></li>
					<li class="item_other_list"><span>6</span>
						<p>
							<a>세상에 이런일이 있네</a>
						</p></li>
					<li class="item_other_list"><span>7</span>
						<p>
							<a>세상에 이런일이 있네</a>
						</p></li>
					<li class="item_other_list"><span>8</span>
						<p>
							<a>세상에 이런일이 있네</a>
						</p></li>
					<li class="item_other_list"><span>9</span>
						<p>
							<a>세상에 이런일이 있네</a>
						</p></li>
					<li class="item_other_list"><span>10</span>
						<p>
							<a>세상에 이런일이 있네</a>
						</p></li>
				</ul>
			</div>
			<span class="item_detail_category_more"><i
				class="fas fa-angle-double-right"></i> <a href="#">더보기</a></span>
		</aside>
	</div>
</div>