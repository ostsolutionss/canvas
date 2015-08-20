<?php
class ModelCustomNeckDesign extends Model 
{
        public function addneckdesign($data) 
          { 
                    $reslts=(array_chunk($data['post'], 2, true));
                    $i=1;
                    foreach($reslts as $reslt)
                    {
                        $ran = rand(10,100);
                        if($i>$data['post']['addcounter'])
                        {
                            continue;
                        }
                        
                        $uploaddir = '../upload/neck/design/';
                        
                        if (!is_dir( $uploaddir )) 
                        {
                           
                          mkdir( $uploaddir, 0777);
                        }
                          $names = $_FILES['designfile'.$i]['name'];
                          
                          $file= explode(".",$names);
                          if((!empty($file[0])) && (!empty($file[1])))
                          {  
                            $name = $file[0].$ran.'.'.$file[1];
                          }
                          else
                          {
                              
                            continue;
                          }
                          
                          $uploaddirmain = 'upload/neck/design/';
                          
                          $fileupload  = $uploaddir. basename($name); 
                          
                          $data['uploadfile'] = $uploaddirmain . basename($name);
                          if (move_uploaded_file($_FILES['designfile'.$i]['tmp_name'], $fileupload))
                          {
                                $this->db->query("INSERT INTO ".DB_PREFIX."neck_designs ( `design_name`, `design_main_img`, `design_thumb_img` )VALUES ('".$data['post']['designname'. $i]."','".$data['uploadfile']."','')");
                                $i++;  	
                       }
                          else
                          { 
                             
                          }  
                     }
                 }
                 
                 
        public function getneckdesign()
        {
            $result=$this->db->query("Select * from ".DB_PREFIX."neck_designs");
            return  $result->rows; 
        }
        
        public function getTotalProducts($data = array()) {
                $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "neck_designs order by id asc";
                $query = $this->db->query($sql);
                return $query->row['total'];
	}
        
        public function deleteoption($data)
        {
            $id = $data['designid'];
            $result=$this->db->query("DELETE FROM ".DB_PREFIX."neck_designs WHERE `id`=$id");
        }
}
?>
