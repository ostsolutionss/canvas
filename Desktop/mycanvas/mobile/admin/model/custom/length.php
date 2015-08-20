<?php
class ModelCustomLength extends Model 
{
        public function addlength($data) 
        { 
                    $reslts=(array_chunk($data['post'], 2, true));
                    $i=1;
                    
                    foreach($reslts as $reslt)
                    {
                          $ran=  rand(10,100);
                          if($i>$data['post']['addcounter'])
                          {
                            continue;
                          }
                        
                          $uploaddir = '../upload/sleeves/Length/';
                        
                          if (!is_dir( $uploaddir )) 
                          {
                            mkdir( $uploaddir, 0777);
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
                          
                          $uploaddirmain = 'upload/sleeves/Length/';
                          
                          $fileupload  = $uploaddir. basename($name); 
                          
                          $data['uploadfile'] = $uploaddirmain . basename($name);
                          
                          if (move_uploaded_file($_FILES['file'.$i]['tmp_name'], $fileupload))
                          {
                                if((empty($data['post']['length'.$i]))  || (empty($fileupload)))
                                { 
                                    continue;
                                }  
                           
                                $this->db->query("INSERT INTO ".DB_PREFIX."sleeve_images (length,attached_image,thumbnail_image )VALUES ('".$data['post']['length'. $i]."','".$data['uploadfile']."','')");
                                $i++;  	
                          }
                          else
                          { 
                             
                          }  
                           
                          }
                      //}	
                  }
        public function length() 
        { 
            $rslt=$this->db->query("Select * from ".DB_PREFIX."option_value_description where option_id='27' and status=1");
            return  $rslt->rows; 
        }    
        
        public function lengthlist()
        {
            $result=$this->db->query("Select * from ".DB_PREFIX."sleeve_images");
            return  $result->rows; 
        }
        
        public function getTotalProducts($data = array()) {
                $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sleeve_images order by id asc";
                $query = $this->db->query($sql);
                return $query->row['total'];
	}
        
        public function deleteoption($data)
        {
           $id= $data['lengthid'];
           $result=$this->db->query("DELETE FROM ".DB_PREFIX."sleeve_images WHERE `id`=$id");
        }
}
?>
