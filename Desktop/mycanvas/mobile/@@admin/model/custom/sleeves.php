<?php

class ModelCustomSleeves extends Model 
{
        public function customsleeves() 
        { 
                $rslt=$this->db->query("Select * from ".DB_PREFIX."option_value_description where option_id='26' and status=1");
                return  $rslt->rows; 
        }
}
?>
