<?php

class Connection {
	private
		$host = 'localhost',
		$name = 'pages',
		$user = 'root',
		$pass = '';

	public function connect(){
		return new PDO("mysql:host=$this->host; dbname=$this->name", $this->user, $this->pass);

		// echo "<pre";
		// print_r($statement->errorInfo());

	}
}


?>