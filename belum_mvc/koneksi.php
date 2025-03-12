<?php

$server = "localhost";
$username = "uli"; // default root
$password = "@HomeData123"; // default kosong
$nama_db = "oop_php";

$koneksi = new mysqli($server, $username, $password, $nama_db);

if($koneksi->connect_errno) {
    die("Error Koneksi".$koneksi->connect_error);
}
