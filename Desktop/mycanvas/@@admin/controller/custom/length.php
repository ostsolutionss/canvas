<?php
class ControllerCustomLength extends Controller {

	public function index() {
		$this->language->load('front/length');

		$this->load->model('custom/length');

		$this->document->setTitle($this->language->get('heading_title'));
                if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) 
                {
                   
                   $data['post']=  $_POST;
                   $data['file']=$_FILES; 
                   $data['success'] = $this->language->get('text_success');

                   $data['result']=$this->model_custom_length->addlength($data);
                   $this->response->redirect($this->url->link('custom/length', 'msg=success&token=' . $this->session->data['token'], 'SSL'));

		}
                
                $data['lengthlist'] = $this->model_custom_length->lengthlist();
                if ($this->request->server['HTTPS']) {
			$data['base'] = HTTP_CATALOG;
		} else {
			$data['base'] = HTTP_CATALOG;
		}
                
                $data['token'] = $this->session->data['token'];
                
                $data['rstlength']=$this->model_custom_length->length();
               
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_button_grey'] = $this->language->get('text_button_grey');
		$data['text_button_blue'] = $this->language->get('text_button_blue');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');

		$data['length'] = $this->language->get('Sleeve Length');
               
                
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_module_add'] = $this->language->get('button_module_add');
		$data['button_remove'] = $this->language->get('button_remove');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['type'])) {
			$data['error_type'] = $this->error['type'];
		} else {
			$data['error_type'] = '';
		}
                if (isset($this->error['area'])) {
			$data['error_area'] = $this->error['area'];
		} else {
			$data['error_area'] = '';
		}
                if (isset($this->error['design'])) {
			$data['error_design'] = $this->error['design'];
		} else {
			$data['error_design'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
                            'text'      => $this->language->get('Sleeves'),
                            'href'      => $this->url->link('custom/sleeves', 'token=' . $this->session->data['token'], 'SSL'),
                            'separator' => $this->language->get('text_separator')
                );   

                $data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('custom/length', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('custom/length', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('custom/sleeves', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['add_shirt_type'])) {
			$data['add_shirt_type'] = $this->request->post['add_shirt_type'];
		} else {
			$data['add_shirt_type'] = $this->config->get('add_shirt_type');
		}
                if (isset($this->request->post['add_shirt_area'])) {
			$data['add_shirt_area'] = $this->request->post['add_shirt_area'];
		} else {
			$data['add_shirt_area'] = $this->config->get('add_shirt_area');
		}
                if (isset($this->request->post['add_shirt_design'])) {
			$data['add_shirt_design'] = $this->request->post['add_shirt_design'];
		} else {
			$data['add_shirt_design'] = $this->config->get('add_shirt_design');
		}

		
		if (isset($this->request->post['add_shirt_button_colour'])) {
			$data['add_shirt_button_colour'] = $this->request->post['add_shirt_button_colour'];
		} elseif ($this->config->get('add_shirt_button_colour')) {
			$data['add_shirt_button_colour'] = $this->config->get('add_shirt_button_colour');
		} else {
			$data['add_shirt_button_colour'] = 'blue';
		}

		
		$this->load->model('localisation/language');

		

		if (isset($this->request->post['add_shirt_locale'])) {
			$data['add_shirt_locale'] = $this->request->post['add_shirt_locale'];
		} else {
			$data['add_shirt_locale'] = $this->config->get('add_shirt_locale');
		}

		$data['return_url'] = HTTPS_CATALOG . 'index.php?route=custom/length/login';

		if (isset($this->request->post['add_shirt_status'])) {
			$data['add_shirt_status'] = $this->request->post['add_shirt_status'];
		} else {
			$data['add_shirt_status'] = $this->config->get('add_shirt_status');
		}
                
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
                $product_total = $this->model_custom_length->getTotalProducts($filter_data);
                
                $pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('custom/length', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();
                
                $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_total - $this->config->get('config_limit_admin'))) ? $product_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_total, ceil($product_total / $this->config->get('config_limit_admin')));
                
                

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('custom/length.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'custom/length')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
                return !$this->error;
	}
        
        public function deleteoptions()
        {
            $this->load->model('custom/length');
            
            if(isset($_GET['length']))
            {
                $data['lengthid'] = $_GET['length'];
                $this->model_custom_length->deleteoption($data);
                $this->response->redirect($this->url->link('custom/length', 'msg=deletesuccess&token=' . $this->session->data['token'], 'SSL'));
                
            }
        }
	
}