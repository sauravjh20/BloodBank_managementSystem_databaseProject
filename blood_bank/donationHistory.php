<?php
session_start();
$_SESSION["tab"] = "Donation History";

if($_SESSION["login"] != 1)
    echo '<h2>Authentication Error!!!</h2>';
else{
    include_once('header.php');
    $sdate = $_POST['sdate'];  
    $edate = $_POST['edate'];  
    
    $sql = "select d.donation_date, d.donation_time, d.donation_quantity, p.person_id, p.person_name, person_phone, p.person_blood_group from Person p,Donation d where p.person_id = d.person_id and d.donation_date >= '$sdate' and d.donation_date <= '$edate'";  
    $result = mysqli_query($con, $sql);  
       

    echo "<h2>Donation History</h2><br>";            

    if ($result->num_rows > 0) {
        echo "<table>
        <tr>
        <th>Personal ID</th>
        <th>Name</th>
        <th>Phone</th>
        <th>Blood Group</th>
        <th>Date</th>
        <th>Time</th>
        <th>Units of Blood</th>
        </tr>";
        while($row = $result->fetch_assoc()) {
            echo "
            <tr>
            <td>" . $row["person_id"]. "</td>
            <td>" . $row["person_name"]."</td>
            <td>" .$row["person_phone"] ."</td>
            <td>" . $row["person_blood_group"]. "</td>
            <td>" . $row["donation_date"]. "</td>
            <td>" . $row["donation_time"]. "</td>
            <td>" . $row["donation_quantity"]. "</td>
            </tr>";
        }
        echo "</table> <br><br>";
    }
    else
        echo "No record found in the specified intervel";
    include_once('footer.php');
}
?>  