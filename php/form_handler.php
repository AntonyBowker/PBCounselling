<?php require_once "common.php";
	$id = substr($_POST['pageSelect'], -1);
if ($_POST['submit'] == "load") {
	$page = new Page();
	$page->load($id);
	echo $page->text;
} else if ($_POST['submit'] == "save") {
	$page = new Page();
	$page->save($id, $_POST['text']);
	$page->load($id);
} else {
	die("Form issues... please reset page.");
}
	
?>