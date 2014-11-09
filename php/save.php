<?php require_once 'common.php';

$id = substr($_POST['pageSelect'], -1);
$page = new Page();
$page->save($id, $_POST['text']);
$page->close();

?>