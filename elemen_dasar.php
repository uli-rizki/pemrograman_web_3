<?php
ini_set('display_errors', 1);
ini_set('display_startup_error', 1);
error_reporting(E_ALL);

class Mahasiswa {
    // property / deklarasi variabel
    public $nim;
    public $nama_depan;
    public $nama_belakang;

    // method
    // function dengan mengembalikan nilai
    public function nama_lengkap()
    {
        $hasil = $this->nama_depan." ".$this->nama_belakang;

        return $hasil;
    }

    // function tanpa megembalikan nilai
    public function tampil_nama_lengkap()
    {
        echo $this->nama_depan." ".$this->nama_belakang;
    }
}

// Object 1
$mahasiswa = new Mahasiswa;
$mahasiswa->nama_depan = "Uli";
$mahasiswa->nama_belakang = "Rizki";

echo $mahasiswa->nama_lengkap()."<br>";
$mahasiswa->tampil_nama_lengkap();

// Object 2
$mahasiswa_1 = new Mahasiswa;
$mahasiswa_1->nama_depan = "Andi";
$mahasiswa_1->nama_belakang = "Sunyoto";

echo "<br>";
$mahasiswa_1->tampil_nama_lengkap();