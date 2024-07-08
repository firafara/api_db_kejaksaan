<?php

$koneksi = mysqli_connect("localhost", "root", "", "kejaksaan");

if($koneksi){

	// echo "Database berhasil Connect";
	
} else {
	echo "gagal Connect";
}

?>