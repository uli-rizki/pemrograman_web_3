<?php

class Mahasiswa {
    public $nim;
    public $nama_lengkap;
    public $jenis_kelamin;
    public $db;

    public function __construct()
    {
        include 'koneksi.php';
        $this->db = $koneksi;
    }

    public function tampil()
    {
        $query = "SELECT * FROM mahasiswa";
        $hasil = $db->query($query);
        $db->close();

        return $hasil;
    }

    public function simpan($data)
    {
        $this->nim = isset($_POST['nim']) ? $_POST['nim'] : "";
        $this->nama_lengkap = isset($_POST['nama_lengkap']) ? $_POST['nama_lengkap'] : "";
        $this->jenis_kelamin = isset($_POST['jenis_kelamin']) ? $_POST['jenis_kelamin'] : "";

        $query = "INSERT INTO mahasiswa (nim, nama_lengkap, jenis_kelamin)
                VALUES ('".$this->nim."', '".$this->nama_lengkap."', '".$this->jenis_kelamin."')";

        $hasil = $this->db->query($query);
        $this->db->close();

        return $hasil;
    }
}