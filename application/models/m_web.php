<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_web extends CI_Model {

	public function getAll($table, $urut, $limit, $offset)
	{
		$this->db->order_by($urut, 'ASC');
		return $this->db->get($table, $limit, $offset);
	}
	
	public function get_id($table, $key, $value)
	{
		$this->db->where($key, $value);
		return $this->db->get($table);
	}	

	public function countAll($table)
	{
		$this->db->count_all($table);
	}

	public function insertData($table, $record)
	{
		$this->db->insert($table, $record);
	}

	public function updateData($table, $record, $key, $value)
	{
		$this->db->where($key, $value);
		$this->db->update($table, $record);
	}

	public function deleteData($table, $key, $value)
	{
		$this->db->where($key, $value);
		$this->db->delete($table);
	}

	public function get_login($username, $password)
	{
		$this->db->where('nim', $username);
		$this->db->where('pass', $password);
		return $this->db->get('t_anggota');
	}

	//auto number
	public function autoNumber($table, $kolom, $lebar=0, $awalan=null)
	{
		$this->db->select($kolom);
		$this->db->limit(1);
		$this->db->order_by($kolom, 'desc');
		$this->db->from($table);
		$query = $this->db->get();
		$row = $query->result_array();
		$cek = $query->num_rows();
		if ($cek == 0)
			$nomor = 1;
		else
		{
			$nomor = intval(substr($row[0][$kolom], strlen($awalan)))+1;
		}
			if ($lebar > 0)
			{
				$result = $awalan.str_pad($nomor, $lebar, "0", STR_PAD_LEFT);
			}
			else
			{
				$result = $awalan.$nomor;
			}
			return $result;
	}

	public function det_buku($kd_buku)
	{
		$this->db->select("t_buku.*, t_penerbit.penerbit, t_pengarang.pengarang, t_kategori.kategori");
		$this->db->from("t_buku");
		$this->db->join("t_penerbit", "t_penerbit.kd_penerbit = t_buku.kd_penerbit");
		$this->db->join("t_pengarang", "t_pengarang.kd_pengarang = t_buku.kd_pengarang");
		$this->db->join("t_kategori", "t_kategori.kd_kategori = t_buku.kd_kategori");
		$this->db->where("t_buku.kd_buku", $kd_buku);
		return $this->db->get();
	}

	// cek booking anggota
	public function cek_booking($id_anggota)
	{
		$this->db->like('id_anggota', $id_anggota);
		$this->db->from('t_booking');
		return $this->db->count_all_results();
	}

	// query untuk data booking per anggota
	public function data_booking($id_anggota)
	{
		$this->db->select('t_booking.*, t_buku.judul');
		$this->db->from('t_booking');
		$this->db->join('t_buku', 't_buku.kd_buku = t_booking.kd_buku');
		$this->db->where('t_booking.id_anggota', $id_anggota);
		return $this->db->get();
	}

	//cari buku
	public function cari_buku($judul)
	{
		$this->db->like('judul', $judul);
		return $this->db->get('t_buku');
	}

	publiC function buku_join($key, $value, $kode)
	{
		$this->db->select("*");
		$this->db->from('t_buku');
		$this->db->join($key, $value);
		$this->db->group_by($kode);
		$this->db->order_by($kode, 'ASC');
		return $this->db->get()->result();
	}

	public function cari_berdasarkan($berdasakan, $value)
	{
		$this->db->select("t_buku.*, t_penerbit.penerbit, t_pengarang.pengarang, t_kategori.kategori");
		$this->db->from('t_buku');
		$this->db->join('t_penerbit', 't_penerbit.kd_penerbit = t_buku.kd_penerbit');
		$this->db->join('t_pengarang', 't_penganrang.kd_pengarang = t_buku.kd_pengarang');
		$this->db->join('t_kategori', 't_kategori.kd_kategori = t_buku.kd_kategori');
		$this->db->like($berdasarkan, $value);
		return $this->db->get();
	}
}

/* End of file m_web.php */
/* Location: ./application/models/m_web.php */