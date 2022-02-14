<?php
session_start();
echo "your number is".$_SESSION['count'];
session_destroy();
?>
