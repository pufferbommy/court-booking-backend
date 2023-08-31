<?php
  require_once('db.php');

  if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $query = "SELECT * FROM bookings WHERE userId = :userId ORDER BY date DESC";
    $stmt = $conn->prepare($query);
    $userId = $_GET['userId'];
    $stmt->bindParam(':userId', $userId, PDO::PARAM_STR);
    $stmt->execute();
    $bookings = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($bookings);
  }
?>