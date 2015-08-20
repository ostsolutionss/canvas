<?php
class ModelCustomBottomLength extends Model 
{
      public function addbottomlength($data) 
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
                        
                        $uploaddir = '../upload/Bottom/Length/';
                        
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
                          
                          $uploaddirmain = 'upload/Bottom/Length/';
                          
                          $fileupload  = $uploaddir."/". basename($name); 
                          
                          $data['uploadfile'] = $uploaddirmain . basename($name);
                          if (move_uploaded_file($_FILES['designfile'.$i]['tmp_name'], $fileupload))
                          {
                          
                           if((empty($data['post']['designname'.$i]))  || (empty($fileupload)))
                           { 
                                continue;
                           }  
                           $this->db->query("INSERT INTO ".DB_PREFIX."bottom_length (   `bottom_length`, `bottom_length_img` )VALUES ('".$data['post']['designname'. $i]."','".$data['uploadfile']."')");

                           $i++;  	
                           }
                          else
                          { 
                             
                          }  
                     }
                 }
                 
      public function getbtmlength()
      {
          $result=$this->db->query("Select * from ".DB_PREFIX."bottom_length");
          return  $result->rows;
      }
      
      public function getTotalProducts($data = array()) {
                $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "bottom_length order by id asc";

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
        
      public function deleteoption($data)
      {
          $id = $data['langthid'];
          $result=$this->db->query("DELETE FROM ".DB_PREFIX."bottom_length WHERE `id`=$id");
      }
                
}
?>
