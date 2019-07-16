<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Test extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{

    $this->load->library('PrivatBankAPI');

    $data = array();

    $data['currCourse'] = json_decode(PrivatBankAPI::getСurrentCourse());
	  foreach($data['currCourse'] as $valutnaPara)
		{
		$insertingData[$valutnaPara->ccy.'_buy'] = $valutnaPara->buy;
		$insertingData[$valutnaPara->ccy.'_sale'] = $valutnaPara->sale;
  	}
		$this->load->helper('array');
		$insertingData = elements(array('USD_buy', 'USD_sale', 'EUR_buy', 'EUR_sale'), $insertingData);
    $this->load->model('third_test_model','', TRUE);
		$this->third_test_model->setRecord($insertingData);

    $this->output->cache(10);
    //$this->load->model('thirdTestModel');
		$this->load->view('thirdTestView', $data);
	}
	public function history()
	{



    $data = array();
    $this->load->model('third_test_model','', TRUE);
		$data['history'] = $this->third_test_model->getRecords(array($_GET['start'], $_GET['end']));
		$data['period'] = $_GET['start']." "."-"." ".$_GET['end'];

    //$this->load->model('thirdTestModel');
		$this->load->view('thirdTestHistoryView', $data);
	}
	public function firsttest()
	{
		$this->load->library('CustomArray');
		$this->load->library('SortClass');
		$data['array'] = (new SortClass)->getSortedArray(CustomArray::$dataArray);



    //$this->load->model('thirdTestModel');
		$this->load->view('firstTestView', $data);
	}

}
