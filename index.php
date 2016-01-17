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
		<div id="container" class="constrain<?php echo $cooking ? '' : ' splash'; ?>">
			
		</div>
	</div>
	
	<div id="footer">
		
	</div>	
</body>


</html>