<?php

class ModelCustomPippingColor extends Model 
{

    public function addcolor($data) 
    { 
            $reslts=(array_chunk($data['post'], 4, true));
            $count = count($data['post']);
            for($i=1; $i<=$count;$i++)
            {
                $pcolor = "#".$data['post']['pippingcolor'.$i];
                $this->db->query("INSERT INTO ".DB_PREFIX."sleeves_pipping_color(pipping_color)VALUES ('".$pcolor."')");
            }
    }
    
    public function pipngcolorlist()
    {
            $result=$this->db->query("Select * from ".DB_PREFIX."sleeves_pipping_color");
            return  $result->rows; 
    }
    
    public function getTotalProducts($data = array()) {
                $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sleeves_pipping_color order by id asc";
                $query = $this->db->query($sql);
                return $query->row['total'];
	}
    
    public function deleteoption($data)
    {
        $id = $data['pipeid'];
        $result=$this->db->query("DELETE FROM ".DB_PREFIX."sleeves_pipping_color WHERE `id`=$id");
    } 
}	
                      
?>
