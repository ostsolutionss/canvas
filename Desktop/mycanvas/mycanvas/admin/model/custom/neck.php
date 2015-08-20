<?php

class ModelCustomNeck extends Model 
{
      public function neckoptions() 
      { 
                $query=$this->db->query("Select * from ".DB_PREFIX."option_value_description where option_id='14' and status=1");
                return  $query->rows; 
      }
     
}
?>
