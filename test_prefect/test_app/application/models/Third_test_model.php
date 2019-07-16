<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Third_test_model extends CI_Model {

	public function setRecord($data)
	{

		$this->db->insert('history', $data);

	}
  public function getRecords($dates)
  {
    $sql = 'SELECT * FROM history WHERE recordDate > ? AND recordDate < ? ORDER BY id';
  $response = $this->db->query($sql, array($dates[0], $dates[1]));
  return $response->result();
  }



}
