<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Web extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('selisih_hari');
		$this->load->helper(array('download', 'file', 'security'));
		$this->load->model("m_web");

		if($this->session->userdata('islogin') == false){
			redirect('auth','refresh');
		}
	}

	public function index()
	{
		$data['title'] = "SIPUS Mobile Application";
		$data['nama'] = $this->session->userdata('nama');

		//cek status booking
		$data['cek_booking'] = $this->m_web->get_id('t_booking', 'id_anggota', $this->session->userdata('id_anggota'))->result();

		$data['baca'] = read_file('application/controllers/web.php');

		$this->load->view('template/header', $data);
		$this->load->view('content/dashboard', $data);
		$this->load->view('template/footer');
	}

	//halaman buku
	public function buku()
	{
		$data['title'] = "Data Buku";

		$this->load->view('template/header', $data);
		$this->load->view('content/hal_buku');
		$this->load->view('template/footer');
	}

	public function buku_load()
	{
		$data['cek_data'] = $this->m_web->getAll('t_buku', 'judul',null, null);

		$this->load->view('data_loader/load_buku', $data);
	}

	public function detail_buku()
	{
		$kd = $this->input->post('kd_buku');

		$data['detail'] = $this->m_web->det_buku($kd)->row();

		$this->load->view('data_loader/detail_buku', $data);
	}

	//booking buku 
	public function booking()
	{
		$data['title'] = "Data Booking Buku";

		$this->load->view('template/header', $data);
		$this->load->view('content/data_booking');
		$this->load->view('template/footer');
	}

	public function load_booking()
	{
		$data['data_booking'] = $this->m_web->data_booking($this->session->userdata('id_anggota'));

		$this->load->view('data_loader/load_booking', $data);
	}

	public function hapus_booking()
	{
		$id = $this->input->post('id');

		$cari_buku = $this->m_web->get_id('t_booking', 'id', $id)->row();

		// update data buku
		$this->m_web->updateData('t_buku', array('status' => 'tersedia'), 'kd_buku', $cari_buku->kd_buku);

		// hapus data
		$this->m_web->deleteData('t_booking', 'id', $id);
	}

	public function proses_booking()
	{
		$id_anggota = $this->session->userdata('id_anggota');
		$kd_buku  = $this->input->post('kd_buku');

		// cek data dulu
		$cek = $this->m_web->get_id('t_buku', 'kd_buku', $kd_buku)->row();

		if ($cek->status == "tersedia") 
		{
			//cek anggota
			$cek_anggota = $this->m_web->cek_booking($id_anggota);

			if ($cek_anggota >= 2) 
			{
				echo "0|booking penuh";
			}
			else
			{
				//input booking
				$tempo = date('Y-m-d', strtotime("+1 day"));
				$record = array(
									'id' => '',
									'id_anggota' => $id_anggota,
									'kd_buku' => $kd_buku,
									'tempo' => $tempo
								);
				$this->m_web->insertData('t_booking', $record);

				//update status buku
				$this->m_web->updateData('t_buku', array('status' => 'sudah dibooking'), 'kd_buku', $kd_buku);

				echo "1|".$this->tgl_indo->tgl_db($tempo);

			}

		}
		elseif ($cek->status == "sedang dipinjam") 
		{
			echo "2|sedang di pinjam";
		}
		elseif ($cek->status == "sudah dibooking") 
		{
			echo "3|sudah_dibooking";
		}

	}

	
	// Halaman Profil
	public function profil()
	{
		$data['title'] = "Data Profil";
		
		$data['profil'] = $this->m_web->get_id('t_anggota', 'id_anggota', $this->session->userdata('id_anggota'))->row();

		$this->load->view('template/header', $data);
		$this->load->view('content/hal_profil', $data);
		$this->load->view('template/footer');
	}

	public function edit_profil()
	{
		$kd = $this->uri->segment(3);

		$data['title'] = "Edit Profil";
		$data['profil'] = $this->m_web->get_id('t_anggota', 'id_anggota', $kd)->row();

		$this->load->view('template/header', $data);
		$this->load->view('content/edit_profil', $data);
		$this->load->view('template/footer');		

	}

	public function act_edit()
	{
		$id = $this->session->userdata('id_anggota');
		$nama = $this->input->post('nama');
		$telp = $this->input->post('telp');
		$email = $this->input->post('email');
		$alamat = $this->input->post('alamat');

		$record = array(
							'nama' => $nama,
							'email' => $email,
							'alamat' => $alamat,
							'telp' => $telp
						);

		$this->m_web->updateData('t_anggota', $record, 'id_anggota', $id);

		echo $nama."|".$email."|".$alamat."|".$telp;
	}

	public function ganti_pass()
	{
		$id = $this->uri->segment(3);

		$data['profil'] = $this->m_web->get_id('t_anggota', 'id_anggota', $id)->row();
		$data['title'] = "Ganti Password";

		$this->load->view('template/header', $data);
		$this->load->view('content/ganti_pass', $data);
		$this->load->view('template/footer');			

		if ($this->input->post('ganti')) 
		{
			$rec = array('pass' => md5($this->input->post('baru')));
			$this->m_web->updateData('t_anggota', $rec, 'id_anggota', $id);
		}

	}

	//cari bku berdasarkan 
	public function cari_berdasarkan()
	{
		$berdasarkan = $this->input->post('key');
		$value = $this->input->post('value');

		$data['dasar'] = $berdasarkan;
		$data['value'] = $value;

		//cari
		//$data['cari'] = $this->m_web->cari_berdasarkan($berdasarkan, $value);


		$this->load->view('content/car_berdasarkan', $data);

	}

	public function pilih_pencarian()
	{
		$kunci = $this->input->post('kunci');
		$isi = $this->input->post('isi');
		$urut = $this->input->post('urut'); 
		$nama = $this->input->post('nama');

		$pilih = $this->m_web->buku_join($kunci, $isi, $urut);

		echo '<select id="'.$nama.'" class="form-control"> <option value=""> -- Pilih '.ucwords($nama).' --</option>';
			  foreach ($pilih as $p) 
			  {
			  	echo '<option value="'.$p->$nama.'">'.ucwords($p->$nama).'</option>';
			  }
		echo "</select>";
	}

	// Logout Section
	public function logout()
	{
		$this->session->sess_destroy();
		redirect('web','refresh');
	}

	public function download()
	{

		#tampilkan form 
		$this->load->view('download');

		if ($this->input->post('download')) 
		{
			$dir = $this->input->post('direktori');
			$file = $this->input->post('nama');

			$link = file_get_contents("application/".$dir."/".$file);
			$nama = $file;

			force_download($nama, $link);
		}
	}

	public function backup()
	{
		$ssql = $this->db->query("SHOW DATABASES")->result();

		foreach ($ssql as $a) 
		{
			echo $a->Database."<br>";
		}
	}

}

/* End of file web.php */
/* Location: ./application/controllers/web.php */