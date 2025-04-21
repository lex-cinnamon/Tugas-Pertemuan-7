<?php
$koneksi = new mysqli("localhost", "root", "", "kuliah");

$query = "SELECT m.nama AS nama_mahasiswa, 
                 mk.nama AS matakuliah, 
                 mk.jumlah_sks
          FROM krs k
          JOIN mahasiswa m ON k.npm_mahasiswa = m.npm
          JOIN matakuliah mk ON k.kodemk_matakuliah = mk.kodemk";
$result = $koneksi->query($query);
?>

<!DOCTYPE html>
<html>
<head>
  <title>Data KRS Mahasiswa</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
  <div class="container">
    <h2>Data KRS Mahasiswa</h2>
    <a href="tambah.php" class="btn-tambah">+ Tambah Data KRS</a>
    
    <table>
      <tr>
        <th>No</th>
        <th>Nama Lengkap</th>
        <th>Mata Kuliah</th>
        <th>Keterangan</th>
      </tr>
      <?php 
      $no = 1;
      while ($row = $result->fetch_assoc()) {
        echo "<tr>
          <td>{$no}</td>
          <td>{$row['nama_mahasiswa']}</td>
          <td>{$row['matakuliah']}</td>
          <td class='keterangan'>
            <span>{$row['nama_mahasiswa']}</span> Mengambil Mata Kuliah 
            <span>{$row['matakuliah']}</span> ({$row['jumlah_sks']} SKS)
          </td>
        </tr>";
        $no++;
      }
      ?>
    </table>
  </div>
</body>
</html>
