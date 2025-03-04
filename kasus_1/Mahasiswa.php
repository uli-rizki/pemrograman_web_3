<?php

class Mahasiswa {
    public $nim;
    public $nama_lengkap;
    public $jenis_kelamin;

    public function simpan($data)
    {
        $nim = $_POST['nim'];
        $nama_lengkap = $_POST['nama_lengkap'];
        $jenis_kelamin = $_POST['jenis_kelamin'];

        echo $nim; exit;
    }
}