<?php


header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

$response = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Check if all parameters are available
    if (isset($_POST['user_id']) && isset($_FILES['bentuk_permasalahan_pdf']) && isset($_FILES['ktp_pdf']) && isset($_POST['bentuk_permasalahan']) && isset($_POST['nama_pelapor']) && isset($_POST['ktp']) && isset($_POST['no_hp'])) {
        $user_id = $_POST['user_id'];
        $bentuk_permasalahan = $_POST['bentuk_permasalahan'];
        $ktp = $_POST['ktp'];
        $nama_pelapor = $_POST['nama_pelapor'];
        $no_hp = $_POST['no_hp'];

        // Handling file upload for bentuk_permasalahan_pdf
        $bentuk_permasalahan_pdf = handleFileUpload('bentuk_permasalahan_pdf');

        // Handling file upload for ktp_pdf
        $ktp_pdf = handleFileUpload('ktp_pdf');

        // Insert into database
        $sql = "INSERT INTO tb_penyuluhan (user_id, bentuk_permasalahan_pdf, ktp_pdf, bentuk_permasalahan, ktp, nama_pelapor, no_hp) VALUES (?, ?, ?, ?, ?, ?, ?)";
        $stmt = $koneksi->prepare($sql);
        if ($stmt === false) {
            $response['isSuccess'] = false;
            $response['message'] = "Failed to prepare statement: " . $koneksi->error;
        } else {
            $stmt->bind_param("sssssss", $user_id, $bentuk_permasalahan_pdf, $ktp_pdf, $bentuk_permasalahan, $ktp, $nama_pelapor, $no_hp);
            if ($stmt->execute()) {
                $log_description = "User Create Permohonan";
                $log_activity_type = "ADD";
                $table_modified = "t_penyuluhan";
                $log_sql = "INSERT INTO t_log_application (log_description, log_activity_type, table_modified, user_id, log_date) VALUES ('$log_description', '$log_activity_type', '$table_modified', '$user_id', NOW())";
                $koneksi->query($log_sql);

                $response['isSuccess'] = true;
                $response['message'] = "Berhasil menambahkan laporan penyuluhan";
            } else {
                $response['isSuccess'] = false;
                $response['message'] = "Gagal menambahkan laporan penyuluhan: " . $stmt->error;
            }
            $stmt->close();
        }
    } else {
        $response['isSuccess'] = false;
        $response['message'] = "Required fields are missing";
    }
} else {
    $response['isSuccess'] = false;
    $response['message'] = "Only POST method is allowed";
}

echo json_encode($response);

function handleFileUpload($fileKey) {
    $file = $_FILES[$fileKey];
    $filename = $file['name'];
    $filetmp = $file['tmp_name'];
    $fileError = $file['error'];
    $fileSize = $file['size'];
    $fileExt = explode('.', $filename);
    $fileActualExt = strtolower(end($fileExt));
    
    // Define allowed file extensions
    $allowed = array('pdf','png','jpg','jpeg');

    // Check if file upload is allowed extension
    if (in_array($fileActualExt, $allowed)) {
        // Check if there are no errors in file upload
        if ($fileError === 0 ) {
            // Check file size
            if ($fileSize < 5000000) { // restrict file size to 5MB
                // Generate unique filenames
                $fileNameNew = uniqid('', true).".".$fileActualExt;
                $fileDestination = 'uploads/'.$fileNameNew;
                move_uploaded_file($filetmp, $fileDestination);
                return $fileDestination;
            } else {
                return "File is too large";
            }
        } else {
            return "There was an error uploading your file";
        }
    } else {
        return "You cannot upload files of this type";
    }
}

// header("Access-Control-Allow-Origin: *");

// include 'koneksi.php';

// $response = array();

// if ($_SERVER['REQUEST_METHOD'] == 'POST') {
//     // Pastikan bahwa semua parameter yang diperlukan tersedia
//     if (isset($_POST['user_id']) && isset($_FILES['bentuk_permasalahan_pdf']['name']) && isset($_POST['bentuk_permasalahan'])) {
//         $user_id = $_POST['user_id'];
//         $laporanPengaduanPdf = $_FILES['bentuk_permasalahan_pdf']['name'];
//         $bentuk_permasalahan = $_POST['bentuk_permasalahan'];
//         $status = 'Pending';
//         // Lokasi upload file
//         $target_dir = "uploads/";
//         $target_file = $target_dir . basename($_FILES["bentuk_permasalahan_pdf"]["name"]);

//         // Pindahkan file ke direktori yang ditentukan
//         if (move_uploaded_file($_FILES["bentuk_permasalahan_pdf"]["tmp_name"], $target_file)) {
//             $sql = "INSERT INTO tb_pengaduan (user_id, bentuk_permasalahan_pdf, bentuk_permasalahan, status, created_at, updated_at) VALUES ('$user_id', '$laporanPengaduanPdf', '$bentuk_permasalahan', '$status', NOW(), NOW())";
//             if ($koneksi->query($sql) === TRUE) {
//                 $response['isSuccess'] = true;
//                 $response['message'] = "Berhasil menambahkan laporan pengaduan";
//             } else {
//                 $response['isSuccess'] = false;
//                 $response['message'] = "Gagal menambahkan laporan pengaduan: " . $koneksi->error;
//             }
//         } else {
//             $response['isSuccess'] = false;
//             $response['message'] = "Gagal mengunggah file";
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
?>
