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
					if($("#item_all_check").prop("checked")){
						$('.item_select_option input[type="checkbox"]').prop("checked",true);
						var label = $('.item_select_option input[type="checkbox"]').next();
						$(label).html("<i class='fas fa-check'></i>");
					}  
					 
					$("#item_all_check").change(function(){
						var allcheck = $(this).prop("checked");
						var label = $('.item_select_option input[type="checkbox"]').next();
						if(allcheck){
							$('.item_select_option input[type="checkbox"]').prop("checked",true);
							$(label).html(
							"<i class='fas fa-check'></i>");
						}else{
							$('.item_select_option input[type="checkbox"]').prop("checked",false);
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
					//상품 아이템 리스트 - 수량 증감
					$(".item_quantity_plus").click(function(){
						var cnt = $(this).parents().prev();
						var quantity = cnt.val();
						quantity++;
						cnt.val(quantity);
					}); 
					$(".item_quantity_minus").click(function(){
						var cnt = $(this).parents().prev();
						var quantity = cnt.val();
						if(quantity<=1) {
							alert("최소수량 입니다.");
							return;
						} 
						quantity--;
						cnt.val(quantity);
					});
					 
					//국내도서 - 탭 오버시 내용 변경
					
					$(".category_array_box h5 a").mouseover(function(){
						$(".category_array_box .section_content").removeClass("on");
						$(this).parents(".section").siblings().removeClass("on");
						$(this).parents(".section").addClass("on");
					})

					// 새로나온 책 슬라이드
					$('.category_new_books_slide').bxSlider({
						minSlides : 3, 
						speed : 400,
						pager : false,
						infiniteLoop : true,
						auto : true,
						slideWidth: 490   
					}); 
					
					
				
				
					// 책 상세페이지 펼쳐보기 - 책 소개
					var book_about_height = $(".item_detail_content .book_about").height();
					if(book_about_height>232){
						 $(".item_detail_content .book_about").append("<span class='open_content'>펼쳐보기 <i class='fas fa-chevron-down'></i></span>")
					}
					
					$(".item_detail_content .book_about span.open_content").click(function(){
						cnt1++;
						var box = $(this).prev();
						if(cnt1%2==1){
							box.css("height","auto");
						}else{
							box.css("height","232px");
						} 
					});
					
					// 책 상세페이지 펼쳐보기 - 목차
					var book_index_height = $(".item_detail_content .book_index").height();
					if(book_index_height>232){
						 $(".item_detail_content .book_index").append("<span class='open_content'>펼쳐보기 <i class='fas fa-chevron-down'></i></span>")
					}
					
					$(".item_detail_content .book_index span.open_content").click(function(){
						cnt2++;
						var box = $(this).prev();
						if(cnt2%2==1){
							box.css("height","auto");
						}else{
							box.css("height","232px");
						} 
					});
					$(".review_reply_btn").click(function(){
						var reply= $(this).parent().next();
						var reply_type = reply.attr("data-type");
						if(reply_type == "hide"){
							reply.attr("data-type","show");
							reply.show();
						}else{
							reply.attr("data-type","hide");
							reply.hide();
						}
						
					});
					//주문 페이지 최근배송지목록 버튼
					$("#call_list").click(function(){
						$(".recent_list").show();
						
					});
					
					 
					//마이페이지 - 주문 정보 변경
					
					$(".change_shipping").click(function(){
						$(".my_order_shipping").hide();
						$(".change_order_shipping").show();
					});
					$(".change_shipping_ok").click(function(){
						$(".my_order_shipping").show();
						$(".change_order_shipping").hide();
					});
					
					
				});