<html>
 <head>
  <title>Hello php/mysql</title>
  <style>
    table, th, td {
      border: 1px solid black;
      border-collapse: collapse;
    }
    th, td {
      padding: 5px;
      text-align: left;
    }
  </style>
 </head>
 <body>
 <h1>Hello php/mysql</h1>
<?php
error_reporting(E_ERROR);

$host = getenv("MYSQL_PORT_3306_TCP_ADDR");
$port = getenv("MYSQL_PORT_3306_TCP_PORT");
$database = getenv("MYSQL_ENV_MYSQL_DATABASE");
$username = getenv("MYSQL_ENV_MYSQL_USER");
$password = getenv("MYSQL_ENV_MYSQL_PASSWORD");

$remoteip = $_SERVER['REMOTE_ADDR'];
echo "<br>";
echo "Remote ip = ", $remoteip;
echo "<br>";
echo "<br>";

echo "Database connection info: ";
echo "<br> host = ", $host, "<br> port = " , $port, "<br> user = ", $username;
echo "<br> password = ", $password, "<br> database = " , $database;
echo "<br>";
echo "<br>";

$conn = mysqli_connect($host, $username, $password, $database, $port);
if ($conn) {
  echo "Database is available <br/>";
  $sql = "CREATE TABLE visitors (
          id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
          remoteip VARCHAR(15) NOT NULL,
          containerip VARCHAR(15) NOT NULL,
          visitstamp VARCHAR(30) NOT NULL)";
  if (mysqli_query($conn, $sql)) {
    echo "Table visitors created successfully <br/>";
  } else {
    echo mysqli_error($conn) . "<br/>";
  }

  $containerip = $_SERVER['SERVER_ADDR'];
  $visitstamp = date("D M j G:i:s T Y");
  $sql = "INSERT INTO visitors (remoteip, containerip, visitstamp)
          VALUES ('$remoteip', '$containerip', '$visitstamp')";

  if (mysqli_query($conn, $sql)) {
    echo "New record created successfully <br/>";
  } else {
    echo "Error: " . $sql . " - " . mysqli_error($conn) . "<br/>";
  }

  echo "<h3> Visitor Log </h3>";
  $sql = "SELECT id, remoteip, containerip, visitstamp FROM visitors";
  $result = mysqli_query($conn, $sql);
  if (mysqli_num_rows($result) > 0) {
    echo "<table><tr><th>Id</th><th>Remote IP</th><th>Container IP</th><th>Timestamp</th></tr>";
    while($row = mysqli_fetch_assoc($result)) {
        echo "<tr><td>" . $row["id"] . "</td><td>" . $row["remoteip"] . "</td><td>" . $row["containerip"] . "</td><td>" . $row["visitstamp"] . "</td></tr>";
    }
    echo "</table>";
  } else {
    echo "0 results";
  }

  mysqli_close($conn);
} else {
  echo "Database is not available";
}
?>
 </body>
</html>

