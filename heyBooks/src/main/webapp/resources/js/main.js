$("document").ready(
		function() {

			var cnt1 = 0; // nav카테고리창 변수
			var cnt2 = 0; // my관심책 분야설정창 변수
			var cnt3 = 0; // my관심책 분야설정 선택 변수
			var cateName ='';

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
			$('#news_event_btn li').mouseenter(
					function() {
						var nth = $(this).text();
						$('#news_event_img').find('img').attr(
								'src',
								"" + ctp + "/resources/images/news_event" + nth
										+ ".jpg");
					})

			// 베스트셀러 버튼 클릭시 내용변경
			$('.best_item_menu li').click(function() {
				var data = $(this).attr('data-tap');
				$('.best_item_list').hide();
				$('.' + data + '').show();
				$(this).siblings().css('font-weight', 'normal');
				$(this).css('font-weight', '600');

			});

			// My관심있는책 분야 설정클릭 시 창등장

			$('.set_cate_btn').click(function() {
				cnt2++;
				if (cnt2 % 2 == 1) {
					$('.cate_select_modal').fadeIn(200);
				} else {
					$('.cate_select_modal').fadeOut(200);
				}
			});
			// My관심있는책 분야 취소클릭 시 창삭제
			$('.cate_cancle').click(function() {
				$('.cate_select_modal').fadeOut(200);
			});
			// My관심있는책 선택 초기화
			$('.clear_cate').click(function() {
				$('.cate_select_box span').remove();
				for(i=0;i<5;i++){
					$('.cate_select_box').append('<span></span>');
				}
				cnt3=0;
				$('.input_label').html("");
			});
			// My관심있는책 5개이내로 체크하고 담기	
			$('.cate_select_list input[type="checkbox"]').change(
					function() {
						var checked = $(this).prop("checked");
						var label = $(this).next();
						var txt = $(this).next().next().text();
						if (checked) {
							if($('.cate_select_box span:last-child').text()!=""){
								var checked = $(this).prop("checked",false);
								return;
							}
							cnt3++;
							$(label).html("<i class='fas fa-check'></i>");
							$('.cate_select_box span:nth-child(' + cnt3 + ')')
									.text(txt).css({
										'border':'none',
										'background':'white',
										'width':'auto',
											'height':'auto'
										
									});
						} else {
							for(i=1;i<6;i++){ 
								if(txt==$('.cate_select_box span:nth-child(' + i + ')').text()){
									$('.cate_select_box').append('<span></span>');
									$('.cate_select_box span:nth-child(' + i + ')').remove();
									$(label).html("");
									cnt3--;
								}
							}
							
						}
					});

		});