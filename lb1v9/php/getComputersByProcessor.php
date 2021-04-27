<?php 
include("dbConnect.php");

$name = $_GET['name'];

$stmt = $db->prepare("select c.* from computer c join processor p on c.fid_processor = p.id_processor where p.name = ?");
$stmt -> bindValue(1,$name);
$stmt->execute();

print "<table border='1'><tr><th> Computers with $name</th></tr>";
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    print "<tr><td>$row[netname]</td><td>$row[motherboard]</td><td>$row[ram_capacity]</td><td>$row[hdd_capacity]</td><td>$row[monitor]</td><td>$row[vendor]</td></tr>";
}
?>