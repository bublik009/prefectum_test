<?php
defined('BASEPATH') OR exit('No direct script access allowed');



?>
<h1>История курса <?=$period?>:</h1>
<table>
  <?php foreach($history as $record){ ?>

      <tr>
        <td><h3><?=$record->recordDate?></h3></td>
      </tr>
      <tr>
        <td><?='USD'.'/'.'UAH'.'      '.'buy = '.$record->USD_buy.'      '.'sale = '.$record->USD_sale?></td>
      </tr>
      <tr>
        <td><?='EUR'.'/'.'UAH'.'      '.'buy = '.$record->EUR_buy.'      '.'sale = '.$record->EUR_sale?></td>
      </tr>
      <tr>
        <td>
          </br>
          </br>
        </td>
      </tr>

  <?php } ?>
    </table>
