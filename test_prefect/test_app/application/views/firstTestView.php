<?php
defined('BASEPATH') OR exit('No direct script access allowed');



?>
 <!doctype html>
<html lang=\"en\">
<head>
  <title>The HTML5 Herald</title>

</head>
<body>
  <table>
    <?php foreach($array as $row){ ?>
        <tr>
          <td><?= $row[0]?></td>
          <td><?= $row[1]?></td>
          <td><?= $row[2]?></td>
        </tr>
    <?php } ?>

  </table>
</body>
</html>
