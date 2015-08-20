<?php
class ModelExtensionExtension extends Model {
	function getExtensions($type) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "extension WHERE `type` = '" . $this->db->escape($type) . "'");

		return $query->rows;
	}
        
        public function getproimg($pid)
        {
            $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customfinial_product` WHERE `product_id`=$pid ");
            return $query->rows;
            
        }
        
}