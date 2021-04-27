<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Processor</title>
</head>
<body>
<?php
include("../php/dbConnect.php");

$softwareSql = 'SELECT DISTINCT `name` FROM `processor`';

echo '<form method="get" action= "../php/getComputersByProcessor.php">';

echo "<select name='name'><option> Choose the processor </option>";

foreach($db->query($softwareSql) as $row) {
    echo "<option value='" . $row['name'] . "'>" . $row['name'] . "</option>";
}

echo "</select>";
echo '<input type="submit" value="ОК"><br>'
?>
</body>
</html>



