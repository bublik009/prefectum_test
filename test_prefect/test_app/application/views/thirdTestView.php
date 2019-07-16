<?php
defined('BASEPATH') OR exit('No direct script access allowed');




?>
<h1>Курс на сегодня:</h1>
<table>
      <tr>
        <td><?=$currCourse[0]->ccy.'/'.$currCourse[0]->base_ccy.'      '.'buy = '.$currCourse[0]->buy.'      '.'sale = '.$currCourse[0]->sale?></td>
      </tr>
      <tr>
        <td><?=$currCourse[1]->ccy.'/'.$currCourse[1]->base_ccy.'      '.'buy = '.$currCourse[1]->buy.'      '.'sale = '.$currCourse[1]->sale?></td>
      </tr>
    </table>
<h1>История курса за период</h1>
Временной диапазон
<form action="http://www.apelsun.test/index.php/test/history/" method="get">
<lable>Начиная с:</lable>
</br>
<input type="text" name='start'>
</br>
<lable>До:</lable>
</br>
<input type="text" name='end'>
</br>
<input type="submit" name='submit' value="Узнать курс">
</form>
