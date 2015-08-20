<?php

class ModelCustomBack extends Model 
{
        public function addshirt($data) 
                { 
                    $reslts=(array_chunk($data['post'], 4, true));
                    $i=1;
                    foreach($reslts as $reslt)
                    {
                  
                        $ran=  rand(10,100);
                        if($i>$data['post']['addcounter'])
                            {
                                continue;
                            }
    
                        if( $data['post']['type'.$i] || $data['post']['Area'.$i] || $data['post']['Design'.$i])
                            {
                   
                                $uploaddir = '../upload/'.$data['post']['type'.$i].'/'.$data['post']['Area'.$i].'/'.$data['post']['Design'.$i].'/';
                                if (!is_dir( $uploaddir)) 
                                    {
                                        mkdir( $uploaddir, 0777,true);
                                        echo "The  $uploaddir directory has been created<br /><br />";
                                    }
                            }
                        
                        $names = ($_FILES['file'.$i]['name']);
                        $file= explode(".",$names);
                        $name = $file[0].$ran.'.'.$file[1];
                        $data['uploadfile'] = $uploaddir . basename($name);
                        $uploaddirpath = 'upload/'.$data['post']['type'.$i].'/'.$data['post']['Area'.$i].'/'.$data['post']['Design'.$i].'/';
                        $data['uploaddirpath'] = $uploaddirpath.basename($name);
                        if ($file_type =="image/png") 
                        {
                            echo "No PHP files<br>"; 
                            $ok=0; 
                        } 
                        else 
                        {
                            if (move_uploaded_file($_FILES['file'.$i]['tmp_name'], $data['uploadfile']))
                            {
                                 echo "The file ". basename($name). " has been uploaded"; 
                                 $this->db->query("INSERT INTO `".DB_PREFIX."kurta_back` ( `back_type`, `back_area`, `back_design`, `back_img` )VALUES ('".$data['post']['type'. $i]."','".$data['post']['Area'. $i]."','".$data['post']['Design'. $i]."','".$data['uploaddirpath']."')");

                            }
                            else
                            { 
                                 echo "Sorry, there was a problem uploading your file."; 
                            } 
                        } 

                        if((empty($data['post']['type'.$i])) || (empty($data['post']['Area'.$i])) ||(empty($data['post']['Design'.$i])) || (empty($data['uploadfile'])))
                        {
                           continue;
                        } 
                        $i++;  	
                    }
                  }	
                        
        public function type() 
                { 
                    $rslt=$this->db->query("Select * from `".DB_PREFIX."option_value_description` where option_id='16' and status=1");
                    return  $rslt->rows; 
                }     
       public function area() 
               { 
                    $rsltarea=$this->db->query("Select * from `".DB_PREFIX."option_value_description` where option_id='20' and status=1");
                    return  $rsltarea->rows; 
               }     
       public function design() 
               { 
                    $rsltdesign=$this->db->query("Select * from `".DB_PREFIX."option_value_description` where option_id='21' and status=1");
                    return  $rsltdesign->rows; 
                }     
                
     public function getback()
     {
          $result=$this->db->query("Select * from ".DB_PREFIX."kurta_back");
          return  $result->rows;            
     }
     
     public function getTotalProducts($data = array()) {
                $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "kurta_back order by id asc";
                $query = $this->db->query($sql);
                return $query->row['total'];
	}
     
     public function deleteoption($data)
     {
         $id = $data['backid'];
         $result=$this->db->query("DELETE FROM ".DB_PREFIX."kurta_back WHERE `id`=$id");
     }
}
?>
