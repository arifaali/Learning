<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Admin extends CI_Controller{

	public function __construct(){
		parent::__construct();

		$this->load->helper(array('form', 'url'));

        $this->load->library('form_validation');

        $this->load->library('session');

        $this->load->model('admin_model');
	}

	public function index(){ 
		//https://www.formget.com/form-login-codeigniter/
		 $this->load->view('a_login');
	}

	public function login(){ 

	 	$this->form_validation->set_rules('userEmail', 'Username', 'required');
        $this->form_validation->set_rules('userPwd', 'Password', 'required');

        if ($this->form_validation->run() == FALSE)
        {
                $this->index();
        }
        else
        { 
        	$data = array(
				'username' => $this->input->post('userEmail'),
				'password' => $this->input->post('userPwd')
				);
        	
        	$result = $this->admin_model->checkLogin($data);
        	if ($result != false) {
				$session_data = array(
				'username' => $result[0]->admin_id,
				'email' => $result[0]->user_name,
				);
				// Add user data in session
				$this->session->set_userdata('logged_in', $session_data);
				$this->load->view('dashboard');
			}else {
				$data = array(
				'error_message' => 'Invalid Username or Password'
				);
				$this->load->view('a_login', $data);
			}
        }
	}

	public function addCategory(){
		$this->form_validation->set_rules('category', 'Category Name', 'required');
		if ($this->form_validation->run() == FALSE)
        {
                $this->load->view('addCategory');
        }
        else
        {
        	$config['upload_path'] = 'assets/images/category/';
	        $config['allowed_types'] = 'gif|jpg|png';
	        $config['max_size'] = 2000;
	        $config['max_width'] = 1500;
	        $config['max_height'] = 1500;

	        $this->load->library('upload', $config);

	        if (!$this->upload->do_upload('category_image')) {
	            $error = array('error' => $this->upload->display_errors());

	            $this->load->view('addCategory', $error);
	        } else {

	        	$upload_data = $this->upload->data();
				$data['pic_file'] = $upload_data['file_name'];
	            $data = array('image_metadata' => $this->upload->data());

	            $this->load->view('files/upload_result', $data);
	        }
        }
		$this->load->view('addCategory');
	}
}
?>