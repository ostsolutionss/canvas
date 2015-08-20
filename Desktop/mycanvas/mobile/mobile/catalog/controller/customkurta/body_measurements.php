<?php 
class ControllercustomkurtaBodyMeasurements extends Controller {
  private $error = array();

	public function index() 
        {
            
              //  $this->load->model('customkurta/measurements');   /* CALL TO MODULE FILE  */
            
		$this->load->language('customkurta/body_measurements');

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
                
               
                $data['custmproid'] = $_SESSION['customproid'];  
                
                $data['quantity'] = $_SESSION['quantity'];
               
                
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

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/customkurta/body_measurements.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/customkurta/body_measurements.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/customkurta/body_measurements.tpl', $data));
		}
         }
         
         public function addmeasure()
         {
             
                    $userid = $this->customer->getId();
                    if($userid != '')
                    {
                        $userid = $userid;
                    }
                    else
                    {
                        $userid = 0;
                    }
                   $json = array();
                   $this->load->model('customkurta/measurements');  
                   $data['customproid'] = $_POST['customproid']; 
                   $data['ksize'] = $_POST['ksize'];
                   //$data['selectsize'] = $_POST['selectsize'];
                   $data['user_id'] =  $userid;
                   $this->model_customkurta_measurements->addsize($data);
                   
                   $json['success'] = sprintf($this->language->get('text_success'), $this->url->link('customkurta/measurements'));
                   
                   $_SESSION['size'] = $_POST['ksize'];
                   
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
}
?>