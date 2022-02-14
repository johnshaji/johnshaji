<?php
$ar=[5,2,1,4];
echo "count:".count($ar)."<br>";
sort($ar);
echo "Sorted Array:";
for($i=0;$i<count($ar);$i++)
echo $ar[$i]." ";
?>
