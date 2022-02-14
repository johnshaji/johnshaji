<html>
<body>
<center>
<?php
$Consumer_Name=$_POST["name"];
$Consumer_No=$_POST["number"];
$Previous_Reading=$_POST["read1"];
$Current_Reading=$_POST["read2"];
$read=$Previous_Reading-$Current_Reading;
echo "<h2> Welcome</h2><br>";
echo "Name : ".$Consumer_Name."<br><br>";
echo "consumer no : ".$Consumer_No."<br><br>";
echo "previous reading : ".$Previous_Reading."<br><br>";
echo "New reading : ".$Current_Reading."<br><br>";
echo "Total reading : ".$read."<br><br>";

if($read<=100)
{
	echo "Due amount is :".($read*3.12);
}
else if($read<=300)
{
	echo "Due amount is :".($read*5);
}
else if($read<=500)
{
	echo "Due amount is :".($read*7);
}

?>
</center>
</body>
</html>
