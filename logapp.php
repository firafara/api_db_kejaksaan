<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// Include the connection file
include 'koneksi.php';

// Ensure the POST request is received
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $input = file_get_contents("php://input");
    $data = json_decode($input, true);

    if (isset($data['user_id']) && isset($data['method']) && isset($data['table']) && isset($data['description'])) {
        $user_id = $data['user_id'];
        $method = $data['method'];
        $table = $data['table'];
        $description = $data['description'];

        $log_description = "$method $description By User id $user_id";
        $log_activity_type = $method;
        $table_modified = $table == NULL ? 'NONE' : $table;

        $sql = "INSERT INTO t_log_application (log_description, log_activity_type, table_modified, user_id, log_date) VALUES ('$log_description', '$log_activity_type', '$table_modified', '$user_id', NOW())";

        if ($koneksi->query($sql) === TRUE) {
            $response['isSuccess'] = true;
            $response['message'] = "Log berhasil disimpan";
        } else {
            $response['isSuccess'] = false;
            $response['message'] = "Gagal menyimpan log: " . $koneksi->error;
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
