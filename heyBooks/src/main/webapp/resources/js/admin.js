$(document).ready(function() {
  $('.collapse.in').prev('.panel-heading').addClass('active');
  $('#accordion, #bs-collapse')
    .on('show.bs.collapse', function(a) {
      $(a.target).prev('.panel-heading').addClass('active');
    })
    .on('hide.bs.collapse', function(a) {
      $(a.target).prev('.panel-heading').removeClass('active');
    });
  
  //관리자 메인 - 메모
  $('.memo_write textarea').click(function(){
	  $(this).css('height','120px');
	  $(this).text('');
	  $('.memo_write i').show();
  });
  $('.memo_write i').click(function(){
	  $(this).prev().css('height','34px');
	  $(this).prev().text('메모를 남기세요');
	  $('.memo_write i').hide();
  });
});