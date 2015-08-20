<?php

class ModelCustomNeck extends Model 
{

    public function addneck($data) 
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
           if( $data['post']['style'.$i] || $data['post']['border'.$i] || $data['post']['pipping'.$i] || $data['post']['buttons'.$i])
           {
                $uploaddir = '../upload/'.$data['post']['style'.$i].'/'.$data['post']['border'.$i].'/'.$data['post']['pipping'.$i].'/'.$data['post']['buttons'.$i].'/';
                if (!is_dir( $uploaddir)) 
                {
                      mkdir( $uploaddir, 0777,true);
                      echo "The  $uploaddir directory has been created<br /><br />";
                }
          }
          $names = ($_FILES['file'.$i]['name']);
          $file= explode(".",$names);
          $name = $file[0].$ran.'.'.$file[1];
          $uploaddirpath = 'upload/'.$data['post']['style'.$i].'/'.$data['post']['border'.$i].'/'.$data['post']['pipping'.$i].'/'.$data['post']['buttons'.$i].'/';
          $data['uploadfile'] = $uploaddirpath . basename($name);
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
               }
               else
               { 
                    echo "Sorry, there was a problem uploading your file."; 
               } 
          } 

          if((empty($data['post']['style'.$i])) || (empty($data['post']['border'.$i])) ||(empty($data['post']['pipping'.$i])) ||(empty($data['post']['buttons'.$i])) || (empty($data['uploadfile'])))
          {
               continue;
          }   echo "<br/>";
          $this->db->query("INSERT INTO ".DB_PREFIX."neck_images(style,border_color,pipping_color,buttons,attached_images )VALUES ('".$data['post']['style'. $i]."','".$data['post']['border'. $i]."','".$data['post']['pipping'. $i]."','".$data['post']['buttons'. $i]."','".$data['uploadfile']."')");
          $i++;  	
        }
    }	
    
    public function style() 
    { 
           $rslt=$this->db->query("Select * from ".DB_PREFIX."option_value_description where option_id='22'");
           return  $rslt->rows; 
    }     
    public function border() 
    { 
                
          $rsltarea=$this->db->query("Select * from ".DB_PREFIX."option_value_description where option_id='23'");
          return  $rsltarea->rows; 
    }     
    public function pipping() 
    { 
          $rsltdesign=$this->db->query("Select * from ".DB_PREFIX."option_value_description where option_id='24'");
          return  $rsltdesign->rows; 
    }     
    public function buttons() 
    { 
          $rsltdesign=$this->db->query("Select * from ".DB_PREFIX."option_value_description where option_id='25'");
          return  $rsltdesign->rows; 
    }     
}
?>
