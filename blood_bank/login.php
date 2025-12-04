<?php      
session_start();
include('connection.php'); 


if(isset($_POST['submit'])){

    
    $username = stripcslashes($_POST['user']);  
    $username = mysqli_real_escape_string($con, $username);  
    $password = stripcslashes($_POST['pass']);  
    $password = mysqli_real_escape_string($con, $password);  

    if($username === '' or $password === ''){
        $_SESSION["login_error"] = 'username or password cannot be empty';
        header('Location: index.php');
    }

    else{
    
        $sql = "select * from user where username = '$username' and password = '$password'";  
        $result = $con->query($sql);

        
        if($result->num_rows > 0){  
            $row = $result->fetch_assoc();
            $_SESSION["login"] = 1;
            $_SESSION["username"] = $row["username"];
            header('Location: Home.php');
        }  

        
        else{
            $_SESSION["login"] = 0;
            $_SESSION["login_error"] = 'invalid login credentials';
            header('Location: index.php');
        }
    }
} 


else
    header('Location: index.php');
?>