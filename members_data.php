<?php
session_start();
if(!isset($_SESSION['user'])) {
    header('location:login.php');
}

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');
header('Access-Control-Allow-Methods: *');
header('Access-Control-Allow-Credentials: true');
header('Content-type: application/json');

$Hostname = 'localhost';
$Username = 'root';
$Password = '';
$Database = 'capstone';

$batch = filter_var($_POST['batch'], FILTER_SANITIZE_STRING);
$name = filter_var($_POST['name'], FILTER_SANITIZE_STRING);
$age = filter_var($_POST['age'], FILTER_SANITIZE_STRING);
$cellphone = filter_var($_POST['cellphone'], FILTER_SANITIZE_STRING);
$image = filter_var($_POST['image'], FILTER_SANITIZE_STRING);
$location = filter_var($_POST['location'], FILTER_SANITIZE_STRING);
$work = filter_var($_POST['work'], FILTER_SANITIZE_STRING);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $mysqli = new mysqli($Hostname, $Username, $Password, $Database);

    if ($mysqli->connect_error) {
        die('Connection failed: ' . $mysqli->connect_error);
    }

    $stmt = $mysqli->prepare("INSERT INTO members (batch, name, age, cellphone, image, location, work) VALUES ('$batch', '$name', '$age', '$cellphone', '$image', '$location', '$work')");
    $stmt->bind_param("sssssss", $batch, $name, $age, $cellphone, $image, $location, $work);
    $stmt->execute();

    if (!$stmt) {
        die("Error in the query: " . $mysqli->error);
    }

    echo json_encode(array("message" => "Client data inserted successfully"));
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Members Data - <?php echo $_SESSION['user'];?></title>

    <style>
      .tables-scroll table, th, td, tr {
        border: 1px solid gray;
        border-collapse: collapse;
        font-size: 15px;
        margin-top: 0px;
        margin-left: 1px;
        text-align: center;
        padding: 2px;  
      }

      table td {
            background-color: white;
            
        }
        table th {
            color: white;
            position: sticky;
            top: 0;
            background-color: #fff; /* Set the background color of the fixed header here */
            border: 1px solid black;
            background: #3A6050 ;
        }

        .tables-scroll {
            overflow-y: scroll;
            height: 450px;
            width: 1396px;
            position: relative;
            top: -30px;
            margin-top: 30px;
        }

        .tables-scroll table {
            width: 1395px;
        }

        table tr {
          height: 30px;
        }

        .tables-scroll {
            overflow: auto;
          }
    </style>

</head>


<body>
<div style="width: 0px; height:0px; position: relative">
<!-- background -->
  <div style="width: 1525.5px; height: 696px; left: -8px; top: -8px; position: absolute; background: #D9D9D9; border: none"></div>
  <div style=" left: 400px; top: 99px; position: absolute; text-align: center; color: #3A6050; font-size: 36px; font-family: sans-serif; width: 700px; font-weight: bold; word-wrap: break-word">MEMBERS DETAILS</div>
  <!-- green -->
  <div style="width: 1525.5px; height: 73.55px; left: -8px; top: -8px; position: absolute; background: #3A6050"></div>
  <a href="home.php"><img src="home_icon.png" alt="" style="height: 40px; width: 40px; left: 20px; top: 13px; position: absolute; background: white; border-radius: 50px"></a>
  <div style="width: 110px; left: 60px; top: 8px; position: absolute; text-align: center; color: white; font-size: 36px; font-family: Inter; font-weight: 700; word-wrap: break-word">e-PaL</div>
  <div class="admin" style="position: relative; top: 13px; left: 680px; display: flex;">
    <img src="admin_avatar.png" alt="" style="height: 40px; width: 40px; postion: absolute; background: white; border-radius: 50px">
    <div style="color: white; position: absolute; left: 55px; top: 8px; font-family: sans-serif; font-size: 20px"><?php echo $_SESSION['user'];?></div>
  </div>

  <div class="w3-container">
  <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:500px">

      <div class="w3-center" style="font-size: 15px;"><br>
        <!-- <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span> -->
        <b><h3 style="font-family: sans-serif; font-weight: bold;">VALID ID</h3></b>
      </div>

      <div class="w3-container w3-border-top w3-padding-16" style="background: #3A6050">   
        <div style=""><br>
        <div style="position: relative; left: 110px; font-size: 20px">
        

            <div class="image">
                <img id="modalImage" src="" alt="Image Here">
            </div>        
                  
        </div>
        <br>
        <center>
          
          <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red" style="width: 100px; border-radius: 10px; margin-left: 10px; height: 50px; font-family: sans-serif; font-weight: bold;">Cancel</button>
        </center>
       
      </div>

    </div>
  </div>
</div>

<script>
    function displayImage(image) {
        var imageElement = document.getElementById("modalImage");
        imageElement.src = image;

        document.getElementById('id01').style.display = 'block';
    }
</script>


  <div style="width: 1398px; height: 452px; left: 65px; top: 200px; position: absolute; background: #D9D9D9; border-radius: 0px; border: none;">
  <div class="tables-scroll">
      <table>
        <tr>
          <th>Code</th>
          <th>Full Name</th>
          <th>Age</th>
          <th>Gender</th>
          <!-- <th>Image</th> -->
          <th>Gcash</th>
          <th>Location</th>
          <th>Work/Business</th>
          <th>Action</th>
        </tr>

        <?php
            // Database connection settings
            include "db_connect.php";

            // Check if the connection was successful

            // Initialize the SQL query
            $sql = "SELECT * FROM members";

            // Check if a category is selected
            if (isset($_POST['fetch_batch']) && $_POST['fetch_batch'] != 'all') {
                $selectedCategory = $_POST['fetch_batch'];
                $sql .= " WHERE batch = '$selectedCategory'";
            }

            // Execute the query
            $result = $con->query($sql);

            if ($result->num_rows > 0) {
                
                while ($row = $result->fetch_assoc()) {
                  echo "<tr>";
                  echo "<td>" . $row['batch'] . "</td>";
                  echo "<td>" . $row['name'] . "</td>";
                  echo "<td>" . $row['age'] . "</td>";
                  echo "<td>" . $row['gender'] . "</td>";
                  // echo "<td>" . $row['image'] . "</td>";
                  echo "<td>" . $row['cellphone'] . "</td>";
                  echo "<td>" . $row['location'] . "</td>";
                  echo "<td>" . $row['work'] . "</td>";
                    // icon sa table
                    echo "<td><a href='#' onclick='displayImage(\"" . $row['image'] . "\")'><i class='fas fa-eye' style='font-size: 30px'></i></a> | <a href='#' onclick='confirmDelete(" . $row['id'] . ")'><i class='fas fa-trash' style='color: red; font-size: 30px'></i></a></td>";


                  echo "</tr>";
                }

            } else {
                echo "<script>alert('NO RECORD FOUND !!')</script>";
            }

            // Initialize the SQL query
                $sql = "SELECT * FROM members";

                // Check if a batch is selected
                if (isset($_POST['fetch_batch']) && $_POST['fetch_batch'] != 'all') {
                    $selectedBatch = $_POST['fetch_batch'];
                    // Modify your SQL query to filter by batch
                    $sql .= " WHERE batch = '$selectedBatch'";
                }

                // Execute the query
                $result = $con->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        // Display the data in the table
                        echo "<tr>";
                      echo "<td>" . $row['batch'] . "</td>";
                      echo "<td>" . $row['name'] . "</td>";
                      echo "<td>" . $row['age'] . "</td>";
                      echo "<td>" . $row['gender'] . "</td>";
                      // echo "<td>" . $row['image'] . "</td>";
                      echo "<td>" . $row['cellphone'] . "</td>";
                      echo "<td>" . $row['location'] . "</td>";
                      echo "<td>" . $row['work'] . "</td>";
                      echo "<td><a href='?id=" . $row['id'] . "'><i class='fas fa-eye' style='font-size: 30px'></i></a> | <a href='#' onclick='confirmDelete(" . $row['id'] . ")'><i class='fas fa-trash' style='color: red; font-size: 30px'></i></a></td>";
                      echo "</tr>";
                    }
                } else {
                    echo "<script>alert('NO RECORD FOUND !!')</script>";
                }

            // Close the database connection
            $con->close();
            ?>
      </table>

                          <script>
                              function confirmDelete(id) {
                                  if (confirm("If you 'OK' this details will be surely deleted.")) {
                                      // If user clicks "OK," redirect to the delete script with the record ID
                                      window.location.href = "members_data_delete.php?id=" + id;
                                  }
                              }
                          </script>

    </div>
  </div>


  <form method="post">
  <div style="width: 216px; height: 52px; left: 1190px; top: 140px; position: absolute">
    <label for="fetch_batch">Select Category:</label>
    <select name="fetch_batch" id="fetch_batch" style="width: 216px; height: 52px; left: 0px; top: 0px; position: absolute; border-radius: 10px; background: #3A6050; color: white">
      <option style="text-align: center; font-size: 20px;" value="batch_1">--BATCH 1--</option>
      <option style="text-align: center; font-size: 20px;" value="batch_2">--BATCH 2--</option>
      <option style="text-align: center; font-size: 20px;" value="batch_3">--BATCH 3--</option>
      <option style="text-align: center; font-size: 20px;" value="batch_4">--BATCH 4--</option>
      <option style="text-align: center; font-size: 20px;" value="batch_5">--BATCH 5--</option>
    </select>

    <button type="submit" style="width: 52px; height: 52px; left: 220px; top: 0px; position: absolute; border-radius: 10px; background: #3A6050; color: white; border: none;">
      <i class="fa fa-search"></i>
    </button>
  </div>
</form>


  <!-- LOG OUT -->
  <a href="logout.php">
    <!-- <img style="width: 42px; height: 42px; left: 1453px; top: 12px; position: absolute; border-radius: 50px" src="logoutpic.jpg" /> -->
    <i class="fa fa-sign-out" style="font-size:40px;color:white;  left: 1440px; top: 13px; position: absolute;"></i>
  </a>
</div>
</body>
</html>