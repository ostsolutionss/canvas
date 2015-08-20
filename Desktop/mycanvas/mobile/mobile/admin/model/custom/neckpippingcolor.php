<?php

class ModelCustomNeckPippingColor extends Model 
{
       public function addneckpcolor($data) 
        { 
             $reslts=(array_chunk($data['post'], 4, true));
             $count = count($data['post']);
             for($i=1; $i<=$count;$i++)
             {
               $color = "#".$data['post']['neckpippingcolor'.$i];
               $this->db->query("INSERT INTO ".DB_PREFIX."neck_pipping_color (neck_pipping_color) VALUES ('".$color."')");
             }
             
        }
        
        public function getneckpiping()
        {
            $result=$this->db->query("Select * from ".DB_PREFIX."neck_pipping_color");
            return  $result->rows; 
        }
        
        public function getTotalProducts($data = array()) {
                $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "neck_pipping_color order by id asc";
                $query = $this->db->query($sql);
                return $query->row['total'];
	}
        
        public function deleteoption($data)
        {
            $id = $data['pipingid'];
            $result=$this->db->query("DELETE FROM ".DB_PREFIX."neck_pipping_color WHERE `id`=$id");
            
        }
}	
?>
