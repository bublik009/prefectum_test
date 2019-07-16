<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class PrivatBankAPI {


    public static $curl;

    public static $running;
    public static $answer;
    public static $curlvalue;
    static function getСurrentCourse()
    {
            self::$curl = curl_init();
            curl_setopt(self::$curl, CURLOPT_URL, 'https://api.privatbank.ua/p24api/pubinfo?exchange&json&coursid=11');
            curl_setopt(self::$curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt(self::$curl, CURLOPT_POST, false);
            self::$answer = curl_exec(self::$curl);

            curl_close(self::$curl);
            return self::$answer;
     }


  

}
