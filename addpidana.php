<?php


header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

$response = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Check if all parameters are available
    if (isset($_POST['user_id']) && isset($_FILES['laporan_pengaduan_pdf'])  && isset($_FILES['ktp_pdf']) && isset($_POST['laporan_pengaduan']) && isset($_POST['ktp']) && isset($_POST['nama_pelapor']) && isset($_POST['no_hp']) && isset($_POST['uraian'])) {
        $user_id = $_POST['user_id'];
        $laporan_pengaduan = $_POST['laporan_pengaduan'];
        $ktp = $_POST['ktp'];
        $nama_pelapor = $_POST['nama_pelapor'];
        $no_hp = $_POST['no_hp'];
        $uraian = $_POST['uraian'];

        // Handling file upload for laporan_pengaduan_pdf
        $laporan_pengaduan_pdf = handleFileUpload('laporan_pengaduan_pdf');

        // Handling file upload for ktp_pdf
        $ktp_pdf = handleFileUpload('ktp_pdf');

        // Insert into database
        $sql = "INSERT INTO tb_pidana_korupsi (user_id, laporan_pengaduan_pdf, ktp_pdf, laporan_pengaduan, ktp, nama_pelapor, no_hp, uraian) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $koneksi->prepare($sql);
        if ($stmt === false) {
            $response['isSuccess'] = false;
            $response['message'] = "Failed to prepare statement: " . $koneksi->error;
        } else {
            $stmt->bind_param("ssssssss", $user_id, $laporan_pengaduan_pdf, $ktp_pdf, $laporan_pengaduan, $ktp, $nama_pelapor, $no_hp, $uraian);
            if ($stmt->execute()) {
                $log_description = "User Create Permohonan";
                $log_activity_type = "ADD";
                $table_modified = "t_pidana_korupsi";
                $log_sql = "INSERT INTO t_log_application (log_description, log_activity_type, table_modified, user_id, log_date) VALUES ('$log_description', '$log_activity_type', '$table_modified', '$user_id', NOW())";
                $koneksi->query($log_sql);

                $response['isSuccess'] = true;
                $response['message'] = "Berhasil menambahkan laporan Pidana";
            } else {
                $response['isSuccess'] = false;
                $response['message'] = "Gagal menambahkan laporan Pidana: " . $stmt->error;
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
?>
