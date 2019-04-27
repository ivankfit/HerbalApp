<?php
include("connect.php");
  //Receive the RAW post data.
  $content = trim(file_get_contents("php://input"));

  $decoded = json_decode($content, true);

  //If json_decode failed, the JSON is invalid.
  if(is_array($decoded)) {

    $code = $decoded['code'];
    $pass = $decoded['pass'];
    $sql = "SELECT * FROM herbalist where contact='{$code}' AND password='{$pass}'  ";
    $result_set=mysqli_query($conn,$sql);

    if(!$result_set){
      $data2 = "query is failed".mysqli_connect_error();
      echo json_encode($data2);

    } 
    
    if(mysqli_num_rows($result_set)>0)
    {
      $row=mysqli_fetch_array($result_set,MYSQLI_ASSOC);
      $data2  ="done";
      echo json_encode($data2);
    }else{
      $data2  ='user not found';

      echo json_encode($data2);
    }

  } else {
    $data2  ='Something went wrong';

    echo json_encode($data2);
  }


?>