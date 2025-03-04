<?php
/**
 * Hierarki kendaraan
 * Kendaraan merupakan object secara umum
 * Object yang termasuk dalam kendaraan misalnya : motor, mobil, kereta, sepeda, dll
 */

class Kendaraan {
    public $merk;
    public $warna;

    public function info() {
        return "Kendaraan merk $this->merk berwarna $this->warna.";
    }
}

class Mobil extends Kendaraan {
    public $jumlahPintu;
}

$mobil = new Mobil();
$mobil->merk = "Toyota";
$mobil->warna = "Merah";
echo $mobil->info();