<?php
class Modelcustomkurtacustomkurta extends Model {
	
        /* ----------------- CODE TO GET FABRIC OPTIONS  ------------------   */
    
	public function getOptions() {
		$sql = "SELECT * FROM `" . DB_PREFIX . "option_description`  WHERE name = 'Fabric n Colour'";
                $query = $this->db->query($sql);
                return $query->rows;
        }
        
        public function getOptionValue($option_id) {
            
            $sql = "SELECT DISTINCT ocv.*,od.status,od.name FROM `" . DB_PREFIX . "option_value` as ocv inner join " . DB_PREFIX . "option_value_description as od on ocv.option_value_id = od.option_value_id where ocv.option_id = '$option_id' and od.status = 1";
            
            //  echo  $sql = "SELECT DISTINCT " . DB_PREFIX . "option_value.image FROM `" . DB_PREFIX . "option_value` inner join " . DB_PREFIX . "option_value_description on " . DB_PREFIX . "option_value.option_id = " . DB_PREFIX . "option_value_description.option_id where " . DB_PREFIX . "option_value.option_id = '$option_id' and " . DB_PREFIX . "option_value_description.status = 1";
		//$sql = "SELECT * FROM `" . DB_PREFIX . "option_value` WHERE option_id = '$option_id'";
                $query = $this->db->query($sql);
                return $query->rows;
	}
        
        
        /*   KURTA FRONT OPTIONS STARTS HERE   */
        
        public function karea() 
            { 
                    $rsltarea=$this->db->query("Select * from `".DB_PREFIX."option_description` where option_id='20'");
                    return  $rsltarea->rows; 
            }    
               
            public function kdesign() 
            { 
                    $rsltdesign=$this->db->query("Select * from `".DB_PREFIX."option_value_description` where option_id='21' and status=1");
                    return  $rsltdesign->rows; 
            }
                
            
        
        /* -------------------- CODE TO GET AREA OPTIONS  --------------------------   */
        
        public function area() 
        { 
                $area=$this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "option_value as op inner join " . DB_PREFIX . "option_value_description as od on (op.option_value_id=od.option_value_id) where op.option_id='20' ");
                return  $area->rows; 
        } 
        
        /* -------------------- CODE TO GET DIGITAL DESIGNS STARTS HERE  --------------------------   */
        
        public function fdigital() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "products_image where design='Digital' ");
                return  $area->rows; 
        } 
        public function midledigital() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "products_image where design='Digital' and area = 'Middle'");
                return  $area->rows; 
        } 
        public function bodydigital() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "products_image where design='Digital' and area = 'Body'");
                return  $area->rows; 
        } 
        public function neckdigital() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "products_image where design='Digital' and area = 'Neck'");
                return  $area->rows; 
        } 
        
        /* -------------------- CODE TO GET EMBORDIORY DESIGNS STARTS HERE  --------------------------   */
        
        public function fembfull() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "products_image where design='Embroidery'");
                return  $area->rows; 
        } 
        public function fembmiddle() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "products_image where design='Embroidery' and area = 'Middle'");
                return  $area->rows; 
        } 
        public function fembneck() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "products_image where design='Embroidery' and area = 'Neck'");
                return  $area->rows; 
        } 
        public function fembbody() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "products_image where design='Embroidery' and area = 'Body'");
                return  $area->rows; 
        } 
        
        /* -------------------- CODE TO GET BLOCK PRINT DESIGNS STARTS HERE  --------------------------   */
        
        public function fblock() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "products_image where design='Block Print'"); 
                return  $area->rows; 
        } 
        public function midleblock() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "products_image where design='Block Print' and area = 'Middle'"); 
                return  $area->rows; 
        } 
        public function bodyblock() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "products_image where design='Block Print' and area = 'Body'"); 
                return  $area->rows; 
        } 
        public function neckblock() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "products_image where design='Block Print' and area = 'Neck'"); 
                return  $area->rows; 
        } 
        
        
        /* -------------------- CODE TO GET SCREEN PRINT DESIGNS STARTS HERE  --------------------------   */
        
        public function fscreenprint()
        {
             $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "products_image where design='Screen Print'"); 
             return  $area->rows; 
        }
        public function midlesprint()
        {
             $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "products_image where design='Screen Print' and area = 'Middle'"); 
             return  $area->rows; 
        }
        public function bodysprint()
        {
             $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "products_image where design='Screen Print' and area = 'Body'"); 
             return  $area->rows; 
        }
        public function necksprint()
        {
             $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "products_image where design='Screen Print' and area = 'Neck'"); 
             return  $area->rows; 
        }


        
        
        
        
        
        /* -------------------- CODE TO GET DIGITAL DESIGNS STARTS HERE  --------------------------   */
        
        
        /*      Neck Options       */
        
        public function neckoptions() 
        { 
                $area=$this->db->query("Select * from ".DB_PREFIX."option_value_description where option_id='14' and status=1"); 
                return  $area->rows; 
        } 
        
        
        /*      Neck Options  */
        
        
        public function neckstyle() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "neck_designs"); 
                return  $area->rows; 
        } 
        
        /* -------------------- CODE TO GET DIGITAL DESIGNS STARTS HERE  --------------------------   */
        
        public function neckpippingcolor() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "neck_pipping_color"); 
                return  $area->rows; 
        } 
        
        /* -------------------- CODE TO GET DIGITAL DESIGNS STARTS HERE  --------------------------   */
        
        public function neckbordercolor() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "neck_border_color"); 
                return  $area->rows; 
        } 
        
        /* -------------------- CODE TO GET DIGITAL DESIGNS STARTS HERE  --------------------------   */
        
        public function neckbuttons() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "neck_buttons"); 
                return  $area->rows; 
        } 
        
         
        /*  ----------------------------    SLEEVES   -----------------------------        */
        
        /*  ----------- GET SLEEVES LENGTH --------------  */
        
        
                /*   SLEEVES OPTIONS    */
        
        public function sleeveoptions() 
        { 
                $area=$this->db->query("Select * from ".DB_PREFIX."option_value_description where option_id='26' and status=1"); 
                return  $area->rows; 
        } 
        
                /*   SLEEVES OPTIONS   */
        
        public function sleevelength() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "sleeve_images "); 
                return  $area->rows; 
        } 
        public function sleevepcolour() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "sleeves_pipping_color"); 
                return  $area->rows; 
        } 
        public function sleevebcolour() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "sleeves_border_color"); 
                return  $area->rows; 
        } 
        
        public function sleevebutons() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "sleeves_buttons"); 
                return  $area->rows; 
        } 
        public function sleevebutonsemb() 
        { 
                $area=$this->db->query("SELECT * FROM " . DB_PREFIX . "sleeves_emb"); 
                return  $area->rows; 
        } 
        
        
        
        /*  ----------------------------    GET PRODUCT INFORMATION   -----------------------------        */
        
        public function getproductinfo($data)
        {
            $pid = $data['productid'];
            $proinfo=$this->db->query("SELECT * FROM `" . DB_PREFIX . "product` WHERE `product_id`= $pid"); 
            return  $proinfo->rows; 
        }
        
        public function getprooption($data)
        {
            $pid = $data['productid'];
            $prooption=$this->db->query("SELECT ov.option_value_id,ov.image FROM " . DB_PREFIX . "option_value as ov join " . DB_PREFIX . "product_option_value as pov on ov.option_value_id = pov.option_value_id where pov.product_id = $pid"); 
            return  $prooption->rows; 
        }
        
}

?>

