<?php 
include("dbConnect.php");

$stmt = $db->prepare("SELECT * FROM computer where quarantii = 'NO'");
$stmt->execute();

print "<table border='1'><tr><th> Computers without quarantee</th></tr>";
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    print "<tr><td>$row[netname]</td><td>$row[motherboard]</td><td>$row[ram_capacity]</td><td>$row[hdd_capacity]</td><td>$row[monitor]</td><td>$row[vendor]</td></tr>";
}
?>