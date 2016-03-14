$(function() {
	$('header.parallax').parallax(0.2);
	$('div.parallax').parallax(0.2);
	
	$('.splash-page header').windowHeight();
	$('.splash-page header .overlay').windowHeight();
	$('#layout-exam').windowHeight();
	$('#layout-login').windowHeight();
		
	$('#button-nav-login').on('click', function() {
		$('#layout-login').insertAfter('#main-header').scrollView();
	});
	
	$('#button-nav-takeexam').on('click', function() {
		$('#layout-exam').insertAfter('#main-header').scrollView();
	});
	
	$('#login-box').scrollShowHide('#layout-login', {
		effect: 'drop',
		showOpts: { direction: 'right' },
		showSpeed: 300,
		show: function () {
			console.log('login visible');
			$('#login-box input').prop("disabled", false);
		},
		hide: [
			function () {
				console.log('preparing to hide login');
//				document.activeElement.blur();
				$('#login-box input').prop("disabled", true);
			},
			function () {
				$('#login-response').hide();
				console.log('login hidden');
			}
		],
		offset: window.innerHeight / 1.75
	});
	
	$('#exam-box').scrollShowHide('#layout-exam', {
		effect: 'drop',
		showOpts: { direction: 'left' },
		showSpeed: 300,
		show: function () {
			console.log('exam visible');
		},
		hide: function () {
			console.log('exam hidden');
		}, 
		offset: window.innerHeight / 1.75
	});
	
	
	
	var loginSubmitting = false;
	$('#login-form').on('submit', function(e) {
		e.preventDefault();
		if (loginSubmitting) { return false; }
		var loginbutton = $('#login-submit');
		var fd = $(this).serialize();
		
		loginSubmitting = true;
		var response = $('#login-response');
		var originalVal = $(loginbutton).val();
		$(loginbutton).val('').addClass('button-loading');
		
		$.post(phpLogin, fd).done(function(data) {
			var result = JSON.parse(data);
			loginSubmitting = false;			
			$(loginbutton).val(originalVal).removeClass('button-loading');
			
			response.text(result.response);
			if (result.status > 0) {
				response.addClass('redtext');
			} else {
				response.removeClass('redtext');
			}
			if (response.is(':hidden')) {
				response.show(250);
			}
			console.log(result);
		});
	});
	
	$('#register-switch').on('click', function() {
		$('#login-form').hide('drop', {direction: 'down'}, 300, function() {
			$('#login-form input').not('[type=submit]').val('');
			$('#login-response').hide();
			$('#register-form').show('drop', {direction: 'down'}, 300);
		})
	});
	
	var registerSubmitting = false;
	$('#register-form').on('submit', function(e) {
		e.preventDefault();
		if (registerSubmitting) { return false; }
		var registerbutton = $('#register-submit');
		var fd = $(this).serialize();
		
		registerSubmitting = true;
		var response = $('#register-response');
		var originalVal = $(registerbutton).val();
		$(registerbutton).val('').addClass('button-loading');
		
		$.post(phpRegister, fd).done(function(data) {
			var result = JSON.parse(data);
			registerSubmitting = false;
			$(registerbutton).val(originalVal).removeClass('button-loading');
			
			response.text(result.response);
			if (result.status > 0) {
				response.addClass('redtext');
			} else {
				response.removeClass('redtext');
			}
			if (response.is(':hidden')) {
				response.show(250);
			}
			console.log(result);
		});
	});
	
	$('#login-switch').on('click', function() {
		$('#register-form').hide('drop', {direction: 'down'}, 300, function() {
			$('#register-form input').not('[type=submit]').val('');
			$('#register-response').hide();
			$('#login-form').show('drop', {direction: 'down'}, 300);
		})
	});
});

var phpLogin = "/ajax/login.php";
var phpRegister = "/ajax/register.php";