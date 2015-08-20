<?php

class ModelCustomBottomBorderColor extends Model 
{
       public function addbottombcolor($data) 
        { 
             $reslts=(array_chunk($data['post'], 4, true));
             $count = count($data['post']);
             for($i=1; $i<=$count;$i++)
             {
               $color = "#".$data['post']['neckbordercolor'.$i];
               $this->db->query("INSERT INTO ".DB_PREFIX."bottom_border_color (bottom_border_color) VALUES ('".$color."')");
             }
             
       }
       public function getbotombcolor()
       {
            $result=$this->db->query("Select * from ".DB_PREFIX."bottom_border_color");
            return  $result->rows; 
       }
       
       public function getTotalProducts($data = array()) {
                $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "bottom_border_color order by id asc";

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
       
       public function deleteoption($data)
       {
           $id= $data['id'];
           $result=$this->db->query("DELETE FROM ".DB_PREFIX."bottom_border_color WHERE `id`=$id");
       }
}	
?>
