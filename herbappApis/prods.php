<?php
include("connect.php");



$information = array();
  //Receive the RAW post data.
  $content = trim(file_get_contents("php://input"));

  $decoded = json_decode($content, true);

  //If json_decode failed, the JSON is invalid.
  if(is_array($decoded)) {

    $data = $decoded['key'];
    $sql = "SELECT * FROM products";
    $result_set=mysqli_query($conn,$sql);

    if(!$result_set){
      die("query is failed".mysqli_connect_error());
    } 
    
    if(mysqli_num_rows($result_set)>0)
    {
      while($row=mysqli_fetch_array($result_set,MYSQLI_ASSOC)){
          $information[]=$row;
      }


      echo json_encode($information);
    }else{
      $data2  ='no items found, please contact mamager';

      echo json_encode($data2);
    }

  } else {
    $data2  ='Something went wrong';

    echo json_encode($data2);
  }


?>