<?php
chdir('..');
date_default_timezone_set('Asia/Manila');
require_once 'includes/MySessions.php'; //DBObject included
require_once 'includes/Crypto.php';
require_once 'includes/constants.php';

if (!empty($_POST['username']) && !empty($_POST['userpass'])) {
	$json = [];
	$db = new DBObject(CURRENT_DB);
//	$username = $db->escape($_POST['username']);
	$username = $_POST['username'];
	
//	$sql = "SELECT * FROM userinfo WHERE userpass = '$hashpass' AND username = '$username'";
	$sql = "SELECT * FROM userinfo WHERE username = ?";
	$time = rand(1000*1000, 1000*500);
	usleep($time);
	
	$query = $db->prepare($sql);
	$query->bind_param('s', $username);
	
	$json['status'] = 1;
	$json['response'] = 'Invalid username/password!';
	foreach ($db->execute($query) as $row) {
		if ($db->getNumrows() > 1) {
			$json['status'] = 3;
			$json['response'] = 'Duplicate username detected! Please clean the database.';
			die(json_encode($json));
		}
		
		if ($row['status']) {
			$timestamp = Crypto::create_timestamp($row['regdate']);
			$hashpass = Crypto::encrypt_password($_POST['userpass'], $timestamp[0]);
			error_log($hashpass);
			error_log($row['userpass']);
			if ($hashpass === $row['userpass']) {
				$json['status'] = 0;
				$json['response'] = "Welcome back, {$row['username']}!";
			}
		} else {
			$json['status'] = 2;
			$json['response'] = 'This account has not yet been activated!';
		}
	}
	die(json_encode($json));
	
	
//	if (($result = $db->query($sql)) && (mysqli_num_rows($result) > 0)) {
//		$row = mysqli_fetch_assoc($result);
//		if ($row['status']) {
//			init_session();
//			init_my_cookie();
//			$_SESSION['userid'] = $row['userid'];
//			$_SESSION['username'] = $row['username'];
//			$_SESSION['status'] = $row['status'];
//			$_SESSION['admin'] = $row['admin'];
//			extend_timeout();
//			
//			$json['status'] = 0;
//			$json['response'] = "Welcome back, {$row['username']}!";
//		} else {
//			$json['status'] = 2;
//			$json['response'] = 'This account has not yet been activated.';
//		}
//	} else {
//		$json['status'] = 1;
//		$json['response'] = 'Invalid username/password.';
//	}
}