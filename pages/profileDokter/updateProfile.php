<?php
include("../../config/koneksi.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Ambil nilai dari form
    $id = $_POST["id"];
    $nama = $_POST["nama"];
    $alamat = $_POST["alamat"];
    $no_hp = $_POST["no_hp"];
    $password = $_POST["password"];
    $confirm_password = $_POST["confirm_password"];

    // Debugging: Check if password is being set
    if (!empty($password)) {
        echo "Password is set to: $password<br>"; // Debugging: Show the password
    } else {
        echo "No password provided.<br>"; // Debugging: Show when no password is provided
    }

    // Validasi jika password baru dan konfirmasi password tidak sama
    if (!empty($password) && $password !== $confirm_password) {
        echo '<script>';
        echo 'alert("Password dan konfirmasi password tidak cocok!");';
        echo 'window.history.back();';
        echo '</script>';
        exit();
    }

    // Mengambil data dokter berdasarkan ID
    $query = "SELECT * FROM dokter WHERE id = '$id'";
    $result = mysqli_query($mysqli, $query);
    $data = mysqli_fetch_assoc($result);

    // Debugging: Show old password value
    echo "Old password in DB: " . $data['password'] . "<br>";

    // Mengecek apakah password saat ini menggunakan MD5
    if (!empty($password)) {
        // Jika password baru diisi, hash password menggunakan MD5
        $password_hash = md5($password); // MD5 password baru untuk kompatibilitas

        // Debugging: Show the hashed password
        echo "Hashed password: $password_hash<br>";

        // Jika password sama dengan nama dokter sebelumnya, gunakan MD5 yang baru
        if ($data['password'] !== md5($data['nama'])) {
            $query = "UPDATE dokter SET 
                nama = '$nama',
                alamat = '$alamat',
                no_hp = '$no_hp',
                password = '$password_hash'
                WHERE id = '$id'";
        } else {
            $query = "UPDATE dokter SET 
                nama = '$nama',
                alamat = '$alamat',
                no_hp = '$no_hp'
                WHERE id = '$id'";
        }
    } else {
        // Jika tidak ada perubahan password, update data tanpa mengubah password
        $query = "UPDATE dokter SET 
            nama = '$nama',
            alamat = '$alamat',
            no_hp = '$no_hp'
            WHERE id = '$id'";
    }

    // Debugging: Show the query being executed
    echo "Executing query: $query<br>";

    // Eksekusi query
    if (mysqli_query($mysqli, $query)) {
        // Jika berhasil, redirect ke halaman profil dokter
        echo '<script>';
        echo 'alert("Profil berhasil diubah!");';
        echo 'window.location.href = "../../profileDokter.php";';
        echo '</script>';
        exit();
    } else {
        // Jika terjadi kesalahan, tampilkan pesan error
        echo "Error: " . $query . "<br>" . mysqli_error($mysqli);
    }
}

// Tutup koneksi
mysqli_close($mysqli);
?>
