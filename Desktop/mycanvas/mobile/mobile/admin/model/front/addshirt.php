<?php

class ModelFrontAddshirt extends Model {

	public function installModule(){
		$sql = " SHOW TABLES LIKE '".DB_PREFIX."add_shirt'";
		$query = $this->db->query( $sql );
		if( count($query->rows) >0 ){
			$this->upgradeToLatest();
			return true;
		}

		$sql = array();

		$sql[] = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."products_image` (
				  `id` int(40) NOT NULL AUTO_INCREMENT,
                                   `type` varchar(225) DEFAULT NULL,
				  `area` varchar(225) DEFAULT NULL,
				  `design` varchar(225) DEFAULT NULL,
				  `attached_image` varchar(225) DEFAULT '0',
				  PRIMARY KEY (`id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC";
		
                }
                  public function addshirt($data) { 
                       //echo"<pre>"; print_r($data);
                  //  echo"<pre>"; print_r($_FILES);
            //print_r(array_chunk($row, 4));
                       // echo $date = date("h:i:s ");
                             
                    
                    $reslts=(array_chunk($data[0], 4, true));
                   // echo "<pre>";print_r($reslts);
                    $i=1;
                    foreach($reslts as $reslt){
                   //print_r($reslt);
                     $ran=  rand(10,100);
                    if($i>$data[0]['addcounter']){
                        continue;
                }
    
                 if( $data[0]['type'.$i] || $data[0]['Area'.$i] || $data[0]['Design'.$i]){
                   
                      $uploaddir = '../upload/'.$data[0]['type'.$i].'/'.$data[0]['Area'.$i].'/'.$data[0]['Design'.$i].'/';
                               // echo"<pre>";print_r( $data[0]['Design'.$i]); 
                       if (!is_dir( $uploaddir)) {
                          mkdir( $uploaddir, 0777,true);
                          echo "The  $uploaddir directory has been created<br /><br />";
                                          }

                        }
                        
                        $names = ($_FILES['file'.$i]['name']);
                        $file= explode(".",$names);
                        echo"<pre>";print_r($file);
                        $name = $file[0].$ran.'.'.$file[1];
                    
                         $data['uploadfile'] = $uploaddir . basename($name);
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

                 

                     $qry="INSERT INTO oc_products_image(type,area,design,attached_image )VALUES ('".$data[0]['type'. $i]."','".$data[0]['Area'. $i]."','".$data[0]['Design'. $i]."','".$data['uploadfile']."')";
                     
                     
                       if((empty($data[0]['type'.$i])) || (empty($data[0]['Area'.$i])) ||(empty($data[0]['Design'.$i])) || (empty($data['uploadfile']))){
                           
                           continue;
                           
                       }   echo "<br/>";
                               
                              
                   $this->db->query("INSERT INTO oc_products_image(type,area,design,attached_image )VALUES ('".$data[0]['type'. $i]."','".$data[0]['Area'. $i]."','".$data[0]['Design'. $i]."','".$data['uploadfile']."')");

                                      $i++;  	

                        }
                        }	

                        }

                        ?>
