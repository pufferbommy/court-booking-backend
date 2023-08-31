<?php
  require_once('db.php');

  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $request = json_decode(file_get_contents('php://input'), true);

    $court = $request['court'];
    $timeRange = $request['timeRange'];
    $userId = $request['userId'];

    $query = "SELECT * FROM bookings WHERE court = :court AND timeRange = :timeRange AND date = CURDATE()";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':court', $court, PDO::PARAM_STR);
    $stmt->bindParam(':timeRange', $timeRange, PDO::PARAM_STR);
    $stmt->execute();
    $rows = $stmt->fetch(PDO::FETCH_ASSOC);

    if(!empty($rows)) {
      echo json_encode(false);
      return;
    }

    $query = "INSERT INTO bookings (court, timeRange, userId, date) VALUES (:court, :timeRange, :userId, CURDATE())";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':court', $court, PDO::PARAM_STR);
    $stmt->bindParam(':timeRange', $timeRange, PDO::PARAM_STR);
    $stmt->bindParam(':userId', $userId, PDO::PARAM_STR);
    $stmt->execute();
    echo json_encode(true);
  } else if ($_SERVER["REQUEST_METHOD"] == "DELETE") {
    $query = "DELETE FROM bookings WHERE id = :id";
    $stmt = $conn->prepare($query);
    $id = $_GET['id'];
    $stmt->bindParam(':id', $id, PDO::PARAM_STR);
    $stmt->execute();
    echo json_encode(true);
  }
?>