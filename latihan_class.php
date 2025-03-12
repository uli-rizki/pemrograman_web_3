<?php

/**
 * sebuah aplikasi mencatat data mahasiswa, prodi, matakuliah
 * masing-masing data tersebut bisa melakukan crud
 * data mahasiswa : id, nama_lengkap, kelas,
 * data prodi : id, nama_prodi, fakutlas
 * data matakuliah : id, kode_mk, dan nama_mk
 * 
 * Buatlah object dari kasus diatas
 */

class Mahasiswa {
    public $nim;
    public $nama_lengkap;
    public $kelas;

    public function tampil()
    {
        echo "menampilkan mahasiswa";
    }

    public function tambah()
    {
        echo "tambah mahasiswa";
    }

    public function edit()
    {
        echo "edit mahasiswa";
    }

    public function hapus()
    {
        echo "hapus mahasiswa";
    }
}

class Prodi {
    public $id;
    public $nama_prodi;
    public $fakultas;

    public function tampil()
    {
        echo "menampilkan mahasiswa";
    }

    public function tambah()
    {
        echo "menampilkan mahasiswa";
    }

    public function edit()
    {
        echo "menampilkan mahasiswa";
    }

    public function hapus()
    {
        echo "menampilkan mahasiswa";
    }
}