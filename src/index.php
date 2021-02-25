<?php

/**
 * index.php - simplekb Index Script
 *
 * This source-code is part of the simplekb project - a simple PHP-based knowledgebase
 * by Oddmatics:
 * <<https://www.oddmatics.uk>>
 *
 * Author(s): Rory Fewell <roryf@oddmatics.uk>
 */

require('/usr/share/rzmvc/rzmvc.php');

rzLoadLibrary('Rzmvc.Mvc');

use \Rzmvc\Mvc\WebRouter;

$router = new WebRouter(__DIR__);

$router->route(
    $_GET['request_uri']
);

?>
