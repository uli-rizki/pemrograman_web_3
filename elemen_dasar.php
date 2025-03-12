<?php
/**
 * Membuat kelas
 * membuat property
 * membuat method
 */

 class Mahasiswa {
    public $nim;
    public $nama_lengkap;
    public $jenis_kelamin;
    private $ipk;

    /**
     * Method (function)
     */
    public function tampil()
    {
        echo $this->nim." ".$this->nama_lengkap;
    }

    /**
     * function menggunakan parameter
     */
    public function setIpk($nilai)
    {
        return $this->ipk = $nilai;
    }

    public function getIpk()
    {
        echo "IPK anda : ".$this->ipk."<br>";
    }

 }

 /**
  * Menggunakan class(object) mahasiswa
  */
$mahasiswa = new Mahasiswa;
$mahasiswa->nim = "20200101";
$mahasiswa->nama_lengkap = "Uli Rizki";
$mahasiswa->setIpk(3.0);
$mahasiswa->tampil();
$mahasiswa->getIpk();

/**
 * Mmebuat object baru
 */
$mahasiswa_1 = new Mahasiswa;
$mahasiswa_1->nim = "20200202";
$mahasiswa_1->nama_lengkap = "Alan";
$mahasiswa_1->tampil();

/**
 * Class menggunakan parameter
 */
class SendMail {
    private $email;
    private $subject;

    /**
     * function __construct untuk mengambil data parameter
     */
    public function __construct($email, $subject)
    {
        $this->email = $email;
        $this->subject = $subject;
    }

    public function send()
    {
        echo "<br>Email terkirim ke : ".$this->email;
    }

    public function resend()
    {
        echo "<br>Email terkirim ke : ".$this->email;
    }

}

$kirim_email = new SendMail('uli@gmail.com',"Test Mail");
$kirim_email->send();