<?php
require_once 'DBObject.php';

function getSettings() {
	$db = new DBObject('cdc');
	$sql = "SELECT schoolyear, semester FROM settings LIMIT 1";
	if ($res = $db->query($sql)) {
		$settings = mysqli_fetch_assoc($res);
		return array('year' => intval($settings['schoolyear']), 'sem' => intval($settings['semester']));
	} else {
		return false;
	}
}

function getBackgroundImage($i) {
	return "images/bg$i.jpg";	
}