<?php
/*$servidor="remotemysql.com";
$username="FzhnWzfWhw";
$password="4lwAqoEP8s";
$db="FzhnWzfWhw";*/

/*$servidor="controler.com.co";
$username="control3_cosechafresca1";
$password="ctj9jN7ePPt@";
$db="control3_cosechafresca1";*/

$servidor="127.0.0.1";
$username="root";
$password="";
$db="basegeneral";


/*$servidor="127.0.0.1";
$username="root";
$password="";
$db="generalfresca";*/

$conn = mysqli_connect($servidor,$username,$password,$db) or die(mysqli_error());

?>
