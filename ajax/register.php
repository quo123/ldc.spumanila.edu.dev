<?php
chdir('..');
date_default_timezone_set('Asia/Manila');
require_once 'includes/MySessions.php'; //DBObject included
require_once 'includes/Crypto.php';
require_once 'includes/constants.php';

if (!empty($_POST['username']) && !empty($_POST['userpass']) && !empty($_POST['userpass2'])) {
	$json = [];
	if ($_POST['userpass'] !== $_POST['userpass2']) {
		$json['status'] = 2;
		$json['response'] = "Passwords do not match!";
		die(json_encode($json));
	}
	
	$db = new DBObject(CURRENT_DB);
	
	$username = $db->escape($_POST['username']);
	$timestamp = Crypto::get_timestamp();
	$encpass = Crypto::encrypt_password($_POST['userpass'], $timestamp[0]);
	$regdate = Crypto::create_microdate($timestamp);
	
//	$sql = "INSERT INTO userinfo(username, userpass, regdate) VALUES(?, ?, ?)";
	$sql = "INSERT INTO userinfo(username, userpass, regdate) VALUES(?username:s, ?userpass:s, ?regdate:s)";
	sleep(1);
	
//	$query = $db->prepare($sql);
//	$query->bind_param('sss', $username, $encpass, $regdate);
//	$db->execute($query);
	
	$db->prepare($sql);
	$db->bind(array(
		"username" => $username,
		"userpass" => $encpass,
		"regdate" => $regdate
	));
	$db->execute();
	
	if($db->hasErrno(0)) {
		$json['status'] = 0;
		$json['response'] = 'Registration successful!';
//	} else if ($db->getErrno() == 1062) {
	} else if ($db->hasErrno(1062)) {
		$json['status'] = 1;
		$json['response'] = 'Username already exists in the database!';
	} else {
		$json['status'] = 3;
		$json['response'] = $db->getError();		
	}
	die(json_encode($json));
}