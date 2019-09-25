<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


		<div class="sub_right_box my_box_wrap">
			<div class="sub_right_content">
				<form class="wishlist_form">
					<div class="order_content">
						<h3 class="my_page_title" style="margin-bottom:20px">위시리스트</h3>
						<div class="left">
							<select class="form-control wish_form">
								<option value="recent" selected>최근순</option>
								<option value="named">상품명순</option>
								<option value="cash">가격순</option>
							</select> 
						</div>  
						<div class="item_all_choice">
							<span class="item_select_option"> 전체 <input
								type="checkbox" id="item_all_check"><label
								for="item_all_check" class="input_label"></label>
							</span> <a href="#" class="btn btn-primary">쇼핑카트 담기</a> <a href="#"
								class="btn btn-primary">삭제</a>
						</div>
						<table class="order_table">
							<tbody>
								<tr>
									<td class="order_item_info">
										<p class="item_select_option">
											<input type="checkbox" id="check_item1" class="item_checking"><label
												for="check_item1" class="input_label"><i
												class="fas fa-check" aria-hidden="true"></i></label>
										</p>
										<p class="order_item_img">
											<a href="#"><img width="80"
												src="/sh/resources/images/list_item1.jpg"></a>
										</p>
										<div class="order_item_title">
											<p>
												<span class="discount_tag">할인도서</span><span
													class="parcel_tag">무료배송</span>
											</p>
											<p class="order_item_title_txt">
												<a href="#">대도시의 사랑법</a>
											</p>
											<p>
												<span class="order_item_editor">민지형</span><span
													class="order_item_publising">민음사</span>
											</p>
										</div>

									</td>
									<td class="order_item_price">
										<p class="order_item_price_txt">13,320원</p>
										<p class="order_item_discount">
											(<span>10%</span><i class="fas fa-long-arrow-alt-down"
												aria-hidden="true"></i>)
										</p>

									</td>
									<td class="order_item_choice"><a
										class="order_item_library">카트담기</a> <a
										class="order_item_delete">삭제</a></td>
								</tr>
								<tr>
									<td class="order_item_info">
										<p class="item_select_option">
											<input type="checkbox" id="check_item1" class="item_checking"><label
												for="check_item1" class="input_label"><i
												class="fas fa-check" aria-hidden="true"></i></label>
										</p>
										<p class="order_item_img">
											<a href="#"><img width="80"
												src="/sh/resources/images/list_item1.jpg"></a>
										</p>
										<div class="order_item_title">
											<p>
												<span class="discount_tag">할인도서</span><span
													class="parcel_tag">무료배송</span>
											</p>
											<p class="order_item_title_txt">
												<a href="#">대도시의 사랑법</a>
											</p>
											<p>
												<span class="order_item_editor">민지형</span><span
													class="order_item_publising">민음사</span>
											</p>
										</div>
									</td>
									<td class="order_item_price">
										<p class="order_item_price_txt">13,320원</p>
										<p class="order_item_discount">
											(<span>10%</span><i class="fas fa-long-arrow-alt-down"
												aria-hidden="true"></i>)
										</p>
									</td>
									<td class="order_item_choice"><a
										class="order_item_library">카트담기</a> <a
										class="order_item_delete">삭제</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>





