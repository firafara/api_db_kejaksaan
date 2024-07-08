<?php

header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Pastikan bahwa semua parameter yang diperlukan tersedia
    if (isset($_POST['user_id']) && isset($_POST['rating']) && isset($_POST['nama_pelapor']) && isset($_POST['ulasan'])) {
        $user_id = $_POST['user_id'];
        $rating = $_POST['rating'];
        $nama_pelapor = $_POST['nama_pelapor'];
        $ulasan = $_POST['ulasan'];

        // Use prepared statement to prevent SQL injection
        $sql = "INSERT INTO tb_rating (user_id, rating, nama_pelapor, ulasan) VALUES (?, ?, ?, ?)";
        $stmt = $koneksi->prepare($sql);
        $stmt->bind_param("isss", $user_id, $rating, $nama_pelapor, $ulasan);
        
        if ($stmt->execute()) {
            $response['isSuccess'] = true;
            $response['message'] = "Berhasil menambahkan Rating";
        } else {
            $response['isSuccess'] = false;
            $response['message'] = "Gagal menambahkan Rating: " . $koneksi->error;
        }
    } else {
        $response['isSuccess'] = false;
        $response['message'] = "Parameter tidak lengkap";
    }
} else {
    $response['isSuccess'] = false;
    $response['message'] = "Metode yang diperbolehkan hanya POST";
}

echo json_encode($response);
?>
