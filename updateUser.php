<?php

header("Access-Control-Allow-Origin: *");
include 'koneksi.php';

if($_SERVER['REQUEST_METHOD'] == "POST") {
    $response = array();
    
    $id = $_POST['id'];
    $username = $_POST['username'];
    $fullname = $_POST['fullname']; 
    $email = $_POST['email']; 
    $phone_number = $_POST['phone_number']; 
    $ktp = $_POST['ktp']; 
    $alamat = $_POST['alamat']; 
    $role = $_POST['role']; 

    $sql = "UPDATE users SET username = '$username', fullname = '$fullname', email = '$email', phone_number = '$phone_number', ktp = '$ktp',alamat = '$alamat', role = '$role' WHERE id = $id";
    $isSuccess = $koneksi->query($sql);

    if ($isSuccess) {
        $cek = "SELECT * FROM users WHERE id = $id";
        $result = mysqli_fetch_array(mysqli_query($koneksi, $cek));
        $response['is_success'] = true;
        $response['value'] = 1;
        $response['message'] = "User Berhasil di Edit";
        $response['username'] = $result['username'];
        $response['fullname'] = $result['fullname']; 
        $response['email'] = $result['email']; 
        $response['phone_number'] = $result['phone_number']; 
        $response['ktp'] = $result['ktp']; 
        $response['alamat'] = $result['alamat']; 
        $response['role'] = $result['role']; 
        $response['id'] = $result['id'];
    } else {
        $response['is_success'] = false;
        $response['value'] = 0;
        $response['message'] = "Gagal Edit User";
    }

    echo json_encode($response);
}

?>
