$(document).ready(function(){
	var leftH=$('.news-left').height(),
		rightH=$('.news-right').height();
	$('.news-right').css({"height":leftH,"overflow-y":"auto"});
	$('.news-tab>li').click(function() {
		$(this).addClass('on').siblings('li').removeClass('on');
	});
})
	