<?php
class ModelCustomLength extends Model 
{
        public function addlength($data) 
        { 
                    $reslts=(array_chunk($data['post'], 2, true));
                    $i=1;
                    
                    $ran=  rand(10,100);
                    foreach($reslts as $reslt)
                    {
                          
                          if($i>$data['post']['addcounter'])
                          {
                            continue;
                          }
                        
                          $uploaddir = '../upload/sleeves/Length/';
                        
                          if (!is_dir( $uploaddir )) 
                          {
                            mkdir( $uploaddir, 0777);
                          }
                          /* -----    Upload Image Icon code   -----  */        
                          
                          $names = $_FILES['file'.$i]['name'];
                          
                          $file= explode(".",$names);
                          if((!empty($file[0])) && (!empty($file[1])))
                          {  
                            $name = $file[0].$ran.'.'.$file[1];
                          }
                         
                          
                          $uploaddirmain = 'upload/sleeves/Length/';
                          
                          $fileupload  = $uploaddir. basename($name); 
                          
                          $data['uploadfile'] = $uploaddirmain . basename($name);
                          
                          /* -----    Upload Canvas Base Image code   -----  */

                          $can_base = $_FILES['can_base'.$i]['name'];
                          
                          $canbfile= explode(".",$can_base);
                          if((!empty($canbfile[0])) && (!empty($canbfile[1])))
                          {  
                            $can_base = $canbfile[0].$ran.'.'.$canbfile[1];
                          }
                         
                          
                          $source_canvas_base = $_FILES['can_base'.$i]['tmp_name'];
                          $destination_canvas_base = $uploaddir. basename($can_base); 
                          
                          $dbcanvasbaseupload = $uploaddirmain . basename($can_base);
                          
                          
                           /* -----    Upload Canvas Base Line Image code   -----  */
                          
                          
                          $canbaselines = $_FILES['can_base_lines'.$i]['name'];
                          
                          $canblines= explode(".",$canbaselines);
                          if((!empty($canblines[0])) && (!empty($canblines[1])))
                          {  
                            $canbaselines = $canblines[0].$ran.'.'.$canblines[1];
                          }
                         
                          
                          $source_can_lines = $_FILES['can_base_lines'.$i]['tmp_name'];
                          $destinationcanvlin  = $uploaddir. basename($canbaselines); 
                          
                          $dbfilecanvlinupload = $uploaddirmain . basename($canbaselines);
                          
                          
                          
                          if (move_uploaded_file($_FILES['file'.$i]['tmp_name'], $fileupload))
                          {
                                move_uploaded_file($source_canvas_base, $destination_canvas_base);
                                move_uploaded_file($source_can_lines, $destinationcanvlin);
                                
                               
                                $this->db->query("INSERT INTO ".DB_PREFIX."sleeve_images (`length`, `sleve_icon`, `sleve_can_base`, `sleve_can_outline`)VALUES ('".$data['post']['length'. $i]."','".$data['uploadfile']."','".$dbcanvasbaseupload."','".$dbfilecanvlinupload."')");
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
