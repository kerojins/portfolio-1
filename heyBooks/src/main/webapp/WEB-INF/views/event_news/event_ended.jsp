<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="event_box">
	<div class="container">
		<h3>이벤트</h3>
		<ul class="nav nav-tabs event_tabs">
			<li class="nav-item"><a class="nav-link"
				href="<c:url value='event_proceed'/>">진행 중인 이벤트</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="<c:url value='event_ended'/>">지난 이벤트</a></li>
		</ul> 
		<div class="list_layout event_list">
			<ul>
				<li>
					<div class="list_layout_left list_img_box">
						<p class="">
							<img src="<c:url value='/resources/images/event1.jpg'/>">
						</p>
					</div>
					<div class="list_layout_right list_content event_content">
						<h4>[EVENT] 더글라스 케네디 베스트 소설전 OPEN!</h4>
						<div>
							<p>
								<span class="point_txt">기간</span><span class="event_content_txt">2019.08.30 ~ 2019.9.30</span>
							</p>
							<p>
								<span class="point_txt">내용</span><span class="event_content_txt"> 130주 베스트셀러 빅 픽처의 저자, 더글라스 케네디 작가전
									OPEN <br> 1. 세트 4종 구매 10% 할인 <br> 2. 단행본 14종 구매 10%
									할인
								</span>
							</p> 
						</div>
					</div>
				</li>
				<li>
					<div class="list_layout_left list_img_box">
						<p class="">
							<img src="<c:url value='/resources/images/event1.jpg'/>">
						</p>
					</div>
					<div class="list_layout_right list_content event_content">
						<h4>[EVENT] 더글라스 케네디 베스트 소설전 OPEN!</h4>
						<div>
							<p>
								<span class="point_txt">기간</span><span class="event_content_txt">2019.08.30 ~ 2019.9.30</span>
							</p>
							<p>
								<span class="point_txt">내용</span><span class="event_content_txt"> 130주 베스트셀러 빅 픽처의 저자, 더글라스 케네디 작가전
									OPEN <br> 1. 세트 4종 구매 10% 할인 <br> 2. 단행본 14종 구매 10%
									할인
								</span>
							</p>  
						</div>
					</div>
				</li> 
			</ul>

		</div>
	</div>
</div>