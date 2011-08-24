(function ( $, window, document, undefined ) {

$.fn.expand = function (options, callback) {

	var s = $.extend({}, $.fn.expand.defaults, options);

	return this.each(function () {

		var $elem = $(this);

		$elem
			.css({
				opacity: 0,
				display: 'none'
			});

		if(typeof s.target === 'string'){
			switch(s.load){
				case 'replace': $(s.target).html($elem); break;
				case 'append': $elem.appendTo(s.target); break;
				case 'prepend': $elem.prependTo(s.target); break;
			}
		}

		$elem
			.slideDown(s.speed, function () {
				$(this).animate({opacity: 1}, s.speed, function () {
					if(typeof callback === 'function') {
						callback();
					}
				})
			});

	});
};

$.fn.expand.defaults = {
	speed : 250,
	target: false, // selector of target
	load: 'append' // [append/prepend/replace]
};

})( jQuery, this, document );