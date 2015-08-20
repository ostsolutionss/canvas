<?php
class ControllerCustomBottomEmbroidery extends Controller 
{

	public function index() 
        {
		$this->language->load('front/bottom_embroidery');
                $this->load->model('custom/bottomembroidery');
                $this->document->setTitle($this->language->get('heading_title'));
                $data['token'] = $this->session->data['token'];
                
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) 
                {
                    
                    
                    $data['post']=  $_POST;
                    $data['file']=$_FILES; 
                    $data['success'] = $this->language->get('text_success');
                    $data['result']=$this->model_custom_bottomembroidery->addbottomemb($data);
                    $this->response->redirect($this->url->link('custom/bottom_embroidery', 'msg=success&token=' . $this->session->data['token'], 'SSL'));
                }
                
                $data['emblisting'] = $this->model_custom_bottomembroidery->emblist();
                
                if ($this->request->server['HTTPS']) {
			$data['base'] = HTTP_CATALOG;
		} else {
			$data['base'] = HTTP_CATALOG;
		}
                
                
                
		$data['heading_title'] = $this->language->get('heading_title');
                $data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_button_grey'] = $this->language->get('text_button_grey');
		$data['text_button_blue'] = $this->language->get('text_button_blue');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
                $data['pippingcolor'] = $this->language->get('Choose Pipping Color');
                $data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_module_add'] = $this->language->get('button_module_add');
		$data['button_remove'] = $this->language->get('button_remove');

		if (isset($this->error['warning'])) 
                {
			$data['error_warning'] = $this->error['warning'];
		} 
                else 
                {
			$data['error_warning'] = '';
		}


		$data['breadcrumbs'] = array();
                $data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);
                $data['breadcrumbs'][] = array(
                            'text' => $this->language->get('Bottom'),
                            'href' => $this->url->link('custom/bottom', 'token=' . $this->session->data['token'], 'SSL'),
                            'separator' => $this->language->get('text_separator')
                );
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('custom/bottom_embroidery', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('custom/bottom_embroidery', 'token=' . $this->session->data['token'], 'SSL');
                $data['cancel'] = $this->url->link('custom/bottom', 'token=' . $this->session->data['token'], 'SSL');
                
                
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
                $product_total = $this->model_custom_bottomembroidery->getTotalProducts($filter_data);
                
                $pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('custom/bottom_embroidery', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();
                
                $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_total - $this->config->get('config_limit_admin'))) ? $product_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_total, ceil($product_total / $this->config->get('config_limit_admin')));
                
                

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('custom/bottom_embroidery.tpl', $data));
	}

	protected function validate() 
        {
		if (!$this->user->hasPermission('modify', 'custom/bottom_embroidery')) 
                {
			$this->error['warning'] = $this->language->get('error_permission');
		}
                return !$this->error;
	}
        
        public function delete_emb()
        {
            $this->load->model('custom/bottomembroidery');
            if(isset($_GET['emb']))
                {
                    $data['embid'] = $_GET['emb'];
                    $this->model_custom_bottomembroidery->deleteoption($data);
                    $this->response->redirect($this->url->link('custom/bottom_embroidery', 'msg=deletesuccess&token=' . $this->session->data['token'], 'SSL'));
                }
                
        }
	
}

?>