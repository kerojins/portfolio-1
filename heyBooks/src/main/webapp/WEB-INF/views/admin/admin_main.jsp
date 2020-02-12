<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="admin_home_content">
	<div class="container">
		<div class="admin_home_left">
			<div class="admin_brief">
				<div class="today_info brief_content">
					<span class="brief_title">오늘 <i class="fas fa-chevron-right"></i></span>
					<p>
						<span class="brief_subtitle">결제</span><i>3</i>건
					</p>
					<p>
						<span class="brief_subtitle">매출</span><i>3,0000</i>원
					</p>
					<p>
						<span class="brief_subtitle">가입</span><i>0</i>명
					</p>
					<p>
						<span class="brief_subtitle">방문</span><i>20</i>명
					</p>
				</div>
				<div class="total_info brief_content">
					<span class="brief_title">누적 <i class="fas fa-chevron-right"></i></span>
					<p>
						<span class="brief_subtitle">회원</span><i>13</i>명
					</p>
					<p>
						<span class="brief_subtitle">적립금</span><i>4324,343</i>원
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
							<td><a href="">${order_cnt_arr[0]}</a>건</td>
						</tr>
						<tr>
							<th>결제확인</th>
							<td>
								<a href="">${order_cnt_arr[1]}</a>건
							</td>
						</tr>
						<tr>
							<th>상품준비</th>
							<td><a href="">${order_cnt_arr[2]}</a>건</td>
						</tr>
						<tr>
							<th>배송중</th>
							<td><a href="">${order_cnt_arr[3]}</a>건</td>
						</tr>
						<tr>
							<th>배송완료</th>
							<td><a href="">${order_cnt_arr[4]}</a>건</td>
						</tr>
						<tr>
							<th>환불접수</th>
							<td><a href="">${order_cnt_arr[5]}</a>건</td>
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
							<td><a href="">${item_cnt_arr[0]}</a>건</td>
						</tr>
						<tr> 
							<th>판매 중지</th>
							<td><a href="">${item_cnt_arr[1]}</a>건</td>
						</tr>
						<tr>
							<th>품절</th>
							<td><a href="">${item_cnt_arr[2]}</a>건</td>
						</tr>
						<tr>
							<th>신규등록(3일이내)</th>
							<td><a href="">${new_item_cnt}</a>건</td>
						</tr>
						<tr>
							<th>재고 20개미만</th>
							<td><a href="">${stock_item_cnt}</a>건</td>
						</tr>
					</table> 
				</div>
				<div class="col-md-3">
					<span class="more"><i class="fas fa-plus"></i></span> <span
						class="count">9</span>
					<h2>
						<i class="far fa-comment-alt"></i> 1:1문의
					</h2>
					<table class="qna_preview_table">
						<c:forEach var="list"  begin="0" end="6"  items="${counsel_list}">
							<tr>
								<th>${list.counsel_type}</th>
								<td><a href="">${list.counsel_title}</a></td>
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
						class="count">2</span>
					<h2>
						<i class="far fa-list-alt"></i> 리뷰관리
					</h2>
					<table class="qna_preview_table">
						<c:forEach var="list" begin="0" end="6"  items="${review_list}">
							<tr>
								<td><a href="">${list.review_content}</a></td>
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
								<td><a href="">${list.event_title}</a></td>
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
								<td><a href="">${list.notice_title}</a></td>
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
						<i class="fas fa-plus"></i>
					</div>
					<div class="board_privew_content">
						<table class="">
							<tr>
								<td><a href="">할인이 되나요??</a></td>
								<td>11.30</td>
							</tr>
							<tr>
								<td><a href="">취소하고싶어요</a></td>
								<td>10.28</td>
							</tr>
							<tr>
								<td><a href="">보통 얼마만에오나요??</a></td>
								<td>09.11</td>
							</tr>
							<tr>
								<td><a href="">표지가 많이 두껍나요</a></td>
								<td>09.09</td>
							</tr>
							<tr>
								<td><a href="">가격이 바뀐건가요</a></td>
								<td>09.09</td>
							</tr>
							<tr>
								<td><a href="">할인 또 언제하나요</a></td>
								<td>09.09</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="admin_home_right">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-bell fa-fw"></i> 관리 활동내역
				</div>
				<div class="panel-body">
					<div class="list-group">
						<c:forEach var="list" items="${admin_alert_list }">
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
					
					
					<!-- 	<a href="#" class="list-group-item"> <i
							class="fa fa-comment fa-fw"></i> New Comment <span
							class="pull-right text-muted small"><em>4 minutes ago</em>
						</span>
						</a> <a href="#" class="list-group-item"> <i
							class="fa fa-book fa-fw"></i> 3 New Followers <span
							class="pull-right text-muted small"><em>12 minutes
									ago</em> </span>
						</a> <a href="#" class="list-group-item"> <i
							class="fa fa-envelope fa-fw"></i> Message Sent <span
							class="pull-right text-muted small"><em>27 minutes
									ago</em> </span>
						</a> 
						 <a href="#" class="list-group-item"> <i
							class="fa fa-shopping-cart fa-fw"></i> New Order Placed <span
							class="pull-right text-muted small"><em>9:49 AM</em> </span>
						</a>  -->
					</div>
					<a href="#" class="btn btn-default btn-block">View All Alerts</a>
				</div>
				<div class="admin_memo">
					<div class="memo_write">
						<div class="memo_write_box">
							<textarea rows="" cols="">메모를 남기세요</textarea>
							<i class="fas fa-times"></i>
						</div>
						<a href="">등록</a>
					</div>
					<div class="panel-group wrap" id="accordion" role="tablist"
						aria-multiselectable="true">
						<div class="panel">
							<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseOne"
										aria-expanded="true" aria-controls="collapseOne">
										Collapsible item #1 </a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingOne">
								<div class="panel-body">Anim pariatur cliche
									reprehenderit, enim eiusmod high life accusamus terry
									richardson ad squid. 3 wolf moon officia aute, non cupidatat
									skateboard dolor brunch.</div>
							</div>
						</div>
						<!-- end of panel -->

						<div class="panel">
							<div class="panel-heading" role="tab" id="headingTwo">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo">
										Collapsible item #2 </a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingTwo">
								<div class="panel-body">Anim pariatur cliche
									reprehenderit, enim eiusmod high life accusamus terry
									richardson ad squid. 3 wolf moon officia aute, non cupidatat
									skateboard dolor brunch.</div>
							</div>
						</div>
						<!-- end of panel -->

						<div class="panel">
							<div class="panel-heading" role="tab" id="headingThree">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">
										Collapsible item #3 </a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingThree">
								<div class="panel-body">Anim pariatur cliche
									reprehenderit, enim eiusmod high life accusamus terry
									richardson ad squid. 3 wolf moon officia aute, non cupidatat
									skateboard dolor brunch.</div>
							</div>
						</div>
						<!-- end of panel -->

						<div class="panel">
							<div class="panel-heading" role="tab" id="headingFour">
								<h4 class="panel-title">
									<a class="collapsed" role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapseFour"
										aria-expanded="false" aria-controls="collapseFour">
										Collapsible item #4 </a>
								</h4>
							</div>
							<div id="collapseFour" class="panel-collapse collapse"
								role="tabpanel" aria-labelledby="headingFour">
								<div class="panel-body">Anim pariatur cliche
									reprehenderit, enim eiusmod high life accusamus terry
									richardson ad squid. 3 wolf moon officia aute, non cupidatat
									skateboard dolor brunch.</div>
							</div>
						</div>
						<!-- end of panel -->
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
	</div>
</div>