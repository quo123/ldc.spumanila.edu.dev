$.fn.scrollView = function(speed, parent) {
	parent = parent != null ? parent : 'html, body';
	speed = speed != null ? speed : 200;
	return this.each(function() {
		$(parent).animate({
			scrollTop: $(this).offset().top
		}, speed);
	});
};
/*
$.fn.parallax = function(speed, xPos) {
	speed = speed == null ? 0.25 : speed;
	xPos = xPos == null ? 'center ' : xPos + ' ';
	return this.each(function() {
		var elem = $(this);
		$(window).on('scroll', function () {
			if (isInView(elem)) {
				var offsetY = -(window.pageYOffset-elem.offset().top) * speed;
				var backgroundPosition = xPos + offsetY + 'px';
				elem.css({"background-position":backgroundPosition});
			}
		});
	});
};*/

/**
 * Simple optimized parallax function.
 * @param float speed Parallax rate.
 * @param float xPos Image's position along the X-axis.
 * @returns {$.fn@call;each}
 */
$.fn.parallax = function(speed, xPos) {
	speed = speed != null ? speed : 0.25;
	xPos = xPos != null ? xPos + ' ' : 'center ';
	return this.each(function() {
		var elem = $(this);
		var latestYOffest = 0;
		var ticking = false;
		$(window).on('scroll', function () {
			ticking = false
			latestYOffest = window.pageYOffset;
			requestTick();
		});		
		function update() {
			if (isInView(elem, latestYOffest)) {
				var offsetY = -(latestYOffest-elem.offset().top) * speed;
				var backgroundPosition = xPos + offsetY + 'px';
				elem.css({"background-position": backgroundPosition});
			}
		}		
		function requestTick() {
			if (!ticking) { requestAnimationFrame(update); }
			ticking = true;
		}
	});
};
/*
$.fn.windowHeight = function(min) {
	min = min == null ? 480 : min;
	return this.each(function() {
		var elem = $(this);
		elem.css({height:window.innerHeight});
        $(window).on('resize', function () {
			if (window.innerHeight >= min) {
				elem.css({height:window.innerHeight});
			}
		});
    });
};*/

/**
 * Simple optimized perma-window height function.
 * @param float min Minimum height of the element.
 * @returns {$.fn@call;each}
 */
$.fn.windowHeight = function(min) {
	min = min != null ? min : 480;
	return this.each(function() {
		var elem = $(this);
		var latestHeight = window.innerHeight;
		var ticking = false;
		elem.css({height: latestHeight});
        $(window).on('resize', function () {
			ticking = false;
			latestHeight = window.innerHeight;
			requestTick();
		});
		function update() {
			if (latestHeight >= min) {
				elem.css({height: latestHeight});
			}
		}		
		function requestTick() {
			if (!ticking) { requestAnimationFrame(update); }
			ticking = true;
		}
    });
};

/**
 * Show/hide element while page scrolling.
 * @param {parent} The DOM object we base the scroll trigger on.
 * @param {args} effect, showOpts, hideOpts, showSpeed, hideSpeed, show, hide, offset
 * @returns {$.fn@call;each}
 */
$.fn.scrollShowHide = function(parent, args) {
	parent = $(parent);
	var effect = args['effect'] != null ? args['effect'] : 'fade';
	var showEffectArgs = args['showOpts'] != null ? args['showOpts'] : null;
	var hideEffectArgs = args['hideOpts'] != null ? args['hideOpts'] : showEffectArgs;
	var showSpeed = args['showSpeed'] != null ? args['showSpeed'] : 300;
	var hideSpeed = args['hideSpeed'] != null ? args['hideSpeed'] : showSpeed;
	
	var showCallback;
	var hideCallback;
	var showPrepare;
	var hidePrepare;
	if (Array.isArray(args['show'])) {
		showPrepare = args['show'][0] != null ? args['show'][0] : null;
		showCallback = args['show'][1] != null ? args['show'][1] : null;
	} else {
		showCallback = args['show'] != null ? args['show'] : null;
	}
	
	if (Array.isArray(args['hide'])) {
		hidePrepare = args['hide'][0] != null ? args['hide'][0] : null;
		hideCallback = args['hide'][1] != null ? args['hide'][1] : null;
	} else {
		hideCallback = args['hide'] != null ? args['hide'] : null;
	}
	
	return this.each(function() {
		var elem = $(this);
		var latestYOffest = 0;
		var latestHeight = window.innerHeight;
		var ticking = false;
		
		elem.hide();
		var isHiding = false;
		$(window).on('scroll', function () {
			ticking = false
			latestYOffest = window.pageYOffset;
			latestHeight = window.innerHeight;
			requestTick();
		});		
		function update() {
			var detectAt = args['offset'] != null ? args['offset'] : latestHeight / 2;
			if (isInView(parent, latestYOffest, latestHeight, detectAt, -detectAt)) {
				if (elem.is(':hidden')) {
					if (showPrepare != null && typeof(showPrepare) === 'function') { showPrepare() };
					$(elem).show(effect, showEffectArgs, showSpeed, function() {
						if (showCallback != null && typeof(showCallback) === 'function') { showCallback() };
					});
				}
			} else {
				if (!elem.is(':hidden') && !isHiding) {
					isHiding = true;
					if (hidePrepare != null && typeof(hidePrepare) === 'function') { hidePrepare() };
					$(elem).hide(effect, hideEffectArgs, hideSpeed, function() {
						isHiding = false;
						if (hideCallback != null && typeof(hideCallback) === 'function') { hideCallback() };
					});
				}
			}
		}		
		function requestTick() {
			if (!ticking) { requestAnimationFrame(update); }
			ticking = true;
		}
		
	});
}

function isInView(elem, windowOffset, windowHeight, offsetTop, offsetBot, container) {
	var elemTop = elem.offset().top;
	elemTop += offsetTop != null ? offsetTop : 0;
	
	var elemBot = elem.offset().top + elem.innerHeight();
	elemBot += offsetBot != null ? offsetBot : 0;
	
	windowOffset = windowOffset != null ? windowOffset : window.pageYOffset;
	windowHeight = windowHeight != null ? windowHeight : window.innerHeight;
	
	var windowBottom = container != null ? $(container).offset().top + $(container).innerHeight() : windowOffset + windowHeight;
	
	return windowOffset < elemBot && windowBottom > elemTop;
}