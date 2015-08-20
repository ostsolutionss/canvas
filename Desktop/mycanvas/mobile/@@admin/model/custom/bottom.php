<?php

class ModelCustomBottom extends Model 
{
      public function bottomoptions() 
      { 
                $query=$this->db->query("Select * from ".DB_PREFIX."option_value_description where option_id='17' and status=1");
                return  $query->rows; 
      }
    
}
?>
