<?php

/**
 * HomeController.php - simplekb Home Controller
 *
 * This source-code is part of the simplekb project - a simple PHP-based knowledgebase
 * by Oddmatics:
 * <<https://www.oddmatics.uk>>
 *
 * Author(s): Rory Fewell <roryf@oddmatics.uk>
 */

rzLoadLibrary('Rzmvc.Mvc');

use \Rzmvc\Mvc\Controller;

/**
 * Represents the controller responsible for handling requests for / .
 */
final class HomeController extends Controller
{
    // HANDLES /
    public function index()
    {
        $this->view('index');
    }
}

?>
