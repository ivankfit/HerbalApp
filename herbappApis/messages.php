<?php
include("connect.php");
  //Receive the RAW post data.
  $content = trim(file_get_contents("php://input"));

  $decoded = json_decode($content, true);

  //If json_decode failed, the JSON is invalid.
  if(is_array($decoded)) {

    $code = $decoded['code'];
    $pass = $decoded['pass'];
    $id =  $decoded['id'];
    $sql = "INSERT INTO    messages (message,subject,herbalist_id) values ('{$code}','{$pass}',{$id})";
    $result_set=mysqli_query($conn,$sql);

    if(!$result_set){
      $data2 = "query is failed".mysqli_error($conn);
      echo json_encode($data2);

    } 
   else {
    $data2  ='done';

    echo json_encode($data2);
  }

}


?>