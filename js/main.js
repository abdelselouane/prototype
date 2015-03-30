jQuery(function() {
	//widget hover
	jQuery('.widgets .widget-container').hover(function() {
		jQuery(this).addClass('hover');
		jQuery('.widget-image', this).attr('src', jQuery('.widget-image', this).attr('src').replace('.png', '-over.png')); 
	},
	function() {
		jQuery(this).removeClass('hover');
		jQuery('.widget-image', this).attr('src', jQuery('.widget-image', this).attr('src').replace('-over.png', '.png'));
	});
	
	jQuery(function() {
		if(jQuery('#main-container').height() >= 1505)
			jQuery('#main-container').css('background-size', 'cover');
	});
});
