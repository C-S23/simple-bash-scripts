<?php
define("DATABASE_LOCAL", "localhost");
define("DATABASE_NAME", "Artstore");
define("DATABASE_USER", "fred");
define("DATABASE_PASSWD", "F5^7d");
$db = new mysqli(DATABASE_LOCAL,DATABASE_PASSWD,DATABASE_NAME,DATABASE_USER);
?>
