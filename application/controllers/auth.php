<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('m_web');

		if ($this->session->userdata('islogin') == true) {
			redirect('web','refresh');
		}
	}

	//Splash Section 
	public function index()
	{
		$data['title'] = "Splash";

		$this->load->view('template/header', $data);
		$this->load->view('content/splash');
		$this->load->view('template/footer', $data);
	}
	// End Splash


	#Login Section 
	public function login(){

		$data['title'] = 'Login Panel';
		$this->load->view('content/login', $data);
	}

	public function act_login()
	{
		//decl var
		$nim = $this->input->post('nim');
		$password = md5($this->input->post('password'));

		//cek nim & pass
		$cek = $this->m_web->get_login($nim, $password);

		if ($cek->num_rows() > 0) 
		{
			//fetch data
			$dat = $cek->row();

			if ($dat->aktif == "Y") {
							//set session 
				$this->session->set_userdata('islogin', true);
				$this->session->set_userdata('nim', $nim);
				$this->session->set_userdata('nama', $dat->nama);
				$this->session->set_userdata('id_anggota', $dat->id_anggota);

				echo "1";
			}
			else
			{
				echo "2";
			}

		}
		else
		{
			echo "3";
		}
	}
	// end login 

	#cek nim
	public function cek_nim()
	{
		$nim = $this->input->post("nim");

		//cek
		$cek = $this->m_web->get_id('t_anggota', 'nim', $nim);

		if ($cek->num_rows() == 0) {
			echo "0";
		}
		else
		{
			echo "1";
		}
	}

	# Register Section
	public function register()
	{
		$data['id_anggota'] = $this->m_web->autonumber('t_anggota', 'id_anggota', 2, date('Ymd'));
		$this->load->view('content/register', $data);
	}

	public function act_register()
	{
		$nim = $this->input->post('nim');
		$nama = $this->input->post('nama');
		$alamat = $this->input->post('alamat');
		$telp = $this->input->post('telp');
		$email = $this->input->post('email');
		$password = $this->input->post('password');

		$id_anggota = $this->m_web->autonumber('t_anggota', 'id_anggota', 3, date('Ym'));

		$record = array(
							'id_anggota' => $id_anggota,
							'nim' => $nim, 
							'nama' => $nama,
							'alamat' => $alamat,
							'email' => $email,
							'telp' => $telp,
							'pass' => md5($password),
							'tanggal' => date('Y-m-d'),
							'aktif' => 'N'
						);
	 	$this->m_web->insertData('t_anggota', $record);
		$this->load->view('content/succes_register');
	}

}

/* End of file auth.php */
/* Location: ./application/controllers/auth.php */