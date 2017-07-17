$(document).ready(function(){
	$('.sidebar-menu>li>a').click(function() {
		$(this).parent('li').toggleClass('on').siblings('li').removeClass('on');
	});
})
	