<?php
ini_set('display_errors', 1);
ini_set('display_startup_error', 1);
error_reporting(E_ALL);

require_once "../app/controllers/MahasiswaController.php";

$controller = new MahasiswaController();
$controller->index();