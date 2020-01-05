$("document")
		.ready(
				function() {

					var cnt1 = 0; // 페이지 변수1
					var cnt2 = 0; // 페이지 변수2
					var cnt3 = 0; // 페이지 변수3
					var cateName = '';

					// 카테고리 클릭시 서브메뉴 유무
					$("#category_btn").click(function() {
						cnt1++;
						if (cnt1 % 2 == 1)
							$("#header_bottom").show();
						else
							$("#header_bottom").hide();
					});

					// 새로나온 책 슬라이드
					$('.new_books_slider').bxSlider({
						mode : 'fade',
						pager : false,
						speed : 400,
						infiniteLoop : true,
						auto : true
					});

					// 연령별 많이 읽은 책 슬라이드
					$('.age_item_slider').bxSlider({
						mode : 'vertical',
						pager : false,
						minSlides : 3,
						speed : 200,
						controls : false,
						infiniteLoop : true,
						auto : true
					});

					// 뉴스이벤트 마우스 오버시 사진변경
					function getContextPath() { // ContextPath얻어오기
						return window.location.pathname.substring(0,
								window.location.pathname.indexOf("/", 2));
					}
					var ctp = getContextPath(); // 틀만 잡음
					$('#news_event_btn li')
							.mouseenter(
									function() {
										var nth = $(this).text();
										$('#news_event_img')
												.find('img')
												.attr(
														'src',
														""
																+ ctp
																+ "/resources/images/news_event"
																+ nth + ".jpg");
									})

					// 베스트셀러 - 버튼 클릭시 내용변경
					$('.best_item_menu li').click(function() {
						var data = $(this).attr('data-tap');
						$('.best_item_list').hide();
						$('.' + data + '').show();
						$(this).siblings().css('font-weight', 'normal');
						$(this).css('font-weight', '600');

					});

					// My관심있는책 - 분야 설정클릭 시 창등장

					$('.set_cate_btn').click(function() {
						cnt2++;
						if (cnt2 % 2 == 1) {
							$('.cate_select_modal').fadeIn(200);
						} else {
							$('.cate_select_modal').fadeOut(200);
						}
					});
					// My관심있는책 - 분야 취소클릭 시 창삭제
					$('.cate_cancle').click(function() {
						$('.cate_select_modal').fadeOut(200);
					});
					// My관심있는책 - 선택 초기화
					$('.clear_cate').click(function() {
						$('.cate_select_box span').remove();
						for (i = 0; i < 5; i++) {
							$('.cate_select_box').append('<span></span>');
						}
						cnt3 = 0;
						$('.input_label').html("");
					});
					// My관심있는책 - 5개이내로 체크하고 담기
					$('.cate_select_list input[type="checkbox"]')
							.change(
									function() {
										var checked = $(this).prop("checked");
										var label = $(this).next();
										var txt = $(this).next().next().text();
										if (checked) {
											if ($(
													'.cate_select_box span:last-child')
													.text() != "") {
												var checked = $(this).prop(
														"checked", false);
												return;
											}
											cnt3++;
											$(label)
													.html(
															"<i class='fas fa-check'></i>");
											$(
													'.cate_select_box span:nth-child('
															+ cnt3 + ')').text(
													txt).css({
												'border' : 'none',
												'background' : 'white',
												'width' : 'auto',
												'height' : 'auto'

											});
										} else {
											for (i = 1; i < 6; i++) {
												if (txt == $(
														'.cate_select_box span:nth-child('
																+ i + ')')
														.text()) {
													$('.cate_select_box')
															.append(
																	'<span></span>');
													$(
															'.cate_select_box span:nth-child('
																	+ i + ')')
															.remove();
													$(label).html("");
													cnt3--;
												}
											}

										}
									});

					// 상품 아이템 리스트 -전체 선택
					if ($("#item_all_check").prop("checked")) {
						$('.item_select_option input[type="checkbox"]').prop(
								"checked", true);
						var label = $(
								'.item_select_option input[type="checkbox"]')
								.next();
						$(label).html("<i class='fas fa-check'></i>");
					}

					$("#item_all_check")
							.change(
									function() {
										var allcheck = $(this).prop("checked");
										var label = $(
												'.item_select_option input[type="checkbox"]')
												.next();
										if (allcheck) {
											$(
													'.item_select_option input[type="checkbox"]')
													.prop("checked", true);
											$(label)
													.html(
															"<i class='fas fa-check'></i>");
										} else {
											$(
													'.item_select_option input[type="checkbox"]')
													.prop("checked", false);
											$(label).html("");
										}
									});

					// 상품 아이템 리스트 - 목록 체크
					$('.item_select_option input[type="checkbox"]').change(
							function() {
								var checked = $(this).prop("checked");
								var label = $(this).next();
								if (checked) {
									$(label).html(
											"<i class='fas fa-check'></i>");
								} else {
									$(label).html("");
								}

							});

					// 상품 아이템 리스트 - 수량 증감
					$(".item_quantity_plus").click(function() {
						var cnt = $(this).parents().prev();
						var quantity = cnt.val();
						quantity++;
						cnt.val(quantity);
					});
					$(".item_quantity_minus").click(function() {
						var cnt = $(this).parents().prev();
						var quantity = cnt.val();
						if (quantity <= 1) {
							alert("최소수량 입니다.");
							return;
						}
						quantity--;
						cnt.val(quantity);
					});

					// 국내도서 - 탭 오버시 내용 변경

					$(".category_array_box h5 a").mouseover(
							function() {
								$(".category_array_box .section_content")
										.removeClass("on");
								$(this).parents(".section").siblings()
										.removeClass("on");
								$(this).parents(".section").addClass("on");
							})

					// 새로나온 책 슬라이드
					$('.category_new_books_slide').bxSlider({
						minSlides : 3,
						speed : 400,
						pager : false,
						infiniteLoop : true,
						auto : true,
						slideWidth : 490
					});

					// 책 상세페이지 펼쳐보기 - 책 소개
					var book_about_height = $(
							".item_detail_content .book_about").height();
					if (book_about_height > 232) {
						$(".item_detail_content .book_about")
								.append(
										"<span class='open_content'>펼쳐보기 <i class='fas fa-chevron-down'></i></span>")
					}

					$(".item_detail_content .book_about span.open_content")
							.click(function() {
								cnt1++;
								var box = $(this).prev();
								if (cnt1 % 2 == 1) {
									box.css("height", "auto");
								} else {
									box.css("height", "232px");
								}
							});

					// 책 상세페이지 펼쳐보기 - 목차
					var book_index_height = $(
							".item_detail_content .book_index").height();
					if (book_index_height > 232) {
						$(".item_detail_content .book_index")
								.append(
										"<span class='open_content'>펼쳐보기 <i class='fas fa-chevron-down'></i></span>")
					}

					$(".item_detail_content .book_index span.open_content")
							.click(function() {
								cnt2++;
								var box = $(this).prev();
								if (cnt2 % 2 == 1) {
									box.css("height", "auto");
								} else {
									box.css("height", "232px");
								}
							});
					// 상세페이지 리뷰 대댓글
					$(".review_reply_btn").click(function() {
						var reply = $(this).parent().next();
						var reply_type = reply.attr("data-type");
						if (reply_type == "hide") {
							reply.attr("data-type", "show");
							reply.show();
						} else {
							reply.attr("data-type", "hide");
							reply.hide();
						}

					});
					// 주문 페이지 최근배송지목록 버튼
					$("#call_list").click(function() {
						$(".recent_list").show();

					});

					// 마이페이지 - 주문 정보 변경

					$(".change_shipping").click(function() {
						$(".my_order_shipping").hide();
						$(".change_order_shipping").show();
					});
					$(".change_shipping_ok").click(function() {
						$(".my_order_shipping").show();
						$(".change_order_shipping").hide();
					});

					// 마이페이지 - 리뷰관리
					$(".review_modi_btn")
							.click(
									function() {
										$(".review_star_box").empty();
										$(".review_modify_box").hide();
										$(".review_list_box_content").show();
										$(this).parents(
												".review_list_box_content")
												.hide();
										$(this).parents(
												".review_list_box_content")
												.next().show();
										$(this)
												.parents(".review_list_box")
												.children()
												.find(".review_star_box")
												.append(
														'<div id="reviewStars-input"> <input id="star-4" type="radio" name="reviewStars"> <label title="gorgeous" for="star-4"></label> <input id="star-3"type="radio" name="reviewStars"> <label title="good"for="star-3"></label> <input id="star-2" type="radio"name="reviewStars"> <label title="regular"for="star-2"></label> <input id="star-1" type="radio"name="reviewStars"> <label title="poor" for="star-1"></label><input id="star-0" type="radio" name="reviewStars"> <label title="bad" for="star-0"></label></div>')
									});

					$(".review_del_btn").click(function() {
						$(".review_star_box").empty();
						$(this).parents(".review_modify_box").hide();
						$(this).parents(".review_modify_box").prev().show();
					});

					// 회원가입 유효성 검사
					$("#join_form input")
							.click(
									function() {
										$(".join_essential span[title='true']")
												.html(
														"<i class='fas fa-check' aria-hidden='true'></i>");
										if ($("span[title='false']").length > 0) {
											$("span.one_area[title='false']")
													.parent().children()
													.first().focus();
										} else {
											$(this).focus();
										}

									});

					// 회원 수정 - 관심분야 체크된 항목 카운트
					var checked = $(".join_favorite input[type='checkbox']");

					checked.each(function(index, item) {
						var checked_val = $(item).prop("checked");
						if (checked_val){
							++cnt1;
							}
					});

					// 회원 수정 - 관심분야 체크 제한 5개
					$(".join_favorite input[type='checkbox']").change(
							function() {
								var checked = $(this).prop("checked");
								if (checked) {
									++cnt1;
								} else {
									--cnt1;
								}
								if (cnt1 > 5) {
									--cnt1;
									alert("최대 5개까지 선택하실 수 있습니다.");
									$(this).prop("checked",false);
									$(this).next().children().hide();
								}
							});
					//장바구니 한개 추가 - ajax
					$(".cart_btn").click(function(){
						var product_num= $(this).siblings(".item_select_option").find(".item_checking").val();
						var count= $(this).siblings(".item_select_option").find(".item_count_num").val();
						$.get( getContextPath() +'/cart_insert', 
		 					{ product_num : product_num,
							  count : count },   
			 				function(data){
								  	if(data == "not login"){
								  		if(confirm("로그인 후 이용가능합니다. 로그인 페이지로 이동하시겠습니까?") == true){ 
											   location.href= getContextPath()+"/member_login";
											}else{   
											    return;
											} 
								  	}else if(data =="overlap"){
								  		if(confirm("이미 장바구니에 존재하는 상품입니다. 수량은 장바구니 페이지에서 변경 가능합니다. 이동하시겠습니까?") == true){
								  			 location.href= getContextPath()+"/cart";
								  		}else{
								  			return;
								  		}
								  	}
								  	else{
								  		if(confirm("장바구니에 담겼습니다. 장바구니 페이지로 이동하시겠습니까?") == true){   
											   location.href= getContextPath()+"/cart";
											}else{   
											    return;
											} 
								  	}
								
			 			});
					
					}); 
					// 장바구니 여러개 추가 - ajax
					$(".all_cart").click(function(){ 
						var small_cate_form = $("#small_cate_form").serialize();
						$(".item_checking").each(function(index){
							if($(this).prop("checked") == false){ 
								$(this).siblings(".item_count_num").val(null);
							}  
						});        
						$.ajax({
							url: getContextPath()+'/cart_multiple_insert',
							type: "POST",  
							data : small_cate_form,
							async: true, 
							processData : false,   
							contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
							success: function(data){ 
								$(".item_count_num").val("1");
								$(".item_checking").prop("checked",false);
								$(".fa-check").remove();
								if(data == "not login"){
							  		if(confirm("로그인 후 이용가능합니다. 로그인 페이지로 이동하시겠습니까?") == true){ 
										   location.href= getContextPath()+"/member_login";
										}else{   
										    return;
										} 
								}else if(data == "cart_add_ok"){
							  		if(confirm("장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?") == true){   
										   location.href= getContextPath()+"/cart";
										}else{   
										    return;
										} 
							  	}else{  
							 		if(confirm("기존 존재하는 "+ data +"을(를) 제외하고 추가되었습니다. 장바구니로 이동하시겠습니까?") == true){   
										   location.href= getContextPath()+"/cart";
										}else{    
										    return;
										} 
							  	}
							},    
							error: function(request,status,error){
							}      
						});  
					});     
				});  
   
// 회원가입 유효성 검사  

window.onload = join;
var id_check = true;
function join() { // 아이디 입력란 포커스주기
	/*
	 * var obj = document.join_form; obj.members_id.focus();
	 */
}
function join1() { // 아이디 조건 검사
	var obj = document.join_form;
	for (var i = 0; i < obj.members_id.value.length; i++) {
		var ch = obj.members_id.value.charAt(i);
		if (!(ch >= '0' && ch <= '9')
				&& !(ch >= 'a' && ch <= 'z')
				&& !(ch >= 'A' && ch <= 'Z')
				|| (obj.members_id.value.length < 4 || obj.members_id.value.length > 10)) {
			obj.members_id.nextSibling.nextSibling.style.color = 'red';
			obj.members_id.nextSibling.nextSibling.setAttribute("title",
					"false");
			obj.members_id.nextSibling.nextSibling.innerHTML = '영문,숫자를 사용한 4~10글자를 입력하세요';
		} else {
			obj.members_id.nextSibling.nextSibling.style.color = '#00b92a';
		}
	}
	if (obj.members_id.nextSibling.nextSibling.getAttribute("title") == "true") { // 중복확인
																					// 후
																					// 아이디
																					// 수정 시
		obj.members_id.nextSibling.nextSibling.setAttribute("title", "false");
		obj.members_id.nextSibling.nextSibling.style.color = 'red';
		obj.members_id.nextSibling.nextSibling.innerHTML = '중복검사는 필수사항입니다.';
	}
}

function join2() { // 비밀번호 조건글씨 나타내기
	var obj = document.join_form;
}

function join3() { // 비밀번호 조건 검사
	var obj = document.join_form;
	for (var i = 0; i < obj.members_password.value.length; i++) {
		var ch = obj.members_password.value.charAt(i);
		if ((!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z'))
				|| obj.members_password.value.length < 8) {
			obj.members_password.nextSibling.style.color = 'red';
			obj.members_password.nextSibling.setAttribute("title", "false");
			obj.members_password.nextSibling.innerHTML = "영문,숫자를 사용한 8글자 이상 입력하세요";
		} else {
			obj.members_password.nextSibling.style.color = '#00b92a';
			obj.members_password.nextSibling.setAttribute("title", "true");
		}
	}
}
function join4() { // 비밀번호 확인
	var obj = document.join_form;
	var password = obj.members_password;
	var password_ok = obj.members_password_ok;
	if (password.value == "") { // 비밀번호 입력 안했을 시 포커스
		password.focus();
		password_ok.value = "";
	}
	for (var i = 0; i < password.value.length; i++) {
		var ch = password.value.charAt(i);
		var ch2 = password_ok.value.charAt(i);
		if (ch != ch2 || password.value.length < password_ok.value.length) {
			password_ok.nextSibling.style.color = 'red';
			password_ok.nextSibling.setAttribute("title", "false");
			password_ok.nextSibling.innerHTML = "비밀번호가 일치하지 않습니다";
		} else {
			password_ok.nextSibling.style.color = '#00b92a';
			password_ok.nextSibling.innerHTML = "확인완료";
			password_ok.nextSibling.setAttribute("title", "true");
		}
	}
}
function join5() { // 이름 검사
	var obj = document.join_form;
	var name = obj.members_name;
	for (var i = 0; i < name.value.length; i++) {
		var ch = name.value.charAt(i);
		if (ch >= 0 && ch <= 9) {
			alert("숫자는 입력하실 수 없습니다.")
			name.nextSibling.setAttribute("title", "false");
			name.value = "";
			name.nextSibling.innerHTML = "";
		} else {
			if (name.value.length > 1) {
				name.nextSibling.setAttribute("title", "true");
			} else {
				name.nextSibling.setAttribute("title", "false");
				name.nextSibling.innerHTML = "";
			}

		}
	}
}
function join6() { // 생년월일 검사 앞자리
	var obj = document.join_form;
	var years = obj.members_years;
	var years_span = document.getElementById("years_span");
	for (var i = 0; i < years[0].value.length; i++) {
		var ch = years[0].value.charAt(i);
		if (!(ch >= 0 && ch <= 9)) {
			alert("숫자 이외에는 입력하실 수 없습니다")
			years_span.setAttribute("title", "false");
			years[0].value = "";
			years_span.innerHTML = "";
		} else {
			if (years[0].value.length == 6) {
				years_span.setAttribute("title", "true");
				years[1].focus();
			} else {
				years_span.setAttribute("title", "false");
				years_span.innerHTML = "";
			}

		}
	}
}
function join7() { // 생년월일 검사 뒷자리
	var obj = document.join_form;
	var years = obj.members_years;
	if (!(years[1].value == '1' || years[1].value == '2')) {
		alert("2나 1이외의 숫자는 올 수 없습니다.");
		years_span.setAttribute("title", "false");
	} else {
		if (years[0].value.length == 6) {
			years_span.setAttribute("title", "true");
		}
	}
}

function join8() { // 전화번호 중간자리
	var obj = document.join_form;
	var phone = obj.members_phone_number;
	var phone_span = document.getElementById("phone_span");
	for (var i = 0; i < phone[1].value.length; i++) {
		var ch = phone[1].value.charAt(i);
		if (!(ch >= 0 && ch <= 9)) {
			alert("숫자 이외에는 입력하실 수 없습니다")
			phone[1].value = "";
			phone_span.setAttribute("title", "false");
		}
	}
	if (phone[1].value.length == 4)
		phone[2].focus();
}

function join9() { // 전화번호 뒷자리
	var obj = document.join_form;
	var phone = obj.members_phone_number;
	var phone_span = document.getElementById("phone_span");
	for (var i = 0; i < phone[2].value.length; i++) {
		var ch = phone[2].value.charAt(i);
		if (!(ch >= 0 && ch <= 9)) {
			alert("숫자 이외에는 입력하실 수 없습니다")
			phone[2].value = "";
			phone_span.setAttribute("title", "false");
		} else {
			if (phone[1].value.length == 4 && phone[1].value.length == 4) {
				phone_span.setAttribute("title", "true");
			}
		}
	}
}

function join10() { // 이메일 앞칸
	var obj = document.join_form;
	var email = obj.members_email;
	var email_span = document.getElementById("email_span");
	for (var i = 0; i < email[0].value.length; i++) {
		var ch = email[0].value.charAt(i);
		if (!(ch >= 1 && ch <= 9) && !(ch >= 'a' && ch <= 'z')
				&& !(ch >= 'A' && ch <= 'Z')) {
			alert('영문,숫자 이외에는 입력하실 수 없습니다')
			email[0].value = '';
			email_span.setAttribute('title', 'false');
		} else {

		}
	}
}

function join11() { // 이메일 뒷칸
	var obj = document.join_form;
	var email = obj.members_email;
	var email_span = document.getElementById("email_span");
	for (var i = 0; i < email[1].value.length; i++) {
		var ch = email[1].value.charAt(i);
		if (!(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')
				&& !(ch == '.')) {
			alert('영문 의외에는 입력하실 수 없습니다')
			email[1].value = '';
			email_span.setAttribute('title', 'false');
		} else {
			if (email[0].value.length >= 4
					&& email[1].value.match(/.com/) == ".com") {
				email_span.setAttribute('title', 'true');
			}
		}
	}
}

function join12(select_obj) { // 이메일 양식 선택
	var obj = document.join_form;
	var input = obj.join_email_input;
	var select_index = select_obj.selectedIndex;
	var selected_val = select_obj.options[select_index].value;
	input.value = selected_val;
}

function join13() { // 전화번호 중간자리
	var obj = document.join_form;
	var phone = obj.members_add_number;
	var phone_span = document.getElementById("phone_add_span");
	for (var i = 0; i < phone[1].value.length; i++) {
		var ch = phone[1].value.charAt(i);
		if (!(ch >= 0 && ch <= 9)) {
			alert("숫자 이외에는 입력하실 수 없습니다")
			phone[1].value = "";
			phone_span.setAttribute("title", "false");
		}
	}
	if (phone[1].value.length == 4)
		phone[2].focus();
}

function join14() { // 전화번호 뒷자리
	var obj = document.join_form;
	var phone = obj.members_add_number;
	var phone_span = document.getElementById("phone_add_span");
	for (var i = 0; i < phone[2].value.length; i++) {
		var ch = phone[2].value.charAt(i);
		if (!(ch >= 0 && ch <= 9)) {
			alert("숫자 이외에는 입력하실 수 없습니다")
			phone[2].value = "";
			phone_span.setAttribute("title", "false");
		} else {
			if (phone[1].value.length == 4 && phone[1].value.length == 4) {
				phone_span.setAttribute("title", "true");
			}
		}
	}
}