<?php
ini_set('display_errors', 1);
ini_set('display_startup_error', 1);
error_reporting(E_ALL);

class AkunBank {
    /**
     * private property
     */
    public $nama_bank;
    private $saldo = 0;

    public function setSaldo($jumlah) {
        if ($jumlah >= 0) {
            $this->saldo = $jumlah;
        }
    }

    public function getSaldo() {
        return $this->saldo;
    }

    private function debet($jumlah) {
        return $this->saldo - $jumlah;
    }

    /**
     * private function
     */
}

$akun = new AkunBank();
$akun->saldo = 10000;
$akun->setSaldo(1000000);
echo $akun->getSaldo(); // Output: 1000000
echo "<br>";