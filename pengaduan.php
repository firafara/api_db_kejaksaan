<?php

header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

$sql = "SELECT * FROM tb_pengaduan";
$result = $koneksi->query($sql);

if ($result) {
    if ($result->num_rows > 0) {
        $response['isSuccess'] = true;
        $response['message'] = "Berhasil Menampilkan Data Pengaduan Pegawai";
        $response['data'] = array();
        while ($row = $result->fetch_assoc()) {
            $response['data'][] = $row;
        }
    } else {
        $response['isSuccess'] = false;
        $response['message'] = "Data Pengaduan Pegawai tidak ditemukan";
        $response['data'] = null;
    }
} else {
    $response['isSuccess'] = false;
    $response['message'] = "Terjadi kesalahan saat mengambil data Pengaduan Pegawai";
    $response['data'] = null;
}

echo json_encode($response);
?>
