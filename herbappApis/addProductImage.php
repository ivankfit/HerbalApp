<?php
include("connect.php");
$MESSAGE ="";

$domain_name = "http://169.254.148.6/herbappApis/" ;

 // Image uploading folder.
 $target_dir = "uploads";
 
 // Generating random image name each time so image name will not be same .
 $target_dir = $target_dir . "/" .rand() . "_" . time() . ".jpeg";
 
 // Receiving image tag sent from application.
 $img_tag = $_POST["productname"];
 $diseases = $_POST["diseases"];
 $cost = $_POST["cost"];
 $filetype =  $_POST["filetype"];
 $herbid =  $_POST["id"];

 
 // Receiving image sent from Application	
 if(move_uploaded_file($_FILES['image']['tmp_name'], $target_dir)){
 
 // Adding domain name with image random name.
 $target_dir = $domain_name . $target_dir ;

 $query = "INSERT INTO products (herbname,image,diseases,rating,cost,herbalist_id)
 values ('{$img_tag}','{$target_dir}','{$diseases}','0',{$cost},{$herbid}) ";
 
 $rs = mysqli_query($conn,$query);

 if(!$rs){
     $MESSAGE = "an error".mysqli_error($conn);
 }


 // Inserting data into MySQL database.
 //////////mysql_query("insert into image_upload_table ( image_tag, image_path) VALUES('$img_tag' , '$target_dir')");
 

 
 // Printing response message on screen after successfully inserting the image .	
 echo json_encode($MESSAGE);
 }

   


?>