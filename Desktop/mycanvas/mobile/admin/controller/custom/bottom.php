<?php

class ControllerCustomBottom extends Controller {

	public function index() {
                $this->load->model('custom/bottom');
		$this->language->load('front/bottom');

		$this->document->setTitle($this->language->get('heading_title'));
                
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('Custom Kurtas'),
			'href' => $this->url->link('custom/customdesign', 'token=' . $this->session->data['token'], 'SSL')
		);

		
		$data['cancel'] = $this->url->link('custom/customdesign', 'token=' . $this->session->data['token'], 'SSL');
                
                $data['heading_title'] = $this->language->get('heading_title');
                $data['result'] = $this->model_custom_bottom->bottomoptions();
                $data['token'] = $this->session->data['token'];
                
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('custom/bottom.tpl', $data));
	}


}