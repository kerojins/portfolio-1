<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="admin_home_content" board="admin_home_content">
	<div class="container">
		<div class="admin_home_left">
			<div class="admin_brief">
				<div class="today_info brief_content">
					<span class="brief_title">오늘 <i class="fas fa-chevron-right"></i></span>
					<p>
						<span class="brief_subtitle">결제</span><i>${order_today[0].CNT}</i>건
					</p>
					<p> 
						<input hidden class="order_today_val" value="${order_today[0].TOTAL_PRICE}" >
						<span class="brief_subtitle">매출</span><i class="order_today_total"></i>원
					</p> 
					<p>
						<span class="brief_subtitle">가입</span><i>${member_today_cnt}</i>명
					</p>
					<%-- <p>
						<span class="brief_subtitle">방문</span><i>20</i>명
					</p> --%> 
				</div>
				<div class="total_info brief_content">
					<span class="brief_title">누적 <i class="fas fa-chevron-right"></i></span>
					<p>
						<span class="brief_subtitle">회원</span><i>${member_cnt}</i>명
					</p>
					<p>
						<input hidden class="total_mile_val" value="${total_mile_cnt}">
						<span class="brief_subtitle">적립금</span><i class="total_mile_cnt">4324,343</i>원
					</p> 
				</div>
			</div>
			<div class="admin_preview">
				<div class="col-md-3">
					<span class="more"><i class="fas fa-plus"></i></span> <span
						class="count">${order_total_cnt}</span>
					<h2>
						<i class="fas fa-truck"></i> 주문처리
					</h2>
					<table class="shipping_preview_table">
						<tr>
							<th>주문접수</th>
							<td><a href="<c:url value='/admin_order_list?order_status=결제대기&admin_date=admin_date'/>">${order_cnt_arr[0]}</a>건</td>
						</tr>
						<tr>  
							<th>결제확인</th>
							<td>
								<a href="<c:url value='/admin_order_list?order_status=결제완료&admin_date=admin_date'/>">${order_cnt_arr[1]}</a>건
							</td>
						</tr>
						<tr>
							<th>상품준비</th>
							<td><a href="<c:url value='/admin_order_list?order_status=배송준비중&admin_date=admin_date'/>">${order_cnt_arr[2]}</a>건</td>
						</tr>
						<tr>
							<th>배송중</th>
							<td><a href="<c:url value='/admin_order_list?order_status=배송중&admin_date=admin_date'/>">${order_cnt_arr[3]}</a>건</td>
						</tr>
						<tr>
							<th>배송완료</th>
							<td><a href="<c:url value='/admin_order_list?order_status=배송완료&admin_date=admin_date'/>">${order_cnt_arr[4]}</a>건</td>
						</tr>
						<tr>
							<th>환불접수</th>
							<td><a href="<c:url value='/admin_order_list?order_status=환불&admin_date=admin_date'/>">${order_cnt_arr[5]}</a>건</td>
						</tr>
					</table>
				</div>
				<div class="col-md-3">
					<span class="more"><i class="fas fa-plus"></i></span> <span
						class="count">${new_item_cnt}</span>
					<h2> 
						<i class="fas fa-book"></i> 상품현황
					</h2>
					<table class="item_preview_table">
						<tr>
							<th>판매 중</th>
							<td><a href="<c:url value='/admin_item_list?product_status=정상&admin_date=admin_date'/>">${item_cnt_arr[0]}</a>건</td>
						</tr> 
						<tr>  
							<th>판매 중지</th>
							<td><a href="<c:url value='/admin_item_list?product_status=판매중지&admin_date=admin_date'/>">${item_cnt_arr[1]}</a>건</td>
						</tr>
						<tr>
							<th>품절</th>
							<td><a href="<c:url value='/admin_item_list?product_status=품절&admin_date=admin_date'/>">${item_cnt_arr[2]}</a>건</td>
						</tr>
						<tr>
							<th>신규등록(3일이내)</th>
							<td><a href="<c:url value='/admin_item_list?admin_date=admin_date'/>">${new_item_cnt}</a>건</td>
						</tr>
						<tr> 
							<th>재고 20개이하</th>
							<td><a href="<c:url value='/admin_item_list?end_stock=20&admin_date=admin_date'/>">${stock_item_cnt}</a></a>건</td>
						</tr>
					</table> 
				</div> 
				<div class="col-md-3">
					<span class="more"><i class="fas fa-plus"></i></span> <span
						class="count">${counsel_cnt}</span>
					<h2>
						<i class="far fa-comment-alt"></i> 1:1문의
					</h2>
					<table class="qna_preview_table">
						<c:forEach var="list"  begin="0" end="6"  items="${counsel_list}">
							<tr>
								<th>${list.counsel_type}</th>
								<td><span class="layer_board_view_btn" board_seq="${list.counsel_num}" board_id="counsel" board_answer="${list.counsel_answer}">${list.counsel_title}</span></td>
								<td class="reply_cell">${list.counsel_answer}</td>
							<c:set var="date" value="${list.counsel_date}"/>
							<%  
								Date date = (Date) pageContext.getAttribute("date");
								SimpleDateFormat sdate = new SimpleDateFormat("MM-dd"); 
								String date_txt = sdate.format(date);
								pageContext.setAttribute("date_txt", date_txt);
							%> 
								<td>${date_txt}</td>
							</tr> 
						</c:forEach>
					</table> 
				</div> 
				<div class="col-md-3">
					<span class="more"><i class="fas fa-plus"></i></span> <span
						class="count">${review_cnt}</span>
					<h2>
						<i class="far fa-list-alt"></i> 리뷰관리
					</h2>
					<table class="qna_preview_table review_preview_table">
						<c:forEach var="list" begin="0" end="6"  items="${review_list}">
							<tr>
								<td><span class="layer_board_view_btn" board_seq="${list.review_num}" board_id="review">${list.review_content}</span></td>
								<c:set var="date" value="${list.review_date}"/>
								<%   
									Date date = (Date) pageContext.getAttribute("date");
									SimpleDateFormat sdate = new SimpleDateFormat("MM-dd");
									String date_txt = sdate.format(date);
									pageContext.setAttribute("date_txt", date_txt);
								%> 
								<td>${date_txt}</td>  
							</tr>
						</c:forEach>
					</table> 
				</div>
			</div>
			<div class="board_preview">
				<div class="col-md-4">
					<div class="board_preview_title">
						<h3>이벤트</h3>
						<i class="fas fa-plus"></i>
					</div>
					<div class="board_privew_content">
						<table class="">
							<c:forEach var="list" begin="0" end="6"  items="${event_list}">
							<tr>
								<td><span class="layer_board_view_btn" board_seq="${list.event_num}" board_id="event">${list.event_title}</span></td>
								<c:set var="date" value="${list.event_date}"/>
								<%  
									Date date = (Date) pageContext.getAttribute("date");
									SimpleDateFormat sdate = new SimpleDateFormat("MM-dd");
									String date_txt = sdate.format(date);
									pageContext.setAttribute("date_txt", date_txt);
								%>  
								<td>${date_txt}</td>
							</tr>
						</c:forEach>
						
						</table>
					</div>
				</div>
				<div class="col-md-4">
					<div class="board_preview_title">
						<h3>공지사항</h3>
						<i class="fas fa-plus"></i>
					</div>
					<div class="board_privew_content">
						<table class="">
							<c:forEach var="list"  begin="0" end="6"  items="${notice_list}">
							<tr>
								<td><span class="layer_board_view_btn" board_seq="${list.notice_num}" board_id="notice">${list.notice_title}</span></td>
								<c:set var="date" value="${list.notice_date}"/>
								<%  
									Date date = (Date) pageContext.getAttribute("date");
									SimpleDateFormat sdate = new SimpleDateFormat("MM-dd");
									String date_txt = sdate.format(date);
									pageContext.setAttribute("date_txt", date_txt);
								%>  
								<td>${date_txt}</td>
							</tr>
						</c:forEach> 
						
							
						</table>
					</div>
				</div>
				<div class="col-md-4">
					<div class="board_preview_title">
						<h3>회원알림</h3>
						<i class="fas fa-plus add_push"></i>
					</div>
					<div class="board_privew_content">
						<div class="content_btn">
							<p><span>이벤트알림</span><a class="list_btn" onclick="push_list(this)" push_id='이벤트'><span class="event_count">${push_event_count}</span>건</a></p>
							<p><span>공지알림</span><a class="list_btn" onclick="push_list(this)" push_id='공지' ><span class="notice_count">${push_notice_count}</span>건</a></p>
							<p><span>일반알림</span><a class="list_btn" onclick="push_list(this)" push_id='일반'><span class="basic_count">${push_basic_count}</span>건</a></p>
						</div>  
					</div>
				</div> 
			</div> 
		</div>
		<div class="admin_home_right">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-bell fa-fw"></i> 최근 관리 활동내역
				</div>
				<div class="panel-body">
					<div class="list-group">
						<c:forEach var="list" items="${admin_alert_list }" end="8">
							<a href="#" class="list-group-item"> 
								<c:choose>
									<c:when test="${list.admin_alert_type eq 1}">
										<i class="fa fa-book fa-fw"></i>
									</c:when>
									<c:when test="${list.admin_alert_type eq 2}">
										<i class="fa fa-comment fa-fw"></i>
									</c:when>
								</c:choose> ${list.admin_alert_content} 
								<span class="pull-right text-muted small">
								<c:set var="date" value="${list.admin_alert_date}"/>
								<%   
									Date date = (Date) pageContext.getAttribute("date");
									SimpleDateFormat sdate = new SimpleDateFormat("MM-dd hh:mm");
									String date_txt = sdate.format(date);
									pageContext.setAttribute("date_txt", date_txt); 
								%> 
									<em>${date_txt}</em>
								</span>
							</a>
						</c:forEach>
					</div>
					<a href="#" class="btn btn-default btn-block">View All Alerts</a>
				</div>
				<div class="admin_memo">
					<form action="<c:url value='/admin_memo_insert'/>" method="post">
						<div class="memo_write"> 
							<div class="memo_write_box">
								<textarea name="admin_memo_content" rows="" cols="">메모를 남기세요</textarea>
								<i class="fas fa-times"></i> 
							</div>
						<input type="submit" value="등록">
						</div>  
					</form>
					<div class="panel-group wrap" id="accordion" role="tablist"
						aria-multiselectable="true">
						<c:forEach var="list" items="${admin_memo_list}" varStatus="status">
							<div class="panel">
								<div class="panel-heading" role="tab" id="heading${status.count}">
									<h4 class="panel-title">
										<c:set var="date" value="${list.admin_memo_date}"/>
										<%    
											Date date = (Date) pageContext.getAttribute("date");
											SimpleDateFormat sdate = new SimpleDateFormat("MM/dd hh:mm");
											String date_txt = sdate.format(date);
											pageContext.setAttribute("date_txt", date_txt);
										%> 
										<a role="button" data-toggle="collapse" class="admin_memo_title"
											data-parent="#accordion" href="#collapse${status.count}"
											aria-expanded="true" aria-controls="collapse${status.count}">
											[MEMO${status.count}] ${date_txt}</a>
									</h4> 
								</div> 
								<div id="collapse${status.count}" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="heading${status.count}">
									<div class="panel-body">${list.admin_memo_content}</div>
								</div> 
							</div>   
						</c:forEach> 
					</div>
					<!-- end of #accordion -->
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<div class="push_layer">
			<p class="push_layer_top">
				<span>알림관리</span>
				<button class="close_btn">
					<i class="fas fa-times"></i>
				</button> 
			</p>
			<div class="push_list_box">
				<h4>알림 리스트</h4>
				<table class="push_list_table">
					<%-- ajax --%>
				</table> 
				<ul class="pagination item_pagenum push_pagination">
					<%-- ajax --%>
				</ul>
			</div>  
			<div class="push_write">  
				<h4>알림 등록</h4>
				<form class="push_insert_form" action="<c:url value='/push_insert'/>" method="post"> 
					<textarea type="text" name="push_content"></textarea>
					<button class="admin_button">등록하기</button>
				</form> 
			</div> 
		</div>
		<%-- 게시글 상세보기 레이어 --%>
		<div class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-draggable board_list_view"
			tabindex="-1" role="dialog" aria-labelledby="ui-dialog-title-dlg"
			style="">
			<div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
				<span class="ui-dialog-title" id="ui-dialog-title-dlg">게시글 보기</span>
				<a href="#" class="ui-dialog-titlebar-close ui-corner-all close_btn" role="button">
					<span class="ui-icon ui-icon-closethick">close</span>
				</a>
			</div>
			<div id="dlg" class="ui-dialog-content ui-widget-content" style="width: auto; min-height: 58px; height: auto;">
				<div id="dlg_content">
					<div id="boardview"> 
						<br style="line-height: 12px;"> 
						<div class="viewbox">
							<form name="form1" id="board_view_form" method="post"
								target="actionFrame">
								<!-- 페이지 타이틀 바 : 시작 -->
								<div id="page-title-bar-area" style="margin-top: -40px;">
									<div id="page-title-bar">
										<div class="page-title">
											<h2><c:choose>
													<c:when test="${board_id eq 'counsel'}">
													[1:1질문]
													</c:when>
													<c:when test="${board_id eq 'notice'}">
													[공지사항]
													</c:when>
													<c:when test="${board_id eq 'event'}">
													[이벤트]
													</c:when> 
													<c:when test="${board_id eq 'review'}">
													[리뷰]
													</c:when>
												</c:choose> 
											게시글 보기</h2>
										</div>
										<ul class="page-buttons-left">
											<li>
												<span class="btn small white">
													<button type="button" name="boardviewclose">게시글리스트
														<span class="arrowright"></span>
													</button> 
												</span>
											</li>
										</ul>
										<ul class="page-buttons-right">
											<li>
												<span class="btn small black">
													<button type="button" board_seq="" board_id="${board_id}" class="board_modify_btn" name="board_modify_btn">수정</button>
												</span> 
											</li>
											<li>
												<span class="btn small black">
													<a type="button" name="board_delete_btn" class="board_delete_btn" href="<c:url value='/board_delete?board_seq=${vo.review_num}&board_id=${board_id}'/>">삭제</a>
												</span> 
											</li>
											<li>
												<span class="btn small black">
													<button type="button" name="board_reply_btn" board_seq="${vo.counsel_num}" class="board_reply_btn counsel_reply_insert" >답변 등록</button>
												</span>
											</li>
											<li> 
												<span class="btn small black">
													<a href="#" class="board_close_btn">닫기</a>
												</span>
											</li> 
										</ul>
									</div>
								</div>
								<!-- 페이지 타이틀 바 : 끝 -->
								<table class="bbsview_table_style" style="width: 100%" cellpadding="0" cellspacing="0" border="0">
									<colgroup>
										<col>
										<col width="300px">
									</colgroup>
									<thead>
										<tr>
											<th class="left pdl5  pdt5 pdb5 detail_board_title">
												게시글 상세 제목
											</th>
											<th class="right"></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="cell" colspan="2">
												<table width="100%" border="0" cellpadding="0" cellspacing="0">
													<tbody>
														<tr style="border: none">
															<td width="5"></td>
															<td>
																<table align="right" class="board_list_info" border="0" cellpadding="0"  width="100%">
																	<tbody>
																		<tr>
																			<td>
																				<span class="fl">
																					<span class="han">작성자</span>
																				:&nbsp;
																				</span>
																				<span class="fl detail_board_name">게시글 상세 작성자</span>
																			</td>
																			<td class="cell_bar">|</td>
																			<td>
																				<span class="han board_another">조회:</span> 
																				<span class="num board_another_info">0</span>
																			</td>
																			<td class="cell_bar">|</td>
																			<td>
																				<span class="han">등록일:</span> 
																				<span class="num detail_board_date">게시글 상세 등록일</span>
																			</td>
																		</tr>
																	</tbody> 
																</table>
															</td>
															<td width="5"></td>
														</tr>
													</tbody>
												</table>
												<div class="cboth"></div>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="content detail_board_content"></div>
								<div id="counsel_reply_box">
									<input hidden="hidden" class="detail_board_num" name="counsel_num" value="">
								</div>
								<textarea class="counsel_reply_content" name="counsel_reply_content"></textarea>
							</form>
						</div>
					</div>  
					<form id="writeform" class="board_write_form" method="post" enctype="multipart/form-data" >
						<div id="page-title-bar-area" style="margin-top: -20px;">
							<div id="page-title-bar">
								<div class="page-title"> 
									<h2><c:choose>
											<c:when test="${board_id eq 'counsel'}">
											[1:1질문]
											</c:when>
											<c:when test="${board_id eq 'notice'}">
											[공지사항]
											</c:when>
											<c:when test="${board_id eq 'event'}">
											[이벤트]
											</c:when> 
											<c:when test="${board_id eq 'review'}">
											[리뷰]
											</c:when>
										</c:choose> 게시글 등록</h2>
								</div>
								<%--  
								<ul class="page-buttons-left">
									<li>
										<span class="btn large white">
											<button type="button">게시글리스트
												<span class="arrowright"></span>
											</button>
										</span>
									</li>
									<li>
										<span class="btn large white board_view_btn">
											<button type="button">게시글보기</button>
										</span>
									</li>  
								</ul> 
								--%>
								<ul class="page-buttons-right">
									<li>
										<span class="btn large black">
											<button id="board_add_btn" type="submit">저장하기</button>
										</span> 
										<span>
											<a class="board_close_btn">닫기</a> 
										</span> 
									</li> 
								</ul>
							</div>
						</div>
						<div>
							<table class="info-table-style" style="width: 100%">
								<colgroup>
									<col width="15%">
									<col>
								</colgroup>
								<thead class="hide">
									<tr>
										<th class="its-th-align center" colspan="4">기본정보</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th class="its-th-align center">작성자</th>
										<td class="its-td board_writer">관리자</td>
									</tr>
									<tr class="notice_display" style="display:none;"> 
										<th class="its-th-align center">공지글 여부</th>
										<td class="its-td">
											<input type="checkbox" name="notice_official" id="board_notice" value="1" >
											<label for="boardnotice"> 공지글입니다.</label>
												<div class="noticelay " style="width: 99%; padding: 3px 5px;">
													<label> 
														<input type="radio" name="notice_official_detail" class="notice_official_detail" id="onlynotice0" value="0" disabled="disabled"> 
														공지글영역과 리스트 영역에 해당 글이 보여집니다.
													</label>
													<br>  
													<label> 
														<input type="radio" name="notice_official_detail" class="notice_official_detail" id="onlynotice1" value="1" disabled="disabled"> 
														공지글 영역에서 특정기간동안(설정 시)만 해당 글이 보여집니다.
													</label> 
													<span> 
														<input type="text" name="notice_official_date" id="period1" value="" class="period line" maxlength="10" size="10" disabled="disabled" autocomplete="off">
														<img class="ui-datepicker-trigger" src="<c:url value='/resources/images/icon_calendar.gif'/>" alt="..." title="...">
														~ 
														<input type="text" name="notice_official_date" id="period2" value="" class="period line" maxlength="10" size="10" disabled="disabled" autocomplete="off">
														<img class="ui-datepicker-trigger" src="<c:url value='/resources/images/icon_calendar.gif'/>" alt="..." title="...">
													</span>
												</div> 
										</td>
									</tr>
									<tr> 
										<th class="its-th-align center">제목</th>
										<td class="its-td">
											<input type="text" name="${board_id}_title" class="board_title" id="subject" value="제목을 입력해주세요" class="required line" title="제목을 입력해 주세요" style="width: 95%" placeholder="제목을 입력해 주세요">
											<input hidden="hidden" class="board_id" name="board_id" value="${board_id}" >
											<input hidden="hidden" class="board_num" name="${board_id}_num">
											<input hidden="hidden" name="admin_board" value="admin_main">
										</td> 
									</tr>
									<tr class="event_display" style="display: none;">
										<th class="its-th-align center">이벤트 썸네일</th>
										<td class="its-td"> 
											<p class=""><input type="file" class="thumb_file" name="event_file" onchange="e_readURL(this);" ><input readonly="readonly" name="thumb_name" class="thumb_name"></p>
											<p class="event_thumb_box"><img class="event_thumb" src="" ><i class="fas fa-times del_thumb"></i></p>
										</td>   
									</tr> 
									<tr>
										<th class="its-th-align center">내용</th>
										<td class="its-td">
											<textarea id="summernote" class="board_content" name="${board_id}_content"></textarea>
										</td>  
									</tr> 
									<tr class="event_display" style="display: none;">
										<th class="its-th-align center">이벤트 기간</th>
										<td class="its-td">
											<input type="text" class="event_period period" id="period1" name="event_period" autocomplete="off">
											<img class="ui-datepicker-trigger" src="<c:url value='/resources/images/icon_calendar.gif'/>" alt="..." title="...">
											 ~
											<input type="text" class="event_period period" id="period2" name="event_period" autocomplete="off">
											<img class="ui-datepicker-trigger" src="<c:url value='/resources/images/icon_calendar.gif'/>" alt="..." title="...">
										</td>   
									</tr> 
									<tr>
										<th class="its-th-align center" colspan="2"> 
											<div class="after board_push">
												회원 알림등록 
												<input type="checkbox" name="board_push" id="board_push1" value="ok">
											</div> 
										</th>
									</tr> 
								</tbody>
							</table> 
						</div>
					</form> 
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#event_period").datepicker({
	    dayNamesMin:["일","월","화","수","목","금","토"], // 요일에 표시되는 형식 설정

	    dateFormat:"yy-mm-dd", //날짜 형식 설정

	    monthNames:["1월","2월","3월","4월","5월","6월","7월",

	     "8월","9월","10월","11월","12월"], //월표시 형식 설정
	 
	    showAnim:"fold", //애니메이션효과

		minDate: 0,
	});  
	
	// summernote 플러그인 
	$('#summernote').summernote({
		height : 300, // set editor height
		focus : true,
		callbacks:{
			onImageUpload: function(files, editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
	            	sendFile(files[i], this);
	            }
	        }	
		} 
	}); 
});


</script>