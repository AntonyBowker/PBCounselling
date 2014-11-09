<?php require_once "common.php";

class Page {
	private $dbh;

	public function __construct(){
		$this->dbh = new Connection();
		try {
			$this->dbh = $this->dbh->connect();
			$this->dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		} catch(PDOException $e) {
			$errmsg = $e->getMessage();
			die("Database error: $errmsg");
		} 
	}

	public function load($id){
		$st = $this->dbh->prepare("SELECT text FROM pages WHERE id = ?");
		$st->bindParam(1, $id);
		$st->execute();
		$r = $st->fetch();
		$this->text = $r['text'];
	}

	public function save($id, $text){
		$st = $this->dbh->prepare("UPDATE pages SET text = :text WHERE id = :id");
		$st->execute(array(
			':text' => $text,
			':id'   => $id
		));

	}

	public function close(){
		$this->dbh = null;
	}
}

?>