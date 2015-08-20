<?php 
class ControllercustomkurtaKurtaView extends Controller {
  private $error = array();

	public function index() 
        {
            
                $this->load->model('customkurta/kurtaview');   /* CALL TO MODULE FILE  */
            
		$this->load->language('customkurta/kurtaview');

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
                $data['cart_text'] = $this->language->get('cart_text'); 
                $data['success_msg'] = $this->language->get('success_msg'); 
                $data['continue_text'] = $this->language->get('continue_text'); 
                $data['remove_text'] = $this->language->get('remove_text'); 
                
                
                $custmproid =  $_SESSION['customproid'];
                $productinfo1 = $this->model_customkurta_kurtaview->product_info($custmproid);
                
                $data['procount'] = count($productinfo1);
                
                foreach($productinfo1 as $product)
                {
                   
                        $data['productinfo'][] = array(
                                'id' => $product['id'],
                                'product_id' => $product['product_id'],
                                'frontimage' => $product['frontimage'],
                                'backimage' => $product['backimage'],
                                'selectedoption' =>$product['selectedoption'],
                                'price' => $product['price'],
                                'order_id' => $product['order_id'],
                                'proname' => $product['name'],
                        );
                
                }
                
                $data['productkey'] = $_SESSION['key'];
                
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

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/customkurta/kurtaview.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/customkurta/kurtaview.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/customkurta/kurtaview.tpl', $data));
		}
         }
         
         function removeproduct()
         {
             
             $this->load->model('customkurta/kurtaview');
            if(isset($_GET['id']))
                {
                    $data['id'] = $_GET['id'];
                    $this->model_customkurta_kurtaview->removeproduct($data);
                    $this->response->redirect($this->url->link('customkurta/kurtaview', 'msg=success'));
                }
         }
         
}
?>