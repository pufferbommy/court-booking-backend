<?php
  require_once('db.php');

  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $request = json_decode(file_get_contents('php://input'), true);

    $id = $request['id'];
    $password = $request['password'];

    $query = "SELECT * FROM users WHERE id = :id AND password = :password";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':id', $id, PDO::PARAM_STR);
    $stmt->bindParam(':password', $password, PDO::PARAM_STR);
    $stmt->execute();
    $rows = $stmt->fetch(PDO::FETCH_ASSOC);

    echo json_encode(!empty($rows));
  }
?>