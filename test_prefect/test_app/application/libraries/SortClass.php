<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class SortClass {
    
private $column_1;
private $column_2;
private $column_3;
private $newData;
    public function getSortedArray($data)
    {
      $this->column_1 = array_column($data, 0);
      $this->column_2 = array_column($data, 1);
      $this->column_3 = array_column($data, 2);
      array_multisort($this->column_1, SORT_ASC, $this->column_2, SORT_ASC, $this->column_3 ,SORT_ASC);
foreach ($data as $rowKey => $rowValue) {
                            $data[$rowKey] = array(
                                            $this->column_1[$rowKey],
                                            $this->column_2[$rowKey],
                                            $this->column_3[$rowKey]
                                            );
                    }
                    return $data;

    }
}
