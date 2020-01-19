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
			 			var cate_code = $(this).val();
			 			$.getJSON( getContextPath() + '/jackson/item_cate',
			 					{ cate_code : cate_code },
			 					function(data){
			 					data.forEach(function(item,index){
			 						$("#select_cate3").append("<option value='" + item.cate_num +"'>"+ item.cate_name+"</option>");
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
						var sel = $.trim($("#cate_editor").text());
						var val = $("#cate_editor").val(); 
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
					$('.order_btn').click(function() {
						$('.order_detail_box').show();
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
					
					// 관리자 게시판 관리 
					$(".layer_board_view_btn").click(function(){
						$(".board_list_view").show(); 
					});  
					// 게시글 닫기 버튼 클릭시
					$(".board_delete_btn").click(function(){
						$(".board_list_view").hide();
						location.reload();
						  
					});
					
					// 1:1문의 상세 클릭할 경우
					$(".counsel_table .layer_board_view_btn").click(function(){
						$(".board_reply_btn").show();
						$(".board_modify_btn").hide();
					});    
					
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
								if(board_answer == '답변대기'){    
									$(".counsel_reply_content").show();  
									$(".counsel_reply_insert").show();
								}else if(board_answer == '답변완료'){
									$("#counsel_reply_box").show();
									$("#counsel_reply_box").text(data.reply_vo.counsel_reply_content);
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
								$("#counsel_reply_box").text(data.reply_vo.counsel_reply_content);
								$(".board_reply_btn").hide();
							},    
							error: function(request,status,error){
							}      
						});  
						
					});  
					
					// 게시판 글쓰기 버튼 클릭시
					
					$('.board_write_btn').click(function() {
						$('#boardview').hide();
						$(".board_list_view").show();
						$("#writeform").show();
						$("#writeform").attr("action", getContextPath()+'/board_insert');
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
								$(".board_list_view .board_num").val(data.num); 
								$(".board_list_view .board_writer").text(data.name); 
								$(".board_list_view .board_title").val(data.title);
								$(".board_list_view .note-editable").html(data.content);
								$(".board_list_view .detail_board_date").text(data.date);
								$(".board_list_view .board_content").val(data.content);
								if(board_id == 'event'){   
									$(".board_list_view #event_period").val(data.period);
									$(".board_list_view .event_thumb").attr('src', getContextPath()+"/resources/upload/editor/"+data.thumbnail);
									$(".board_list_view .thumb_name").val(data.thumbnail);
									$(".thumb_name").show()
									$('.event_thumb_box .del_thumb').show();
									if(data.thumbnail == null){ 
										$(".thumb_name").hide()
										$('.event_thumb_box .del_thumb').hide();
										$(".board_list_view .event_thumb").attr('src', "");
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
					// summernote 플러그인 
					$('#summernote').summernote({
						height : 300, // set editor height
						focus : true,
						callbacks:{
							onImageUpload: function(files, editor, welEditable) {
								for (var i = files.length - 1; i >= 0; i--) {
					            	sendFile(files[i], this);
					            }
					        }	
						} 
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
			alert("result:" + data);
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
		var img_files = input.files; 
		var filesArr = Array.prototype.slice.call(img_files);
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지만 가능합니다.");
				return;
			}   
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
	
	var pv_bool = false;
	//미리보기 삭제
	function delete_img(del){
		pv_bool = false;
		var pv_list = document.getElementsByClassName("preview_list");
 	del.parentNode.remove(); 
 	console.log(sel_files);
	}
	 
	var pv_idx1 = 0;   
	var pv_idx2 = 0;
	var val = null;
	//미리보기 사진 클릭시 해당 요소값 따로 저장 및 제거하기
	function mouseDown(span){
		if(!pv_bool){
	 		var pv_list = document.getElementsByClassName("preview_list");
	 		for(var i = 0 ; i < pv_list.length ; i ++){
	 			if(pv_list[i] == span) pv_idx1 = i;
	 		}        
	 		val = sel_files[pv_idx1];
	 		sel_files.splice(pv_idx1,1); 
	 		console.log(pv_idx1);
	 		pv_bool = true;
		} 
	}       
	//미리보기 사진에서 범위 벗어났을 때 해당 인덱스값 얻고 저장해둔 요소값 추가, 파일 배열 맞춰주기
	function mouseOut(span){  
		if(pv_bool){
	 		var pv_list = document.getElementsByClassName("preview_list");
	 		for(var i = 0 ; i < pv_list.length ; i ++){
	 			if(pv_list[i] == span) pv_idx2 = i ;
	 		}  
	 		sel_files.splice(pv_idx2,0,val);
	 		console.log(pv_idx2);
		 	pv_bool = false; 
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
        		alert(url);
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
	