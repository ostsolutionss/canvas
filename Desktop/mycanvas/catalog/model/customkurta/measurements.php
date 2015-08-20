<?php
class ModelcustomkurtaMeasurements extends Model 
{
    public function product_info($cpid)
    {
        $sql = $this->db->query("select cp.*,pd.name as proname , od.name as optionname from " . DB_PREFIX . "product_description as pd join " . DB_PREFIX . "customfinial_product as cp on  pd.product_id = cp.`product_id` join " . DB_PREFIX . "option_value_description as od on cp.selectedoption = od.option_value_id where cp.id = $cpid");
        return $sql->rows;
    }
    
    public function getSize()
    {
        $sql = $this->db->query("SELECT ovd.name FROM `" . DB_PREFIX . "option_value_description` as ovd  join " . DB_PREFIX . "option_description od on ovd.option_id = od.option_id where od.name='Size'");
        return $sql->rows;
    }
    
    public function addsize($data)
    {
        $cuid  = $data['customproid']; 
        $ksize = $data['ksize'];
       // $selsize = $data['selectsize'];
        $userid = $data['user_id'];
        $sql = $this->db->query("select * from " . DB_PREFIX . "custom_measurements where customid = $cuid and user_id=$userid");
        if($sql->num_rows == 0 )
        {
            $insert = $this->db->query("INSERT INTO `" . DB_PREFIX . "custom_measurements`( `customid`, `size`,`user_id`) VALUES ($cuid,'$ksize','$userid')");
        }
        else
        {
            
            $update = $this->db->query("update " . DB_PREFIX . "custom_measurements set size='$ksize',`user_id`='$userid' where customid = $cuid and `user_id`='$userid' ");
        }
        
    }
    
    public function getselsctsize($id)
    {
        $sql = $this->db->query("select * from " . DB_PREFIX . "custom_measurements where customid = $id");
        return $sql->rows;
    }
    
    public function getmeasure($data)
    {
        $id = $data['userid'];
        $sql = $this->db->query("select size from " . DB_PREFIX . "custom_measurements where user_id = $id order by sizeid desc limit 0,1");
        return $sql->rows;
    }
    
}

?>

