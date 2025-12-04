<?php
session_start();
$_SESSION["tab"] = "New Receive";

if($_SESSION["login"] != 1)
    echo '<h2 txtcolor="red">Authentication Error!!!</h2>';
else{
    include_once('header.php');
    
    $pid = $_POST['pid'];  
    $units = $_POST['units']; 
    $hospital = $_POST['hospital']; 

    date_default_timezone_set("America/Los_Angeles");

    $date = date('y-m-d');
    $time = date('h:i');

    $sql_1 = "insert into Receive (person_id, received_date, received_time, received_quantity, received_hospital) values('$pid', '$date', '$time', '$units', '$hospital')";  
    $sql_2 = "update  Stock SET stock_quantity = stock_quantity - '$units' where Stock.stock_blood_group = (select person_blood_group FROM Person where person_id = '$pid')";

    if (($con->query($sql_1) === TRUE) and ($con->query($sql_2) === TRUE)) {
              
        echo 'your Receiving is succesful';
                
    }
    else {
        echo "Error: " . $sql . "<br>" . $con->error;
    }
    include_once('footer.php');
}
?>  