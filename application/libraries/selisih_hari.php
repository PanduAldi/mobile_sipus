<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Selisih_hari
{
	protected $ci;

	public function __construct()
	{
        $this->ci =& get_instance();
	}

	public function selisih($tgl1, $tgl2)
	{
		$ex1 = explode("-", $tgl1);
		$ex2 = explode("-", $tgl2);

		// pech tgl1
		$tanggal1 = $ex1[2];
		$bulan1 = $ex1[1];
		$tahun1 = $ex1[0];

		//pecah tgl2
		$tanggal2 = $ex2[2];
		$bulan2 = $ex2[1];
		$tahun2 = $ex2[0];


		$jd1 = GregorianToJD($bulan1, $tanggal1, $tahun1);
		$jd2 = GregorianToJD($bulan2, $tanggal2, $tahun2);
	
		//cari selisih
		$selisih = $jd2 - $jd1;

		return $selisih;
	}
	

}

/* End of file selisih_tanggal.php */
/* Location: ./application/libraries/selisih_tanggal.php */
