(function ( $, window, document, undefined ) {

$.fn.collapse = function (options, callback) {

	if(typeof options === 'function') {
		callback = options;
		options = {};
	}
	
	var s = $.extend({}, $.fn.collapse.defaults, options);

	return this.each(function () {

		$(this)
			.animate({opacity: 0}, s.speed, function () {
				$(this).slideUp(s.speed, function () {
					if(s.remove === true) {
						$(this).remove();
					}
					if(typeof callback === 'function') {
						callback();
					}
				});
			});

	});
};

$.fn.collapse.defaults = {
	speed : 250,
	remove: false
};

})( jQuery, this, document );