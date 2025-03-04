<?php
require('koneksi.php');

# query untuk mengambil semua data dari tabel mahasiswa
$qry = "SELECT * FROM mahasiswa";
# eksekusi query
$hasil = $koneksi->query($qry);
# tutup koneksi database
$koneksi->close();

?>

<html>
    <head>
        <title>Data Mahasiswa</title>
    </head>
    <body>
        <h2>Data Mahasiswa</h2>
        <a href="mahasiswa_tambah.php">Tambah Data</a>
        <table border="1">
            <thead>
                <tr>
                    <th>NIM</th>
                    <th>Nama Lengkap</th>
                    <th>Jenis Kelamin</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody>
                <?php while($row = mysqli_fetch_array($hasil)){ ?>
                    <tr>
                        <td><?php echo $row['nim']; ?></td>
                        <td><?php echo $row['nama_lengkap']; ?></td>
                        <td><?php echo $row['jenis_kelamin']; ?></td>
                        <td>
                            <a href="mahasiswa_edit.php?id_mahasiswa=<?php echo $row['id_mahasiswa']; ?>">Edit</a>
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </body>
</html>