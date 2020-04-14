
function getContextPath() { // ContextPath얻어오기
						return window.location.pathname.substring(0,
								window.location.pathname.indexOf("/", 2));
					}
var ctp = getContextPath(); // 틀만 잡음
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
						autoHover: true,
						touchEnabled : false,
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
						touchEnabled : false,
						auto : true 
					});

					// 뉴스이벤트 마우스 오버시 사진변경
					
					$('#news_event_btn li').mouseenter(function() {
						var num = Number($(this).text());
						var nth = num - 1;
						var element = $("#news_event_img a");
						element.hide();
						$(element[nth]).show();
					}); 

					// 베스트셀러 - 버튼 클릭시 내용변경
					$('.best_item_menu li').click(function() {
						var data = $(this).attr('data-tap');
						$('.best_item_list').hide();
						$('.' + data + '').show();
						$(this).siblings().css({
							'font-weight': 'normal',
							'color':'#444'
						});
						$(this).css({
							'font-weight': '600',
							'color':'#0072d0'
						});
					});
					
					if($('#scroll_top').val() != null){
						var scroll = $('#scroll_top').val()	
						window.scrollTo(0, scroll);
					} 
					// 관심있는분야 - 버튼 클릭시 내용변경
					$('.cate_item_menu li').click(function() {
						var data = $(this).attr('data-tap');
						$('.favorite_item_list').fadeOut(200);
						$('.' + data + '').fadeIn(200);
						$(this).siblings().css({
							'font-weight': 'normal',
							'color':'#444'
						});
						$(this).css({
							'font-weight': '600',
							'color':'#0072d0'
						});
 
					});
 

					// My관심있는책 - 분야 설정클릭 시 창등장
					$('.set_cate_btn').click(function() {
						cnt2++;
						if (cnt2 % 2 == 1) {
							$('.cate_select_modal').fadeIn(200);
							var favorite = document.getElementById('members_favorite').value; // 관심분야 체크 
							var fa_array = favorite.split(",");
							var fa_check = document.getElementsByName("members_favorite");
							if($("#cate_size").val() != "" && $("#cate_basic").val() == ""){
								cnt3 = $("#cate_size").val();
							}    
							for (var i = 0; i < fa_array.length; i++) { 
								for (var j = 0; j < fa_check.length; j++) { 
									if (fa_array[i] == fa_check[j].value) {
										fa_check[j].setAttribute("checked", "checked");
										var label = fa_check[j].nextElementSibling;
										$('.cate_select_box span:nth-child('+ (i+1)+ ')').text(label.nextElementSibling.innerHTML).css({
											'border' : 'none',
											'background' : 'white',
											'width' : 'auto',
											'height' : 'auto'
										});
										label.innerHTML='<i class="fas fa-check"></i>'; 
									} 
								}   
							}  
						} else {
							$('.cate_select_modal').fadeOut(200);
						}
						$(".cate_submit").click(function(){
							var scroll = $(window).scrollTop();
							$('#scroll_top').val(scroll);
							$("#favorite_form").submit();
						}); 
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
					$('.cate_select_list input[type="checkbox"]').change(function() {
										var checked = $(this).prop("checked");
										var label = $(this).next();
										var txt = $(this).next().next().text();
										if (checked) {
											if ($('.cate_select_box span:last-child').text() != "") {
												var checked = $(this).prop("checked", false);
												return;
											}
											cnt3++;
											$(label).html("<i class='fas fa-check'></i>");
											$('.cate_select_box span:nth-child('+ cnt3 + ')').text(txt).css({
												'border' : 'none',
												'background' : 'white',
												'width' : 'auto',
												'height' : 'auto'

											});
										} else {
											for (i = 1; i < 6; i++) {
												if (txt == $('.cate_select_box span:nth-child('+ i + ')').text()) {
													$('.cate_select_box').append('<span></span>');
													$('.cate_select_box span:nth-child('+ i + ')').remove();
													$(label).html("");
													cnt3--;
												} 
											}

										}
									});

					// 상품 아이템 리스트 -전체 선택
					if ($("#item_all_check").prop("checked")) {
						$('.item_select_option input[type="checkbox"]').prop( "checked", true);
						var label = $(
								'.item_select_option input[type="checkbox"]')
								.next();
						$(label).html("<i class='fas fa-check'></i>");
						
					}
				/*	
					if($('.item_select_option input[type="checkbox"]').prop("checked")){
						var label = $('.item_select_option input[type="checkbox"]').next();
						$(label).html("<i class='fas fa-check'></i>");
					}*/
  
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
										
										order_check();
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
						touchEnabled : false,
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
					var member_num = 0;
					

					$(".reply_del_btn a").click(function() {
						var reply_num = $(this).attr("reply_num"); 
						var review_num = $(this).attr("review_num");
						// ajax 처리
						$.get(getContextPath() +'/review_reply_delete',  
					 			 {reply_num:reply_num,
								  review_num:review_num
					 			 }, 
					 		function(data){
					 				$(this).parents().find(".add_reply_list").html("");
					 				var reply_list = data.list; 
					 				reply_list.forEach(function(item,index){
					 			    $(this).parents().find(".add_reply_list").append('<li class="review_content"><p>'+ item.review_reply_content + '</p>'+
								 			 '<p class="add_reply_info"><span>'+ data.id_arr[index] +'</span><span>'+ data.date_txt[index] +'</span><span class="reply_del_btn"></span></p>'
								 			 +'</li>'); 
					 			    if(member_num == item.members_num){
					 				 $(this).parents().find(".add_reply_list").children().find(".reply_del_btn").html('<a review_num="'+ item.review_num +'" reply_num="'+item.review_reply_num+'">삭제</a>');
					 			  }
					 			});   
					 		     
					 		});    
					}); 
					
					 
					// 리뷰 대댓글달기 
					$(".review_reply_insert_form .review_btn").click(function(){
						
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
					$(".review_modi_btn").click(function() {
						$(".review_star_box").empty();
						$(".review_modify_box").hide();
						$(".review_list_box_content").show();
						$(this).parents(".review_list_box_content").hide();
						$(this).parents(".review_list_box_content").next().show();
					});
					
					$(".review_del_btn").click(function() {
						$(".review_star_box").empty();
						$(this).parents(".review_modify_box").hide();
						$(this).parents(".review_modify_box").prev().show();
					});

					// 회원가입 유효성 검사
						$("#join_form input").click(function() {
						$(".join_essential span[title='true']").html("<i class='fas fa-check' aria-hidden='true'></i>");
						if ($("span[title='false']").length > 0) {
							$("span.one_area[title='false']").parent().children().first().focus();
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
						if($(this).attr("sel-id") == "detail_buy"){
				 			product_num = $(".item_num").val();
				 			count = $(".num").val();
				 		}  
						if(product_num == null && count == null){
							product_num = $(this).siblings(".item_num_val").val();
							count = 1;
						} 
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
					
					
					
					
					//  *** 장바구니 리스트 페이지 ***
					var price = $("#cart_form .order_item_price_txt");
					var total_mileage = 0;
					var total_count = 0;
					var total_price = 0;
					
					// 적립금 5%계산 및 쉼표 넣어주기
				 	for(var i = 0; i < price.length ; i++){
				 		var price_txt = Number($(price[i]).text().replace(/,/gi,""));
				 		var item_count = $(price[i]).parent().next().children().find(".item_count").val();
				 		var mileage_origin = Math.floor(price_txt * item_count * 0.05);
				 		total_mileage += mileage_origin;
				 		var mileage = won_transform(String(Math.floor(price_txt * 0.05)));
				 		$(price[i]).siblings("#cart_form .order_item_mileage").children("#cart_form .mileage_text").text(mileage);
				 	}  
				 
				 	// 장바구니 총액 구하고 쉼표 넣어주기 
				 	for(var i = 0; i < price.length ; i++){
				 		var price_txt = Number($(price[i]).text().replace(/,/gi,""));
				 		var item_count = $(price[i]).parent().next().children().find(".item_count").val();
				 		total_count += Number(item_count);
				 		total_price += price_txt * item_count;
				 		var total = won_transform(String(price_txt * item_count));
				 		$(price[i]).parent().next().next().children().find(".allPrice_txt").text(total);
				 	}    
				 	$("#cart_form .total_mileage").text(won_transform(String(total_mileage)));
				 	$("#cart_form .item_total_price_val").val(won_transform(String(total_price)));
				 	$("#cart_form .order_total_count .count_num").text(total_count);
				 	
				 	var org_price = $("#cart_form .item_origin_price");
				 	var total_org = 0;
				 	var total_discount = 0;
				 	var total_shipping = 0;
				 	for(var i = 0; i < org_price.length ; i++){
				 		var item_count = Number($(org_price[i]).parent().next().children().find(".item_count").val());
				 		org_price_txt = $(org_price[i]).val().replace(/,/gi,"");
				 		total_org += (Number(org_price_txt) * item_count);  
				 		var discount = Number($(org_price[i]).siblings("#cart_form .order_item_discount").children(".discount_txt").text());
				 		total_discount += Math.ceil(Number(org_price_txt) * item_count * 0.01 * discount);
				 	}  
				 	 
				 	var shipping = $("#cart_form .item_shipping");
				 	for(var i = 0; i < shipping.length ; i++){
				 		var shipping_val = Number($(shipping[i]).val().replace(/,/gi,""));
				 		if(total_shipping < shipping_val){  
				 			total_shipping =  shipping_val;
				 		}
				 	}
				 	$("#cart_form .order_total_originPrice span").text(won_transform(String(total_org)));
				 	$("#cart_form .order_total_dicount span").text(won_transform(String(Math.floor(total_discount)))); 
				 	$("#cart_form .order_total_parcel span").text(won_transform(String(total_shipping))); 
				 	$("#cart_form .order_total_count .count_subject").text(org_price.length);
				 	var all_total_price = total_org - Math.ceil(total_discount) + total_shipping;
				 	$("#cart_form .order_total_price span").text(won_transform(String(Math.floor(all_total_price)))); 
				 	$("#cart_form .total_price_val").val(won_transform(String(Math.floor(all_total_price)))); 
				 	$("#cart_form .total_discount_price_val").val(won_transform(String(Math.floor(total_discount)))); 
				 	$(".mileage_val").val($(".total_mileage").text());
				 	
				 	// 장바구니 수량 수정    
				 	$("#cart_form .order_count_change").click(function(){
				 		var cart_num = $(this).parents(".order_item_count").prev().children(".cart_item_num").val();
				 		var item_count = $(this).parent().prev().children(".item_count").val();
				 		$(this).attr("href",  getContextPath() + "/cart_update?cart_item_num="+ cart_num +"&cart_item_quantity=" + item_count );
				 	});
				 	
				 	
				 	// 장바구니 선택삭제
				 	$(".cart_sel_del").click(function(){
				 		$("#cart_form").attr("action",  getContextPath()+"/cart_delete" )
				 		$("#cart_form").submit();
				 	});
				 	
				 	$(".order_btn").click(function(){
				 		/*$(".total_price_val").val($(".total_price_txt").text());
				 		$(".item_total_price_val").val($(".order_total_originPrice span").text());*/
				 	});
				 
				 	// 주문 - 바로구매
				 	$(".buy_btn").click(function(){ 
				 		var item_num = $(this).siblings(".item_select_option").children(".item_checking").val();
				 		var item_count = $(this).siblings(".item_select_option").children(".item_count_num").val();
				 		if($(this).attr("sel-id") == "detail_buy"){
				 			item_num = $(".item_num").val();
				 			item_count = $(".num").val();
				 		} 
				 		$(this).attr("href", getContextPath()+"/order?product_num="+ item_num +"&item_count="+ item_count +"");
				 	});
				 	  
				 	// 주문 페이지 - 간략 상품 목록 
					var order_price = $("#order_form .order_table .item_total_text");
				 	for(var i = 0 ; i < order_price.length ; i++){
				 		var price = Number($(order_price[i]).text().replace(/,/gi,""));
				 		var count = Number($(order_price[i]).parents(".order_item_price").siblings(".order_item_count").children().find(".item_count_text").text());
				 		var shipping = Number($(order_price[i]).parents(".order_item_price").siblings(".order_item_shipping").children().find(".shipping_txt").text().replace(/,/gi,""));
				 		if(order_price.length==1){
				 			var origin_price = Number($(".item_origin_price").val().replace(/,/gi,""));
				 			$(".item_total_text").text(won_transform(String(price * count)));
					 		$(".shipping_text").text(won_transform(String(shipping)));
					 		$(".total_text").text(won_transform(String(price*count+shipping)));
					 		$(".total_mileage_val").val(won_transform(String(Math.round(price * count * 0.05))));
					 		$(".total_discount_price").val(won_transform(String(origin_price - price)));
				 		} 
				 		$(order_price[i]).text(won_transform(String(price * count)));
				 		$(order_price[i]).parents(".order_item_price").siblings(".order_item_mileage").children().find(".mileage_txt").text(won_transform(String(Math.round(price * count * 0.05))));
				 		$(order_price[i]).parents(".order_item_price").siblings(".order_item_allPrice").children().find(".allPrice_txt").text(won_transform(String(price*count+shipping)));
				 	}     
				 	 
				    // 주문 페이지 - 아이템 상세보기 목록   
				 	$(".order_list_view").click(function(){ 
				 		$(".order_brief_box").hide();
				 		$(".cart_order_box").show();
				 		  
				 	}); 
				 	$(".order_brief_view").click(function(){
				 		$(".order_brief_box").show();
				 		$(".cart_order_box").hide();
				 	}); 
				 	 
				 	// 주문 적립금 금액 적용하기
				 	$(".mileage_money").text(won_transform($(".mileage_money").text()));
					var have_mileage  = $(".mileage_money").text().replace(/,/gi,"");
				 	$(".mileage_btn").click(function(){
				 		var use_mileage  = $(".use_mileage_val").val();
				 		var total_price = $(".order_total_price span").text().replace(/,/gi,"");
				 		if(Number(use_mileage)>Number(have_mileage)){
				 			alert("사용 적립금이 부족합니다.");
				 			$(".use_mileage_val").val("0");
				 		}else{ 
				 			$(".discount_text").text(use_mileage);
				 			$(".mileage_money").text(won_transform(String(Number(have_mileage)-Number(use_mileage))));
				 			$(".order_total_price span").text(won_transform(String(Number(total_price)-Number(use_mileage))));
				 		}    
				 	
				 	});
				 	// 주문 페이지 - 배송지 회원정보와 동일 버튼
					$(".same_info").click(function(){
						var members_num = $(".members_num_val").val(); 
				 		$.get(getContextPath() +'/member_getinfo',  
				 			 {members_num:members_num},
				 		function(data){ 
				 				 var phone_arr= data.members_phone_number.split("-")
				 				 var number_arr= data.members_add_number.split("-")
				 				 $(".order_name").val(data.members_name);
				 				 $(".order_phone_number0").val(phone_arr[0]); 
				 				 $(".order_phone_number1").val(phone_arr[1]);
				 				 $(".order_phone_number2").val(phone_arr[2]);
				 				 $(".order_add_number0").val(number_arr[0]);
				 				 $(".order_add_number1").val(number_arr[1]);
				 				 $(".order_add_number2").val(number_arr[2]);
				 				 $(".order_post").val(data.members_post);
				 				 $(".order_address").val(data.members_address);
				 				 $(".order_detail_address").val(data.members_detail_address);
				 				 $(".order_extra_address").val(data.members_extra_address);
				 		});
					});
				 	// 주문 페이지 - 배송지 새로입력 버튼 클릭
			 		$(".reset_info").click(function(){
			 			var input = $(".order_shipping input[type='text']");
			 			for(var i = 0; i < input.length; i++){
			 				$(input[i]).val(""); 
			 			}
			 		}); 
			 		
				 	// 주문 페이지 - 결제하기 버튼 클릭 시	
				 	$(".pay_btn").click(function(){ 
				 		var form = $("#order_form");
				 		var price_str = $(".cart_order_box input[name='order_item_price']");
				 		for(var i = 0; i < price_str.length; i++){
				 			if(price_str.length != 1){
				 				$(price_str[i]).val($(price_str[i]).val() +"/"); //숫자 구분단위 추가
				 			} 
				 		}
				 		$(".total_count_val").val($(".order_total_count").text().trim());
				 		$(".total_price_val").val($(".order_total_price span").text());
				 		$(".get_mileage_val").val($(".order_breif_table .order_item_mileage span").text().replace(/,/gi,""));
				 		$(".order_shipping_charge_val").val($(".order_breif_table .shipping_txt").text());
				 		form.submit();
				 	});	   
				 	
				 	//마이페이지 주문
				 	
				 	//아이템 목록 
				 	var item_list_star = $(".item_list_star_before");
				 	var item_star_val = $(".item_star_val");
			 		for(var i= 0 ; i < item_list_star.length ; i++){
			 			$(item_list_star[i]).children().width($(item_list_star[i]).width()/5*$(item_star_val[i]).val());
			 		} 
			 	
			 		// 상품 상세 별점 
			 		var detail_star_w = $(".detail_item_star_before").width();
			 		var detail_item_star_val = $(".detail_item_star_val").val();
			 		$(".detail_item_star_before .star_after").width(detail_star_w/5*detail_item_star_val); 
			 		  
			 		// 이 책의 별점 
			 		var review_star_w = $(".review_item_star_before").width();
			 		var review_item_star_val = $(".review_item_star_val").val();
			 		$(".review_item_star_before .star_after").width(review_star_w/5*review_item_star_val); 
			 		  
			 		
			 		// 내가 남긴 별점
			 		var star_w = $(".review_star_before").width();
			 		var grade_val = $(".review_grade_val").val();
			 		$(".review_star_before .star_after").width(star_w/5*grade_val);
			 		
			 		// 리뷰 리스트 별점
			 		var grade_list_val = $(".grade_list_val");
			 		var review_list_star = $(".review_list_star_before");
			 		for(var i= 0 ; i < review_list_star.length ; i++){
			 			$(review_list_star[i]).children().width($(review_list_star[i]).width()/5*$(grade_list_val[i]).val());
			 		} 
			 		
			 		$(".review_modify_box .reviewStars-input input").change(function(){
			 			$(this).prevAll().css(
			 					{"background-position": "0 0", 
			 					 "width":"22px",
			 					 "height":"20px" 
			 					});
			 			$(this).nextAll().css(
			 					{"background-position": "0 -20px", 
			 					 "width":"22px",
			 					 "height":"20px" 
			 					});
			 		}) 
			 		
			 		
					//위시리스트 한개 추가 - ajax
					$(".wishlist_btn").click(function(){
						var product_num= $(this).siblings(".item_select_option").find(".item_checking").val();
						if($(this).attr("sel-id") == "detail_buy"){
							product_num = $(".item_num").val();
				 		} 
						$.get( getContextPath() +'/wishlist_insert', 
		 					{ product_num : product_num},   
			 				function(data){
								  	if(data == "not login"){
								  		if(confirm("로그인 후 이용가능합니다. 로그인 페이지로 이동하시겠습니까?") == true){ 
											   location.href= getContextPath()+"/member_login";
											}else{   
											    return;
											} 
								  	}else if(data =="overlap"){
								  		if(confirm("이미 존재하는 상품입니다.") == true){
								  			 location.href= getContextPath()+"/cart";
								  		}else{
								  			return;
								  		}
								  	}
								  	else{
								  		if(confirm("위시리스트에 담겼습니다. 위시리스트 페이지로 이동하시겠습니까?") == true){   
											   location.href= getContextPath()+"/mypage_wishlist";
											}else{   
											    return;
											} 
								  	}
								
			 			});
					  
					});
			 		
			 		// 위시리스트 여러개 추가 - ajax
					$(".all_wish").click(function(){ 
						var small_cate_form = $("#small_cate_form").serialize();
						$(".item_checking").each(function(index){
							if($(this).prop("checked") == false){ 
								$(this).siblings(".item_count_num").val(null);
							}  
						});        
						$.ajax({
							url: getContextPath()+'/wish_multiple_insert',
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
								}else if(data == "wishlist_add_ok"){
							  		if(confirm("위시리스트에 담겼습니다. 위시리스트로 이동하시겠습니까?") == true){   
										   location.href= getContextPath()+"/mypage_wishlist";
										}else{   
										    return;
										} 
							  	}else{  
							 		if(confirm("기존 존재하는 "+ data +"을(를) 제외하고 추가되었습니다. 위시리스트로 이동하시겠습니까?") == true){   
										   location.href= getContextPath()+"/mypage_wishlist";
										}else{    
										    return;
										} 
							  	}
							},    
							error: function(request,status,error){
							}      
						});  
					});   
					 var today = new Date();  
	 				 var now_y = today.getFullYear();
	 				 var now_m = today.getMonth() + 1;
	 				 
			 		//베스트셀러 주차 불러오기
					if($(".having_date").val() == "date"){
		 				 var str = ""; 
		 				 var year = $(".best_year").val();
			 			 var month = $(".best_month").val();
			 			 var choice_y = $(".choice_year").val();
			 			 var choice_m = $(".choice_month").val();
			 			 var choice_w = $(".choice_week").val();
			 			 	for(var i = 2016 ; i <= now_y ; i++){ 
		 						if(choice_y == ""){ 
		 							if(i == now_y){
		 								str += "<option selected value="+i+">"+i+"년</option>";
		 								break;
		 							}else{
		 								 str += "<option value="+i+">"+i+"년</option>";
		 							} 
		 						}else{   
		 							if(i == choice_y){
		 								str += "<option selected value="+i+">"+i+"년</option>"
		 							}else{
		 								 str += "<option value="+i+">"+i+"년</option>"
		 							}
		 						 } 
		 					 }  
			 			 	 $(".best_year").html(str); 
		 					
		 					 $.get(getContextPath() +'/best_get_week',
					 				{ year: now_y, 
					 				  month : now_m
					 			},function(data){  
					 				 str = ""; 
					 				if(data == 0){
								 		now_m = now_m - 1
					 				}
					 				for(var i = 1 ; i <= 12 ; i++){
					 					if(i > now_m && $(".best_year").val() == now_y ) break;
				 						if(choice_m == ""){
				 							if(i == now_m){
				 								str += "<option selected value="+i+">"+i+"월</option>";
				 								break;
				 							}else{
				 								 str += "<option value="+i+">"+i+"월</option>";
				 							}
				 						}else{   
				 							if(i == choice_m){
				 								str += "<option selected value="+i+">"+i+"월</option>"
				 							}else{
				 								 str += "<option value="+i+">"+i+"월</option>"
				 							}
				 						 }   
				 							
				 					 }  
					 				$(".best_month").html(str); 
					 	     });	   
		 					
		 					var basic_year = "";
		 					var basic_month = "";
		 					if(choice_w == ""){ 
		 						basic_year = now_y;
		 						basic_month = now_m;
		 					}else{
		 						basic_year = choice_y;
		 						basic_month = choice_m;
		 					} 
	 						$.get(getContextPath() +'/best_get_week',
					 				{ year: basic_year, 
					 				  month : basic_month 
					 			},function(data){  
					 				 str = "";
					 				 if(data ==  0){
					 					$.get(getContextPath() +'/best_get_week',
								 				{ year: basic_year, 
								 				  month : basic_month - 1
								 			},function(data){  
							 					 for(var i = 1 ; i <= data ; i++){
							 						if(choice_w == ""){
							 							if(i == data){
							 								str += "<option selected value="+i+">"+i+"주</option>"
							 							}else{
							 								 str += "<option value="+i+">"+i+"주</option>"
							 							} 
							 						}else{    
							 							if(i == choice_w){
							 								str += "<option selected value="+i+">"+i+"주</option>"
							 							}else{
							 								 str += "<option value="+i+">"+i+"주</option>"
							 							}
							 						 }   
							 					 }   
							 					 $(".best_week").html(str);
							 					$(".year_txt").text($(".best_year").val());
												$(".month_txt").text($(".best_month").val()); 
												$(".week_txt").text($(".best_week").val()); 
								 			});	  
					 				 }else{
					 					 for(var i = 1 ; i <= data ; i++){
					 						if(choice_w == ""){
					 							if(i == data){
					 								str += "<option selected value="+i+">"+i+"주</option>"
					 							}else{
					 								 str += "<option value="+i+">"+i+"주</option>"
					 							} 
					 						}else{    
					 							if(i == choice_w){
					 								str += "<option selected value="+i+">"+i+"주</option>"
					 							}else{
					 								 str += "<option value="+i+">"+i+"주</option>"
					 							}
					 						 }  
					 					 }   
					 					 $(".best_week").html(str);
					 					 $(".year_txt").text($(".best_year").val());
										 $(".month_txt").text($(".best_month").val());
										 $(".week_txt").text($(".best_week").val()); 
					 				 } 
					 			});	  
		 					
				 		$(".best_year").change(function(){
				 			str = "<option value=''>= 선택 =</option>";
				 			 var year = $(this).val();
		 					 for(var i = 1 ; i <= 12 ; i++){
		 						 if(i > now_m && year == now_y) break;
		 						 str += "<option value="+i+">"+i+"월</option>"
		 					 }  
		 					 $(".best_month").html(str); 
			 				 
				 		});
				 		$(".best_month").change(function(){
				 			var year = $(".best_year").val();
				 			var month = $(this).val();
				 			$.get(getContextPath() +'/best_get_week' ,
				 				{ year: year,
				 				  month : month 
				 			},function(data){
				 				 str = "<option value=''>= 선택 =</option>";
			 					 for(var i = 1 ; i <= data ; i++){
			 						 str += "<option value="+i+">"+i+"주</option>"
			 					 }  
			 					 $(".best_week").html(str);
				 			});
				 		}); 
				 		$(".week_search_btn").click(function(){
				 			var search_id = $(this).attr("search_id");
				 			var year = $(".best_year").val();
				 			var month = $(".best_month").val();
				 			var week = $(".best_week").val();
				 			var cate_num = $(".cate_num_val").val();
				 			var cate_ref1 = $(".cate_ref1_val").val();
				 			location.href= getContextPath()+"/"+ search_id +"?year="+year+"&month="+month+"&week="+week+"&cate_num="+cate_num+"&cate_ref1="+cate_ref1+"";
				 		});  
				 		$(".best_search_btn").click(function(){
				 			var year = $(".best_year").val();
				 			var month = $(".best_month").val();
				 			var cate_num = $(".cate_num_val").val();
				 			var cate_ref1 = $(".cate_ref1_val").val();
				 			location.href= getContextPath()+"/monthly_best_seller?year="+year+"&month="+month+"&cate_num="+cate_num+"&cate_ref1="+cate_ref1+"";
				 		});  
				 		$(".search_preview button").click(function(){
				 		
				 		}); 
					} 
					
					// 책 상세페이지 마일리지 표시
					if($(".detail_price_val").val() != null){
						var detail_mile = $(".detail_price_val").val().replace(/,/gi,"");
						$(".detail_mileage_txt").text(won_transform(String(Math.floor(detail_mile * 0.05)))+"원");
					}
					// 도서사진 미리보기 슬라이드
					$('.item_preview_slide').bxSlider({
						mode : 'fade',
						pager : true,
						speed : 200,
						infiniteLoop : false, 
						touchEnabled : false,
						auto : false
					});  
					$(".preview_btn").click(function(){
						$("#item_preview_box").show();
					})
					$(".slide_cancle").click(function(){ 
						$("#item_preview_box").hide();
					})
					
					
					// 마이페이지 주문 상세 검색 달력기간 설정
					$("#today").click(function(){
						$(".start_day").val(today_week());
						$(".end_day").val(today_week());
					});
					$("#1week").click(function(){
						$(".start_day").val(lastWeek()); 
						$(".end_day").val(today_week());
					});
					$("#1month").click(function(){
						$(".start_day").val(lastMonth());
						$(".end_day").val(today_week());
					});
					$("#3month").click(function(){
						$(".start_day").val(last3Month());
						$(".end_day").val(today_week()); 
					});    
					$("#all_day").click(function(){
						$(".start_day").val("");
						$(".end_day").val("");  
					});
				
				// 마이페이지 주문 상세정보에서 aside 없애기
				if($(".aside_hide").val() == "ok"){
						$("aside").hide();
						// 마이페이지 주문 가격정보
						var price =  $(".order_item_price");
						var total_price = 0; 
						var item_total_price = 0;
						var shipping_price =  Number($(".shipping_price").text().replace(/,/gi,""));
					 	for(var i = 0; i < price.length ; i++){
					 		var price_txt = Number($(price[i]).val().replace(/,/gi,""));
					 		var item_count = $(price[i]).next().val();
					 		total_price += price_txt * item_count;
					 	}  
					 	item_total_price = total_price + shipping_price;
					 	$(".order_origin_total").text(won_transform(String(total_price)));
					 	$(".item_total_price").text(won_transform(String(item_total_price)));
					}  
				$(".select_order_btn").click(function(){
					$.ajax({ 
						type: 'post', 
						url: getContextPath() + '/order_status_update',
						data : order_form,
						success: function(data){
						
						},  
						error: function(request,status,error){
						}    
					});  
				}); 
				// 마이페이지 마일리지 금액 표기
				if($(".mileage_val").val() != null){
					var m_val = $(".mileage_val_txt").text();
					$(".mileage_val_txt").text(won_transform(String(m_val))+"원");
					var mileage_score_val = $(".mileage_score_val"); 
					$.each(mileage_score_val,function(index,value){ 
						var score = $(value).val();   
						if(score > 0){
							var score_val = won_transform(String(score));
							$(value).next().text("+"+ score_val +"원");
						}
						else{ 
							score = score.slice(1);
							var score_val = won_transform(String(score));
							$(value).next().text("-"+  score_val +"원");
						} 
					}); 
				}  
				// 메인 검색버튼 클릭 시  
				$(".search_btn").click(function(){
					var keyword = $(this).siblings("#book_search_input").val();
					if(keyword != null && keyword != ""){
						location.href= getContextPath()+"/search?keyword="+keyword;
					}
				});
				
				//분야별 마지막 작대기처리
				var section = $(".category_array_box .section");
				$.each(section,function(index,value){ 
					if((index+1)%5==0){
						$(value).css("border-right","1px solid #ddd");
					}
				});
				
				//책 리뷰 리스트 더 불러오기
				var review_cnt = 0;
				$(".more_review").click(function(){
					var num = $(".item_num").val(); 
					review_cnt += 10;
					$.get(getContextPath() +'/ajax/review_list',
						{cnt: review_cnt,
						 product_num: num
						}, 
					function(data){
						if(review_cnt+10>$(".review_total").val()){
							$(".more_review").hide();
						}	
						var list =  data.review_list;	
						var member =  data.member_list;	
						list.forEach(function(item,index){
							$(".review_list").append(
									'<li class="review_list_box">'
									+ '<div class="review_list_left">'
									+ '<div class="star_box">'
									+	'<input hidden="hidden" class="grade_list_val" value="'+item.review_grade+'">'
									+	'<span class="star_before review_list_star_before"><span class="star_after"></span></span>'
									+'</div>'
									+'<span class="review_id">'+member[index].members_id+'</span>'
								 
									+'<p>' 
									+	'<span class="review_date">'+data.date_txt[index]+'</span><span class="review_report">신고</span>'
									+'</p>'
									+'</div>'
									+	'<div class="review_list_right">' 
									+	'<p class="review_content">'+item.review_content+'</p>'
									+	'<p class="review_list_btn">'
									+		'<span class="review_reply_btn"  onclick="review_reply_list(this)" list_num="'+item.review_num+'" member_num= "${member_vo.members_num}">'
									+			'<i class="fas fa-comment"></i> 댓글'
									+		'</span>'
									+		'<span><i class="fas fa-thumbs-up"></i>'+item.review_recommend+'</span>'
									+	'</p>'
									+	'<div class="add_reply" data-type="hide">'
									+		'<form class="review_reply_insert_form"  method="post">'
									+			'<input hidden="hidden" name="product_num" value="'+num+'">'
									+			'<input hidden="hidden" class="member_num" name="members_num" value="${member_vo.members_num}">'
									+			'<input hidden="hidden" name="review_num" value="'+item.review_num+'">'
									+			'<ul class="add_reply_list" url="dddd">'
									+			'</ul>'
									+			'<textarea name="review_reply_content" class="review_reply_write"></textarea>'
									+			'<input type="button" class="btn review_btn" onclick="review_reply_insert(this)" list_num="'+item.review_num+'" member_num= "${member_vo.members_num}" value="댓글 달기">'
									+		'</form>'
									+	'</div>'
									+ '</div>' 
									+'</li>')
						});
					});
				});
				
			// 공지사항 키워드 검색기능	
			$(".notice_search button").click(function(){
				var keyword = $(".notice_search input").val();
				location.href = getContextPath() + "/notice?board_keyword="+ keyword;
				
				});
			});             

            // 작가알림 추가 메시지
			if($(".editor_add_msg").val() != null){
				if($(".editor_add_msg").val() == "success" ){
					alert("해당 작가알림이 추가됐습니다.")
				}else{
					alert("이미 등록된 작가입니다.")
				}
			} 
			
			//마이페이지 aside 현제 메뉴 표시
			
			 
			 
      
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

//장바구니 체크
function order_check(){
	var total_org = 0;
 	var total_discount = 0; 
 	var total_mileage = 0; 
 	var total_count = 0; 
 	var total_shipping = 0; 
 	var total_price = 0;
	var org_ck = new Array();
	var mile_ck = new Array();
	var count_ck = new Array();
	var shipping_ck = new Array();
	var total_ck = new Array();
 	var check = $("#cart_form .item_checking");
 	for(var i = 0; i < check.length ; i++){
 		if($(check[i]).prop("checked")){ 
 			org_ck.push($(check[i]).parents(".order_item_info").siblings(".order_item_price").children(".item_origin_price"));
 			mile_ck.push($(check[i]).parents(".order_item_info").siblings(".order_item_price").children().find(".mileage_text"));
 			count_ck.push($(check[i]).parents(".order_item_info").siblings(".order_item_count").children().find(".item_count"));
 			shipping_ck.push($(check[i]).parents(".order_item_info").siblings(".order_item_price").children(".item_shipping"));
 			total_ck.push($(check[i]).parents(".order_item_info").siblings(".order_item_allPrice").children().find(".allPrice_txt"));
 		} 
 	} 
	for(var i = 0; i < org_ck.length ; i++){
 		org_price_txt = Number($(org_ck[i]).val().replace(/,/gi,"")) * Number($(count_ck[i]).val());
 		total_org += org_price_txt;  
 		var discount = Number($(org_ck[i]).siblings(".order_item_discount").children(".discount_txt").text());
 		total_discount += Math.ceil(org_price_txt * 0.01 * discount);
 	}  
	for(var i = 0; i < mile_ck.length ; i++){
 		var mileage_origin = Number($(mile_ck[i]).text().replace(/,/gi,""));
 		var mileage = won_transform(String(mileage_origin));
 		var item_count = $(count_ck[i]).val();
 		total_mileage += mileage_origin * item_count;
 		total_count += Number(item_count);
 	} 
	for(var i = 0; i < shipping_ck.length ; i++){
		var shipping = Number($(shipping_ck[i]).val().replace(/,/gi,""));
		if(total_shipping < shipping){
			total_shipping = shipping; 
		} 
	}
	for(var i = 0; i < total_ck.length ; i++){
		var price = $(total_ck[i]).text().replace(/,/gi,"");
 		total_price += Number(price);
	} 
	
	$("#cart_form .order_total_count .count_subject").text(org_ck.length);
 	$("#cart_form .order_total_count .count_num").text(total_count);
	$("#cart_form .total_mileage").text(won_transform(String(total_mileage)));
	$("#cart_form .order_total_originPrice span").text(won_transform(String(total_org)));
 	$("#cart_form .order_total_dicount span").text(won_transform(String(Math.ceil(total_discount)))); 
 	$("#cart_form .order_total_parcel span").text(won_transform(String(total_shipping))); 
 	$("#cart_form .item_total_price_val").val(won_transform(String(total_price))); 
 	var all_total_price = total_org - Math.ceil(total_discount) + total_shipping;  
 	$("#cart_form .total_price_val").val(won_transform(String(Math.floor(all_total_price)))); 
 	$("#cart_form .order_total_price span").text(won_transform(String(Math.floor(all_total_price)))); 
 	$(".total_count_val").val($(".order_total_count").text().trim());
 	$("#cart_form .total_discount_price_val").val(won_transform(String(Math.floor(total_discount))));
 	$(".mileage_val").val($(".total_mileage").text());
}   
  
//금액 천단위 쉼표 변환 함수 
function won_transform(won_txt){
	var won_result = "";
	var won_array = won_txt.split("");
	won_array = won_array.reverse(); // 배열 순서 뒤집기 
	for(var i = won_array.length - 1   ; i  >= 0 ; i--){
			if(i % 3 == 0 && ( i!=0 ) ){
				won_array.splice(i, 0, ",");
			}			       
	}    
	won_array  =  won_array.reverse();
	won_array.forEach(function(item,index){
		won_result += item;  
	}); 
	return won_result;
}

// 스크롤 위치 기억
function save_scroll(object){
	document.getElementById('scrollPos').value=object.scrollTop;
}
function reply_del(btn){
	var reply_num = $(btn).attr("reply_num"); 
	var review_num = $(btn).attr("review_num");
	var member_num =  $(".member_num").val();
	var rp_loc = $(btn).parents(".review_list_box").children().find(".add_reply_list");
	// ajax 처리
	$.get(getContextPath() +'/review_reply_delete',  
 			 {reply_num:reply_num,
			  review_num:review_num
 			 },    
 		function(data){    
 				rp_loc.html("");
 				var reply_list = data.list; 
 				reply_list.forEach(function(item,index){ 
 					rp_loc.append('<li class="review_content"><p>'+ item.review_reply_content + '</p>'+
			 			 '<p class="add_reply_info"><span>'+ data.id_arr[index] +'</span><span>'+ data.date_txt[index] +'</span><span class="reply_del_btn"></span></p>'
			 			 +'</li>');  
 			    if(member_num == item.members_num){
 			    	rp_loc.children().find(".reply_del_btn").html('<a onclick="reply_del(this);" review_num="'+ item.review_num +'" reply_num="'+item.review_reply_num+'">삭제</a>');
 			  }    
 			});      
 		      
 		});  
}

function getDateStr(myDate){
	return (myDate.getFullYear() + '-' + ('00' + (myDate.getMonth() + 1)).slice(-2) + '-' + ('00' + (myDate.getDate())).slice(-2)); 
}

/* 오늘 날짜를 문자열로 반환 */
function today_week() { 
  var d = new Date();
  return getDateStr(d); 
} 

/* 오늘로부터 1주일전 날짜 반환 */
function lastWeek() {
  var d = new Date();
  var dayOfMonth = d.getDate()
  d.setDate(dayOfMonth - 7);
  return getDateStr(d);
}

/* 오늘로부터 1개월전 날짜 반환 */
function lastMonth() {
  var d = new Date();
  var monthOfYear = d.getMonth();
  d.setMonth(monthOfYear - 1);
  return getDateStr(d);
}

/* 오늘로부터 1개월전 날짜 반환 */
function last3Month() {
  var d = new Date();
  var monthOfYear = d.getMonth();
  d.setMonth(monthOfYear - 3);
  return getDateStr(d);
}
/* 금액 입력시 , 함수*/
function key_money(input){
	var val = $(input).val().replace(/,/gi,""); 
	input.value = won_transform(val);
} 
// 검색창 키워드 입력시 해당 키워드 리스트 호출
function search_preview(keyword){
	var keyword = keyword.value;
	if(keyword != null && keyword != ""){
		$.get(getContextPath() +'/search_preview', 
				{keyword:keyword},
				function(data){
					editor_list = data.editor_list;
					item_list = data.item_list;
					if(editor_list != null || item_list != null){
						$(".search_preview").show();
					}else{
						$(".search_preview").hide();
					}
					$(".search_editor_preview_list").html("");
					$(".search_item_preview_list").html("");
					
					//작가 리스트 값이 존재할 경우
					if(editor_list != null){
							var editor_count =""
							editor_list.forEach(function(item,index){
								if(item.editor_item_count>1){
									editor_count = "외 "+(item.editor_item_count-1)+"권";
								}
								$(".search_editor_preview_list").append(
									'<li>'
										+'<button onclick="search_on(this)" editor-id="'+ item.editor_num+'">' 
										+	'<span class="search_editor_name">'+ item.editor_name +'</span>'
										+	'<span class="search_editor_item"><'+ item.editor_item_name +'></span>'
										+	'<span class="search_editor_count">'+ editor_count +'</span>'
										+'</button>'
									+'</li>'
								)   
						});  
					}
					//아이템 리스트 값이 존재할 경우
					if(item_list != null){
							$(".search_item_preview_list").html("");
							item_list.forEach(function(item,index){ 
								$(".search_item_preview_list").append(
									'<li>' 
										+'<button onclick="search_on(this)" item-id="'+ item.PRODUCT_NUM +'">' 
										+	'<div class="search_item_preview_content">'
										+		'<img src="'+ getContextPath() +'/resources/upload/'+ item.PRODUCT_PICTURE +'">' 
										+		'<div>'
										+			'<p  class="search_item_title">'+ item.PRODUCT_NAME +'</p>'
										+			'<p>'  
										+				'<span class="search_item_editor">'+ item.editor_name +'</span>'
										+				'<span class="search_item_publish">'+ item.PRODUCT_PUBLISH +'</span>'
										+			'</p>' 
										+		'</div>'
										+	'</div>'
										+'</button>' 
								   +'</li>' 
								)  
						});
					}
			});
	}
}
function search_on(button){
	var editor_num = $(button).attr("editor-id");
	var item_num = $(button).attr("item-id");
	if(editor_num != null && editor_num !=""){
			location.href= getContextPath()+"/editor_detail?editor_num="+editor_num;
	}else if(item_num != null && item_num != ""){
			location.href= getContextPath()+"/book_detail?product_num="+item_num;
	}
}

function review_reply_list(obj){
	var review_num = $(obj).attr("list_num");
	var member_num = $(obj).attr("member_num");
	var reply = $(obj).parent().next();
	var reply_type = reply.attr("data-type");
	if (reply_type == "hide") {
		 reply.attr("data-type", "show");
		 reply.show();
	} else {
		reply.attr("data-type", "hide");
		reply.hide();
	}
	// ajax 처리
	$.get(getContextPath() +'/review_reply_list',  
 			 {review_num:review_num}, 
 		function(data){
 			$(reply).children().find(".add_reply_list").html("");
 		   var reply_list = data.list; 
 		   reply_list.forEach(function(item,index){
 			  $(reply).children().find(".add_reply_list").append('<li class="review_content"><p>'+ item.review_reply_content + '</p>'+
			 			 '<p class="add_reply_info"><span>'+ data.id_arr[index] +'</span><span>'+ data.date_txt[index] +'</span><span class="reply_del_btn"></span></p>'
			 			 +'</li>'); 
 			  if(member_num == item.members_num){
 				 $(reply).children().find(".add_reply_list").children().find(".reply_del_btn").html('<a  onclick="reply_del(this);" review_num="'+ item.review_num +'" reply_num="'+item.review_reply_num+'">삭제</a>');
 			  }
 			});  
 		    
 		});    
}

//리뷰 대댓글 추가
function review_reply_insert(obj){
	var reply_form = $(obj).parent(".review_reply_insert_form").serialize();
	var reply_box = $(obj).siblings(".add_reply_list");
	member_num = $(obj).attr("member_num");
	$.ajax({ 
		url: getContextPath()+'/review_reply_insert',
		type: "POST",  
		data : reply_form,  
		success: function(data){   
			  reply_box.html(""); 
			  $(".review_reply_write").val('');
			  var reply_list = data.list; 
			  reply_list.forEach(function(item,index){
 			  reply_box.append('<li class="review_content"><p>'+ item.review_reply_content + '</p>'+
			 			 '<p class="add_reply_info"><span>'+ data.id_arr[index] +'</span><span>'+ data.date_txt[index] +'</span><span class="reply_del_btn"></span></p>'
			 			 +'</li>'); 
			  	  if(member_num == item.members_num){
			  		 reply_box.children().find(".reply_del_btn").html('<a onclick="reply_del(this);" review_num="'+ item.review_num +'" reply_num="'+item.review_reply_num+'">삭제</a>');
 			     } 
			  });  
		}  
	});
}
