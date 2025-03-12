<html>
    <head>
        <title>Tambah Mahasiswa</title>
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
                <?php foreach($data_mahasiswa as $mahasiswa) { ?>
                    <tr>
                        <td><?php echo $mahasiswa['nim']; ?></td>
                        <td><?php echo $mahasiswa['nama_lengkap']; ?></td>
                        <td><?php echo $mahasiswa['jenis_kelamin']; ?></td>
                        <td>
                            <a href="mahasiswa_edit.php?id_mahasiswa=<?php echo $mahasiswa['id_mahasiswa']; ?>">Edit</a>
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </body>
</html>