<?php
session_start();
sesion_destroy();
if($_SESSSION['COUNT'])
echo "session value is deleted";
?>
