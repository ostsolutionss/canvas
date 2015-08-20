<?php 
class ControllercustomkurtaMeasurements extends Controller {
  private $error = array();

	public function index() 
        {
            
                $this->load->model('customkurta/measurements');   /* CALL TO MODULE FILE  */
            
		$this->load->language('customkurta/measurements');

		/* ------------ BREADCRUMB CODE STARTS HERE ----------------     */
                
                $data['breadcrumbs'] = array(); // Breadcrumbs for your website. 
		$data['breadcrumbs'][] = array(
			'text'			=> $this->language->get('text_home'),
			'href'			=> $this->url->link('common/home'),           
			'separator'		=> false
		);
		$data['breadcrumbs'][] = array(
			'text'			=> $this->language->get('heading_title'),
			'href'      	=> $this->url->link('customslider/static'),
			'separator' 	=> $this->language->get('text_separator')
		);   
                
                /* ------------ BREADCRUMB CODE ENDS HERE ----------------     */
                
                $data['heading_title'] = $this->language->get('heading_title'); /*  PAGE HEADING  */
                
                $custmproid = $_GET['customproid'];  
                
                $data['quantity'] = $_SESSION['quantity'];
                
                $selectedsize= $this->model_customkurta_measurements->getselsctsize($custmproid);
                
                if(count($selectedsize) == 0)
                {
                   $size= "";
                }
                else
                {
                     $size = $selectedsize[0]['size'];
                     
                     $_SESSION['size'] = $selectedsize[0]['size'];
                }
                $productinfo1 = $this->model_customkurta_measurements->product_info($custmproid);
                
                foreach($productinfo1 as $product)
                {
                   
                        $data['productinfo'][] = array(
                        'id' => $product['id'],
                        'product_id' => $product['product_id'],
                        'childid' => $product['childid'],
                        'frontimage' => $product['frontimage'],
                        'backimage' => $product['backimage'],
                        'selectedoption' =>$product['selectedoption'],
                        'price' => $product['price'],
                        'order_id' => $product['order_id'],
                        'proname' => $product['proname'],
                        'optionname' => $product['optionname'],
                        'size' => $size
                        );
                
                }
                
                $userid = $this->customer->getId();
                     if($userid != '')
                     {
                         $data['userid'] = $userid;
                     }
                     else
                     {
                         $data['userid'] = 0;
                     }
                
                 $data['size']= $this->model_customkurta_measurements->getSize();
                
                 if ($this->request->server['HTTPS']) {
			$data['base'] = HTTP_SERVER;
		} else {
			$data['base'] = HTTP_SERVER;
		}
                
                // Text from language file
		$data['heading_title']	= $this->language->get('heading_title'); // Get "heading title" from language file. $data['something'] will allow you to call for this variable from the template file.
		$data['text_content']	= $this->language->get('text_content');
                $data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

                                            
                
                /* -------------------- CALL TO TPL FILES STARTS HERE -------------------------------  */

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/customkurta/measurements.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/customkurta/measurements.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/customkurta/measurements.tpl', $data));
		}
         }
         
         public function addmeasure()
         {
                   $json = array();
                   $this->load->model('customkurta/measurements');  
                   
                   $userid = $this->customer->getId();
                     if($userid != '')
                     {
                         $userid = $userid;
                     }
                     else
                     {
                         $userid = 0;
                     }
                   
                   $data['customproid'] = $_POST['customproid']; 
                   $data['ksize'] = $_POST['ksize'];
                  // $data['selectsize'] = $_POST['selectsize'];
                   $data['user_id'] =  $userid;
                   $this->model_customkurta_measurements->addsize($data);
                   
                   $json['success'] = sprintf($this->language->get('text_success'), $this->url->link('customkurta/measurements'));
                   $this->response->addHeader('Content-Type: application/json');
                   $this->response->setOutput(json_encode($json));
               
         }
         
         protected function validate() 
        {
		if (!$this->user->hasPermission('modify', 'customkurta/measurements')) 
                {
			$this->error['warning'] = $this->language->get('error_permission');
		}
                return !$this->error;
	}
        
        
        public function getmeasures()
        {
            $json = array();
            $this->load->model('customkurta/measurements');  
            $this->load->language('customkurta/measurements');
            $data['userid'] = $_POST['userid'];
            $measurements= $this->model_customkurta_measurements->getmeasure($data);
            if(count($measurements) != '')
            {
                $json['size'] = $measurements[0]['size'];
                
                $data['customproid'] =  $_POST['customproid'];
                $data['ksize'] = $measurements[0]['size'];
                $data['user_id'] =  $_POST['userid'];
                               
                $this->model_customkurta_measurements->addsize($data);
            }
            else
            {
                $json['size'] = 0;
                $json['error'] = $this->language->get('measure_error');
            }
            $json['success'] = sprintf($this->language->get('text_success'), $this->url->link('customkurta/measurements'));
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
        }
}
?>