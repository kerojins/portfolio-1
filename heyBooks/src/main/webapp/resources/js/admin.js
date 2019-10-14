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
					var index_cnt = 11;
					$('.index_add')
							.click(
									function() {
										$(this)
												.prev()
												.append(
														'<li><input type="text" name="" class="cal-len line" style="width: 85%" value="" title="" placeholder="'
																+ index_cnt
							 									+ '."></li>');
										index_cnt++;
									});
					
					$('.layer_close').click(function() {
						$('#member_info_layers').hide();
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
	for(i=0; i<trList.length; i++){
		if(trList[i]==tr){
			nth_tr = i + 1;
			break;
		}  
	}  
	   
	var layer_top = 550 + (nth_tr * 37);
	m_layer.style.display= "block";
	m_layer.style.top= ""+layer_top+"px";
	   
}