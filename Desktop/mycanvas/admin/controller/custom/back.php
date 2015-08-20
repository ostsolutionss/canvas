<?php 
class ControllerCustomBack extends Controller 
{
  private $error = array();

	public function index() 
        {
                $this->language->load('front/back');
                $this->load->model('custom/back');
                $data['token'] = $this->session->data['token'];
                $this->document->setTitle($this->language->get('heading_title'));
                
                if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) 
                {
                    $data['post']=  $_POST;
                    $data['file']=$_FILES; 
                    $data['success'] = $this->language->get('text_success');
                    $data['result']=$this->model_custom_back->addshirt($data);
                    $this->response->redirect($this->url->link('custom/back', 'msg=success&token=' . $this->session->data['token'], 'SSL'));
                }
                
                
                $data['backlist'] = $this->model_custom_back->getback();
                
                if ($this->request->server['HTTPS']) {
			$data['base'] = HTTP_CATALOG;
		} else {
			$data['base'] = HTTP_CATALOG;
		}
                
                
                if (isset($this->error['warning'])) 
                {
			$data['error_warning'] = $this->error['warning'];
		} 
                else 
                {
			$data['error_warning'] = '';
		}

		if (isset($this->error['type'])) 
                {
			$data['error_type'] = $this->error['type'];
		} 
                else 
                {
			$data['error_type'] = '';
		}
                if (isset($this->error['area'])) 
                {
			$data['error_area'] = $this->error['area'];
		} 
                else 
                {
			$data['error_area'] = '';
		}
                if (isset($this->error['design'])) 
                {
			$data['error_design'] = $this->error['design'];
		} 
                else 
                {
			$data['error_design'] = '';
		}
                
                $data['breadcrumbs'] = array(); // Breadcrumbs for your website. 
                $data['breadcrumbs'][] = array(
                            'text'			=> $this->language->get('text_home'),
                            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),          
                            'separator'		=> false
                );
                $data['breadcrumbs'][] = array(
                            'text'      => $this->language->get('Custom Kurta'),
                            'href'      => $this->url->link('custom/customdesign', 'token=' . $this->session->data['token'], 'SSL'),
                            'separator' => $this->language->get('text_separator')
                );
                
                $data['action'] = $this->url->link('custom/back', 'token=' . $this->session->data['token'], 'SSL');    
                $data['cancel'] = $this->url->link('custom/customdesign', 'token=' . $this->session->data['token'], 'SSL');
                
                if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
                
                $filter_data = array(
			'start'           => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'           => $this->config->get('config_limit_admin')
		);
                $product_total = $this->model_custom_back->getTotalProducts($filter_data);
                
                $pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('custom/back', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();
                
                $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_total - $this->config->get('config_limit_admin'))) ? $product_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_total, ceil($product_total / $this->config->get('config_limit_admin')));
                
                
                $data['rsttype']=$this->model_custom_back->type();
                $data['rstarea']=$this->model_custom_back->area();
                $data['rstdesign']=$this->model_custom_back->design();
                $data['token'] = $this->session->data['token'];
                $data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_button_grey'] = $this->language->get('text_button_grey');
		$data['text_button_blue'] = $this->language->get('text_button_blue');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
                $data['type'] = $this->language->get('Type');
                $data['area'] = $this->language->get('Area');
                $data['design'] = $this->language->get('Design');
                $data['price'] = $this->language->get('Price');
                
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_module_add'] = $this->language->get('button_module_add');
		$data['button_remove'] = $this->language->get('button_remove');

                // Text from language file
		$data['heading_title']	= $this->language->get('heading_title'); // Get "heading title" from language file. $data['something'] will allow you to call for this variable from the template file.
		$data['text_content']	= $this->language->get('text_content');
                $data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

               
                $this->response->setOutput($this->load->view('custom/back.tpl',$data));
        }
        protected function validate() 
        {
		if (!$this->user->hasPermission('modify', 'custom/add_shirt')) 
                {
			$this->error['warning'] = $this->language->get('error_permission');
		}
                return !$this->error;
	}
        
        public function deleteoptions()
        {
            $this->load->model('custom/back');
            if(isset($_GET['back']))
            {
                $data['backid'] = $_GET['back'];
                $this->model_custom_back->deleteoption($data);
                $this->response->redirect($this->url->link('custom/back', 'msg=deletesuccess&token=' . $this->session->data['token'], 'SSL'));
            }        
        }
}
?>

