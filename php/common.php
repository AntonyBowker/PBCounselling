<?php

function __autoload($classname) {
	$classname = strtolower($classname);
	include $classname.".php";
}

?>