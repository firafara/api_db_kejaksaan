<?php

// header("Access-Control-Allow-Origin: header");
// header("Access-Control-Allow-Origin: *");
// include 'koneksi.php';

// if($_SERVER['REQUEST_METHOD'] == "POST") {

//     $response = array();
//     $username = $_POST['username'];
//     $email = $_POST['email'];
//     $password = password_hash($_POST['password'], PASSWORD_BCRYPT); 
//     $fullname = $_POST['fullname'];
//     $phone_number = $_POST['phone_number'];
//     $ktp = $_POST['ktp'];
//     $alamat = $_POST['alamat'];
//     $role = $_POST['role'];

//     $cek = "SELECT * FROM users WHERE username = '$username' OR email = '$email'"; 
//     $result = mysqli_query($koneksi, $cek);

//     if(mysqli_num_rows($result) > 0){ 
//         $response['value'] = 2;
//         $response['message'] = "Username atau email telah digunakan";
//         echo json_encode($response);
//     } else {
//         $insert = "INSERT INTO users (username, email, password, fullname, phone_number, ktp, alamat, role, created_at) 
//                    VALUES ('$username', '$email', '$password', '$fullname','$phone_number','$ktp','$alamat','$role', NOW())";
        
//         if(mysqli_query($koneksi, $insert)){
//             $response['value'] = 1;
// 			$response['username'] = $username;
//             $response['email'] = $email;
//             $response['fullname'] = $fullname;
//             $response['phone_number'] = $phone_number;
//             $response['ktp'] = $ktp;
//             $response['alamat'] = $alamat;
//             $response['role'] = $role;
//             $response['message'] = "Registrasi Berhasil";
//             echo json_encode($response);
//         } else {
//             $response['value'] = 0;
//             $response['message'] = "Gagal Registrasi";
//             echo json_encode($response);
//         }
//     }
// }


header("Access-Control-Allow-Origin: *");
include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    $response = array();
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT); 
    $fullname = $_POST['fullname'];
    $phone_number = $_POST['phone_number'];
    $ktp = $_POST['ktp'];
    $alamat = $_POST['alamat'];
    $role = isset($_POST['role']) ? $_POST['role'] : 'User'; // Set default role to 'User'

    $cek = "SELECT * FROM users WHERE username = '$username' OR email = '$email'"; 
    $result = mysqli_query($koneksi, $cek);

    if (mysqli_num_rows($result) > 0) { 
        $response['value'] = 2;
        $response['message'] = "Username atau email telah digunakan";
        echo json_encode($response);
    } else {
        $insert = "INSERT INTO users (username, email, password, fullname, phone_number, ktp, alamat, role, created_at) 
                   VALUES ('$username', '$email', '$password', '$fullname','$phone_number','$ktp','$alamat','$role', NOW())";
        
        if (mysqli_query($koneksi, $insert)) {
            // Mendapatkan ID pengguna yang baru saja diinsert
            $user_id = mysqli_insert_id($koneksi);

            $response['value'] = 1;
            $response['username'] = $username;
            $response['email'] = $email;
            $response['fullname'] = $fullname;
            $response['phone_number'] = $phone_number;
            $response['ktp'] = $ktp;
            $response['alamat'] = $alamat;
            $response['role'] = $role;
            $response['message'] = "Registrasi Berhasil";

            // Logging aktivitas
            $log_description = "User Register";
            $log_activity_type = "REGISTER";
            $table_modified = "users";

            $log_sql = "INSERT INTO t_log_application (log_description, log_activity_type, table_modified, user_id, log_date) 
                        VALUES ('$log_description', '$log_activity_type', '$table_modified', '$user_id', NOW())";
            $koneksi->query($log_sql);

            echo json_encode($response);
        } else {
            $response['value'] = 0;
            $response['message'] = "Gagal Registrasi";
            echo json_encode($response);
        }
    }
}



?>
