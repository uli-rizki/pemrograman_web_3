<?php 
require("koneksi.php");

// ambil id mahasiswa dari parameter url
$id_mahasiswa = $_GET['id_mahasiswa'];

// query ambil data berdasarkan id
$qry = "SELECT * FROM mahasiswa WHERE id_mahasiswa=$id_mahasiswa";
// jalankan query 
$hasil = $koneksi->query($qry);
// ubah hasil query menjadi data array
$mahasiswa = mysqli_fetch_assoc($hasil);

$koneksi->close();

?>
<html>
    <head>
        <title>Edit Mahasiswa</title>
    </head>
    <body>
        <form method="POST" action="mahasiswa_update.php">
            <input type="hidden" name="id_mahasiswa" value="<?php echo $mahasiswa['id_mahasiswa']; ?>">
            <p>
                <label>NIM</label>
                <input type="text" name="nim" value="<?php echo $mahasiswa['nim']; ?>" required>
            </p>
            <p>
                <label>Nama Lengkap</label>
                <input type="text" name="nama_lengkap" value="<?php echo $mahasiswa['nama_lengkap']; ?>" required>
            </p>
            <p>
                <label>Jenis Kelamin</label>
                <select name="jenis_kelamin" required>
                    <option <?php echo $mahasiswa['jenis_kelamin'] == 'laki-laki' ? 'selected' : ''; ?> value="laki-laki">Laki-laki</option>
                    <option <?php echo $mahasiswa['jenis_kelamin'] == 'perempuan' ? 'selected' : ''; ?> value="perempuan">Perempuan</option>
                </select>
            </p>
            <button type="submit">Simpan</button>
        </form>
    </body>
</html>