<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


		<div class="sub_right_box my_box_wrap mypage_order">
			<div class="sub_right_content">
				<form>
					<h3 class="my_page_title">주문 내역</h3>
					<div class="order_period">
						<p class="order_period_title">기간별 조회</p>
						<div class="order_period_box">
							<p class="order_period_btn">
								<a>최근 15일</a><a>1개월</a><a>2개월</a><a>3개월</a>
							</p>
							<input type="text" id="order_pre_date" placeholder="2019-09-22">
							~ <input type="text" id="order_ep_date" placeholder="2019-09-22">
							<a class="order_period_detail_btn" href="">조회</a>
						</div>
						<div class="my_mileage_count">
							<span class="my_mileage_count_title">적립 포인트</span>
							<p>0<span>원</span></p>
						</div>
					</div>
					<div id="_listContentArea">
					<div class="tit_month">
						<h4>2019.09</h4>
					</div>
					<ul class="list_area">
						<li class="list_item">
							<div class="item sub _interlockNo156889351154217d03m4oyo">
								<a href="/orderStatus/2019091931845781" class="item_content">
									<div class="state_space point">
										<span class="state _statusName">사용</span>
									</div>
									<div class="info_space">
										<!--N=a:pnt.detail-->
										<span class="date">2019.09.19</span> <strong
											class="title _titleName">결제 시 사용</strong>
										<p class="subtext">해맑음푸드</p>
									</div>
								</a>

								<div class="amount_space">
									<div class="amount_inner">
										<span class="point">-788원</span>
										<div class="func_area">
											<a href="#"
												class="func_button _click(nmp.front.order.timeline.home.list.removeEtc(20190919204511PNT20190919100680601)) _stopDefault">내역삭제</a>
											<!--N=a:pnt.del-->
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="list_item">
							<div class="item due _interlockNo156889351154217d03Seq6Y">
								<a href="/orderStatus/2019091931845781" class="item_content">
									<div class="state_space point">
										<span class="state _statusName">적립</span>
									</div>
									<div class="info_space">
										<!--N=a:pnt.detail-->
										<span class="date">2019.09.19</span> <strong
											class="title _titleName">구매 적립예정</strong>
										<p class="subtext">해맑음푸드</p>
									</div>
								</a>
								<div class="amount_space">
									<div class="amount_inner">
										<span class="point">+110원</span>
										<div class="func_area">
											<a href="#"
												class="func_button _click(nmp.front.order.timeline.home.list.removeEtc(20190919204511PNT20190919100680599)) _stopDefault">내역삭제</a>
											<!--N=a:pnt.del-->
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
					<div class="tit_month">
						<h4>2019.07</h4>
					</div>
					<ul class="list_area">
						<li class="list_item">
							<div class="item due _interlockNo15642939474810980ekWeCc">
								<a href="/orderStatus/2019072883337091" class="item_content">
									<div class="state_space point">
										<span class="state _statusName">취소</span>
									</div>
									<div class="info_space">
										<!--N=a:pnt.detail-->
										<span class="date">2019.07.28</span> <strong
											class="title _titleName">구매 적립예정취소</strong>
										<p class="subtext">oneline20</p>
									</div>
								</a>
								<div class="amount_space">
									<div class="amount_inner">
										<span class="point">-330원</span>
										<div class="func_area">
											<a href="#"
												class="func_button _click(nmp.front.order.timeline.home.list.removeEtc(20190728150547PNT201907287921412)) _stopDefault">내역삭제</a>
											<!--N=a:pnt.del-->
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="list_item">
							<div class="item add _interlockNo156429394670317d036B2JN">
								<a href="/orderStatus/2019072883337091" class="item_content">
									<div class="state_space point">
										<span class="state _statusName">취소</span>
									</div>
									<div class="info_space">
										<!--N=a:pnt.detail-->
										<span class="date">2019.07.28</span> <strong
											class="title _titleName">사용취소</strong>
										<p class="subtext">oneline20</p>
									</div>
								</a>
								<div class="amount_space">
									<div class="amount_inner">
										<span class="point">+788원</span>
										<div class="func_area">
											<a href="#"
												class="func_button _click(nmp.front.order.timeline.home.list.removeEtc(20190728150546PNT201907287921389)) _stopDefault">내역삭제</a>
											<!--N=a:pnt.del-->
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="list_item">
							<div class="item sub _interlockNo156425865775917d03Ixl6V">
								<a href="/orderStatus/2019072883337091" class="item_content">
									<div class="state_space point">
										<span class="state _statusName">사용</span>
									</div>
									<div class="info_space">
										<!--N=a:pnt.detail-->
										<span class="date">2019.07.28</span> <strong
											class="title _titleName">결제 시 사용</strong>
										<p class="subtext">oneline20</p>
									</div>
								</a>
								<div class="amount_space">
									<div class="amount_inner">
										<span class="point">-788원</span>
										<div class="func_area">
											<a href="#"
												class="func_button _click(nmp.front.order.timeline.home.list.removeEtc(20190728051737PNT201907286799351)) _stopDefault">내역삭제</a>
											<!--N=a:pnt.del-->
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="list_item">
							<div class="item due _interlockNo156425865775917d03mzyNU">
								<a href="/orderStatus/2019072883337091" class="item_content">
									<div class="state_space point">
										<span class="state _statusName">적립</span>
									</div>
									<div class="info_space">
										<!--N=a:pnt.detail-->
										<span class="date">2019.07.28</span> <strong
											class="title _titleName">구매 적립예정</strong>
										<p class="subtext">oneline20</p>
									</div>
								</a>
								<div class="amount_space">
									<div class="amount_inner">
										<span class="point">+330원</span>
										<div class="func_area">
											<a href="#"
												class="func_button _click(nmp.front.order.timeline.home.list.removeEtc(20190728051737PNT201907286799350)) _stopDefault">내역삭제</a>
											<!--N=a:pnt.del-->
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="list_item">
							<div class="item _interlockNo156209272723617d03uviMa add">
								<a href="/orderStatus/2019070377829051" class="item_content">
									<div class="state_space point">
										<span class="state _statusName">적립</span>
									</div>
									<div class="info_space">
										<!--N=a:pnt.detail-->
										<span class="date">2019.07.03</span> <strong
											class="title _titleName">구매 적립</strong>
										<p class="subtext">삼공주맘</p>
									</div>
								</a>
								<div class="amount_space">
									<div class="amount_inner">
										<span class="point">+46원</span>
										<div class="func_area">
											<a href="#"
												class="func_button _click(nmp.front.order.timeline.home.list.removeEtc(20190703033847PNT201907033074384)) _stopDefault">내역삭제</a>
											<!--N=a:pnt.del-->
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="list_item">
							<div class="item _interlockNo156201305942417d03SQ3ya add">
								<a href="/orderStatus/2019070264547140" class="item_content">
									<div class="state_space point">
										<span class="state _statusName">적립</span>
									</div>
									<div class="info_space">
										<!--N=a:pnt.detail-->
										<span class="date">2019.07.02</span> <strong
											class="title _titleName">구매 적립</strong>
										<p class="subtext">비노브레드</p>
									</div>
								</a>
								<div class="amount_space">
									<div class="amount_inner">
										<span class="point">+57원</span>
										<div class="func_area">
											<a href="#"
												class="func_button _click(nmp.front.order.timeline.home.list.removeEtc(20190702053059PNT201907026867188)) _stopDefault">내역삭제</a>
											<!--N=a:pnt.del-->
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
					<div class="tit_month">
						<h4>2019.06</h4>
					</div>
					<ul class="list_area  ">
						<li class="list_item">
							<div class="item _interlockNo156149334061617d03Xonzw add">
								<a href="/orderStatus/2019062686431221" class="item_content">
									<div class="state_space point">
										<span class="state _statusName">적립</span>
									</div>
									<div class="info_space">
										<!--N=a:pnt.detail-->
										<span class="date">2019.06.26</span> <strong
											class="title _titleName">구매 적립</strong>
										<p class="subtext">현대백화점</p>
									</div>
								</a>
								<div class="amount_space">
									<div class="amount_inner">
										<span class="point">+50원</span>
										<div class="func_area">
											<a href="#"
												class="func_button _click(nmp.front.order.timeline.home.list.removeEtc(20190626050900PNT201906262161281)) _stopDefault">내역삭제</a>
											<!--N=a:pnt.del-->
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="list_item">
							<div class="item _interlockNo156149314786917d03ZDtDm add">
								<a href="/orderStatus/2019062686427241" class="item_content">
									<div class="state_space point">
										<span class="state _statusName">적립</span>
									</div>
									<div class="info_space">
										<!--N=a:pnt.detail-->
										<span class="date">2019.06.26</span> <strong
											class="title _titleName">구매 적립</strong>
										<p class="subtext">oneline20</p>
									</div>
								</a>
								<div class="amount_space">
									<div class="amount_inner">
										<span class="point">+165원</span>
										<div class="func_area">
											<a href="#"
												class="func_button _click(nmp.front.order.timeline.home.list.removeEtc(20190626050547PNT201906262159684)) _stopDefault">내역삭제</a>
											<!--N=a:pnt.del-->
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="list_item">
							<div class="item sub _interlockNo156139682131217d03sgoHM">
								<a href="/orderStatus/2019062573248121" class="item_content">
									<div class="state_space point">
										<span class="state _statusName">사용</span>
									</div>
									<div class="info_space">
										<!--N=a:pnt.detail-->
										<span class="date">2019.06.25</span> <strong
											class="title _titleName">결제 시 사용</strong>
										<p class="subtext">라임모카</p>
									</div>
								</a>
								<div class="amount_space">
									<div class="amount_inner">
										<span class="point">-753원</span>
										<div class="func_area">
											<a href="#"
												class="func_button _click(nmp.front.order.timeline.home.list.removeEtc(20190625022021PNT201906257077426)) _stopDefault">내역삭제</a>
											<!--N=a:pnt.del-->
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="list_item">
							<div class="item _interlockNo156139682131217d03lTdZW add">
								<a href="/orderStatus/2019062573248121" class="item_content">
									<div class="state_space point">
										<span class="state _statusName">적립</span>
									</div>
									<div class="info_space">
										<!--N=a:pnt.detail-->
										<span class="date">2019.06.25</span> <strong
											class="title _titleName">구매 적립</strong>
										<p class="subtext">라임모카</p>
									</div>
								</a>
								<div class="amount_space">
									<div class="amount_inner">
										<span class="point">+470원</span>
										<div class="func_area">
											<a href="#"
												class="func_button _click(nmp.front.order.timeline.home.list.removeEtc(20190625022021PNT201906257077425)) _stopDefault">내역삭제</a>
											<!--N=a:pnt.del-->
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="list_item">
							<div class="item _interlockNo156020671820917d03t1IJG add">
								<a href="/orderStatus/2019061114113261" class="item_content">
									<div class="state_space point">
										<span class="state _statusName">적립</span>
									</div>
									<div class="info_space">
										<!--N=a:pnt.detail-->
										<span class="date">2019.06.11</span> <strong
											class="title _titleName">구매 적립</strong>
										<p class="subtext">오뚜기 다모아</p>
									</div>
								</a>
								<div class="amount_space">
									<div class="amount_inner">
										<span class="point">+109원</span>
										<div class="func_area">
											<a href="#"
												class="func_button _click(nmp.front.order.timeline.home.list.removeEtc(20190611074518PNT201906111977438)) _stopDefault">내역삭제</a>
											<!--N=a:pnt.del-->
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
					<div class="tit_month">
						<h4>2019.05</h4>
					</div>
					<ul class="list_area">
						<li class="list_item">
							<div class="item _interlockNo155920373030217d03w1APr add">
								<a href="/orderStatus/2019053075532681" class="item_content">
									<div class="state_space point">
										<span class="state _statusName">적립</span>
									</div>
									<div class="info_space">
										<!--N=a:pnt.detail-->
										<span class="date">2019.05.30</span> <strong
											class="title _titleName">구매 적립</strong>
										<p class="subtext">oneline20</p>
									</div>
								</a>
								<div class="amount_space">
									<div class="amount_inner">
										<span class="point">+165원</span>
										<div class="func_area">
											<a href="#"
												class="func_button _click(nmp.front.order.timeline.home.list.removeEtc(20190530170850PNT201905306336492)) _stopDefault">내역삭제</a>
											<!--N=a:pnt.del-->
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="list_item">
							<div class="item _interlockNo155879196093417d03imPA3 add">
								<a href="/orderStatus/2019052522952731" class="item_content">
									<div class="state_space point">
										<span class="state _statusName">적립</span>
									</div>
									<div class="info_space">
										<!--N=a:pnt.detail-->
										<span class="date">2019.05.25</span> <strong
											class="title _titleName">구매 적립</strong>
										<p class="subtext">마당클럽</p>
									</div>
								</a>

								<div class="amount_space">
									<div class="amount_inner">
										<span class="point">+244원</span>
										<div class="func_area">
											<a href="#"
												class="func_button _click(nmp.front.order.timeline.home.list.removeEtc(20190525224600PNT201905257060942)) _stopDefault">내역삭제</a>
											<!--N=a:pnt.del-->
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
					<input type="hidden" id="_lastId0"
						value="20190525224600PNT201905257060942"> <input
						type="hidden" id="_hasMore0" value="true"> <input
						type="hidden" id="_interlockNosForDeliveryTracking0"
						value="156425865775917d03mzyNU,156201305942417d03SQ3ya,156149314786917d03ZDtDm,156209272723617d03uviMa,156149334061617d03Xonzw,155879196093417d03imPA3,156139682131217d03lTdZW,156889351154217d03Seq6Y,155920373030217d03w1APr,156020671820917d03t1IJG">
				</div>
				</form>
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




