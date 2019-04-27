<?php
include("connect.php");


$domain_name = "http://169.254.148.6/herbappApis/" ;

 // Image uploading folder.
 $target_dir = "uploads";
 
 // Generating random image name each time so image name will not be same .
 $target_dir = $target_dir . "/" .rand() . "_" . time() . ".jpeg";
 
 // Receiving image tag sent from application.
 $img_tag = $_POST["user"];
 $id =  $_POST["id"];
 
 // Receiving image sent from Application	
 if(move_uploaded_file($_FILES['image']['tmp_name'], $target_dir)){
 
 // Adding domain name with image random name.
 $target_dir = $domain_name . $target_dir ;
 
 // Inserting data into MySQL database.
 $query = "UPDATE herbalist SET Image = '{$target_dir}' where id = {$id} ";

 $rs = mysqli_query($conn,$query);
if($rs){
    $MESSAGE = "an error occured".mysqli_error($conn);
}
 //////////mysql_query("insert into image_upload_table ( image_tag, image_path) VALUES('$img_tag' , '$target_dir')");
 
 $MESSAGE = "Image Uploaded Successfully." ;
 
 // Printing response message on screen after successfully inserting the image .	
 echo json_encode($MESSAGE);
 }

   


?>