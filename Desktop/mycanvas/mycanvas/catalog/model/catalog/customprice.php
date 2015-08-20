<?php
class ModelCatalogCustomprice extends Model {
	
	public function updateprice($data)
        {
            $price = $data['price'] ;
            $proid = $data['proid'];
            $this->db->query("UPDATE `" . DB_PREFIX . "product` SET `price`=$price WHERE `product_id`=$proid");
        }
        
        public function addimg($data)
        {
            $proid = $data['pro_id'];
            $frntimg = $data['frnt_img_val'];
            $backimg = $data['back_img_val'];
            $pro_option = $data['pro_option'];
            $price = $data['price'];
            
            if($frntimg != '')
            {
                $fname = basename($frntimg);
                list($txt) = explode(".", $fname);
                //$ext='png';
                $fname = substr($txt,0,10).time();
                $fname = $fname.".png";
                $frontimage = "upload/finialproimg/$fname";
                $upload = file_put_contents("upload/finialproimg/$fname",file_get_contents($frntimg));
            }
            else
            {
                $frontimage = "";
            }
            if($backimg != '')
            {
                $bname = basename($backimg);
                list($txt) = explode(".", $bname);
               // $ext='png';
                $bname = $txt.time();
                $bname = $bname.".png";
                
                $backimgae = "upload/finialproimg/$bname";

                $upload = file_put_contents("upload/finialproimg/$bname",file_get_contents($backimg));
            }
            else
            {
                $backimgae = '';
            }
            $sql = "SELECT * FROM `" . DB_PREFIX . "customfinial_product` order by id desc limit 0,1";
            $query = $this->db->query($sql);
            
           
            
            if($query->num_rows == 0 )
            {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "product_option`(`product_id`, `option_id`, `value`, `required`) VALUES ($proid,$pro_option,'',0)");
                $product_option_id = $this->db->getLastId();
                
                $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "customfinial_product`(`product_id`, `childid`, `frontimage`, `backimage`, `selectedoption`,`price`)
                VALUES ($proid,'1','$frontimage','$backimgae',$pro_option,'$price')");
                $custom_pro_id = $this->db->getLastId();
                
                $lastid[] = array('option_value_id'=>$product_option_id,'custom_pro_id' => $custom_pro_id);
                return $lastid;
                
                
            }
            else 
            {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "product_option`(`product_id`, `option_id`, `value`, `required`) VALUES ($proid,$pro_option,'',0)");
                $product_option_id = $this->db->getLastId();
                $childid = $query->row['childid'];
                $childidd= $childid+1;
                
                $query = $this->db->query("INSERT INTO `" . DB_PREFIX . "customfinial_product`(`product_id`, `childid`, `frontimage`, `backimage`, `selectedoption`,`price`)
                VALUES ($proid,'$childidd','$frontimage','$backimgae',$pro_option,'$price')"); 
                $custom_pro_id = $this->db->getLastId();
                
                $lastid[] = array('option_value_id'=>$product_option_id,'custom_pro_id' => $custom_pro_id);
                return $lastid;
                
                
            }
        }
       
        
        public function getproimg($productid,$option)
        {
            $productid = $productid;
            
            $sql = "SELECT * FROM `" . DB_PREFIX . "customfinial_product` WHERE `product_id`=$productid and selectedoption= $option order by childid asc";
            $query = $this->db->query($sql);
            
        }
        
}

?>