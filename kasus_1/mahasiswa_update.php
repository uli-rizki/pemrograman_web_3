<?php
// panggil file koneksi
require('koneksi.php');

$id_mahasiswa = $_POST['id_mahasiswa'];
$nim = $_POST['nim'];
$nama_lengkap = $_POST['nama_lengkap'];
$jenis_kelamin = $_POST['jenis_kelamin'];

$qry = "UPDATE mahasiswa SET 
        nim='$nim', 
        nama_lengkap='$nama_lengkap',
        jenis_kelamin='$jenis_kelamin'
        WHERE id_mahasiswa=$id_mahasiswa";

$hasil = $koneksi->query($qry);
$koneksi->close();

if($hasil) {
    header("Location: mahasiswa_tampil.php");
} else {
    echo "Gagal mengedit data";
}
?>