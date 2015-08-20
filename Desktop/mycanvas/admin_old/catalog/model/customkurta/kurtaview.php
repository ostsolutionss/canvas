<?php
class Modelcustomkurtakurtaview extends Model 
{
    public function product_info($cpid)
    {
        $sql = $this->db->query("SELECT cp.*, pd.name FROM `" . DB_PREFIX . "customfinial_product` as cp LEFT JOIN " . DB_PREFIX . "product_description as pd on cp.`product_id` = pd.product_id where cp.id=$cpid");
        return $sql->rows;
    }
    
    public function removeproduct($data)
    {
        $id = $data['id'];
        $sql = $this->db->query("DELETE FROM `" . DB_PREFIX . "customfinial_product` WHERE `id`=$id");
    }
    
}

?>

