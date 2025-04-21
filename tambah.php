<?php
$koneksi = new mysqli("localhost", "root", "", "kuliah");

// Ambil data matakuliah
$matakuliah = $koneksi->query("SELECT kodemk, nama FROM matakuliah");

// Proses simpan jika form disubmit
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $npm = $_POST['npm'];
  $nama = $_POST['nama'];
  $jurusan = $_POST['jurusan'];
  $alamat = $_POST['alamat'];
  $kodemk = $_POST['kodemk'];

  // Simpan ke tabel mahasiswa
  $simpan_mhs = "INSERT INTO mahasiswa (npm, nama, jurusan, alamat) VALUES ('$npm', '$nama', '$jurusan', '$alamat')";
  $koneksi->query($simpan_mhs);

  // Simpan ke tabel krs
  $simpan_krs = "INSERT INTO krs (npm_mahasiswa, kodemk_matakuliah) VALUES ('$npm', '$kodemk')";
  $koneksi->query($simpan_krs);

  echo "<script>alert('Data mahasiswa dan KRS berhasil ditambahkan'); window.location='datamahasiswa.php';</script>";
}
?>

<!DOCTYPE html>
<html>
<head>
  <title>Tambah Mahasiswa & KRS</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
  <h2 style="text-align:center;">Tambah Mahasiswa & KRS</h2>
  <form method="POST" action="">
    <label for="npm">NPM</label>
    <input type="text" name="npm" required>

    <label for="nama">Nama</label>
    <input type="text" name="nama" required>

    <label for="jurusan">Jurusan</label>
    <input type="text" name="jurusan" required>

    <label for="alamat">Alamat</label>
    <textarea name="alamat" required></textarea>

    <label for="kodemk">Pilih Mata Kuliah</label>
    <select name="kodemk" required>
      <option value="">-- Pilih Mata Kuliah --</option>
      <?php while ($mk = $matakuliah->fetch_assoc()) {
        echo "<option value='{$mk['kodemk']}'>{$mk['nama']}</option>";
      } ?>
    </select>

    <button type="submit">Simpan Data</button>
  </form>
</body>
</html>
