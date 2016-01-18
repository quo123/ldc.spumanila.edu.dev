<?php
date_default_timezone_set('Asia/Manila');
require_once 'includes/MySessions.php'; //DBObject included
require_once 'includes/util.php';
//require_once 'includes/functions.php';
$session = new MySessions('__ldc');
$cooking = $session->init();

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<!--<base href="http://ldc.spumanila.edu.dev" />-->	
	<title>Language Development Center</title>
	<link rel="stylesheet" href="/css/jquery-ui.min.css">
	<link rel="stylesheet" href="/css/main.css">
	<script src="/script/jquery-1.12.0.min.js"></script>
	<script src="/script/jquery-ui.min.js"></script>
	<script src="/script/main.js"></script>
</head>

<body class="cdc">
	<header class="noselect">
		<nav>
			<div class="constrain">

			</div>
		</nav>
	</header>
	
	<div id="body">
		<div class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-front ui-dialog-buttons sample-div-dialog">
			<div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
				<span class="ui-dialog-title">Dialog Title</span>
				<button title="Close" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only ui-dialog-titlebar-close" type="button">
					<span class="ui-button-icon-primary ui-icon ui-icon-closethick"></span>
					<span class="ui-button-text">Close</span>
				</button>
			</div>
			<fieldset>
				<legend>Sample Buttons</legend>
				<div class="sample-flex-container ui-dialog-content ui-widget-content" id="buttonset">					
				<?php
				for ($i = 0; $i < 10; $i++) {
				?>
					<input type="checkbox" id="button<?=$i?>" value="Sample Button"/><label for="button<?=$i?>"><?=$i%3 == 0 ? 'Long Label Sample' : 'Choice'?> <?=$i?></label>
				<?php
				}
				?>
				</div>
			</fieldset>
			<div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
				<div class="ui-dialog-buttonset">
					<button role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" type="button"><span class="ui-button-text">Ok</span></button>
					<button role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" type="button"><span class="ui-button-text">Cancel</span></button>
				</div>
			</div>
		</div>
		<div id="container" class="constrain<?php echo $cooking ? '' : ' splash'; ?>">
			
		</div>
	</div>
	
	<div id="footer">
		
	</div>	
<script>
$(function() {
	$('#buttonset').buttonset();
	$('#buttonset .ui-button').addClass('sample-button').removeClass('ui-corner-left').removeClass('ui-corner-right');
})
</script>
</body>

</html>