<?php

//Author: Niral Fernando  
//Email: niral.fernando@mgail.com

echo $_SERVER['CONTENT_TYPE'];

//the $post variable here stores an object
$post = json_decode(file_get_contents('php://input'));

$fp = fopen("fopen.txt","a");
if( $fp )
{
    //best way to access the value of key-value pair from the object stored in $post
    fwrite($fp, $post->target);
    
    fclose($fp);
    
    //"echo" cannot print Arrays and Objects
    echo "this has saved new data correctly" . date("H:i:s");
}

?>