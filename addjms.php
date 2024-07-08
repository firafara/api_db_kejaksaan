<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Ensure all required parameters are available
    if (isset($_POST['user_id']) && isset($_POST['sekolah']) && isset($_POST['nama_pemohon']) && isset($_POST['permohonan'])) {
        $user_id = $_POST['user_id'];
        $sekolah = $_POST['sekolah'];
        $nama_pemohon = $_POST['nama_pemohon'];
        $permohonan = $_POST['permohonan'];

        $sql = "INSERT INTO tb_jaksa_sekolah (user_id, sekolah, nama_pemohon, permohonan) VALUES ('$user_id', '$sekolah', '$nama_pemohon', '$permohonan')";
        if ($koneksi->query($sql) === TRUE) {
            $log_description = "User Create Permohonan";
            $log_activity_type = "ADD";
            $table_modified = "t_jaksa_sekolah";

            $log_sql = "INSERT INTO t_log_application (log_description, log_activity_type, table_modified, user_id, log_date) VALUES ('$log_description', '$log_activity_type', '$table_modified', '$user_id', NOW())";
            $koneksi->query($log_sql);
            
            $response['isSuccess'] = true;
            $response['message'] = "Berhasil menambahkan JMS";
        } else {
            $response['isSuccess'] = false;
            $response['message'] = "Gagal menambahkan JMS: " . $koneksi->error;
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
