function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}

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
					
					
					//-----------  상품 등록  ------------
					
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

					// 카테고리 불러오기 AJAX 연결
			 		$('#select_cate1').change(function(){
			 			$("#select_cate2").html('');
			 			$(".search-form-table #select_cate2").html('<option value="">= 2차 분류 =</option>');
			 			var cate_code = $(this).val(); 
			 			$.getJSON( getContextPath() +'/jackson/item_cate', 
			 					{ cate_code : cate_code },   
			 					function(data){
			 					data.forEach(function(item,index){
			 						$("#select_cate2").append("<option value='" + item.cate_ref1 +"'>"+ item.cate_name+"</option>");
			 						     
			 					});
			 			});  
			 		}); 
					$('#select_cate2').change(function(){
			 			$("#select_cate3").html('');
			 			$(".search-form-table #select_cate3").html('<option value="">= 3차 분류 =</option>');
			 			var type = $(this).attr("data-type");
			 			var cate_code = $(this).val();
			 			$.getJSON( getContextPath() + '/jackson/item_cate',
			 					{ cate_code : cate_code }, 
			 					function(data){
			 					data.forEach(function(item,index){
			 						if(type == 'search'){
			 							$("#select_cate3").append("<option value='" + item.cate_ref1 +"'>"+ item.cate_name+"</option>");
			 						}else{
			 							$("#select_cate3").append("<option value='" + item.cate_num +"'>"+ item.cate_name+"</option>");
			 						}
			 					});  
			 			}); 
			 		});   
					$('#category_select_btn').click(function(){
						var sel1 = $("#select_cate1 option:selected").text();
						var sel2 = $("#select_cate2 option:selected").text(); 
						var sel3 = $("#select_cate3 option:selected").text();
						var val = $("#select_cate3 option:selected").attr('value');
						$("#cate_txt").html("<input type='text' hidden = 'hidden'  name='product_cate_num' value='"+ val + "'> <input type='text' readonly  value='"+ sel1 + " > " + sel2 + " > " + sel3+ "'>");
						$("#category_select").hide();  
					});  
					
					//작가 리스트 값 뿌려주기
					$('#editor_select_btn').click(function(){   
						var val = $("#cate_editor").val(); 
						var sel =$("#cate_editor option[value='"+val+"']").text();
						$("#editor_txt").html('<input type="text" hidden = "hidden"  name="product_editor_num" value="'+ val +'"> <input type="text" readonly  value="'+sel+'">');
						$("#editor_select").hide();   
					});     
					   
					//출판사 리스트 값 뿌려주기
					$("#publish_select_btn").click(function(){ 
						var val = $("#cate_publish").val(); 
						$("#publishing_text").html("<input type='text' readonly name='product_publish' id='publishing_direct' value='"+ val + "'>"); 
						$("#publishing_select").hide();     
					}); 
					
					//출판사 직접입력 선택 시 
					$("#publish_add_btn").click(function(){
						$("#publishing_text").html("<input type='text' name='product_publish' id='publishing_direct' >"); 
						$("#publishing_direct").focus();
						$("#publishing_select").hide();     
					}); 
					
					//아이템 사진 크기별 미리보기
					$(".item_detail_img").click(function(){ 
						$("#item_viewImg").css({
							width : '480px',
							height: '768px'
						});
						$("#item_img_info").text("대표컷 - 상품 상세(확대)")
					});
					$(".item_basic_img").click(function(){ 
						$("#item_viewImg").css({
							width : '203px',
							height: '305px'
						});
						$("#item_img_info").text("대표컷 - 상품 상세(기본)")
					});
					$(".item_list_img").click(function(){  
						$("#item_viewImg").css({
							width : '110px',
							height: '162px'
						});
						$("#item_img_info").text("대표컷 - 상품 리스트")
					});
					$(".item_order_img").click(function(){ 
						$("#item_viewImg").css({ 
							width : '80px',
							height: '118px'
						});
						$("#item_img_info").text("대표컷 - 상품 썸네일(장바구니/주문)")
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
					$('.board_list .close_btn').click(function() {
						$('.board_list_view').hide();
					});
				
					
					// 관리자 상품등록 - 사진 미리보기 창
					$('.item_preview_btn').click(function(){
						var scroll = $(document).scrollTop();
						$("#item_preview").css('top',''+ scroll +'px');
						$("#item_preview").show();
					}); 
					 
					$("#item_preview .select_btn").click(function(){
						$("#item_preview").hide(); 
					});  
					var type = $("#list_type").val();
					
			  		// 아이템 항목별,갯수별 리스트 불러오기 
			 		$("#item_rowCount_list").change(function(){
			 			var rowCount = $(this).val(); 
			 			var list_arr = $("#item_list_arr_list").val();
			 			var counsel_type = $("#counsel_type").val();
			 			var counsel_answer = $("#counsel_answer").val();
			 			var url = $(".url_val").val();
			 			location.href =  getContextPath() + url + "&rowCount="+rowCount+"&list_arr="+list_arr+"&counsel_type="+counsel_type+"&counsel_answer="+counsel_answer+"";
			 		});    
			 		$("#item_list_arr_list").change(function(){ 
			 			var list_arr = $(this).val();  
			 			var rowCount = $("#item_rowCount_list").val(); 
			 			var counsel_type = $("#counsel_type").val();
			 			var counsel_answer = $("#counsel_answer").val();
			 			var url = $(".url_val").val(); 
			 			location.href =  getContextPath() + url + "&rowCount="+rowCount+"&list_arr="+list_arr+"&counsel_type="+counsel_type+"&counsel_answer="+counsel_answer+"";
			 		});    
			 		$("#counsel_type").change(function(){ 
			 			var counsel_type = $(this).val(); 
			 			var list_arr = $("#item_list_arr_list").val();
			 			var rowCount = $("#item_rowCount_list").val(); 
			 			var counsel_answer = $("#counsel_answer").val();
			 			var url = $(".url_val").val();
			 			location.href =  getContextPath() + url + "&rowCount="+rowCount+"&list_arr="+list_arr+"&counsel_type="+counsel_type+"&counsel_answer="+counsel_answer+"";
			 		});
			 		$("#counsel_answer").change(function(){ 
			 			var counsel_answer = $(this).val();
			 			var list_arr = $("#item_list_arr_list").val();
			 			var rowCount = $("#item_rowCount_list").val(); 
			 			var counsel_type = $("#counsel_type").val();
			 			var url = $(".url_val").val();
			 			location.href =  getContextPath() + url + "&rowCount="+rowCount+"&list_arr="+list_arr+"&counsel_type="+counsel_type+"&counsel_answer="+counsel_answer+"";
			 		});
			 		$("#review_grade").change(function(){ 
			 			var review_grade = $(this).val();
			 			var list_arr = $("#item_list_arr_list").val();
			 			var rowCount = $("#item_rowCount_list").val(); 
			 			var url = $(".url_val").val();
			 			location.href =  getContextPath() + url + "&rowCount="+rowCount+"&list_arr="+list_arr+"&review_grade="+review_grade+"";
			 		});
			 		
			 		
					// 관리자 게시판 관리 
					$(".layer_board_view_btn").click(function(){
						$(".board_list_view").show(); 
					});  
					// 관리자 게시판 드래그기능
					$(".board_list_view").draggable({
						cancel:".note-frame,.board_title,textarea,.hasDatepicker"
					});
					// 게시글 닫기 버튼 클릭시
					$(".board_close_btn").click(function(){
						$(".board_list_view").hide();
						$(".event_display").hide();
						$(".notice_display").hide();
						$(".counsel_reply_content").hide();
						$(".notice_official_detail").removeAttr("chcked");
						$(".board_list_view .period").attr("disabled","disabled")
						$(".board_list_view .period").val("");
						    
					});  
					// 게시판 별 추가정보 보이게하기
					if($(".board_id").val() == "event"){
						$(".event_display").show(); 
						$(".board_list_view .board_another").text("조회: ");
					}else if($(".board_id").val() == "notice"){
						$(".notice_display").show(); 
						$(".board_list_view .board_another").text("조회: ");
					}
					// 게시글 상세보기
					$(".layer_board_view_btn").click(function(){
						$(".board_list_view").show();
						$('#boardview').show();
						$("#writeform").hide();
						var board_id = $(this).attr("board_id");
						var board_seq = $(this).attr("board_seq");
						var board_answer = $(this).attr("board_answer");
						$(".board_modify_btn").attr("board_seq", board_seq);
						$(".board_modify_btn").attr("board_id", board_id);
						$.get( getContextPath() +'/ajax/board_detail', 
		 					{ board_seq : board_seq, 
							  board_id : board_id },    
			 				function(data){        
								$(".board_list_view .detail_board_num").val(data.num); 
								$(".board_list_view .detail_board_name").text(data.name); 
								$(".board_list_view .detail_board_title").text(data.title);
								$(".board_list_view .detail_board_content").html(data.content);
								$(".board_list_view .board_another_info").text(data.another);
								$(".board_list_view .detail_board_date").text(data.date);
								$(".board_delete_btn").attr("href", getContextPath() +'/board_delete?board_seq='+ board_seq +'&board_id='+ board_id +'&board=admin_board');
								if(board_id == 'counsel'){
									$(".board_modify_btn").hide();
									$(".board_reply_btn").show();
									$(".board_list_view .board_another").text("답변상태: ");
									if(board_answer == '답변대기'){    
										$(".counsel_reply_content").show();  
										$(".counsel_reply_insert").show();
									}else if(board_answer == '답변완료'){
										$(".board_modify_btn").hide(); 
										$("#counsel_reply_box").show();
										$("#counsel_reply_box").text(data.reply_vo.counsel_reply_content);
									}
								}
								else if(board_id == 'review'){
									var grade = data.grade;
									var grade_txt = "";
									for(var i = 0 ; i < grade ; i ++ ){
										grade_txt += "★";
									}
									$(".board_list_view .detail_board_title").text(data.item_name + " " + grade_txt);
									$(".board_delete_btn").show();
									$(".board_modify_btn").hide(); 
									$(".board_reply_btn").hide();
									$(".board_list_view .board_another").text("조회: ");
								}else if(board_id == 'event'){
									$(".event_display").show();
									$(".board_modify_btn").show(); 
									$(".board_reply_btn").hide();
									$(".board_list_view .board_another").text("조회: ");
								}else if(board_id == 'notice'){
									$(".notice_display").show(); 
									$(".board_modify_btn").show(); 
									$(".board_reply_btn").hide();
									$(".board_list_view .board_another").text("조회: ");
								}  
		 					});      
					}); 
					
					// 1:1 답변 등록
					$(".counsel_reply_insert").click(function(){
						var board_view_form = $("#board_view_form").serialize();
						$.ajax({
							url: getContextPath()+'/counsel_reply_insert',
							type: "POST",  
							data : board_view_form,
							async: true, 
							processData : false,   
							contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
							success: function(data){ 
								$(".counsel_reply_content").hide();
								$("#counsel_reply_box").show();
								$("#counsel_reply_box").text(data.reply_vo.counsel_reply_content);
								$(".board_reply_btn").hide();
							},    
							error: function(request,status,error){
							}      
						});  
						
					});  
					
					// 게시판 글쓰기 버튼 클릭시
					$('.board_write_btn').click(function() {
						var board_id = $(this).attr("board_id");
						$('#boardview').hide();
						$(".board_list_view").show();
						$("#writeform").show();
						$("#writeform").attr("action", getContextPath()+'/board_insert');
						if(board_id=='event'){
							$(".event_display").show();
						}else if(board_id=='notice'){
							$(".notice_display").show();
						}
					});   
					// 게시판 글쓰기 창에서 저장하기 클릭시
					$('#board_add_btn').click(function(){
						var board_id = $(this).attr("board_id");
					});
					
					// 게시판 수정버튼 클릭 시 
					$('.board_modify_btn').click(function() {
						$(".board_list_view").show();
						$("#writeform").show();
						$('#boardview').hide(); 
						var board_id = $(this).attr("board_id");
						var board_seq = $(this).attr("board_seq");
						$.get( getContextPath() +'/ajax/board_detail', 
		 					{ board_seq : board_seq,
							  board_id : board_id },   
			 				function(data){        
								$(".board_list_view .board_id").val(board_id);  
								$(".board_list_view .board_num").val(data.num); 
								$(".board_list_view .board_num").attr("name", board_id+"_num"); 
								$(".board_list_view .board_title").attr("name", board_id+"_title"); 
								$(".board_list_view .board_content").attr("name", board_id+"_content"); 
								$(".board_list_view .board_title").val(data.title);
								$(".board_list_view .board_writer").text(data.name); 
								$(".board_list_view .note-editable").html(data.content);
								$(".board_list_view .detail_board_date").text(data.date);
								$(".board_list_view .board_content").val(data.content);
								if(board_id == 'event'){   
									$(".board_list_view #period1").val(data.period[0]);
									$(".board_list_view #period2").val(data.period[1]);
									$(".event_display").show();
									$(".board_list_view .event_thumb").attr('src', getContextPath()+"/resources/upload/editor/"+data.thumbnail);
									$(".board_list_view .thumb_name").val(data.thumbnail);
									$(".thumb_name").show()
									$('.event_thumb_box .del_thumb').show();
									if(data.thumbnail == null){ 
										$(".thumb_name").hide()
										$('.event_thumb_box .del_thumb').hide();
										$(".board_list_view .event_thumb").attr('src', "");
									}
									
								}else if(board_id =='notice'){
									$(".notice_display").show(); 
									if(data.official == 1){
										$("#board_notice").attr("checked","checked");
										$(".notice_official_detail").removeAttr("disabled");
									}
									if(data.official_d == 0){
										$("#onlynotice0").attr("checked","checked");
									}else{
										$("#onlynotice1").attr("checked","checked");
										$(".board_list_view .period").removeAttr("disabled");
										$(".board_list_view #period1").val(data.period[0]);
										$(".board_list_view #period2").val(data.period[1]);
									}
									
								}    
							  });   
						
						$("#writeform").attr("action", getContextPath()+'/board_update');
					}); 
					$('.event_thumb_box .del_thumb').click(function() {
						$(".board_list_view .event_thumb").attr('src', null);
						$(".thumb_file").val("");
						$(".thumb_name").val("");  
						$(".thumb_name").hide();   
						$(this).hide();  
					});  
			  
					  
					//주문 상세보기  
					$(".admin_order_detail_btn").click(function(){
						$('.order_detail_box').show();
						var order_num = $(this).attr("order_num");
						$.get( getContextPath() +'/ajax/order_detail', 
			 					{ order_num : order_num},   
				 				function(data){    
			 						$(".order_item_list_row").remove();
			 						var list = data.list; 
			 		 				list.forEach(function(item,index){ 
			 		 					var mile = Math.floor(Number(item.order_item_price.replace(/,/gi,"")) * item.order_item_quantity * 0.05);
			 		 					var item_total = Number(item.order_item_price.replace(/,/gi,"")) * item.order_item_quantity;
										$(".order_table_body").append('<tr class="order_item_list_row"><td class="order_item_info"><p class="order_item_img"><a href="#"><img width="80"src="/sh/resources/upload/'+data.item_list[index].product_picture+'"></a></p>'
										+'<div class="order_item_title"><p class="order_item_title_txt"><a href="#">'+item.order_item_name+'</a></p><p><span class="order_item_editor">'+data.editor_list[index].editor_name+'</span><span class="order_item_publising">'+data.item_list[index].product_publish+'</span></p></div></td>'
										+'<td class="order_item_price"><p class="order_item_price_txt"><span>'+item.order_item_price+'</span>원</p><p class="order_item_discount">(<span>'+data.item_list[index].product_discount+'%</span><i class="fas fa-long-arrow-alt-down"aria-hidden="true"></i>)</p></td>'
										+'<td class="order_item_count"><p>'+item.order_item_quantity+'개</p></td>' 
										+'<td class="order_item_mileage"><p>'+won_transform(String(mile))+'원</p></td>' 
										+'<td class="order_item_allPrice"><p class="order_item_allPrice_txt">'+won_transform(String(item_total))+'원</p></td></tr>')
			 		 				});    
			 		 				$("#total_reserve").text(won_transform(String(Math.floor(Number(data.vo.total_price.replace(/,/gi,""))*0.05))));
			 		 				$("#total_settle_price").text(data.vo.total_price);
			 		 				$(".method_txt").text(data.vo.payment_methods);
			 		 				$(".shipping_txt").text(data.vo.order_shipping_charge+'원');
			 		 				$(".address_txt").text(data.vo.order_address+' '+data.vo.order_detail_address+' '+data.vo.order_extra_address);
			 		 				$(".order_id").text(data.vo.order_name);
			 		 				$(".order_phone").text(data.vo.order_phone_number +' / '+ data.vo.order_add_number);
			 		 				$(".order_email").text(data.member_vo.members_email);
			 					});  
					});
					
					
					// 달력 설정
					$(".datepickers").datepicker({
						 monthNamesShort:["1월","2월","3월","4월","5월","6월","7월",

							     "8월","9월","10월","11월","12월"], //월표시 형식 설정
							     
					    dayNamesMin:["일","월","화","수","목","금","토"], // 요일에 표시되는 형식 설정

					    dateFormat:"yy-mm-dd", //날짜 형식 설정

					    showMonthAfterYear : true, // 년 뒤에 월 표시
					     
					    showAnim:"fold", //애니메이션효과
					    
					    changeMonth : true, // 월 변경가능
					    
					    changeYear : true, // 년 변경가능

						maxDate: 0,
					}); 
					
					
					var date = new Date();
					// 관리자 상세 검색 달력기간 설정
					$("#today").click(function(){
						$(this).parent().siblings(".start_day").val(today());
						$(this).parent().siblings(".end_day").val(today());
					});
					$("#1week").click(function(){
						$(this).parent().siblings(".start_day").val(lastWeek()); 
						$(this).parent().siblings(".end_day").val(today());
					});
					$("#1month").click(function(){
						$(this).parent().siblings(".start_day").val(lastMonth());
						$(this).parent().siblings(".end_day").val(today());
					});
					$("#3month").click(function(){
						$(this).parent().siblings(".start_day").val(last3Month());
						$(this).parent().siblings(".end_day").val(today()); 
					});   
					$("#all_day").click(function(){
						$(this).parent().siblings(".start_day").val("");
						$(this).parent().siblings(".end_day").val("");  
					});
					
					$(".today").click(function(){
						$(this).parent().siblings(".start_day").val(today());
						$(this).parent().siblings(".end_day").val(today());
					});
					$(".1week").click(function(){
						$(this).parent().siblings(".start_day").val(lastWeek()); 
						$(this).parent().siblings(".end_day").val(today());
					});
					$(".1month").click(function(){
						$(this).parent().siblings(".start_day").val(lastMonth());
						$(this).parent().siblings(".end_day").val(today());
					});
					$(".3month").click(function(){
						$(this).parent().siblings(".start_day").val(last3Month());
						$(this).parent().siblings(".end_day").val(today()); 
					});   
					$(".all_day").click(function(){
						$(this).parent().siblings(".start_day").val("");
						$(this).parent().siblings(".end_day").val("");  
					});
					
					// 관리자 검색 체크유지 
					if($(".status_val").val() != null){
						var status = $(".status_val").val().split(",");
						var input = $("input[type='checkbox']");
						for(var i= 0; i < input.length; i++){
							for(var j=0; j < status.length; j++){
								if($(input[i]).val() == status[j]){
									$(input[i]).prop('checked', true);
								}
							}
						} 
					}   
					// 리뷰 관리자 게시판 별출력
					
					var grade_arr = document.getElementsByClassName("review_grade");
					for(var i=0; i<grade_arr.length; i++){
						var review_str = ''; 
						var grade = $(grade_arr[i]).text();
						for(var j = 0; j < grade; j++){ 
							review_str += '★';    
						}   
						$(grade_arr[i]).text(review_str);
					} 
		
					// 관리자 검색창 선택시
					$(".search_layer li").click(function(){
						var keyword = $(".search_input").val();
						var url = $(this).attr("id");
						location.href =  getContextPath() + "/" + url +"_list?keyword=" + keyword;
					});
					var order_total_val = $(".order_today_val").val();
					var total_mile_val = $(".total_mile_val").val();
					if(order_total_val == ""){
						order_total_val = 0;
					} 
					if(total_mile_val ==""){
						total_mile_val = 0;
					}
					$(".order_today_total").text(won_transform(String(order_total_val)));
					$(".total_mile_cnt").text(won_transform(String(total_mile_val)));
					 
					//주문 상태 변경
					$(".order_status_btn").click(function(){
						var order_form = $("#order_list").serialize();
						var order_ck = document.getElementsByName("select_ck_num");
						var ck_val = $(".order_status_val").val();
						if(ck_val != ""){
							order_ck.forEach(function(item,index){
								if($(item).prop("checked")){
									$(item).parent().siblings(".order_status_cnt").text(ck_val);
								}  
							});  
							$.ajax({ 
								type: 'post', 
								url: getContextPath() + '/order_status_update',
								data : order_form,
								success: function(data){
								
								},  
								error: function(request,status,error){
								}    
							});  
						}
					
					});
					
					//관리자 게시판 공지사항 설정
					$("#board_notice").click(function(){
						if($(this).prop("checked")){
							$(".notice_official_detail").removeAttr("disabled");
						}else{
							$(".notice_official_detail").attr("disabled","disabled");
						}
					});
					$("#onlynotice1").click(function(){
						if($(this).prop("checked")){
							$(".period").removeAttr("disabled");
						}else{
							$(".period").attr("disabled","disabled");
						}
					});
					$(".close_btn").click(function(){
						$(".push_layer").hide(); 
						$(".push_list_box").hide(); 
						$(".push_write").hide();
					}); 
					$(".add_push").click(function(){ 
						$(".push_layer").show();
						$(".push_list_box").hide(); 
						$(".push_write").show(); 
					}); 
					
				});          
  
 

// 관리자 회원 상세보기창
function open_summary(ent) {
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
	var layer_top = 460 + (nth_tr * 53);
	m_layer.style.display = "block";
	m_layer.style.top = "" + layer_top + "px";
 
	var num = ent.getAttribute("num");
	$.get( getContextPath() +'/ajax/user_detail', 
		{num : num},   
		function(data){  
			$(".detail_review").text(data.review_cnt+"개");
			$(".detail_counsel").text(data.counsel_cnt+"건");
			$(".detail_order").text(data.order_cnt+"개");
			$(".detail_job").text(data.vo.members_job);
			$(".members_num").val(data.vo.members_num);
			if(data.vo.members_favorite == null){
				$(".detail_favorite").text("없음");
			}else{
				$(".detail_favorite").text(data.vo.members_favorite);
			}
		});    
}

// 관리자 항목별 리스트 전체 선택 체크표시
function ckAll(ck_a){
	var bool = $(".ckAll").prop("checked");
	if(bool){
		$(".select_ck_num").prop("checked",true);
	}else{ 
		$(".select_ck_num").prop("checked",false);
	}   
	  
}       

// 관리자 상품 등록 / 수정 
var sel_files = []; // 실제 다중 선택 파일 리스트
var pic_bool = 'false';
var pv_bool = 'false';
//폼 전송전 체크
	function check_item_form(){
		var form = document.item_form;
		var img_form = new FormData(document.getElementById('item_img_form'));
		// 상품 목차 여백값 넘기지 않기
		
		var pr = form.product_index; 
		for(var i = pr.length - 1 ; i >= 0 ; i--){
			if(pr[i].value == ''){ 
				pr[i].removeAttribute('name'); 
			}       
		}
		var pv_length = String(sel_files.length);
		sel_files.forEach(function(item,index){
			img_form.append("pv_arr"+ index +"", item);
		})
		img_form.append("pv_length", pv_length); 
		img_form.append("pic_bool", pic_bool); 
		img_form.append("pv_bool", pv_bool); 
		 
		$.ajax({
			type: 'post', 
			url: getContextPath() + '/file_upload',
			data : img_form,
			processData : false,   
			contentType : false,
			success: function(data){
				if(data != 1) document.getElementById("product_num").value = data;
				document.getElementById("item_form").submit(); 
			},  
			error: function(request,status,error){
			}    
		});  
}  
  
	// 정가 입력시 할인가 자동 적용 및 금액 단위 표시
	function discount(){
		var form = document.item_form;
		var charge = parseInt(document.querySelector('input[name="product_discount"]:checked').value);
		var arr =  form.origin_price.value.split(',');
		var origin = form.origin_price.value;
		var origin_len = form.origin_price.value.length; 
		var rtnStr = ""; 
		var origin_val = ""; 
		var last_val = "";
		var last_val2 = "";
		arr.forEach(function(item,index){  
		origin_val += item; 
		});
	
	//판매가 자동 할인금액 적용 , 숫자만 표시
	var price = parseInt(origin_val);
	var dis_price = Math.round(price - (price * (charge * 0.01)));
		var dis_val = String(dis_price).split("");
		for (var i = 0; i < origin_val.length ; i++) {
			var ch = origin_val.charAt(i);
			if (!(ch >= '0' && ch <= '9')){  
 				 alert("숫자만 입력 가능합니다.");
 				 form.origin_price.value = ''; 
 				 form.discount_price.value = ''; 
				}     
		}        
		  
	//상품 금액 입력시 쉼표(,) 추가하기 
	var array_str =  origin_val.split("");
	array_str =  array_str.reverse(); // 배열 순서 뒤집기 
	for(var i = array_str.length - 1   ; i  >= 0 ; i--){
			if(i % 3 == 0 && ( i!=0 ) ){
				array_str.splice(i, 0, ",");
			}			      
	}  
	array_str  =  array_str.reverse(); 
	array_str.forEach(function(item,index){
		last_val += item;  
	}); 
	form.origin_price.value = last_val;
	
	
	dis_val  =  dis_val.reverse();
	for(var i = dis_val.length - 1   ; i  >= 0 ; i--){
			if(i % 3 == 0 && ( i!=0 ) ){
				dis_val.splice(i, 0, ",");
			}			      
	}    
	
	dis_val  =  dis_val.reverse();  
	dis_val.forEach(function(item,index){
		last_val2 += item;  
	}); 
	if(!(origin == '' || origin == null) ){
		form.discount_price.value = last_val2;
	}    
	if( charge == 0 ){ 
		form.discount_price.value = origin_price.value;
		} 
	}     
	//---파일 전송 전 미리보기
	
	//상품 대표사진 한장 
	function readURL(input){
		$("#item_img_box").show();
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				pic_bool = 'true';
				var img = $("#item_viewImg").attr('src',e.target.result);
				if(img.width() < 480 || img.height() < 780){
					alert("이미지 권장 사이즈는 480x780입니다.");
				} ;
				$("#item_viewImg").attr('src',e.target.result);
				$(".hide_pic_name").hide();
			} 
			reader.readAsDataURL(input.files[0]);
		}    
	} 
	
	
	function item_img_del(del){
		$("#item_img_box").hide();
	}
	var item_name = '';
	var pv_cnt = 0;
	// 상품 여러장 미리보기
	function preview_img(input){
		if( ++pv_cnt == 1){
			$("#preview_box").html("");
		} 
		$(".hide_pics_name").text(""); 
		var img_files = input.files; 
		var filesArr = Array.prototype.slice.call(img_files);
		filesArr.forEach(function(f){
			sel_files.push(f);
			var reader = new FileReader();
			reader.onload = function(e){
				item_name = ''; 
				pv_bool = 'true';
				var img_html = "<span class='preview_list' onmousedown='mouseDown(this)' onmouseOut='mouseOut(this)'> <img src='"+ e.target.result  +"'/><i class='fas fa-times' onclick = 'delete_img(this);' ></i></span>"
				$("#preview_box").append(img_html);
				$("#preview_box span i").show();      
				// 상품사진 프리뷰 드래그이벤트
				$("#preview_box").sortable(); 
				$("#preview_box").disableSelection();      
			}   
			reader.readAsDataURL(f);  
		});
		sel_files.forEach(function(item,index){ //선택 이미지이름 나열
			item_name += item.name;
			if(index != sel_files.length-1){
				item_name = item_name + ", ";
			} 
		}); 
		$(".hide_pics_name").text(item_name);
	
	}
	 
	// 상품 미리보기 위치 변경 시 배열  
	var pv_bool2 = false;
	//미리보기 삭제
	function delete_img(del){
		pv_bool2 = false;
		var pv_list = document.getElementsByClassName("preview_list");
	 	del.parentNode.remove(); 
	 	console.log(sel_files);
	}
	var pv_idx1 = 0;   
	var pv_idx2 = 0;
	var val = null;
	var name = '';
	//미리보기 사진 클릭시 해당 요소값 따로 저장 및 제거하기
	
	function mouseDown(span){
		if(!pv_bool2){
	 		var pv_list = document.getElementsByClassName("preview_list");
	 		for(var i = 0 ; i < pv_list.length ; i ++){
	 			if(pv_list[i] == span) pv_idx1 = i;
	 		}         
	 		val = sel_files[pv_idx1];
	 		sel_files.splice(pv_idx1,1); 
	 		console.log(pv_idx1);
	 		pv_bool2 = true;
		}  
	}       
	//미리보기 사진에서 범위 벗어났을 때 해당 인덱스값 얻고 저장해둔 요소값 추가, 파일 배열 맞춰주기
	function mouseOut(span){  
		if(pv_bool2){
			name = '';
	 		var pv_list = document.getElementsByClassName("preview_list");
	 		for(var i = 0 ; i < pv_list.length ; i ++){
	 			if(pv_list[i] == span) pv_idx2 = i ;
	 		}  
	 		sel_files.splice(pv_idx2,0,val);
	 		console.log(pv_idx2);
	 		
	 		sel_files.forEach(function(item,index){
	 			console.log(item);
	 		});
	 		pv_bool2 = false; 
	 		
	 		 //선택 이미지이름 나열
	 		sel_files.forEach(function(item,index){
				if(item != null) name += item.name;
				if(index != sel_files.length-1){
					name = name + ", ";
				} 
			});  
			$(".hide_pics_name").text(name);
		}   
		
	}    
	  
	// 에디터 이미지 보내주기 
	function sendFile(file, el) {
		var form_data = new FormData();
      	form_data.append('file', file);
      	$.ajax({
        	data: form_data, 
        	type: "POST",
        	url:  getContextPath()+'/editor_img_insert',
        	cache: false, 
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(img_name){
        		// 에디터에 이미지 출력 
        		var url =  getContextPath() + img_name;
          		$(el).summernote('editor.insertImage', url);
        	}
      	});  
    } 
	// 이벤트 썸네일 이미지 미리보기
	
	//상품 대표사진 한장 
	function e_readURL(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				var img = $(".event_thumb").attr('src',e.target.result);
				if(img.width() < 372 || img.height() < 186){
					alert("이미지 권장 사이즈는 372x186입니다.");
				} ;
				$(".event_thumb_box .del_thumb").show();
			}  
			reader.readAsDataURL(input.files[0]);
		} 
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
 

	function getDateStr(myDate){
		return (myDate.getFullYear() + '-' + ('00' + (myDate.getMonth() + 1)).slice(-2) + '-' + ('00' + (myDate.getDate())).slice(-2)); 
	}

	/* 오늘 날짜를 문자열로 반환 */
	function today() { 
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
	
	// 관리자 페이지 내용 선택 삭제
  function ck_null(str){
		 var form = document.getElementById(str);
		 if(str == "order_list"){ 
			 $(form).attr("action", getContextPath()+"/order_delete");
			 $(form).attr("method", "get");
		 }  
		 var ck_list = document.getElementsByName("select_ck_num");
		 var bool = false; 
		 ck_list.forEach(function(item){ 
			 if($(item).prop("checked")){
				 bool = true; 
			 }  
		 }); 
		 if(bool){ 
			 form.submit();   
		 }else{
			 alert("하나의 항목 이상 체크하세요")
		 }
	  }
  // 관리자 검색 
  function keyword_keyup(key){
	  var val = key.value; 
	  $(".search_layer").show();
	  $(".search_layer_keyword").text(val);
	  if(val == ""){
		  $(".search_layer").hide();
	  }
  }
  //관리자 알림 관리 Ajax
  function push_list(input){
	  $(".push_layer").show(); 
	  $(".push_list_box").show(); 
	  $(".push_write").hide(); 
		var cate = $(input).attr("push_id");
		var page_num = $(input).attr("page_num");
		if(page_num != null){
			page_num = 1;
		}
		$.get(getContextPath() + '/ajax/push_list',
			{ cate : cate,
			  pageNum : page_num
		},function(data){
			var str = ""; 
			var pg_str = "";
			var util = data.util; 

			$(".push_list_table").html("<tr>" +
										  "<th width='10%'>번호</th>" +
										  "<th width='60%'>내용</th>" +
										  "<th>등록일</th>" +
										  "<th width='10%'>관리</th>" +
									   "</tr>");
			$(".push_pagination").html("");
			data.list.forEach(function(item,index){
				str = str + "<tr>" +
								"<td>"+ ((data.rowCount*(util.pageNum-1)+1) + index) +"</td>" +
								"<td>"+ item.push_content +"</td>" +
								"<td>"+ data.date_list[index] +"</td>" +
								"<td>" + 
								"	<input class='push_delete_val' push_id='"+ data.cate +"' page_num='"+ util.pageNum +"' class='fas fa-times'></i>" +
								"	<i class='fas fa-times' push_num='"+ item.push_num +"' onclick='delete_push(this)'></i>" +
								"</td>" +
							"</tr>";  
			});  
			$(".push_list_table").append(str);  
			
			if((util.startPageNum%util.pageBlockCount==1) && (util.startPageNum>util.pageBlockCount)){
				pg_str = pg_str +  "<li class='page-item'>" +
								       "<a class='page-link list_btn' onclick='push_list(this)' page_num='"+ (util.startPageNum-1) +"' push_id='"+ cate +"' aria-label='Previous'>" +
								       	  "<span aria-hidden='true'>«</span>" +
								       "</a>"+  
								   "</li>";
			}else{
				pg_str = pg_str +  "<li class='page-item'>" +
								       "<a class='page-link list_btn' onclick='push_list(this)' page_num='"+ (util.pageNum-1) +"' push_id='"+ cate +"' aria-label='Previous'>" +
								       	  "<span aria-hidden='true'>«</span>" +
								       "</a>"+  
								   "</li>";
			}
			for(var i = util.startPageNum; i <= util.endPageNum; i++){
				if(util.pageNum==i){
					pg_str = pg_str +  "<li class='page-item' id='page_ck'>" +
									       "<a class='page-link list_btn' onclick='push_list(this)' page_num='"+ i +"' push_id='"+ cate +"' aria-label='Previous'>"+ i +"</a>"+  
									   "</li>";
				}else{
					pg_str = pg_str +  "<li class='page-item'>" +
									       "<a class='page-link list_btn' onclick='push_list(this)' page_num='"+ i +"' push_id='"+ cate +"' aria-label='Previous'>"+ i +"</a>"+  
									   "</li>"; 
				}
			}
			if(util.pageNum < util.totalPageCount){
				pg_str = pg_str +  "<li class='page-item'>" +
								       "<a class='page-link list_btn' onclick='push_list(this)' page_num='"+ (util.pageNum + 1) +"' push_id='"+ cate +"' aria-label='Previous'>" +
								       	  "<span aria-hidden='true'>»</span>" +
								       "</a>"+ 
								   "</li>"; 
			}else{
				pg_str = pg_str +  "<li class='page-item'>" +
								       "<a class='page-link list_btn' aria-label='Previous'>" +
								       	  "<span aria-hidden='true'>»</span>" +
								       "</a>"+ 
								   "</li>";
			} 
			$(".push_pagination").append(pg_str);
		});    
  }
 // 관리자 알림 삭제
function delete_push(btn){
	var push_num = $(btn).attr("push_num");
	var obj = $(btn).prev();
	var push_id = $(obj).attr("push_id");
	$.get(getContextPath() + '/ajax/push_delete',
			{ push_num : push_num,
			  push_id : push_id
		},function(data){
			push_list(obj);
			if(push_id == "이벤트"){
				$(".event_count").text(data);
			}else if(push_id == "공지"){
				$(".notice_count").text(data);
			}else{
				$(".basic_count").text(data);
			}
		}); 
}

// 관리자 매출 통계
function viewGraph(){
	$('.column').css('height','0');
	$('.admin_chart li').each(function(index) {
	var ha = Number($(this).text());
	var ha_per = ha * 0.00001; 
	$('#col'+index).animate({height: ha_per}, 1500);
	}); 
} 

// 관리자 회원 상세정보 페이지
function detail_list(obj){
	var num = $(".members_num").val();
	var url = $(obj).attr("url");
	location.href = url + num; 
}