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
		    slideWidth: 600
		  });
});