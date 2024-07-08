<?php

// header("Access-Control-Allow-Origin: *");

// include 'koneksi.php';

// if ($_SERVER['REQUEST_METHOD'] == 'POST') {
//     // Pastikan bahwa semua parameter yang diperlukan tersedia
//     if (isset($_POST['id']) && isset($_POST['user_id']) && isset($_POST['sekolah'])  && isset($_POST['nama_pelapor'])  && isset($_POST['status'])) {
//         $id = $_POST['id'];
//         $user_id = $_POST['user_id'];
//         $sekolah = $_POST['sekolah'];
//         $nama_pelapor = $_POST['nama_pelapor'];
//         $status = $_POST['status'];

//         $sql = "UPDATE tb_jaksa_sekolah SET user_id='$user_id', sekolah='$sekolah', nama_pelapor='$nama_pelapor', status='$status' WHERE id='$id'";
//         if ($koneksi->query($sql) === TRUE) {
//             $response['isSuccess'] = true;
//             $response['message'] = "Berhasil mengedit data JMS";
//         } else {
//             $response['isSuccess'] = false;
//             $response['message'] = "Gagal mengedit data JMS: " . $koneksi->error;
//         }
//     } else {
//         $response['isSuccess'] = false;
//         $response['message'] = "Parameter tidak lengkap";
//     }
// } else {
//     $response['isSuccess'] = false;
//     $response['message'] = "Metode yang diperbolehkan hanya POST";
// }

// echo json_encode($response);
header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

$response = array('isSuccess' => false, 'message' => 'Unknown error occurred');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['id']) && isset($_POST['user_id']) && isset($_POST['sekolah'])  && isset($_POST['nama_pelapor'])) {
        $id = $_POST['id'];
        $user_id = $_POST['user_id'];
        $sekolah = $_POST['sekolah'];
        $nama_pelapor = $_POST['nama_pelapor'];
        $status = isset($_POST['status']) ? $_POST['status'] : '';

        $sql = "UPDATE tb_jaksa_sekolah SET user_id='$user_id', sekolah='$sekolah', nama_pelapor='$nama_pelapor', status='$status' WHERE id='$id'";
        if ($koneksi->query($sql) === TRUE) {
            $response['isSuccess'] = true;
            $response['message'] = "Berhasil mengedit data jms";
        } else {
            $response['isSuccess'] = false;
            $response['message'] = "Gagal mengedit data jms: " . $koneksi->error;
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
