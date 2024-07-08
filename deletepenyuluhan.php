<?php

header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Pastikan bahwa parameter id tersedia
    if (isset($_POST['id'])) {
        $id = $_POST['id'];

        $sql = "DELETE FROM tb_penyuluhan WHERE id='$id'";
        if ($koneksi->query($sql) === TRUE) {
            $response['isSuccess'] = true;
            $response['message'] = "Berhasil menghapus data penyuluhan";
        } else {
            $response['isSuccess'] = false;
            $response['message'] = "Gagal menghapus data penyuluhan: " . $koneksi->error;
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
