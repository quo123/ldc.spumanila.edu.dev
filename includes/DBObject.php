<?php
/**
 *  DB Object wrapper class made to simplify query code
 *  Copyright 2014-2016 Alvin R. Betoya
 *  Released under the MIT license (https://tldrlegal.com/license/mit-license)
 *	version 0.5.2
 * 
 *	changelog:
 *	0.5.2	- refactored code; only one prepare and execute method is exposed
 *	0.5.1	- allowed named binding
 *	0.5.0	- added support for prepared statements
 *	0.4.4	- added variable timezone
 *	0.4.3	- initialized error
 *	0.4.2	- added affected rows
 *	0.4.1	- added error reporting
 *	0.4.0	- migrated to mysqli
 *	0.3.2	- added last insert id method
 *	0.3.1	- fixed bug on nonstandard character queries
 *
 *	==Usage instructions==
 *	General:
 *	Php symbol "->" is equivalent to java/.net ".".
 *		Ex:	PHP		- Object->method("args");
 *			Java	- Object.method("args");
 *
 *	Create a new DB connection using:
 *		$db = new DBObject("database_name"); OR
 *		$db = new DBObject("database_name", "host_name"); OR
 *		$db = new DBObject("database_name", "host_name", "user_name"); OR
 *		$db = new DBObject("database_name", "host_name", "user_name", "password");
 *
 *	IMPORTANT! USE escape() FUNCTION FOR NON-HASHED QUERY VARS AND PRE_HASHED PASSWORD:
 *		$usern = $db->escape($_POST["username"]); //escape to protect against SQL injection attacks
 *		$sql = "SELECT * FROM usertable WHERE username = '$usern' AND userpass = '$encpass'";
 *		$sql = "INSERT INTO usertable VALUES ('$usern', '$encpass')";
 *
 *	IMPORTANT! USE intval() when using ints in query:
 *		$id = intval($id);
 *		$sql = "SELECT * FROM usertable WHERE userid = $id";
 *
 *	SELECT statements:
 *		$sql = "SELECT ...";
 *		$result = $db->query($sql);
 *		if ($row = mysqli_fetch_array($result)) {
 *			//TODO: code that operates on query results [$row]
 *		} else {
 *			//TODO: code that runs if $row is empty
 *		}
 *			OR
 *		while ($row = mysqli_fetch_array($result)) {
 *			//TODO: code that operates on query results [$row]
 *		}
 *
 *	INSERT and DELETE statements:
 *		$sql = "INSERT ...";
 *		if ($db->query($sql)) {
 *			//TODO: code for successful update
 *		} else {
 *			//TODO: code for failed update
 *		}
 * 
 *	Prepared statements:
 *	
 */
class DBObject {
	private $database;
	private $host;
	private $dbuser;
	private $dbpass;
	/**
	 * The private mysqli connection object.
	 * @var mysqli 
	 */
	private $con;
	private $lastid;
	private $error = '';
	private $errno = 0; //1062 for duplicate entry on unique key //added v0.5.0
	private $affected;
	private $numrows; //added v0.5.0
	private $timezone = 'Asia/Manila'; // added v0.4.4

	/**
	 * The prepared statement.
	 * @since 0.5.1
	 * @var mysqli_stmt 
	 */
	private $statement;
	private $paramnames;
	private $paramtypes;
	private $paramvals;
	
	/**
	 * Set to true if using named parameters.
	 * @since 0.5.2
	 * @var boolean 
	 */
	private $usenamed = false;
	
	/**
	 * Create a new DB connection.
	 * @param string $_database The database name.
	 * @param string $_host The host name/url.
	 * @param string $_dbuser The database user name.
	 * @param string $_dbpass The database password.
	 */
	public function __construct($_database, $_host = 'localhost', $_dbuser = 'root', $_dbpass = '') {
		$this->host = $_host;
		$this->dbuser = $_dbuser;
		$this->dbpass = $_dbpass;
		$this->database = $_database;
	}
	
	/**
	 * Escapes using mysqli_real_escape_string.
	 * @param string $var The string to escape
	 */
	public function escape($var) {
		$this->connect();
		mysqli_set_charset($this->con, 'utf8'); //added v0.3.1
		$escaped = mysqli_real_escape_string($this->con, $var);
		mysqli_close($this->con);
		return $escaped;
	}
	
	/**
	 * Simple query function. Stores the following: <br />
	 * last insert id<br />
	 * error(s)<br />
	 * number of affected and retrieved rows<br />
	 * @param string $sql SQL string
	 * @return mysqli_result Query result set
	 */
	public function query($sql) {
		$this->connect();
		mysqli_set_charset($this->con, 'utf8'); //added v0.3.1
		mysqli_select_db($this->con, $this->database);
		mysqli_query($this->con, "SET time_zone = '{$this->timezone}'");
		$result = mysqli_query($this->con, $sql);
		$this->lastid = mysqli_insert_id($this->con);
		$this->error = mysqli_error($this->con);
		$this->errno = mysqli_errno($this->con);
		$this->affected = mysqli_affected_rows($this->con);
		$this->numrows = mysqli_num_rows($this->con);
		mysqli_close($this->con);
		return $result;
	}
	
	/**
	 * Prepare a statement. Automatically detects if named parameters are used.
	 * @since 0.5.2
	 * @param string $sql The SQL to prepare. Named parameters are automcatically detected
	 * and are supported via the following format:
	 * <pre><b>?<PARAMETER_NAME>:<PARAMETER_TYPE></b></pre><br />
	 * Example:<br />
	 * <code>$db->prepare("SELECT * FROM example WHERE username = 'admin' AND password = ?username:s");</code><br /><br />
	 * <code>PARAMETER_TYPE</code> can be any of the following:
	 * <pre>
	 * s -> string
	 * i -> integer
	 * d -> decimal
	 * b -> blob
	 * </pre>
	 * @return boolean Returns <code>TRUE</code> on success, <code>FALSE</code> on error.
	 */
	public function prepare($sql) {
		$this->clearParams();
		$this->usenamed = false;
		
		$pattern = "/\?([A-Za-z_]+[\w]*):([idsb])/";
		if (preg_match_all($pattern, $sql, $matches, PREG_SET_ORDER)) {
			$sql = $this->prepareNamed($sql, $matches, $pattern);
			$this->usenamed = true;
		}
		
		try {
			$this->statement = $this->prepareBasic($sql);
			error_log('statement: ' . print_r($this->statement, true));
			return true;
		} catch (Exception $ex) {
			error_log($ex->getMessage() . ' ' . print_r($ex, true));
			return false;
		}
	}
		
	/**
	 * Bind parameters to prepared statement.
	 * @since 0.5.2
	 * @param array $params An associative array of parameters to bind.
	 * <p>For named paramenters, keys should coincide with the names of the parameters. Ex:</p>
	 * <code>$db->bind(array('username' => 'admin', 'password' => $password));</code>
	 * 
	 * <p>For unnamed parameters, the parameter array needs to be prefixed by an element containing the parameter types. Ex:</p>
	 * <code>$db->bind(array('ss', 'admin', $password));</code>
	 * 
	 * Named parameter binding just stores the parameters in the <code>DBObject</code> object.
	 * Actual binding happens only when the query is executed.
	 */
	public function bind($params) {
		if ($this->usenamed) {
			$this->bindNamed($params);
		} else {
			$this->bindBasic($params);
		}
	}
	
	/**
	 * Executes the previously prepared statement.
	 * @since 0.5.2
	 * @param boolean $close Closes the query if set to <code>TRUE</code>.
	 * Set to <code>FALSE</code> to allow further parameter binds on this prepared statement.
	 * @return mysqli_result Query result set
	 */
	public function execute($close = false) {
		if ($this->usenamed) {
			return $this->executeNamed($close);
		} else {
			return $this->executeBasic($this->statement, $close);
		}
	}
	
	/**
	 * Prepare a statement. To use named parameters, use <code>prepareNamed()</code> instead.
	 * @since 0.5.0
	 * @param string $sql The SQL string.
	 * @return mysqli_stmt The prepared statement
	 */
	private function prepareBasic($sql) {
		$this->connect();
		mysqli_set_charset($this->con, 'utf8');
		mysqli_select_db($this->con, $this->database);
		mysqli_query($this->con, "SET time_zone = '{$this->timezone}'");
		return mysqli_prepare($this->con, $sql);
	}
	
	/**
	 * Bind named parameters to prepared statement.
	 * @since 0.5.2
	 * @param array $params An associative array of parameters to bind.
	 * Keys should coincide with the names of the parameters.<br />
	 * This just stores the parameters in the <code>DBObject</code> object.
	 * Actual binding happens only when the query is executed.
	 */
	private function bindBasic($params) {
		$ref = new ReflectionClass('mysqli_stmt');
		$method = $ref->getMethod('bind_param');
		$method->invokeArgs($this->statement, $params);
		error_log('statement: ' . print_r($this->statement, true));
	}
	
	/**
	 * Executes a prepared statement. When using named parameters, use <code>executeQuery()</code> instead.
	 * @since 0.5.0
	 * @param mysqli_stmt $query The query to execute
	 * @param boolean $close Closes the query if set to <code>TRUE</code>.
	 * Set to <code>FALSE</code> to allow further parameter binds on this prepared statement.
	 * @return mysqli_result Query result set
	 */
	private function executeBasic(mysqli_stmt $query, $close = true) {
		$query->execute();
		$result = $query->get_result();
		$this->lastid = $query->insert_id;
		$this->error = $query->error;
		$this->errno = $query->errno;
		$this->affected = $query->affected_rows;
		$this->numrows = $query->num_rows;
		if ($close) {
			$query->close();
			mysqli_close($this->con);
		}
//		error_log('result: ' . print_r($this, true));
		return $result;
	}
	
	/**
	 * Prepare a statement with named parameters.
	 * @since 0.5.1
	 * @param string $sql The sql to prepare. Named parameters are supported via the following format:
	 * <pre><code>?<PARAMETER_NAME>:<PARAMETER_TYPE></code></pre>
	 * e.g. <code>SELECT * FROM example WHERE username = ?username:s</code><br /><br />
	 * <code>PARAMETER_TYPE</code> can be any of the following:<br />
	 * s -> string<br />
	 * i -> integer<br />
	 * d -> decimal<br />
	 * b -> blob<br />
	 */
	private function prepareNamed($sql, $matches, $pattern) {
//		$this->clearParams();
//		$pattern = "/\?([A-Za-z_]+[\w]*):([idsb])/";
//		preg_match_all($pattern, $sql, $matches, PREG_SET_ORDER);
		foreach ($matches as $val) {
			error_log($val[1]);
			$this->paramnames[] = $val[1];
			$this->paramtypes[] = $val[2];
		}
		$sql = preg_replace($pattern, '?', $sql);
		error_log('sql: ' . $sql);
		error_log('paramnames: ' . print_r($this->paramnames, true));
		error_log('paramtypes: ' . print_r($this->paramtypes, true));
		
		return $sql;
//		try {
//			$this->namedstmt = $this->prepareBasic($sql);
//			error_log('namedstmt: ' . print_r($this->namedstmt, true));
//			return true;
//		} catch (Exception $ex) {
//			return false;
//		}
	}
	
	/**
	 * Bind named parameters to prepared statement.
	 * @since 0.5.1
	 * @param array $params An associative array of parameters to bind.
	 * Keys should coincide with the names of the parameters.<br />
	 * This just stores the parameters in the <code>DBObject</code> object.
	 * Actual binding happens only when the query is executed.
	 */
	private function bindNamed($params) {
		foreach ($params as $key => $val) {
			$this->paramvals[$key] = $val;
		}
		error_log('paramvals: ' . print_r($this->paramvals, true));
	}
	
	/**
	 * Execute prepared statement with named parameters.
	 * @since 0.5.1
	 * @param boolean $close Closes the query if set to <code>TRUE</code>.
	 * Set to <code>FALSE</code> to allow further parameter binds on this prepared statement.
	 * @return mysqli_result Query result set.
	 */
	private function executeNamed($close = true) {
		$vals = array();
		$types = array(join('', $this->paramtypes));
		foreach ($this->paramnames as $name) {
			$vals[] = &$this->paramvals[$name];
		}
		
		$bindarray = array_merge($types, $vals);
		error_log('bindarray: ' . print_r($bindarray, true));
		$ref = new ReflectionClass('mysqli_stmt');
		$method = $ref->getMethod('bind_param');
		$method->invokeArgs($this->statement, $bindarray);
//		call_user_func_array('mysqli_stmt_bind_param', $bindarray);
		error_log('statement: ' . print_r($this->statement, true));
		return $this->executeBasic($this->statement, $close);
	}
	
	private function connect() {
		$this->con = mysqli_connect($this->host, $this->dbuser, $this->dbpass);
		if (mysqli_connect_errno()) {
			$this->error = 'Error: Cannot connect to database!';
			return false;
		}
		return true;
	}

	private function clearParams() {
		$this->paramnames = array();
		$this->paramtypes = array();
		$this->paramvals = array();
	}
	
	public function setDatabase($_database) {
		$this->database = $_database;
	}

	public function setHost($_host) {
		$this->host = $_host;
	}

	public function setUser($_dbuser) {
		$this->dbuser = $_dbuser;
	}

	public function setPassword($_dbpass) {
		$this->dbpass = $_dbpass;
	}

	public function getDatabse() {
		return $this->database;
	}

	public function getHost() {
		return $this->host;
	}

	public function getUser() {
		return $this->dbuser;
	}

	public function getPassword() {
		return $this->dbpass;
	}

	/** @since v0.3.2 */
	public function getLastID() {
		return $this->lastid;
	}
	
	/** @since v0.4.1 */
	public function getError() {
		return $this->error;
	}
	
	/** @since v0.4.2 */
	public function getAffected() {
		return $this->affected;
	}

	/** @since v0.4.4 */
	public function getTimezone() {
		return $this->timezone;
	}
	
	/** @since v0.4.4 */
	public function setTimezone($timezone) {
		$this->timezone = $timezone;
	}
	
	/** @since v0.5.0 */
	public function getErrno() {
		return $this->errno;
	}
	
	/**
	 * Shortcut for getErrno() == $errno.
	 * @since v0.5.2
	 */
	public function hasErrno($errno) {
		return $this->errno == $errno;
	}
	
	/** @since v0.5.0 */
	public function getNumrows() {
		return $this->numrows;
	}
}