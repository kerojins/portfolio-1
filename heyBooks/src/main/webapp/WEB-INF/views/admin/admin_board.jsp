<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container board_list">
	<div id="boardmain">
		<div id="boardtopright" style="width: 49.2%; margin: 30px 3px 0;"
			class="fl">
			<ul class="clearbox">
				<li class="left-btns"><div class="item_add_head">
						<h3>1:1문의</h3>
					</div></li>
				<li class="right-btns"
					style="font-size: 12px; font-weight: bold; vertical-align: middle;"><a
					href="<c:url value='/admin_board_list?board=qna'/>"> + 더보기</a></li>
			</ul>
			<table class="list-table-style" style="table-layout: auto;"
				cellspacing="0">
				<colgroup>
					<col width="50">
					<col width="20%">
					<col>
					<col width="70">
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
				<!-- 테이블 헤더 : 끝 -->
				<!-- 리스트 : 시작 -->
				<tbody class="ltb otb" id="ajaxTable">
					<!-- 리스트데이터 : 시작 -->
					<tr class="list-row  ">
						<td align="center" class="number">5</td>
						<td align="left" class="name pdl10">(gso***)</td>
						<td align="left" class="pdl10"><span
							class="hand  blue  mbqna_boad_view_btn layer_boad_view_btn"
							viewlink="/admin/board/view?id=mbqna&amp;seq=17" board_seq="17"
							board_id="mbqna"> <span class="cat">[기타문의]</span>가정에서의
								전기안전
						</span></td>
						<td align="center"><span class="gray"></span></td>
						<td align="center" class="date">2019-06-13 23:05</td>
					</tr>
					<tr class="list-row  ">
						<td align="center" class="number">4</td>
						<td align="left" class="name pdl10">(gso***)</td>
						<td align="left" class="pdl10"><span
							class="hand  blue  mbqna_boad_view_btn layer_boad_view_btn"
							viewlink="/admin/board/view?id=mbqna&amp;seq=16" board_seq="16"
							board_id="mbqna"> <span class="cat">[기타문의]</span>산업안전보건법
								법령...
						</span></td>
						<td align="center"><span class="gray"></span></td>
						<td align="center" class="date">2019-06-13 23:02</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="boardtopleft" class="fr">
			<ul class="clearbox">
				<li class="left-btns"><div class="item_add_head">
						<h3>공지사항</h3>
					</div></li>
				<li class="right-btns"
					style="font-size: 12px; font-weight: bold; vertical-align: middle;"><a
					href="<c:url value='/admin_board_list?board=notice'/>"> + 더보기</a></li>
			</ul>
			<table class="list-table-style" style="table-layout: auto;"
				cellspacing="0">
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
				<!-- 테이블 헤더 : 끝 -->
				<!-- 리스트 : 시작 -->
				<tbody class="ltb otb" id="ajaxTable">
					<!-- 리스트데이터 : 시작 -->
					<tr class="list-row  ">
						<td align="center" class="number">3</td>
						<td align="left" class="name pdl10"><img
							src="/data/skin/responsive_ver1_default_gl/images/board/icon/icon_admin.gif"
							id="icon_admin_img" align="absmiddle"
							style="vertical-align: middle;"> (gso***)</td>
						<td align="left" class="pdl10"><span
							class="hand  blue   notice_boad_view_btn add_boad_view_btn"
							viewlink="/admin/board/view?id=notice&amp;seq=19" board_seq="19"
							board_id="notice"> <span class="cat">[공지]</span>공지공지입니다
						</span></td>
						<td align="center" class="date">2019-10-12 02:05</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="cboth"></div>
		<div id="boardtopright" class="fl">
			<ul class="clearbox">
				<li class="left-btns"><div class="item_add_head">
						<h3>이벤트</h3>
					</div></li>
				<li class="right-btns"
					style="font-size: 12px; font-weight: bold; vertical-align: middle;"><a
					href="<c:url value='/admin_board_list?board=event'/>"> + 더보기</a></li>
			</ul>
			<table class="list-table-style" style="table-layout: auto;"
				cellspacing="0">
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
				<!-- 테이블 헤더 : 끝 -->
				<!-- 리스트 : 시작 -->
				<tbody class="ltb otb" id="ajaxTable">
					<!-- 리스트데이터 : 시작 -->
					<tr class="list-row  ">
						<td align="center" class="number">3</td>
						<td align="left" class="name pdl10"><img
							src="/data/skin/responsive_ver1_default_gl/images/board/icon/icon_admin.gif"
							id="icon_admin_img" align="absmiddle"
							style="vertical-align: middle;"> (gso***)</td>
						<td align="left" class="pdl10"><span
							class="hand  blue   notice_boad_view_btn add_boad_view_btn"
							viewlink="/admin/board/view?id=notice&amp;seq=19" board_seq="19"
							board_id="notice"> <span class="cat">[공지]</span>공지공지입니다
						</span></td>
						<td align="center" class="date">2019-10-12 02:05</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="boardtopleft" class="fr">
			<ul class="clearbox">
				<li class="left-btns"><div class="item_add_head">
						<h3>리뷰관리</h3>
					</div></li>
				<li class="right-btns"
					style="font-size: 12px; font-weight: bold; vertical-align: middle;"><a
					href="<c:url value='/admin_board_list?board=review'/>"> + 더보기</a></li>
			</ul>
			<table class="list-table-style" style="table-layout: auto;"
				cellspacing="0">
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
				<!-- 테이블 헤더 : 끝 -->
				<!-- 리스트 : 시작 -->
				<tbody class="ltb otb" id="ajaxTable">
					<!-- 리스트데이터 : 시작 -->
					<tr class="list-row  ">
						<td align="center" class="number">8</td>
						<td align="left" class="name pdl10">배정훈 (비회원)</td>
						<td align="left" class="pdl10"><span
							class="hand  blue  goods_review_boad_view_btn layer_boad_view_btn"
							viewlink="/admin/board/view?id=goods_review&amp;seq=1"
							board_seq="1" board_id="goods_review">테스트 </span> <img
							src="/admin/skin/default/images/board/icon/icon_img.gif"
							title="첨부파일" align="absmiddle"></td>
						<td align="center" class="date">2019-03-11 18:05</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="cboth"></div>
	</div>
	<div
		class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-draggable board_list_view"
		tabindex="-1" role="dialog" aria-labelledby="ui-dialog-title-dlg"
		style="">
		<div
			class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
			<span class="ui-dialog-title" id="ui-dialog-title-dlg">게시글 보기</span><a
				href="#" class="ui-dialog-titlebar-close ui-corner-all close_btn"
				role="button"><span class="ui-icon ui-icon-closethick">close</span></a>
		</div>
		<div id="dlg" class="ui-dialog-content ui-widget-content"
			scrolltop="0" scrollleft="0"
			style="width: auto; min-height: 58px; height: auto;">
			<div id="dlg_content">
				<div id="boardview">
					<br style="line-height: 12px;">
					<div class="viewbox">
						<form name="form1" id="board_view_form" method="post"
							action="/admin/board_process" target="actionFrame">
							<!-- 페이지 타이틀 바 : 시작 -->
							<div id="page-title-bar-area" style="margin-top: -40px;">
								<div id="page-title-bar">
									<!-- 타이틀 -->
									<div class="page-title">
										<h2>[1:1문의] 게시글 보기</h2>
									</div>
									<!-- 좌측 버튼 -->
									<ul class="page-buttons-left">
										<li><span class="btn small white"><button
													type="button" name="boardviewclose">
													게시글리스트<span class="arrowright"></span>
												</button></span></li>
									</ul>
									<!-- 우측 버튼 -->

									<ul class="page-buttons-right">
										<li></li>
										<li><span class="btn small black boad_modify_btn"><button
													type="button" name="boad_modify_btn" board_seq="17"
													board_id="mbqna">수정</button></span></li>
										<li><span class="btn small black"><button
													type="button" name="boad_reply_btn" board_seq="17"
													board_id="mbqna">답변등록</button></span></li>
										<li><span class="btn small black"><button
													type="button" name="boad_delete_btn" board_seq="17"
													board_id="mbqna">삭제</button></span></li>
									</ul>
								</div>
							</div>
							<!-- 페이지 타이틀 바 : 끝 -->

							<table class="bbsview_table_style" style="width: 100%"
								cellpadding="0" cellspacing="0" border="0">
								<colgroup>
									<col>
									<col width="300px">
								</colgroup>
								<thead>
									<tr>
										<th class="left pdl5  pdt5 pdb5"><b> 가정에서의 전기안전 </b></th>
										<th class="right"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="cell" colspan="2">
											<table width="100%" border="0" cellpadding="0"
												cellspacing="0">
												<tbody>
													<tr style="border: none">
														<td width="5"></td>
														<td>
															<table align="right" class="board_list_info" border="0"
																cellpadding="0" cellspacing="0" width="100%">
																<tbody>
																	<tr style="border: none">
																		<td><span class="fl"><span class="han">작성자</span>
																				:&nbsp;</span><span class="fl">관리자 (gso***)</span></td>
																		<td class="cell_bar">|</td>
																		<td><span class="han">조회:</span> <span
																			class="num">0</span></td>
																		<td class="cell_bar">|</td>
																		<td><span class="han">날짜:</span> <span
																			class="num">2019-06-13 23:05:55</span></td>
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

									<tr>
										<td class="cell" colspan="2">
											<div class="content">상품정보가 없습니다.</div>
										</td>
									</tr>

								</tbody>
							</table>

							<div class="content">
								<p>
									<a href="https://www.youtube.com/watch?v=1IRKKJzDNkE">https://www.youtube.com/watch?v=1IRKKJzDNkE</a>
								</p>
								<p>
									<br>
								</p>
							</div>
						</form>
						<!-- 이전/다음 -->
						<div id="prenextlist" style="margin: 15px 0 5px">
							<table style="width: 100%">
								<colgroup>
									<col width="10%">
									<col>
									<col width="20%">
									<col width="15%">
								</colgroup>
								<tbody>
									<tr style="border-top: 1px solid #ddd;">
										<td class="center"><i class="fas fa-angle-down"></i> 이전글</td>
										<td class="left"><span
											class="blue hand boad_view_btn sbj"
											viewlink="/admin/board/mbqna_view?id=mbqna&amp;mainview=1&amp;seq=16"
											board_seq="16" board_id="mbqna"><a>산업안전보건법 법령구조도</a></span></td>
										<td class="right">관리자 (gso***)</td>
										<td class="center">2019-06-13 23:02</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 이전/다음 -->
					</div>
					<!-- 댓글관리 start -->
					<!-- 댓글관리 end  -->
				</div>
				<form name="writeform" id="writeform" method="post"
					action="/admin/board_process" enctype="multipart/form-data"
					target="actionFrame" novalidate="novalidate">
					<input type="hidden" name="callPage" id="callPage" value="">
					<input type="hidden" name="mode" id="mode" value="board_modify">
					<input type="hidden" name="board_id" id="board_id" value="mbqna">
					<input type="hidden" name="reply" id="reply" value=""> <input
						type="hidden" name="mainview" id="mainview" value="1"> <input
						type="hidden" name="seq" id="seq" value="17"> <input
						type="hidden" name="returnurl" id="returnurl"
						value="/admin/board/board?id=mbqna&amp;mainview=1">
					<!-- 페이지 타이틀 바 : 시작 -->
					<div id="page-title-bar-area" style="margin-top: -20px;">
						<div id="page-title-bar">
							<!-- 타이틀 -->
							<div class="page-title">
								<h2>[1:1문의] 게시글 수정</h2>
							</div>
							<!-- 좌측 버튼 -->
							<ul class="page-buttons-left">
								<li><span class="btn large white"><button
											type="button"
											onclick="document.location.href='/admin/board/board?id=mbqna';">
											게시글리스트<span class="arrowright"></span>
										</button></span></li>
								<li><span class="btn large white boad_view_btn"
									viewlink="/admin/board/mbqna_view?id=mbqna&amp;mainview=1&amp;seq=17"><button
											type="button">게시글보기</button></span></li>
							</ul>
							<!-- 우측 버튼 -->
							<ul class="page-buttons-right">
								<li><span class="btn large black"><button
											type="submit" name="data_save_btn" id="data_save_btn">
											저장하기<span class="arrowright"></span>
										</button></span></li>
							</ul>
						</div>
					</div>
					<!-- 페이지 타이틀 바 : 끝 -->

					<!-- 서브메뉴 바디 : 시작-->
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
									<td class="its-td">관리자 <input type="hidden" name="name"
										id="name" value="관리자" title="작성자를 입력해 주세요"
										class="required line" placeholder="작성자를 입력해 주세요">
										(IP:175.116.250.225)

									</td>
								</tr>

								<tr>
									<th class="its-th-align center">질문유형</th>
									<td class="its-td"><select name="category"
										id="addcategory" class="required line">
											<option value="" selected="selected">- 질문유형선택 -</option>
											<option value="배송지연/불만">배송지연/불만</option>
											<option value="반품문의 ">반품문의</option>
											<option value="A/S문의">A/S문의</option>
											<option value="환불문의 ">환불문의</option>
											<option value="주문결제문의 ">주문결제문의</option>
											<option value="회원정보문의">회원정보문의</option>
											<option value="취소문의 ">취소문의</option>
											<option value="교환문의 ">교환문의</option>
											<option value="상품정보문의 ">상품정보문의</option>
											<option value="기타문의" selected="selected">기타문의</option>
											<option value="newadd">- 신규질문유형 -</option>
									</select> <input type="text" name="newcategory" id="newcategory"
										value="" title="질문유형을 입력해 주세요" class="hide line" size="30"
										placeholder="질문유형을 입력해 주세요"></td>
								</tr>

								<!-- 게시판 스킨이 썸네일일 경우 공지글, 팝업, 비밀글 기능 비활성화 by hed 기획팀 요청 jhs -->
								<tr>
									<th class="its-th-align center">공지글 여부</th>
									<td class="its-td"><input type="checkbox" name="notice"
										id="boardnotice" value="1" onclick="noticecheck()"><label
										for="boardnotice"> 공지글입니다.</label>
										<div class="noticelay " style="width: 99%; padding: 3px 5px;">
											<label> <input type="radio" name="onlynotice"
												id="onlynotice0" value="0" disabled="disabled"> 공지글
												영역과 리스트 영역에 해당 글이 보여집니다.
											</label><br> <label> <input type="radio"
												name="onlynotice" id="onlynotice1" value="1"
												disabled="disabled"> 공지글 영역에서 특정기간동안(설정 시)만 해당 글이
												보여집니다.
											</label> <span> <input type="text" name="onlynotice_sdate"
												id="onlynotice_sdate" value=""
												class="line datepicker hasDatepicker" maxlength="10"
												size="10" disabled="disabled"><img
												class="ui-datepicker-trigger"
												src="/app/javascript/jquery/icon_calendar.gif" alt="..."
												title="...">~ <input type="text"
												name="onlynotice_edate" id="onlynotice_edate" value=""
												class="line datepicker hasDatepicker" maxlength="10"
												size="10" disabled="disabled"><img
												class="ui-datepicker-trigger"
												src="/app/javascript/jquery/icon_calendar.gif" alt="..."
												title="...">
											</span>
										</div></td>
								</tr>

								<tr>
									<th class="its-th-align center">질문</th>
									<td class="its-td"><input type="text" name="subject"
										id="subject" value="가정에서의 전기안전" class="required line"
										title="제목을 입력해 주세요" style="width: 95%"
										placeholder="제목을 입력해 주세요"></td>
								</tr>
								<tr>
									<th class="its-th-align center">내용</th>
									<td class="its-td">
										<textarea id="summernote"></textarea>
									</td>
								</tr>
								<tr class="hide" id="filelistlay">
									<th class="its-th-align center">첨부파일</th>
									<td class="its-td">
										<div>
											<table class="simplelist-table-style boardfileliststyle"
												id="BoardFileTable" style="width: 100%">
												<colgroup>
													<col width="10%">
													<col width="60%">
													<col width="20%">
												</colgroup>
												<thead>
													<tr>
														<th>순서</th>
														<th>파일</th>
														<th><span class="btn-plus gray"><button
																	type="button" id="boardfileadd"></button></span></th>
													</tr>
												</thead>
												<tbody class="ui-sortable" style="">
													<tr style="">
														<td align="center">↕</td>
														<td align="center"><input type="file"
															name="file_info[]"></td>
														<td align="center"><span class="btn-minus gray"><button
																	type="button" class="etcDel"></button></span></td>
													</tr>
												</tbody>
											</table>
										</div>
									</td>
								</tr>
								<tr>
									<th class="its-th-align center" colspan="2">
										<div class="after">
											저장후 <input type="radio" name="backtype" id="backtype1"
												value="list" checked="checked"><label
												for="backtype1">목록으로 이동</label>
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