<?php
require_once 'DBObject.php';

class MySessions {
	private $cookiename;
	private $cookieduration;
	private $cookieextend;
	
	private $initfailed = 'Error: Session has expired. Please log in again.';
	private $refreshfailed = 'Error: Could not connect to server. Please log in again if the error persists.';
	
	/**
	 * 
	 * @param string $cookiename The name of the cookie.
	 * @param int $cookieduration Cookie's lifetime in seconds.
	 * @param int $cookieextend Amount in seconds the cookie's lifetime will be extended on refresh.
	 */
	public function __construct($cookiename = '__cookie', $cookieduration = 3600, $cookieextend = 1800) {
		$this->cookiename = $cookiename;
		$this->cookieduration = $cookieduration;
		$this->cookieextend = $cookieextend;
	}
	
	public function init() {
		if (ini_set('session.use_cookies', '0') && ini_set('session.use_only_cookies', '0')) {
			if (isset($_COOKIE[$this->cookiename])) {
				session_id($_COOKIE[$this->cookiename]);
				session_start();
				return true;
			} else {
				session_start();
				return false;
			}
		} else {
			return false;
		}
	}
		
	public function cook() {
		return setcookie($this->cookiename, session_id(), time()+$this->cookieduration, '/');
	}

	public function kill() {
		return setcookie($this->cookiename, session_id(), time()-3600, '/');
	}

	public function extend() {
		$_SESSION['timeout'] = time()+$this->cookieextend;
		return $_SESSION['timeout'];
	}

	public function refresh(DBObject $db, $table = 'userinfo', $fields = ['userid'], $status = 'status') {
		$sql = "SELECT * FROM $table WHERE {$fields[0]} = {$_SESSION[$fields[0]]}";

		if (($result = $db->query($sql)) && (mysqli_num_rows($result) > 0)) {
			$row = mysqli_fetch_assoc($result);
			if ($row[$status] == 0) {
				return false;
			}
			foreach ($fields as $field) {
				$_SESSION[$field] = $row[$field];
			}
			return true;
		} else {
//			echo $db->getError();
			error_log($db->getError());
			return false;
		}
	}
	
	public function check() {
		$this->init() or die($this->initfailed);
		$this->cook();
		$this->refresh() or die($this->refreshfailed);
		$this->extend();
	}
	
	public function create($row, $fields = ['userid']) {
		$this->init();
		$this->cook();
		foreach ($row as $key => $value) {
			if (in_array($key, $fields)) {
				$_SESSION[$key] = $value;
			}
		}
		$this->extend();
	}
	
	/**
	* Use this if login is required to view page
	* @param string $to - Set page to jump to after login.
	*/
   public function login_redirect($to = '/') {
	   if (!isset($_COOKIE[$this->cookiename])) {
		   //redirect to "must log in" page
		   header("location: $to");
		   return false;
	   } else {
		   $this->init();
		   if (!isset($_SESSION['timeout']) or $_SESSION['timeout']-time() <= 0) {
			   //redirect to "must log in" page
			   header("location: $to");
			   return false;
		   } else {
//			   $this->init();
			   $this->extend();
			   return true;
		   }
	   }
   }
	
	function getCookiename() {
		return $this->cookiename;
	}

	function getCookieduration() {
		return $this->cookieduration;
	}

	function getCookieextend() {
		return $this->cookieextend;
	}

	function getInitfailed() {
		return $this->initfailed;
	}

	function getRefreshfailed() {
		return $this->refreshfailed;
	}

	function setCookiename($cookiename) {
		$this->cookiename = $cookiename;
	}

	function setCookieduration($cookieduration) {
		$this->cookieduration = $cookieduration;
	}

	function setCookieextend($cookieextend) {
		$this->cookieextend = $cookieextend;
	}

	function setInitfailed($initfailed) {
		$this->initfailed = $initfailed;
	}

	function setRefreshfailed($refreshfailed) {
		$this->refreshfailed = $refreshfailed;
	}


}
