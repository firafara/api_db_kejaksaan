<?php

header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $response = array();
    
    $id = $_POST['id'];
    $status = $_POST['status']; 

    $sql = "UPDATE tb_pengawasan SET status = ? WHERE id = ?";
    $stmt = $koneksi->prepare($sql);
    $stmt->bind_param("si", $status, $id);
    
    if ($stmt->execute()) {
        $response['is_success'] = true;
        $response['value'] = 1;
        $response['message'] = "Status pengaduan berhasil diperbarui";
    } else {
        $response['is_success'] = false;
        $response['value'] = 0;
        $response['message'] = "Gagal memperbarui status pengaduan";
    }

    echo json_encode($response);
}

?>
