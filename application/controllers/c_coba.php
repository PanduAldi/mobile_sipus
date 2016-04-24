 <?php
 defined('BASEPATH') OR exit('No direct script access allowed');
 
 class C_coba extends CI_Controller {
 
 	public function _construct()
 	{
 		parent::__construct();
 		$this->load->model("m_coba");
 		$this->load->library(array("form_validation", "upload"));
 	}

 	public function index()
 	{
 		$data["title"] = "Tampil";

 		$this->load->view("template/header", $data);
 		$this->load->view('coba/index');
 		$this->load->view("template/footer", $data);

 	}

 	public function tambah_data()
 	{
 		$data["title"] = $this->title_data()->tambah;
		
		$this->__rules();

		if ($this->form_validaition->run() == true) 
		{
			//upload
			$config['upload_path'] = './img/';
			$config['allowed_types'] = 'gif|jpg|png';
			$config['max_size']  = '2000';
			$config['max_width']  = '2024';
			$config['max_height']  = '1768';
			
			$this->upload->initialize($config);
			
			if ( ! $this->upload->do_upload("foto")){
				$data = array('error' => $this->upload->display_errors());
			}
			else
			{
				$info = $this->upload->data();
				$file = $info['file_name'];

				$record = array('id'=>'', 'nama'=>$this->input->post('nama'), 'tgl_lahir'=>$this->input->post("tgl_lahir"), 'foto'=>$file);

				$this->m_coba->insertData("t_coba", $record);
				redirect('c_coba','refresh');
			}
		}


		$this->load->view("template/header", $data);
 		$this->load->view('coba/tambah');
 		$this->load->view("template/footer", $data);
 		
 	}

 	public function __rules()
 	{
 		$this->form_validation->set_rules("nama", "Nama", "required");
 		$this->form_validarion->set_error("tgl_lahir", "tgl_lahir", "required");
 		$this->form_validation->set_error_delimiters('<div class="text-danger">', "</div>");
 	}
 
 }
 
 /* End of file c_coba.php */
 /* Location: ./application/controllers/c_coba.php */