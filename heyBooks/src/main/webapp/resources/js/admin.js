$(document)
		.ready(
				function() {
					$('.collapse.in').prev('.panel-heading').addClass('active');
					$('#accordion, #bs-collapse').on(
							'show.bs.collapse',
							function(a) {
								$(a.target).prev('.panel-heading').addClass(
										'active');
							}).on(
							'hide.bs.collapse',
							function(a) {
								$(a.target).prev('.panel-heading').removeClass(
										'active');
							});

					// 관리자 메인 - 메모
					$('.memo_write textarea').click(function() {
						$(this).css('height', '120px');
						$(this).text('');
						$('.memo_write i').show();
					});
					$('.memo_write i').click(function() {
						$(this).prev().css('height', '34px');
						$(this).prev().text('메모를 남기세요');
						$('.memo_write i').hide();
					});

					// 관리자 상품등록 - 카테고리 추가
					$('.category_select_cancel').click(function() {
						$('.category_select').hide();
					});
					$('#category_btn2').click(function() {
						$('#category_select').show();
					});

					$('#editor_btn').click(function() {
						$('#editor_select').show();
					});

					$('#publishing_btn').click(function() {
						$('#publishing_select').show();
					});

					// 관리자 상품등록 - 목차 추가 
				
					$('.index_add').click(function() {
						var name = $(this).attr("title");
						var index_cnt = $(this).prev().find("li").length;
										$(this).prev().append('<li><input type="text" name="'+ name +'" class="cal-len line" style="width: 85%" title="" placeholder="'
																+ ++index_cnt + '." value=""></li>');
									}); 
					
 
					$('.layer_close').click(function() {
						$('#member_info_layers').hide();
					});
					$('.ui-dialog-titlebar-close').click(function() {
						$('.order_detail_box').hide();
					});
					$('.order_btn').click(function() {
						$('.order_detail_box').show();
					}); 
					$('.board_list .close_btn').click(function() {
						$('.board_list_view').hide();
					});
					$('.boad_modify_btn').click(function() {
						$('#boardview').hide();
						$("#writeform").show();
					}); 
					
					// 관리자 상품등록 - 사진 미리보기 창
					$('.item_preview_btn').click(function(){
						var scroll = $(document).scrollTop();
						$("#item_preview").css('top',''+ scroll +'px');
						$("#item_preview").show();
					}); 
					 
					// summernote 활용

					$('#summernote').summernote({

						height : 300, // set editor height
						minHeight : null, // set minimum height of editor
						maxHeight : null, // set maximum height of editor
						focus : true

					});
	
				});
// 관리자 회원 상세보기창
function open_crm_summary(ent) {
	var nth_tr;
	var i;
	var m_layer = document.getElementById("member_info_layers");
	var table = document.getElementById("user_list_table");
	var tr = ent.parentElement.parentElement.parentElement;
	var trList = document.getElementById("user-tr-list").children;
	for (i = 0; i < trList.length; i++) {
		if (trList[i] == tr) {
			nth_tr = i + 1;
			break;
		}
	}

	var layer_top = 543 + (nth_tr * 53);
	m_layer.style.display = "block";
	m_layer.style.top = "" + layer_top + "px";

}