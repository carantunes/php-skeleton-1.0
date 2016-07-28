<?php

class SmartySingleton
{
    static private $instance;

    static public function instance()
    {
        if( !isset( self::$instance ) )
        {

            if (function_exists('mb_internal_encoding')) {
                mb_internal_encoding('ISO-8859-1');
            }
            define('SMARTY_RESOURCE_CHAR_SET', 'ISO-8859-1');



            $smarty = new Smarty;

            $smarty->setTemplateDir(APP .'view/templates/');
            $smarty->setCompileDir(APP .'view/templates_c/');
            $smarty->setConfigDir(APP .'view/configs/');
            $smarty->setCacheDir(APP .'view/cache/');


            $smarty->debugging = false;
            $smarty->compile_check = true;


            self::$instance = $smarty;
        };
        return self::$instance;
    }

}
?>