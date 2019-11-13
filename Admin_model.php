<?php
Class Admin_model extends CI_Model { 
	
  	Public function __construct() { 
         parent::__construct(); 
  	} 

  	public function checkLogin($data){ 
      	$password = md5($data['password']);
      	$condition = "user_name =" . "'" . $data['username'] . "' AND " . "user_password =" . "'" . $password . "'";
		$this->db->select('*');
		$this->db->from('tbl_admin_login');
		$this->db->where($condition);
		$this->db->limit(1);
		$query = $this->db->get();

		if ($query->num_rows() == 1) {
		return $query->result();
		} else {
		return false;
		}
  	}

  	public function storeCategory($data){
		$insert_data['pic_title'] = $data['pic_title'];
		$insert_data['pic_desc'] = $data['pic_desc'];
		$insert_data['pic_file'] = $data['pic_file'];

		$query = $this->db->insert('pictures', $insert_data);
	}

} 
?>