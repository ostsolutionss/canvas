<?php
class ModelCustomSleeveEmb extends Model 
{
        public function addsleeveemb($data) 
        { 
              $reslt=(array_chunk($data['file'], 4, true));
              $count = count($data['file']);
              for($i=1; $i<=$count ; $i++)
              {
                    $ran=  rand(10,100);
                    $uploaddir = '../upload/'.'sleeves/'.'Embroidery/';
                    if (!is_dir( $uploaddir)) 
                    {
                          mkdir( $uploaddir, 0777,true);
                    }
                    $names = $_FILES['file'.$i]['name'];
                    
                    $file= explode(".",$names);
                    if((!empty($file[0])) && (!empty($file[1])))
                    {  
                        $name = $file[0].$ran.'.'.$file[1];
                    }
                    else
                    {
                          continue;
                    }
                    $uploaddirmain = 'upload/'.'sleeves/'.'Embroidery/';
                    $uploadpath = $uploaddirmain . basename($name);
                    
                    $data['uploadfile'] = $uploaddir . basename($name);
                    if (move_uploaded_file($_FILES['file'.$i]['tmp_name'], $data['uploadfile']))
                        {
                              
                                if((empty($data['uploadfile'])))
                                {
                                     continue;
                                }       
                                    $this->db->query("INSERT INTO ".DB_PREFIX."sleeves_emb ( sleeve_emb_image )VALUES ('".$uploadpath."')");
                        }
                        else
                        { 
                           
                        } 
              }
        }
        
        public function sleevemblist()
        {
            $result=$this->db->query("Select * from ".DB_PREFIX."sleeves_emb");
            return  $result->rows; 
        }
        
        public function getTotalProducts($data = array()) {
                $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sleeves_emb order by id asc";
                $query = $this->db->query($sql);
                return $query->row['total'];
	}
        
        public function deleteoption($data)
        {
            $id = $data['embid'];
            $result=$this->db->query("DELETE FROM ".DB_PREFIX."sleeves_emb WHERE `id`=$id");
            
        }
}

?>
