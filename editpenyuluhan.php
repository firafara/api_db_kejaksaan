<?php

// header("Access-Control-Allow-Origin: *");

// include 'koneksi.php';

// $response = array('isSuccess' => false, 'message' => 'Unknown error occurred');

// if ($_SERVER['REQUEST_METHOD'] == 'POST') {
//     if (isset($_POST['id']) && isset($_POST['user_id']) && isset($_POST['bentuk_permasalahan']) && isset($_POST['status']) && isset($_FILES['ktp_pdf']) && isset($_POST['ktp']) && isset($_POST['nama_pelapor']) && isset($_POST['no_hp'])) {
//         $id = $_POST['id'];
//         $user_id = $_POST['user_id'];
//         $bentuk_permasalahan = $_POST['bentuk_permasalahan'];
//         $status = $_POST['status'];
//         $ktp = $_POST['ktp'];
//         $nama_pelapor = $_POST['nama_pelapor'];
//         $no_hp = $_POST['no_hp'];

//         $bentuk_permasalahanPath = isset($_FILES['bentuk_permasalahan_pdf']['name']) ? $_FILES['bentuk_permasalahan_pdf']['name'] : '';
//         // Handle file upload
//         if (!empty($_FILES['bentuk_permasalahan_pdf']['name'])) {
//             $fileError = $_FILES['bentuk_permasalahan_pdf']['error'];
//             if ($fileError === UPLOAD_ERR_OK) {
//                 $targetDir = "uploads/";
//                 $targetFilePath = $targetDir . basename($_FILES["bentuk_permasalahan_pdf"]["name"]);
//                 $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
//                 // Allow certain file formats
//                 $allowed = array('pdf', 'png', 'jpg', 'jpeg');
//                 if (in_array($fileType, $allowed)) {
//                     // Upload file to server
//                     if (move_uploaded_file($_FILES["bentuk_permasalahan_pdf"]["tmp_name"], $targetFilePath)) {
//                         $bentuk_permasalahan_pdf = $targetFilePath; // Update bentuk_permasalahan_pdf path to use in SQL
//                     } else {
//                         $response['message'] = "Sorry, there was an error uploading your file.";
//                         echo json_encode($response);
//                         exit;
//                     }
//                 } else {
//                     $response['message'] = "Sorry, only PDF, JPG, JPEG, & PNG files are allowed.";
//                     echo json_encode($response);
//                     exit;
//                 }
//             } else {
//                 $response['message'] = "Error uploading file: " . $fileError;
//                 echo json_encode($response);
//                 exit;
//             }
//         } else {
//             // Use existing bentuk_permasalahan_pdf path if new bentuk_permasalahan_pdf is not uploaded
//             $sql = "SELECT bentuk_permasalahan_pdf FROM tb_penyuluhan WHERE id = '$id'";
//             $result = $koneksi->query($sql);
//             if ($result->num_rows > 0) {
//                 $row = $result->fetch_assoc();
//                 $bentuk_permasalahan_pdf = $row['bentuk_permasalahan_pdf'];
//             } else {
//                 $response['message'] = "No record found to update.";
//                 echo json_encode($response);
//                 exit;
//             }
//         }
        
//         // Handle file upload for ktp_pdf
//         $ktp_pdfPath = isset($_FILES['ktp_pdf']['name']) ? $_FILES['ktp_pdf']['name'] : '';
//         if (!empty($_FILES['ktp_pdf']['name'])) {
//             $fileError = $_FILES['ktp_pdf']['error'];
//             if ($fileError === UPLOAD_ERR_OK) {
//                 $targetDir = "uploads/";
//                 $targetFilePath = $targetDir . basename($_FILES["ktp_pdf"]["name"]);
//                 $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
//                 // Allow certain file formats
//                 $allowed = array('pdf', 'png', 'jpg', 'jpeg');
//                 if (in_array($fileType, $allowed)) {
//                     // Upload file to server
//                     if (move_uploaded_file($_FILES["ktp_pdf"]["tmp_name"], $targetFilePath)) {
//                         $ktp_pdf = $targetFilePath; // Update ktp_pdf path to use in SQL
//                     } else {
//                         $response['message'] = "Sorry, there was an error uploading your file.";
//                         echo json_encode($response);
//                         exit;
//                     }
//                 } else {
//                     $response['message'] = "Sorry, only PDF, JPG, JPEG, & PNG files are allowed.";
//                     echo json_encode($response);
//                     exit;
//                 }
//             } else {
//                 $response['message'] = "Error uploading file: " . $fileError;
//                 echo json_encode($response);
//                 exit;
//             }
//         } else {
//             // Use existing ktp_pdf path if new ktp_pdf is not uploaded
//             $sql = "SELECT ktp_pdf FROM tb_penyuluhan WHERE id = '$id'";
//             $result = $koneksi->query($sql);
//             if ($result->num_rows > 0) {
//                 $row = $result->fetch_assoc();
//                 $ktp_pdf = $row['ktp_pdf'];
//             } else {
//                 $response['message'] = "No record found to update.";
//                 echo json_encode($response);
//                 exit;
//             }
//         }

//         $sql = "UPDATE tb_penyuluhan SET user_id='$user_id', bentuk_permasalahan_pdf='$bentuk_permasalahan_pdf', ktp_pdf='$ktp_pdf', bentuk_permasalahan='$bentuk_permasalahan', status='$status', ktp='$ktp', nama_pelapor='$nama_pelapor', no_hp='$no_hp'  WHERE id='$id'";
//         if ($koneksi->query($sql) === TRUE) {
//             $response['isSuccess'] = true;
//             $response['message'] = "Berhasil mengedit data penyuluhan";
//         } else {
//             $response['isSuccess'] = false;
//             $response['message'] = "Gagal mengedit data penyuluhan: " . $koneksi->error;
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
    if (isset($_POST['id']) && isset($_POST['user_id']) && isset($_POST['bentuk_permasalahan']) && isset($_POST['ktp']) && isset($_POST['nama_pelapor']) && isset($_POST['no_hp'])) {
        $id = $_POST['id'];
        $user_id = $_POST['user_id'];
        $bentuk_permasalahan = $_POST['bentuk_permasalahan'];
        $ktp = $_POST['ktp'];
        $nama_pelapor = $_POST['nama_pelapor'];
        $no_hp = $_POST['no_hp'];
        $status = isset($_POST['status']) ? $_POST['status'] : '';

        $bentuk_permasalahanPath = isset($_FILES['bentuk_permasalahan_pdf']['name']) ? $_FILES['bentuk_permasalahan_pdf']['name'] : '';
        // Handle file upload
        if (!empty($_FILES['bentuk_permasalahan_pdf']['name'])) {
            $fileError = $_FILES['bentuk_permasalahan_pdf']['error'];
            if ($fileError === UPLOAD_ERR_OK) {
                $targetDir = "uploads/";
                $targetFilePath = $targetDir . basename($_FILES["bentuk_permasalahan_pdf"]["name"]);
                $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
                // Allow certain file formats
                $allowed = array('pdf', 'png', 'jpg', 'jpeg');
                if (in_array($fileType, $allowed)) {
                    // Upload file to server
                    if (move_uploaded_file($_FILES["bentuk_permasalahan_pdf"]["tmp_name"], $targetFilePath)) {
                        $bentuk_permasalahan_pdf = $targetFilePath; // Update bentuk_permasalahan_pdf path to use in SQL
                    } else {
                        $response['message'] = "Sorry, there was an error uploading your file.";
                        echo json_encode($response);
                        exit;
                    }
                } else {
                    $response['message'] = "Sorry, only PDF, JPG, JPEG, & PNG files are allowed.";
                    echo json_encode($response);
                    exit;
                }
            } else {
                $response['message'] = "Error uploading file: " . $fileError;
                echo json_encode($response);
                exit;
            }
        } else {
            // Use existing bentuk_permasalahan_pdf path if new bentuk_permasalahan_pdf is not uploaded
            $sql = "SELECT bentuk_permasalahan_pdf FROM tb_penyuluhan WHERE id = '$id'";
            $result = $koneksi->query($sql);
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $bentuk_permasalahan_pdf = $row['bentuk_permasalahan_pdf'];
            } else {
                $response['message'] = "No record found to update.";
                echo json_encode($response);
                exit;
            }
        }
        
        // Handle file upload for ktp_pdf
        $ktp_pdfPath = isset($_FILES['ktp_pdf']['name']) ? $_FILES['ktp_pdf']['name'] : '';
        if (!empty($_FILES['ktp_pdf']['name'])) {
            $fileError = $_FILES['ktp_pdf']['error'];
            if ($fileError === UPLOAD_ERR_OK) {
                $targetDir = "uploads/";
                $targetFilePath = $targetDir . basename($_FILES["ktp_pdf"]["name"]);
                $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
                // Allow certain file formats
                $allowed = array('pdf', 'png', 'jpg', 'jpeg');
                if (in_array($fileType, $allowed)) {
                    // Upload file to server
                    if (move_uploaded_file($_FILES["ktp_pdf"]["tmp_name"], $targetFilePath)) {
                        $ktp_pdf = $targetFilePath; // Update ktp_pdf path to use in SQL
                    } else {
                        $response['message'] = "Sorry, there was an error uploading your file.";
                        echo json_encode($response);
                        exit;
                    }
                } else {
                    $response['message'] = "Sorry, only PDF, JPG, JPEG, & PNG files are allowed.";
                    echo json_encode($response);
                    exit;
                }
            } else {
                $response['message'] = "Error uploading file: " . $fileError;
                echo json_encode($response);
                exit;
            }
        } else {
            // Use existing ktp_pdf path if new ktp_pdf is not uploaded
            $sql = "SELECT ktp_pdf FROM tb_penyuluhan WHERE id = '$id'";
            $result = $koneksi->query($sql);
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $ktp_pdf = $row['ktp_pdf'];
            } else {
                $response['message'] = "No record found to update.";
                echo json_encode($response);
                exit;
            }
        }

        $sql = "UPDATE tb_penyuluhan SET user_id='$user_id', bentuk_permasalahan_pdf='$bentuk_permasalahan_pdf', ktp_pdf='$ktp_pdf', bentuk_permasalahan='$bentuk_permasalahan', ktp='$ktp', nama_pelapor='$nama_pelapor', no_hp='$no_hp', status='$status' WHERE id='$id'";
        if ($koneksi->query($sql) === TRUE) {
            $response['isSuccess'] = true;
            $response['message'] = "Berhasil mengedit data penyuluhan";
        } else {
            $response['isSuccess'] = false;
            $response['message'] = "Gagal mengedit data penyuluhan: " . $koneksi->error;
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
