<?php
$ar=['peter'=>23,'alice'=>30,'bob'=>40,'jenny'=>50];
echo "<table border=1><tr><th>Name</th><th>Age</th></tr>";
foreach($ar as $key=>$value)
{
echo "<tr><td>$key</td><td>$value</td></tr>";
}
echo "</table>";
?>

