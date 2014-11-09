<?php require_once 'common.php';

$id = substr($_POST['pageSelect'], -1);
$page = new Page();
$page->load($id);
echo $page->text;
$page->close();

?>