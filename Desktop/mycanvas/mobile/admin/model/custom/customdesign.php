<?php

class ModelCustomCustomDesign extends Model 
{
     public function customdesign() 
     { 
            $rslt=$this->db->query("Select * from ".DB_PREFIX."option_value_description where option_id='18' and status=1");
            return  $rslt->rows; 
     }
}
?>
