<?php
include("connect.php");




  //Receive the RAW post data.
  $content = trim(file_get_contents("php://input"));

  $decoded = json_decode($content, true);

  //If json_decode failed, the JSON is invalid.
  if(is_array($decoded)) {

    $code = $decoded['username'];
    $pass = $decoded['location'];
    $code2 = $decoded['contact'];
    $pass3 = $decoded['password'];
    $check  =  "select *  from  herbalist  where contact = '{$code2}' ";

  $sql = "INSERT INTO herbalist (Name,location,contact,password)  values ('{$code}','{$pass}','{$code2}','{$pass3}')";


    $result_set2=mysqli_query($conn,$check);
    if(!$result_set2){
        $data2 = "query is failed".mysqli_connect_error();
        echo json_encode($data2);
  
      } else{ 
          if(mysqli_num_rows($result_set2)>0){
            $data2 = "exists";
            echo json_encode($data2);
      

          }else{

            $result_set=mysqli_query($conn,$sql);
            if(!$result_set){
                $data2 = "query is failed".mysqli_connect_error();
                echo json_encode($data2);
          
              } else{ 
                $data2 = "done";
                echo json_encode($data2);
              }
             }
      }
  } else {
    $data2  ='nop';

    echo json_encode($data2);
  }


?>