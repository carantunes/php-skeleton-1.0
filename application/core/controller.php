<?php

class Controller
{
    /**
     * @var null Database Connection
     */
    public $db = null;

    /**
     * @var Directory in templates folder
     */
    public  $directory;

    /**
     * @var null Model
     */
    public $model = null;

    /**
     * @var Smarty Singleton
     */
    public $smarty;

    /**
     * Whenever controller is created, open a database connection too and load "the model".
     */
    function __construct()
    {
        require APP . 'libs/smarty_singleton.php';
        $this->smarty = SmartySingleton::instance();
        $this->openDatabaseConnection();
        $this->loadModel();
        $this->directory = strtolower(get_called_class()) . DIRECTORY_SEPARATOR;
        $this->smarty->assign('URL', URL);
    }

    /**
     * Open the database connection with the credentials from application/config/config.php
     */
    private function openDatabaseConnection()
    {
        // set the (optional) options of the PDO connection. in this case, we set the fetch mode to
        // "objects", which means all results will be objects, like this: $result->user_name !
        // For example, fetch mode FETCH_ASSOC would return results like this: $result["user_name] !
        // @see http://www.php.net/manual/en/pdostatement.fetch.php
        $options = array(PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ, PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING);

        // generate a database connection, using the PDO connector
        // @see http://net.tutsplus.com/tutorials/php/why-you-should-be-using-phps-pdo-for-database-access/
        $this->db = new PDO(DB_TYPE . ':host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=' . DB_CHARSET, DB_USER, DB_PASS, $options);
    }

    /**
     * Loads the "model".
     * @return object model
     */
    public function loadModel()
    {
        require APP . 'model/model.php';
        // create new "model" (and pass the database connection)
        $this->model = new Model($this->db);
    }


    public function displayTemplate($name){
        $this->smarty->display($this->directory . $name . '.tpl');
    }
}
