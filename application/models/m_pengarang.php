<!-- 
  Bagus Susilo  - 11119006
  Muhammad Rofi - 11119003
  Aplikasi Perpustakaan Berbasis Web
 -->
<?php 

class M_pengarang Extends CI_Model{

	public function edit($id)
    {
        $this->db->where('id_pengarang', $id);
        return $this->db->get('pengarang')->row_array();
    }

    public function update($id_pengarang, $data)
    {
        $this->db->where('id_pengarang', $id_pengarang);
        $this->db->update('pengarang', $data);
    }

    public function hapus($id)
    {
        $this->db->where('id_pengarang', $id);
        $this->db->delete('pengarang');
    }
}