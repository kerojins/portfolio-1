<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container admin_item_list">
	<div class="search-form-container">
		<div class=" admin_page_head">
			<input hidden="hidden" class="board_id" value="${board_id}">
			<h2>
				<c:choose>
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
				목록 리스트 
			</h2>
			<c:if test="${board_id eq 'notice' or board_id eq 'event'}"><a class="admin_btn board_write_btn" board_id = "${board_id}">글쓰기</a></c:if>
		</div> 
		<form action="<c:url value='/admin_board_list'/>" class="board_form" method="get"> 
			<table class="search-form-table">
				<tbody>
					<tr> 
						<td>
							<table>
								<tbody>
									<tr>
										<td width="440">
											<table class="sf-keyword-table">
												<tbody>
													<tr>
														<td class="sfk-td-txt">
															<input type="text" name="keyword" value="${keyword}" title="작성자, 제목" placeholder="작성자, 제목">
														</td>
														<td class="sfk-td-btn">
															<button type="submit">
																<span>검색</span>
															</button>
														</td> 
													</tr>
												</tbody>
											</table>
										</td>
										<td width="20">&nbsp;</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="search-form-table" id="search_detail_table">
				<tbody>
					<tr id="goods_search_form" style="display: block;">
					</tr>
					<tr>
						<td>
							<table class="sf-option-table">
								<colgroup>
									<col width="80">
									<col width="230">
									<col width="80">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th>작성일</th>
										<td colspan="5"> 
											<input type="text"  maxlength="10" size="10" value="${search_date}" value="${search_date}" name="search_date" class="datepickers start_day">
											<img class="ui-datepicker-trigger" src="<c:url value='/resources/images/icon_calendar.gif'/>" alt="..." title="..."> &nbsp;
											<span class="gray">-</span>&nbsp;
											<input type="text" maxlength="10" size="10" value="${search_end_date}" value="${search_end_date}" name="search_end_date" class="datepickers end_day">
											<img class="ui-datepicker-trigger" src="<c:url value='/resources/images/icon_calendar.gif'/>" alt="..." title="..."> &nbsp;&nbsp; 
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
								</tbody>
							</table>
						</td>
					</tr>
				</tbody> 
			</table>
			<input hidden="hidden" name="board_id" value="${board_id}"> 
		</form>
	</div> 
	
	<div class="admin_list_box user_list_box">
		<div class="admin_list_top">
			<p>
				전체 <span>${totalRowCount}</span>개
			</p>  
			<div class="admin_select_list">
				<input hidden="hidden" id="list_type" value="admin_item_list">
				<select name = "item_list_arr_list" id="item_list_arr_list">
					<option value="board_date" <c:if test="${list_arr eq 'board_date'}">selected="selected"</c:if>>최신순</option>
					<option value="board_title"<c:if test="${list_arr eq 'board_title'}">selected="selected"</c:if>>제목순</option>
				</select>   
				<select name ="item_rowCount_list" id="item_rowCount_list">  
					<option value="10" <c:if test="${rowCount eq 10}">selected </c:if>>10개씩</option>
					<option value="50" <c:if test="${rowCount eq 50}">selected </c:if>>50개씩</option> 
					<option value="100" <c:if test="${rowCount eq 100}">selected </c:if>>100개씩</option>   
					<option value="200" <c:if test="${rowCount eq 200}">selected </c:if>>200개씩</option>
				</select> 
			</div>     
		</div>
	<form action="<c:url value='/board_delete'/>" id="board_list">
		<input hidden="hidden" name="board_id" value="${board_id}">
		<c:choose> 
			<%--  1:1 상담 --%>
			<c:when test='${board_id eq "counsel"}'>
			<table class="list-table-style counsel_table board_list_tables"cellspacing="0">
				<thead class="lth">
					<tr>
						<th>
							<input type="checkbox"  class="ckAll" onclick="ckAll(this);">
						</th>
						<th>번호</th>
						<th width="8%">작성자</th>
						<th width="8%">
							<select name="category" id="counsel_type" class="line">
								<option value="" selected="selected">- 질문유형전체 -</option>
								<option value="회원계정문의" <c:if test="${counsel_type eq '회원계정문의'}">selected</c:if>>회원계정문의</option>
								<option value="이용문의" <c:if test="${counsel_type eq '이용문의'}">selected</c:if>>이용문의</option> 
								<option value="배송문의" <c:if test="${counsel_type eq '배송문의'}">selected</c:if>>배송문의</option> 
								<option value="환불문의" <c:if test="${counsel_type eq '환불문의'}">selected</c:if>>환불문의</option>
								<option value="이벤트문의" <c:if test="${counsel_type eq '이벤트문의'}">selected</c:if>>이벤트문의</option> 
								<option value="오류문의" <c:if test="${counsel_type eq '오류문의'}">selected</c:if>>오류문의</option>  
								<option value="기타문의" <c:if test="${counsel_type eq '기타문의'}">selected</c:if>>기타문의</option>
							</select> 
						</th>
						<th width="40%">제목</th>
						<th>등록일</th>
						<th width="8%">
							<select name="reply" id="counsel_answer" class="line">
								<option value="" selected="selected">- 답변상태 -</option>
								<option value="답변대기" <c:if test="${counsel_answer eq '답변대기'}">selected</c:if>>답변대기</option>
								<option value="답변완료" <c:if test="${counsel_answer eq '답변완료'}">selected</c:if>>답변완료</option>
							</select>  
						</th>
						<th width="12%">관리</th> 
					</tr> 
				</thead>
				<tbody class="ltb otb" id="ajaxTable">
					<c:forEach var="vo" items="${counsel_list}"  varStatus="status">
						<tr class="list-row"> 
							<td align="center"><input type="checkbox" class="select_ck_num" name="select_ck_num" value="${vo.counsel_num}" data-provider_seq="1"></td>
							<td align="center" class="number">${vo.counsel_num}</td>
							<td align="center" class="name">${member_list[status.index].members_id}</td>
							<td align="center" class="category">${vo.counsel_type}</td> 
							<td align="left"> 
								<span class="hand blue layer_board_view_btn" board_answer="${vo.counsel_answer}" board_seq="${vo.counsel_num}" board_id="${board_id }">
									${vo.counsel_title }
								</span>  
							</td> 
							<c:set var="date" value="${vo.counsel_date}" />
							<%-- 수정 등록일 날짜,시간 표시 --%>
							<%
								Date date = (Date) pageContext.getAttribute("date");
								SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
								String date_txt = sdate.format(date);
								pageContext.setAttribute("date_txt", date_txt);
							%> 
							<td align="center" class="date">${date_txt}</td>
							<td align="center">${vo.counsel_answer}</td> 
							<td align="center">
								<span class="admin_detail_btn small valign-middle">
									<input type="button" name="board_reply_btn"  board_answer="${vo.counsel_answer}" board_seq="${vo.counsel_num}"  board_id="${board_id }" class="layer_board_view_btn" value="상세보기">
									<a type="button" name="board_delete_btn" href="<c:url value='/board_delete?board_seq=${vo.counsel_num}&board_id=${board_id}'/>">삭제</a>
								</span> 
							</td> 
						</tr>  
					</c:forEach>
				</tbody> 
			</table>
		</c:when>  
		<%--  공지사항 --%>
		<c:when test="${board_id eq 'notice'}">
			<table class="list-table-style board_list_tables" cellspacing="0">
				<colgroup>
				</colgroup> 
				<thead class="lth"> 
					<tr>
						<th>
							<input type="checkbox"  class="ckAll" onclick="ckAll(this);">
						</th>
						<th>번호</th> 
						<th>작성자</th>
						<th width="40%">제목</th>
						<th>등록일</th>
						<th>조회수</th> 
						<th width="7%">관리</th>
					</tr> 
				</thead>
				<tbody class="ltb otb" id="ajaxTable">
				  <c:forEach var = "vo" items="${notice_list}" varStatus="status">
				  	<tr class="list-row ">    
						<td align="center">
							<input type="checkbox" class="select_ck_num" name="select_ck_num" value="${vo.notice_num}" data-provider_seq="1">
						</td>   
						<td align="center" class="number">${vo.notice_num}</td> 
						<td align="center" class="name">${admin_list[status.index].admin_id}</td> 
						<td align="left">    
							<span class="hand blue layer_board_view_btn"  board_seq="${vo.notice_num}" board_id="${board_id}">
								${vo.notice_title}
							</span>   
						</td>   
						<c:set var="date" value="${vo.notice_date}"/> 
							<%--  수정 등록일 날짜,시간 표시  --%> 
							<%  
								Date date = (Date) pageContext.getAttribute("date");
								SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
								String date_txt = sdate.format(date);
								pageContext.setAttribute("date_txt", date_txt); 
							%> 
						<td align="center" class="date">${date_txt}</td> 
						<td align="center">${vo.notice_hit}</td>  
						<td align="center" nowrap="">
							<span class="admin_detail_btn small valign-middle">
								<input type="button" class="board_modify_btn" name="board_modify_btn" board_seq="${vo.notice_num}" board_id="${board_id}" value="수정">
							</span>
							<span class="btn small valign-middle">
								<a type="button" name="board_delete_btn" href="<c:url value='/board_delete?board_seq=${vo.notice_num}&board_id=${board_id}'/>">삭제</a>
							</span>
						</td>
					</tr>
				  </c:forEach>
				</tbody>
			</table>  
		</c:when>
		<%--  이벤트 --%>
		<c:when test="${board_id eq 'event'}">
			<table class="list-table-style qna_list_table board_list_tables">
				<colgroup>
				</colgroup> 
				<thead class="lth">
					<tr>
						<th>
							<input type="checkbox"  class="ckAll" onclick="ckAll(this);">
						</th>
						<th>번호</th>
						<th>작성자</th>
						<th width="40%">제목</th>
						<th>등록일/종료일</th>
						<th>조회수</th> 
						<th width="7%">관리</th>
					</tr>
				</thead>
				<tbody class="ltb otb" id="ajaxTable">
					 <c:forEach var = "vo" items="${event_list}" varStatus="status">
					  	<tr class="list-row ">    
							<td align="center">
								<input type="checkbox" class="select_ck_num" name="select_ck_num" value="${vo.event_num}" data-provider_seq="1">
							</td>   
							<td align="center" class="number">${vo.event_num}</td> 
							<td align="center" class="name">${admin_list[status.index].admin_id}</td> 
							<td align="left">    
								<span class="hand blue layer_board_view_btn"  board_seq="${vo.event_num}" board_id="${board_id}">
									${vo.event_title}
								</span>   
							</td>    
							<c:set var="date" value="${vo.event_date}"/> 
								<%--  수정 등록일 날짜,시간 표시  --%> 
								<%  
									Date date = (Date) pageContext.getAttribute("date");
									SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
									String date_txt = sdate.format(date);
									pageContext.setAttribute("date_txt", date_txt); 
									
								%> 
							<td align="center" class="date">
								<p>${date_txt}</p>
								<p>${vo.event_period}</p>
							</td> 
							<td align="center">${vo.event_hit}</td>  
							<td align="center" nowrap="">
								<span class="admin_detail_btn small valign-middle">
									<input type="button" class="board_modify_btn" name="board_modify_btn" board_seq="${vo.event_num}" board_id="${board_id}" value="수정">
									<a type="button" name="board_delete_btn" href="<c:url value='/board_delete?board_seq=${vo.event_num}&board_id=${board_id}'/>">삭제</a>
								</span>
							</td>    
						</tr>  
					  </c:forEach> 
				</tbody>  
				</tbody>
			</table>
		</c:when>
		<%--  리뷰 --%>
		<c:when test="${board_id eq 'review'}">
			<table class="list-table-style qna_list_table board_list_tables" cellspacing="0">
				<colgroup>
				</colgroup> 
				<thead class="lth">
					<tr> 
						<th>
							<input type="checkbox"  class="ckAll" onclick="ckAll(this);">
						</th>
						<th>번호</th>
						<th>작성자</th>
						<th width="40%">내용</th>
						<th>등록일</th>
						<th> 
							<select name="score" id="review_grade" class="line">
									<option value="" selected="selected">-평점전체-</option>
									<option value="1">★</option>
									<option value="2">★★</option>
									<option value="3">★★★</option>
									<option value="4">★★★★</option>
									<option value="5">★★★★★</option>
							</select>
						</th> 
						<th width="8%">추천수/신고수</th>  
						<th width="7%">관리</th>
					</tr>
				</thead>
				<tbody class="ltb otb" id="ajaxTable">
					 <c:forEach var = "vo" items="${review_list}" varStatus="status">
					  	<tr class="list-row ">    
							<td align="center">
								<input type="checkbox" class="select_ck_num" name="select_ck_num" value="${vo.review_num}" data-provider_seq="1">
							</td>   
							<td align="center" class="number">${vo.review_num}</td> 
							<td align="center" class="name">${member_list[status.index].members_id}</td> 
							<td align="left">    
								<span class="hand blue layer_board_view_btn"  board_seq="${vo.review_num}" board_id="${board_id}">
									${vo.review_content}
								</span>   
							</td>     
							<c:set var="date" value="${vo.review_date}"/> 
								<%--  수정 등록일 날짜,시간 표시  --%> 
								<%  
									Date date = (Date) pageContext.getAttribute("date");
									SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
									String date_txt = sdate.format(date);
									pageContext.setAttribute("date_txt", date_txt); 
									
								%> 
							<td align="center" class="date">
								<p>${date_txt}</p>
							</td>  
							<td align="center" class="review_grade">${vo.review_grade}</td>  
							<td align="center">${vo.review_recommend}/${vo.review_report}</td>  
							<td align="center" nowrap="">
								<span class="admin_detail_btn small valign-middle">
									<input type="button" class="layer_board_view_btn" board_seq="${vo.review_num}" board_id="${board_id}" value="상세">
									<a type="button" name="board_delete_btn" href="<c:url value='/board_delete?board_seq=${vo.review_num}&board_id=${board_id}'/>">삭제</a>
								</span> 
							</td>   
						</tr>
					  </c:forEach>
				</tbody> 
			</table> 
		</c:when>
	</c:choose>

		<p style="margin-top:10px;"><input type="button" onclick="ck_null('board_list');" value="선택 삭제"></p>
	</form>
	</div> 

	<%-- 페이지 네비게이션 --%> 
	<ul class="pagination item_pagenum">
		<li class="page-item"> 
			<input hidden="hiddne" class="url_val" value="/admin_board_list?pageNum=${util.pageNum}&board_id=${board_id}&keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}" >
			<c:choose> 
				<c:when test="${(util.startPageNum%util.pageBlockCount==1) && (util.startPageNum>util.pageBlockCount)}">
					<a class="page-link" href="<c:url value='/admin_board_list?pageNum=${util.startPageNum-1}&list_arr=${list_arr}&rowCount=${rowCount}&board_id=${board_id}&keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}'/>" aria-label="Previous">
						<span aria-hidden="true">«</span>
					</a>  
				</c:when>    
				<c:otherwise>
					<a class="page-link" href="<c:url value='/admin_board_list?pageNum=${util.pageNum-1 }&list_arr=${list_arr}&rowCount=${rowCount}&board_id=${board_id}&keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}'/>" aria-label="Previous">
					<span aria-hidden="true">«</span>
					</a> 
				</c:otherwise>
			</c:choose>    
		</li> 
		<c:forEach var="i" begin="${util.startPageNum }" end="${util.endPageNum }">
			<c:choose> 
				<c:when test="${util.pageNum==i }"> 
					<li class="page-item" id="page_ck" ><a class="page-link"  href="<c:url value='/admin_board_list?pageNum=${i}&list_arr=${list_arr}&rowCount=${rowCount}&board_id=${board_id}&keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}'/>">${i}</a></li>
				</c:when> 
				<c:otherwise> 
					<li class="page-item"><a class="page-link" href="<c:url value='/admin_board_list?pageNum=${i}&list_arr=${list_arr}&rowCount=${rowCount}&board_id=${board_id}&keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}'/>">${i}</a></li>
				</c:otherwise>
			</c:choose>    
		</c:forEach>  
		<li class="page-item">
			<c:choose>
				<c:when test="${util.pageNum < util.totalPageCount}">
					<a class="page-link" href="<c:url value='/admin_board_list?pageNum=${util.pageNum + 1 }&list_arr=${list_arr}&board_id=${board_id}&keyword=${keyword}&search_date=${search_date}&search_end_date=${search_end_date}'/>" aria-label="Next"> 
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
													<input type="text" name="notice_official_date" id="onlynotice_sdate" value="" class="period line" maxlength="10" size="10" disabled="disabled" autocomplete="off">
													<img class="ui-datepicker-trigger" src="<c:url value='/resources/images/icon_calendar.gif'/>" alt="..." title="...">
													~ 
													<input type="text" name="notice_official_date" id="onlynotice_edate" value="" class="period line" maxlength="10" size="10" disabled="disabled" autocomplete="off">
													<img class="ui-datepicker-trigger" src="<c:url value='/resources/images/icon_calendar.gif'/>" title="...">
												</span>
											</div>
									</td>
								</tr>
								<tr> 
									<th class="its-th-align center">제목</th>
									<td class="its-td">
										<input type="text" name="${board_id}_title" class="board_title" id="subject" value="제목을 입력해주세요" class="required line" title="제목을 입력해 주세요" style="width: 95%" placeholder="제목을 입력해 주세요">
										<input hidden="hidden" class="board_id" name="board_id" value="${board_id}" >
										<input hidden="hidden" class="board_num" name="${board_id}_num" value="" >
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
										<img class="ui-datepicker-trigger" src="<c:url value='/resources/images/icon_calendar.gif'/>" alt="..." title="..." >
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
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-lite.min.js"></script>
<script>
$(document).ready(function(){
	$(".period").datepicker({
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