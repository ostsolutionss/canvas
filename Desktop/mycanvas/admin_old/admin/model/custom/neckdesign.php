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
                        
                        /*  ICON IMAGE     */
                        
                          $names = $_FILES['designfile'.$i]['name'];
                          
                          $file= explode(".",$names);
                          if((!empty($file[0])) && (!empty($file[1])))
                          {  
                            $name = $file[0].$ran.'.'.$file[1];
                          }
                         
                          
                          $uploaddirmain = 'upload/neck/design/';
                          
                          $fileupload  = $uploaddir. basename($name); 
                          
                          $data['uploadfile'] = $uploaddirmain . basename($name);
                          
                          /*    CANVAS BASE     */
                          
                          $ran1 = rand(10,100);
                          
                          $canvasbase = $_FILES['can_base'.$i]['name'];
                          
                          $filecanvas_base= explode(".", $canvasbase);
                          if((!empty($filecanvas_base[0])) && (!empty($filecanvas_base[1])))
                          {  
                             $canvasbase = $filecanvas_base[0].$ran1.'.'.$filecanvas_base[1];
                          }
                         
                          $source_canvas_base = $_FILES['can_base'.$i]['tmp_name'];
                          $destintion_canv_base  = $uploaddir. basename($canvasbase); 
                          
                          $db_canvas_base = $uploaddirmain . basename($canvasbase);
                          
                          
                          /*   CANVAS OUTLINE     */
                          
                          $ran2 = rand(10,100);
                            
                          $can_outline = $_FILES['canvas_outline'.$i]['name'];
                          
                          $file_can_out= explode(".",$can_outline);
                          if((!empty($file_can_out[0])) && (!empty($file_can_out[1])))
                          {  
                            $can_outline = $file_can_out[0].$ran2.'.'.$file_can_out[1];
                          }
                         
                          
                          $sourec_can_out = $_FILES['canvas_outline'.$i]['tmp_name'];
                          
                          $desti_canvs_out  = $uploaddir. basename($can_outline); 
                          
                          $dbcanvas_out = $uploaddirmain . basename($can_outline);
                          
                          
                          
                          
                          
                          
                          if (move_uploaded_file($_FILES['designfile'.$i]['tmp_name'], $fileupload))
                          {
                              move_uploaded_file($source_canvas_base, $destintion_canv_base);
                              move_uploaded_file($sourec_can_out, $desti_canvs_out);
                              
                                $this->db->query("INSERT INTO ".DB_PREFIX."neck_designs ( `design_name`, `design_canvas_base`, `design_canvs_outline`, `design_icon` )
                                    VALUES 
                                    ('".$data['post']['designname'. $i]."','".$db_canvas_base."','".$dbcanvas_out."','".$data['uploadfile']."')");
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
