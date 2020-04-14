<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container board_list">
	<div id="boardmain">
		<%-- 1:1문의 --%>
		<div id="boardtopright" style="width: 49.2%; margin: 30px 3px 0;"
			class="fl">
			<ul class="clearbox">
				<li class="left-btns"><div class="item_add_head">
						<h3>1:1문의</h3>
					</div></li>
				<li class="right-btns"
					style="font-size: 12px; font-weight: bold; vertical-align: middle;"><a
					href="<c:url value='/admin_board_list?board_id=counsel'/>"> + 더보기</a></li>
			</ul>
			<table class="list-table-style counsel_table" style="table-layout: auto;">
				<colgroup>
					<col width="50">
					<col width="100">
					<col>
					<col width="100">
					<col width="110">
				</colgroup> 
				<thead class="lth">
					<tr> 
						<th>번호</th>
						<th>작성자</th>
						<th>내용</th>
						<th>상태</th>
						<th>문의일</th> 
					</tr>
				</thead>  
				<tbody class="ltb otb" id="ajaxTable"> 
					<c:forEach var="vo" begin="0" end="6" varStatus="status" items="${counsel_list}">
						<tr class="list-row"> 
							<td align="center" class="counsel_number board_number">${vo.counsel_num}</td>
							<td align="center" class="counsel_name board_name">${member_list[status.index].members_id}</td>
							<td align="left"  class="counsel_title board_title" class="pdl10"> 
								<span class="layer_board_view_btn counsel_btn" board_answer="${vo.counsel_answer}" board_id="counsel" board_seq="${vo.counsel_num}"> 
									<span class="cat">[${vo.counsel_type }]</span> 
									${vo.counsel_title}
								</span>  
							</td>  
							<td align="center" class="counsel_answer"><span class="gray">${vo.counsel_answer}</span></td>
							<c:set var="date" value="${vo.counsel_date}" />
							<%-- 수정 등록일 날짜,시간 표시 --%>
							<%
									Date date = (Date) pageContext.getAttribute("date");
									SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
									String date_txt = sdate.format(date);
									pageContext.setAttribute("date_txt", date_txt);
							%> 
							<td align="center"  class="counsel_date board_date">${date_txt}</td> 
						</tr>
					</c:forEach>  
				</tbody>
			</table>
		</div>
		<div id="boardtopleft" class="fr">
			<ul class="clearbox">
				<li class="left-btns">
					<div class="item_add_head">
						<h3>공지사항</h3>
					</div>
				</li>
				<li class="right-btns" style="font-size: 12px; font-weight: bold; vertical-align: middle;">
					<a href="<c:url value='/admin_board_list?board_id=notice'/>"> + 더보기</a>
				</li>
			</ul>
			<table class="list-table-style" style="table-layout: auto;">
				<colgroup>
					<col width="50">
					<col width="20%">
					<col>
					<col width="110">
				</colgroup>
				<thead class="lth">
					<tr>
						<th>번호</th>
						<th>관리자</th>
						<th>제목</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody class="ltb otb" id="ajaxTable"> 
					<c:forEach var="vo" begin="0" end="6" varStatus="status" items="${notice_list}">
						<tr class="list-row">  
							<td align="center" class="counsel_number board_number">${vo.notice_num}</td>
							<td align="center" class="counsel_name board_name">${notice_admin_list[status.index].admin_id}</td>
							<td align="left"  class="counsel_title board_title" class="pdl10"> 
								<span class="layer_board_view_btn" board_id="notice" board_seq="${vo.notice_num}"> 
									${vo.notice_title} 
								</span>  
							</td>  
							<c:set var="date" value="${vo.notice_date}" />
							<%-- 수정 등록일 날짜,시간 표시 --%> 
							<%
									Date date = (Date) pageContext.getAttribute("date");
									SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
									String date_txt = sdate.format(date);
									pageContext.setAttribute("date_txt", date_txt);
							%> 
							<td align="center"  class="counsel_date board_date">${date_txt}</td> 
						</tr>
					</c:forEach>  
				</tbody>
			</table>
		</div>
		<div class="cboth"></div>
		<div id="boardtopright" class="fl">
			<ul class="clearbox">
				<li class="left-btns">
					<div class="item_add_head">
						<h3>이벤트</h3>
					</div>
				</li>
				<li class="right-btns" style="font-size: 12px; font-weight: bold; vertical-align: middle;">
					<a href="<c:url value='/admin_board_list?board_id=event'/>"> + 더보기</a>
				</li>
			</ul>
			<table class="list-table-style" style="table-layout: auto;">
				<colgroup>
					<col width="50">
					<col width="20%">
					<col>
					<col width="110">
				</colgroup>
				<thead class="lth">
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>내용</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody class="ltb otb" id="ajaxTable">
					<c:forEach var="vo" begin="0" end="6" varStatus="status" items="${event_list}">
						<tr class="list-row">  
							<td align="center" class="counsel_number board_number">${vo.event_num}</td>
							<td align="center" class="counsel_name board_name">${event_admin_list[status.index].admin_id}</td>
							<td align="left"  class="counsel_title board_title" class="pdl10"> 
								<span class="layer_board_view_btn" board_id="event" board_seq="${vo.event_num}"> 
									${vo.event_title}  
								</span>    
							</td>  
							<c:set var="date" value="${vo.event_date}" />
							<%-- 수정 등록일 날짜,시간 표시 --%> 
							<%
									Date date = (Date) pageContext.getAttribute("date");
									SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
									String date_txt = sdate.format(date);
									pageContext.setAttribute("date_txt", date_txt);
							%> 
							<td align="center"  class="counsel_date board_date">${date_txt}</td> 
						</tr>
					</c:forEach>  
				</tbody>
			</table>
		</div>
		<div id="boardtopleft" class="fr">
			<ul class="clearbox">
				<li class="left-btns">
					<div class="item_add_head">
						<h3>리뷰관리</h3>
					</div>
				</li>
				<li class="right-btns"
					style="font-size: 12px; font-weight: bold; vertical-align: middle;">
					<a href="<c:url value='/admin_board_list?board_id=review'/>"> + 더보기</a>
				</li>
			</ul>
			<table class="list-table-style" style="table-layout: auto;" cellspacing="0">
				<colgroup>
					<col width="50">
					<col width="20%">
					<col>
					<col width="110">
				</colgroup>
				<thead class="lth">
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>내용</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody class="ltb otb" id="ajaxTable">
					<c:forEach var="vo" begin="0" end="6" varStatus="status" items="${review_list}">
						<tr class="list-row">  
							<td align="center" class="counsel_number board_number">${vo.review_num}</td>
							<td align="center" class="counsel_name board_name">${rmember_list[status.index].members_id}</td>
							<td align="left"  class="counsel_title board_title" class="pdl10">  
								<span class="layer_board_view_btn" board_id="review" board_seq="${vo.review_num}"> 
									${vo.review_content}   
								</span>    
							</td>  
							<c:set var="date" value="${vo.review_date}" />
							<%-- 수정 등록일 날짜,시간 표시 --%> 
							<%
									Date date = (Date) pageContext.getAttribute("date");
									SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
									String date_txt = sdate.format(date);
									pageContext.setAttribute("date_txt", date_txt);
							%> 
							<td align="center"  class="counsel_date board_date">${date_txt}</td> 
						</tr>
					</c:forEach>  
				</tbody> 
			</table>
		</div>
		<div class="cboth"></div>
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
													<input type="text" name="notice_official_date" id="onlynotice_sdate" value="" class="period line" maxlength="10" size="10" disabled="disabled" autocomplete="off">
													<img class="ui-datepicker-trigger" src="<c:url value='/resources/images/icon_calendar.gif'/>" alt="..." title="...">
													~ 
													<input type="text" name="notice_official_date" id="onlynotice_edate" value="" class="period line" maxlength="10" size="10" disabled="disabled" autocomplete="off">
													<img class="ui-datepicker-trigger" src="<c:url value='/resources/images/icon_calendar.gif'/>" alt="..." title="...">
												</span>
											</div>
									</td>
								</tr>
								<tr> 
									<th class="its-th-align center">제목</th>
									<td class="its-td">
										<input type="text" name="${board_id}_title" class="board_title" id="subject" value="제목을 입력해주세요" class="required line" title="제목을 입력해 주세요" style="width: 95%" placeholder="제목을 입력해 주세요">
										<input hidden="hidden"  class="board_id" name="board_id" value="${board_id}" >
										<input hidden="hidden" class="board_num" name="${board_id}_num" value="" >
										<input hidden="hidden" name="admin_board" value="board_main">
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
<script type="text/javascript">
$(document).ready(function(){
	$(".event_period").datepicker({
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