<?php


require_once __DIR__ . '/../../vendor/autoload.php';

use Leafo\ScssPhp\Server;

$directory = "scss";

Server::serveFrom($directory);
?>
