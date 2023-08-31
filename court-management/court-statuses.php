<?php
  require_once('db.php');

  if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $query = "SELECT bookings.court, bookings.timeRange, users.fullName FROM bookings LEFT JOIN users ON bookings.userId = users.id WHERE date = CURDATE()";
    $stmt = $conn->prepare($query);
    $stmt->execute();
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $courtAmount = 4;
    $timeRanges = [
      "18:00 - 18:30",
      "18:30 - 19:00",
      "19:00 - 19:30",
      "19:30 - 20:00",
    ];

    for ($i = 1; $i <= $courtAmount; $i++) {
      foreach ($timeRanges as $timeRange) {
        $status = [
          "bookedBy" => '',
          "isBooked" => false,
        ];
        foreach ($rows as $row) {
          if ($row['court'] == $i && $row['timeRange'] == $timeRange) {
              $status['isBooked'] = true;
              $status['bookedBy'] = $row['fullName'];
              break;
          }
        }
        $courtStatuses[$i][$timeRange] = $status;
      }
    }
   
    echo json_encode($courtStatuses);
  }
?>