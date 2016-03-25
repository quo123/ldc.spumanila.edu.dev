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
	$sql = "SELECT * FROM userinfo WHERE username = ?username:s";
	$time = rand(1000*1000, 1000*500);
	usleep($time);
	
//	$query = $db->prepare($sql);
//	error_log('query from login: ' . print_r($query, true));
//	$query->bind_param('s', $username);
	$db->prepare($sql);
	$db->bind(array(
		"username" => $username
	));
	
	$json['status'] = 1;
	$json['response'] = 'Invalid username/password!';
	foreach ($db->execute() as $row) {
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
}