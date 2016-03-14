<?php
date_default_timezone_set('Asia/Manila');
require_once 'includes/constants.php';
require_once 'includes/MySessions.php'; //DBObject included
require_once 'includes/util.php';
require_once 'includes/common.php';

$session = new MySessions(COOKIE_NAME);
$cooking = $session->init();

$backgroundurl = getBackgroundImage(mt_rand(1, 5));
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Language Development Center</title>
	<!--<link href="https://fonts.googleapis.com/css?family=Quicksand:400,700|Open+Sans:400,700,400italic,700italic" rel="stylesheet" type="text/css">-->
	<style type="text/css">
		#main-header {
			background: url(<?=$backgroundurl ?>) no-repeat;
			background-position: center top;
			background-attachment: fixed;
			background-size: cover;
		}
	</style>
	
	<link href="/css/jquery-ui.min.css" rel="stylesheet" type="text/css">
	<link href="/css/fonts.css" rel="stylesheet" type="text/css">
	<link href="/css/util.css" rel="stylesheet" type="text/css">
	<link href="/css/flex.css" rel="stylesheet" type="text/css">
	<link href="/css/main.css" rel="stylesheet" type="text/css">
	<link href="/css/splash.css" rel="stylesheet" type="text/css">
	
	<script src="/script/jquery-1.12.0.min.js"></script>
	<script src="/script/jquery-ui.min.js"></script>
	<script src="/script/util.js"></script>
	<script src="/script/splash.js"></script>
	<script src="/script/main.js"></script>
</head>

<body class="splash-page">
	<header class="flexbox-vertical parallax" id="main-header">
		<div class="layout-svg-container svg-black">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 612 32">
				<polygon points="0 0 612 0 0 32" />
			</svg>
		</div>
		<div class="overlay"></div>
		<div class="site-logo-text noselect flexbox-vertical">
			<h1><a href="/" tabindex="-1">Language Development Center</a></h1>
			<h2>St. Paul University Manila</h2>
			<div class="header-buttons-container">
				<button id="button-nav-login" tabindex="-1" class="nofocus">Log In</button>
				<button id="button-nav-takeexam" tabindex="-1" class="nofocus">Take Exam</button>
			</div>
		</div>
		<div class="layout-svg-container svg-black">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 612 32">
				<polygon points="612 32 0 32 612 0" />
			</svg>
		</div>
	</header>
	<div class="layout-body flexbox-vertical parallax" id="layout-login">
		<div class="layout-svg-container svg-black">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 612 32">
				<polygon points="0 0 612 0 0 32" />
			</svg>
		</div>
		<div class="flex-filler"></div>
		<div class="box-fadein header-formbox" id="login-box">
			<form id="login-form" class="generic-form">
				<fieldset>
					<legend>Faculty Login</legend>
					<div class="flexbox-vertical fillheight">
						<input type="text" name="username" id="login-username" class="focusglow flexitem" placeholder="Username" autocomplete="off" maxlength="20" required=""/>
						<input type="password" name="userpass" id="login-userpass" class="focusglow flexitem" placeholder="Password" autocomplete="off" maxlength="20" required=""/>
						<span id="login-response" style="display:none">&nbsp;</span>
						<input type="submit" id="login-submit" value="Log In" tabindex="-1" class="nofocus flexitem"/>
						<div class="flex-filler"></div>
						<button type="button" id="register-switch" class="flexitem">Register</button>
					</div>
				</fieldset>
			</form>
			<form id="register-form" class="generic-form" style="display: none">
				<fieldset>
					<legend>Faculty Registration</legend>
					<div class="flexbox-vertical fillheight">
						<input type="text" name="username" id="register-username" class="focusglow flexitem" placeholder="Username" autocomplete="off" maxlength="20" required=""/>
						<input type="password" name="userpass" id="register-userpass" class="focusglow flexitem" placeholder="Password" autocomplete="off" maxlength="20" required=""/>
						<input type="password" name="userpass2" id="register-userpass2" class="focusglow flexitem" placeholder="Re-type password" autocomplete="off" maxlength="20" required=""/>
						<span id="register-response" style="display:none">&nbsp;</span>
						<input type="submit" id="register-submit" value="Register" tabindex="-1" class="nofocus flexitem"/>
						<div class="flex-filler"></div>
						<button type="button" id="login-switch" class="flexitem">Log In</button>
					</div>
				</fieldset>
			</form>
		</div>
		<div class="layout-svg-container svg-black">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 612 32">
				<polygon points="612 32 0 32 612 0" />
			</svg>
		</div>
	</div>
	<div class="layout-body flexbox-vertical parallax" id="layout-exam">
		<div class="layout-svg-container svg-black">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 612 32">
				<polygon points="0 0 612 0 0 32" />
			</svg>
		</div>
		<div class="flex-filler"></div>
		<div class="box-fadein header-formbox" id="exam-box">
			<form>
				<fieldset>
					<legend>Exam Registration</legend>
				</fieldset>
			</form>
		</div>
		<div class="layout-svg-container svg-black">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 612 32">
				<polygon points="612 32 0 32 612 0" />
			</svg>
		</div>
	</div>
</body>

</html>