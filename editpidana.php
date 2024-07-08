<?php

// header("Access-Control-Allow-Origin: *");

// include 'koneksi.php';

// $response = array('isSuccess' => false, 'message' => 'Unknown error occurred');

// if ($_SERVER['REQUEST_METHOD'] == 'POST') {
//     if (isset($_POST['id']) && isset($_POST['user_id']) && isset($_POST['laporan_pengaduan']) && isset($_POST['status']) && isset($_FILES['ktp_pdf'])&& isset($_POST['ktp']) && isset($_POST['nama_pelapor']) && isset($_POST['no_hp'])  && isset($_POST['uraian'])) {
//         $id = $_POST['id'];
//         $user_id = $_POST['user_id'];
//         $laporan_pengaduan = $_POST['laporan_pengaduan'];
//         $ktp = $_POST['ktp'];
//         $nama_pelapor = $_POST['nama_pelapor'];
//         $no_hp = $_POST['no_hp'];
//         $status = $_POST['status'];
//         $uraian = $_POST['uraian'];

//         $laporan_pengaduanPath = isset($_FILES['laporan_pengaduan_pdf']['name']) ? $_FILES['laporan_pengaduan_pdf']['name'] : '';
//         // Handle file upload
//         if (!empty($_FILES['laporan_pengaduan_pdf']['name'])) {
//             $fileError = $_FILES['laporan_pengaduan_pdf']['error'];
//             if ($fileError === UPLOAD_ERR_OK) {
//                 $targetDir = "uploads/";
//                 $targetFilePath = $targetDir . basename($_FILES["laporan_pengaduan_pdf"]["name"]);
//                 $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
//                 // Allow certain file formats
//                 $allowed = array('pdf', 'png', 'jpg', 'jpeg');
//                 if (in_array($fileType, $allowed)) {
//                     // Upload file to server
//                     if (move_uploaded_file($_FILES["laporan_pengaduan_pdf"]["tmp_name"], $targetFilePath)) {
//                         $laporan_pengaduan_pdf = $targetFilePath; // Update laporan_pengaduan_pdf path to use in SQL
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
//             // Use existing laporan_pengaduan_pdf path if new laporan_pengaduan_pdf is not uploaded
//             $sql = "SELECT laporan_pengaduan_pdf FROM tb_pidana_korupsi WHERE id = '$id'";
//             $result = $koneksi->query($sql);
//             if ($result->num_rows > 0) {
//                 $row = $result->fetch_assoc();
//                 $laporan_pengaduan_pdf = $row['laporan_pengaduan_pdf'];
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
//             $sql = "SELECT ktp_pdf FROM tb_pidana_korupsi WHERE id = '$id'";
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

//         $sql = "UPDATE tb_pidana_korupsi SET user_id='$user_id', laporan_pengaduan_pdf='$laporan_pengaduan_pdf', ktp_pdf='$ktp_pdf', laporan_pengaduan='$laporan_pengaduan', ktp='$ktp', nama_pelapor='$nama_pelapor', no_hp='$no_hp', status='$status', uraian='$uraian' WHERE id='$id'";
//         if ($koneksi->query($sql) === TRUE) {
//             $response['isSuccess'] = true;
//             $response['message'] = "Berhasil mengedit data pidana";
//         } else {
//             $response['isSuccess'] = false;
//             $response['message'] = "Gagal mengedit data pidana: " . $koneksi->error;
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
    if (isset($_POST['id']) && isset($_POST['user_id']) && isset($_POST['laporan_pengaduan']) && isset($_POST['ktp']) && isset($_POST['nama_pelapor']) && isset($_POST['no_hp']) && isset($_POST['uraian'])) {
        $id = $_POST['id'];
        $user_id = $_POST['user_id'];
        $laporan_pengaduan = $_POST['laporan_pengaduan'];
        $ktp = $_POST['ktp'];
        $nama_pelapor = $_POST['nama_pelapor'];
        $no_hp = $_POST['no_hp'];
        $uraian = $_POST['uraian'];
        $status = isset($_POST['status']) ? $_POST['status'] : '';

        $laporan_pengaduanPath = isset($_FILES['laporan_pengaduan_pdf']['name']) ? $_FILES['laporan_pengaduan_pdf']['name'] : '';
        // Handle file upload
        if (!empty($_FILES['laporan_pengaduan_pdf']['name'])) {
            $fileError = $_FILES['laporan_pengaduan_pdf']['error'];
            if ($fileError === UPLOAD_ERR_OK) {
                $targetDir = "uploads/";
                $targetFilePath = $targetDir . basename($_FILES["laporan_pengaduan_pdf"]["name"]);
                $fileType = strtolower(pathinfo($targetFilePath, PATHINFO_EXTENSION));
                // Allow certain file formats
                $allowed = array('pdf', 'png', 'jpg', 'jpeg');
                if (in_array($fileType, $allowed)) {
                    // Upload file to server
                    if (move_uploaded_file($_FILES["laporan_pengaduan_pdf"]["tmp_name"], $targetFilePath)) {
                        $laporan_pengaduan_pdf = $targetFilePath; // Update laporan_pengaduan_pdf path to use in SQL
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
            // Use existing laporan_pengaduan_pdf path if new laporan_pengaduan_pdf is not uploaded
            $sql = "SELECT laporan_pengaduan_pdf FROM tb_pidana_korupsi WHERE id = '$id'";
            $result = $koneksi->query($sql);
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $laporan_pengaduan_pdf = $row['laporan_pengaduan_pdf'];
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
            $sql = "SELECT ktp_pdf FROM tb_pidana_korupsi WHERE id = '$id'";
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

        $sql = "UPDATE tb_pidana_korupsi SET user_id='$user_id', laporan_pengaduan_pdf='$laporan_pengaduan_pdf', ktp_pdf='$ktp_pdf', laporan_pengaduan='$laporan_pengaduan', ktp='$ktp', nama_pelapor='$nama_pelapor', no_hp='$no_hp', uraian='$uraian',status='$status' WHERE id='$id'";
        if ($koneksi->query($sql) === TRUE) {
            $response['isSuccess'] = true;
            $response['message'] = "Berhasil mengedit data pidana";
        } else {
            $response['isSuccess'] = false;
            $response['message'] = "Gagal mengedit data pidana: " . $koneksi->error;
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
