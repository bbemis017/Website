<?php

use Phalcon\Mvc\Controller;

class IndexController extends Controller
{

    public function indexAction()
    {
	$this->view->pick("index.phtml");

	$this->view->test = 'yes';
	

    }
}
?>
