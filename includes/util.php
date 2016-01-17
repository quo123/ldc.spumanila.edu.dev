<?php

function return_base() {
//	return '<base href="http://ldc.spumanila.edu.dev/" />';
//	$base = $_SERVER['HTTP_HOST'];
	$base = $_SERVER['SERVER_NAME'];
	return "<base href=\"http://$base\" />";
}

function echo_base() {
	echo return_base();
}

function url_return_space($url) {
	return rawurldecode(str_replace('_', '%20', $url));
}

function url_replace_space($url) {
	return str_replace(array('%2F', '%5C'), array('%252F', '%255C'), rawurlencode(str_replace(array(' ', '%20'), '_', $url)));
}

//replace html elements
function replace_html($dirtystring) {
	$ascii = array('&', '<', '>', '"', "'", '/', "\t", '+');
	$htmlc = array('&amp;','&lt;', '&gt;', '&quot;', '&#x27;', '&#x2F;', '&emsp;', '&plus;');
	
	return str_replace($ascii, $htmlc, $dirtystring);
}

/**
 * Full name creator.
 * @param string $fname First Name, eg: John
 * @param string $lname Last Name, eg: Doe
 * @param string $mname Middle Name, eg: Dela Cruz
 * @return string Format: John D.C. Doe
 */
function create_name($fname, $lname, $mname = null, $order = 'standard') {
	$mi = '';
	if ($mname !== null) {
		$temp = explode(' ', $mname);
		foreach ($temp as &$i) {
			if (!empty($i)) {
				$i = strtoupper(substr($i, 0, 1)).'.';
			}
		}
		unset($i);
		$mi = implode(' ', $temp);
	}
//	first letter only according to http://www.census.gov.ph/civilregistration/problems-and-solutions/compound-middle-names-dela-cruz-quintos-deles-villa-roman
//	$mi = substr(strtoupper($mname), 0, 1).'.';
	
	if ($order === 'standard') {
		return trim(replace_html("$fname $mi $lname"));
	} else {
		return trim(replace_html("$lname, $fname $mi"));
	}
}

function hexcolor_to_rgb($hexcolor) {
	$hexcolor = str_replace('#', '', $hexcolor);
	if (strlen($hexcolor) === 6) {
		$rgb = str_split($hexcolor, 2);
	} else if (strlen($hexcolor) === 3) {
		$rgb = str_split($hexcolor, 1);
	} else {
		return false;
	}
	
	foreach ($rgb as &$i) {
		$i = hexdec($i);
	}
	unset($i);
	
	return $rgb;
}
