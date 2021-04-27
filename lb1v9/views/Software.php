<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Software</title>
</head>
<body>
<?php
include("../php/dbConnect.php");

$softwareSql = 'SELECT DISTINCT `name` FROM `software`';

echo '<form method="get" action= "../php/getComputersBySoftware.php">';

echo "<select name='name'><option> Choose the software </option>";

foreach($db->query($softwareSql) as $row) {
    echo "<option value='" . $row['name'] . "'>" . $row['name'] . "</option>";
}

echo "</select>";
echo '<input type="submit" value="ОК"><br>'
?>
</body>
</html>



