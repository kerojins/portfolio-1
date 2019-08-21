$("document").ready(function() {

	var cnt = 0; // 카테고리창 변수

	// 카테고리 클릭시 서브메뉴 유무
	$("#category_btn").click(function() {
		cnt++;
		if (cnt % 2 == 1)
			$("#header_bottom").show();
		else
			$("#header_bottom").hide();
	});
	
	// 새로나온 책 슬라이드
	 $('.bxslider').bxSlider({
		    mode: 'fade',
		    pager: false,
		    speed: 400,
		    slideWidth: 600,
		    infiniteLoop: true,
		    auto: true
		  });
	 
	
	 
	 //뉴스이벤트 마우스 오버시 사진변경
	 
	 function getContextPath(){ //ContextPath얻어오기
		 return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	 }
	 var ctp = getContextPath(); //틀만 잡음
	 $('#news_event_btn li').mouseenter(function(){
		 var nth = $(this).text();
		 $('#news_event_img').find('img').
		 attr('src',""+ctp+"/resources/images/news_event"+nth+".jpg");
	 })
});