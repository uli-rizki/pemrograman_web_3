<?php

require_once "../app/models/Mahasiswa.php";

class MahasiswaController {

    public function index()
    {
        $mahasiswa = new Mahasiswa;
        $data_mahasiswa = $mahasiswa->list();

        require_once "../app/views/mahasiswa.php";
    }

    public function tambah()
    {
        require_once "../app/views/mahasiswa_tambah.php";
    }
}