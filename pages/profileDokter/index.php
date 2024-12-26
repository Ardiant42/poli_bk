<?php
include("config/koneksi.php");

// Mengambil data dokter berdasarkan ID
$id_dokter = $_SESSION['id']; // Asumsikan ID dokter disimpan dalam session

$query = "SELECT * FROM dokter WHERE id = '$id_dokter'";
$result = mysqli_query($mysqli, $query);
$data = mysqli_fetch_assoc($result);

mysqli_close($mysqli);
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profil Dokter</title>
    <!-- Link Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome (untuk ikon tombol) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>

<div class="container my-5">
    <!-- Header -->
    <div class="row mb-4">
        <div class="col-12">
            <h1 class="text-center">Profil Dokter</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-center">
                    <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Profil Dokter</li>
                </ol>
            </nav>
        </div>
    </div>

    <!-- Card Profil Dokter -->
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <h3 class="card-title">Data Profil</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <!-- Icon untuk Profil Dokter -->
                    <i class="fas fa-user-md fa-4x d-block text-center text-primary mb-3"></i>
                </div>
                <div class="col-md-8">
                    <p><strong>Nama:</strong> <?php echo htmlspecialchars($data['nama']); ?></p>
                    <p><strong>Alamat:</strong> <?php echo nl2br(htmlspecialchars($data['alamat'])); ?></p>
                    <p><strong>No HP:</strong> <?php echo htmlspecialchars($data['no_hp']); ?></p>

                    <!-- Tombol Edit Profil -->
                    <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#editProfileModal">
                        <i class="fas fa-edit"></i> Edit Profil
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Edit Profil Dokter -->
    <div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="editProfileModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editProfileModalLabel">Edit Profil Dokter</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Form Edit Profil Dokter -->
                    <form action="pages/profileDokter/updateProfile.php" method="post">
                        <input type="hidden" name="id" value="<?php echo htmlspecialchars($data['id']); ?>">

                        <div class="form-group">
                            <label for="nama">Nama Dokter</label>
                            <input type="text" class="form-control" id="nama" name="nama" value="<?php echo htmlspecialchars($data['nama']); ?>" required>
                        </div>

                        <div class="form-group">
                            <label for="alamat">Alamat</label>
                            <textarea class="form-control" id="alamat" name="alamat" rows="3" required><?php echo htmlspecialchars($data['alamat']); ?></textarea>
                        </div>

                        <div class="form-group">
                            <label for="no_hp">No HP</label>
                            <input type="text" class="form-control" id="no_hp" name="no_hp" value="<?php echo htmlspecialchars($data['no_hp']); ?>" required>
                        </div>

                        <!-- Password Fields -->
                        <div class="form-group">
                            <label for="password">Password Baru</label>
                            <input type="password" class="form-control" id="password" name="password">
                            <small class="form-text text-muted">Kosongkan jika tidak ingin mengubah password</small>
                        </div>

                        <div class="form-group">
                            <label for="confirm_password">Konfirmasi Password Baru</label>
                            <input type="password" class="form-control" id="confirm_password" name="confirm_password">
                        </div>

                        <button type="submit" class="btn btn-success btn-block">Simpan Perubahan</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JS, Popper.js, and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
