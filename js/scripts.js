$('.nav-menu > li > a').click(function() {
	var checkElement = $(this).next();
	$('.nav-menu li').removeClass('active');
	$(this).closest('li').addClass('active'); 
	if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
		$(this).closest('li').removeClass('active');
		checkElement.slideUp('normal');
	}
	if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
		$('.nav-menu ul:visible').slideUp('normal');
		checkElement.slideDown('normal');
	}
	if($(this).closest('li').find('ul').children().length == 0) {
		return true;
	} else {
		return false; 
	}
});
$(document).ready(function(){
	$(".content-sidebar").niceScroll({ cursorcolor: 'rgba(255, 255, 255, 0.2)',cursorborder: '0px', cursorwidth:'6px', cursorborderradius: '0px'});

	var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
	elems.forEach(function(html) {
		var switchery = new Switchery(html);
	});

});