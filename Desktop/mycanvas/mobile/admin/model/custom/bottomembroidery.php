<?php
class ModelCustomBottomEmbroidery extends Model 
{
      public function addbottomemb($data) 
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
                        
                        $uploaddir = '../upload/Bottom/embroidery';
                        
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
                          
                          $uploaddirmain = 'upload/Bottom/embroidery/';
                          
                          $fileupload  = $uploaddir."/". basename($name); 
                          
                          $data['uploadfile'] = $uploaddirmain . basename($name);
                          if (move_uploaded_file($_FILES['designfile'.$i]['tmp_name'], $fileupload))
                          {
                          
                          $n_width=80;          // Fix the width of the thumb nail images
                          $n_height=80;         // Fix the height of the thumb nail imaage
                          $uploaddir1 = '../upload/Bottom/embroidery/thumb';
                          if (!is_dir( $uploaddir1)) 
                          {
                                mkdir( $uploaddir1, 0777);
                          }
                          $upthumb = 'upload/Bottom/embroidery/thumb';
                          
                          $uploadthumb = $uploaddir1.'/'.$name;
                          
                          $tsrc= $upthumb.'/'.$name;
                          if (!($_FILES['designfile'.$i]['type'] =="image/png"))
                          {
                            exit;
                          } 
                          if($_FILES['designfile'.$i]['type']=="image/png")
                          {
                                $im=ImageCreateFromPNG($fileupload); 

                                $width=ImageSx($im);              
                                $height=ImageSy($im);            
                                $newimage=imagecreatetruecolor($n_width,$n_height);                 
                                imageCopyResized($newimage,$im,0,0,0,0,$n_width,$n_height,$width,$height);
                                ImagePng($newimage,$uploadthumb);
                                chmod("$uploadthumb",0777);
                                
                           }
                           if((empty($data['post']['designname'.$i]))  || (empty($fileupload)))
                           { 
                                continue;
                           }  
                           $this->db->query("INSERT INTO ".DB_PREFIX."bottom_embroidery ( `emb_name`, `emb_main_img`, `emb_thumb_img` )VALUES ('".$data['post']['designname'. $i]."','".$data['uploadfile']."','$tsrc')");

                           $i++;  	
                       }
                          else
                          { 
                             
                          }  
                     }
                 }
                 
    
      public function emblist()
      {
          $result=$this->db->query("Select * from ".DB_PREFIX."bottom_embroidery");
          return  $result->rows;
      }
      
      
      public function getTotalProducts($data = array()) {
                $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "bottom_embroidery order by id asc";
                $query = $this->db->query($sql);
                return $query->row['total'];
	}
        
      public function deleteoption($data)
      {
         $id = $data['embid'];
         $result=$this->db->query("DELETE FROM ".DB_PREFIX."bottom_embroidery WHERE `id`=$id");
      }
                
}
?>
