<?php
session_start();
$_SESSION["tab"] = "Search Person";

if($_SESSION["login"] != 1)
    echo '<h2 txtcolor="red">Authentication Error!!!</h2>';
else{
    include_once('header.php');

    $pid = $_POST['pid'];  
    $sql = "select * from Person where person_id = '$pid'";  
    $result = mysqli_query($con, $sql);  
    $row = mysqli_fetch_array($result);  
    $count = mysqli_num_rows($result);  

    if($count == 1){  
        $pname = $row['person_name'];
        $gender = $row['person_gender'];
        $phone = $row['person_phone'];
        $dob = $row['person_dob'];
        $blood_group = $row['person_blood_group'];
        $address = $row['person_address'];
        $med_issues = $row['person_med_issues'];





        echo'<h2>' .$pname .'</h2><br><br>';
        echo'Personal Id : '.$pid .'<br><br>';
        echo'Name : '.$pname .'<br><br>';
        echo 'Phone Number: ' .$phone .'<br><br>';
        echo 'DOB : ' .$dob .'<br><br>';
        echo 'Blood Group : ' .$blood_group .'<br><br>';
        echo 'Gender : ';
        if ($gender === 'm')
            echo 'Male<br><br>'; 
        if ($gender === 'f')
            echo 'Female<br><br>'; 
        if ($gender === 'o')
            echo 'Others<br><br>'; 
        echo 'Address : ' .$address .'<br><br>';
        echo 'Medical Issues : ';
        if ($med_issues === "")
            echo 'None<br><br><br>';



        echo'<h3>Donation History</h3><br>';

        $sql = "select * from Donation where person_id = '$pid'";  

        $result = mysqli_query($con, $sql);  


        if ($result->num_rows > 0) {
            echo "<table><tr><th>Date of Donation</th><th>Time of Donation</th><th>Units of blood</th></tr>";
            while($row = $result->fetch_assoc()) {
                echo "<tr><td>" . $row["donation_date"]. "</td><td>" . $row["donation_time"]."</td><td>" .$row["donation_quantity"] ."</td></tr>";
            }
            echo "</table> <br><br>";
        }

        else
            echo "No donations Yet";

        echo'<h3>Receiving History</h3><br>';

        $sql = "select * from Receive where person_id = '$pid'";  

        $result = mysqli_query($con, $sql);  


        if ($result->num_rows > 0) {
            echo "
            <table>
            <tr>
            <th>Date of Receive</th>
            <th>Time of Receive</th>
            <th>Units of blood</th>
            <th>Hospital</th>
            </tr>";

            while($row = $result->fetch_assoc()) {
                echo "
                <tr>
                <td>" . $row["received_date"]. "</td>
                <td>" . $row["received_time"]."</td>
                <td>" .$row["received_quantity"] ."</td>
                <td>" .$row["received_hospital"] ."</td>
                </tr>";
            }
            echo "</table> <br>";
        }

        else
            echo "No Receives Yet";

    }  
    else{
        echo 'Person with pid: ' .$pid .' not found!
        <br>Please provide a valid personal id';
    }
    include_once('footer.php');
}
?>  