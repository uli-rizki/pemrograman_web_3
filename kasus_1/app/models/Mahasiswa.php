<?php

class Mahasiswa {
    private $db;

    public function __construct()
    {
        $this->db = new PDO("mysql:host=localhost;dbname=oop_php", "uli", "@HomeData123");
    }

    public function list() {
        $mahasiswa = $this->db->query("SELECT * FROM mahasiswa");
        return $mahasiswa->fetchAll(PDO::FETCH_ASSOC);
    }

    public function save($data_mahassiwa) {
        $mahasiswa = $this->db->query("INSERT INTO mahasiswa");
    }

    public function delete()
    {
        $mahasiswa = $this->db->query("DELETE FROM mahasiswa");
    }
}