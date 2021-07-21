<!-- 
  Bagus Susilo  - 11119006
  Muhammad Rofi - 11119003
  Aplikasi Perpustakaan Berbasis Web
 -->
<?php 

class Pengembalian Extends CI_Controller{

	public function index()
	{
		$isi['content'] = 'pengembalian/v_pengembalian';
		$isi['judul']	= 'Data Pengembalian Buku';
		$this->load->model('m_pengembalian');
		$isi['data']	= $this->m_pengembalian->getAllData();
		$this->load->view('v_dashboard', $isi);
	}
}