<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_coba extends CI_Model {

		public function get_all($table)
		{
			return $this->db->get($table);
		}

		public function insertData($table, $record)
		{
			$this->db->insert($table, $record)
		}

		public function deleteData($table, $key, $value)
		{
			$this->db->where($key, $value);
			$this->db->get($table);
		}
}

/* End of file modelName.php */
/* Location: ./application/models/modelName.php */