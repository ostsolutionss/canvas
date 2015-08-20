<?php

class ControllerFrontAddShirt extends Controller {

	public function index() {
		$this->language->load('front/add_shirt');

		$this->load->model('front/addshirt');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
                    
                  //$date[]=  ($_POST);
                    //$data['file']=$_FILES; 
                         // echo "<pre>";print_r($_POST);
                          $data[]=($_POST);
                         
			$this->session->data['success'] = $this->language->get('text_success');

                    /*if ($this->request->server['HTTPS']) {
                   $server = $this->config->get('config_ssl');
                 } else {
                   $server = $this->config->get('config_url');
                 }

                     $data['base'] = $server;*/
            
           
          /*if($data[0][type]=='Front' AND $data[0][Area]=='Full' AND $data[0][Design]==' digital'){
                 $uploaddir = 'uploads/front/full/digital';
                if (!is_dir( $uploaddir)) {
                   mkdir( $uploaddir, 0777);
                    echo "The  $uploaddir directory has been created<br /><br />";
                                 }
                    
              }
              echo  $uploaddir = 'upload/';
                   echo $data['uploadfile'] = $uploaddir . basename($_FILES['file']['name']);
                
                  $this->model_addshirt_addshirt->addshirt($data);
                       //  echo "<pre>";print_r($data);
                         
                    if (move_uploaded_file($_FILES['file']['tmp_name'], $data['uploadfile'])) {
                       
                        echo "File successfully uploaded.\n";
                    } else {
                        echo "Possible file upload ";
                    }*/
                   // $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));

		}

		$data['heading_title'] = $this->language->get('heading_title');

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
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/pp_login', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/add_shirt', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

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

		$data['languages'] = $this->model_localisation_language->getLanguages();

		$data['locales'] = array();

		$data['locales'][] = array(
			'value' => 'en-gb',
			'text' => 'English (Great Britain)'
		);

		$data['locales'][] = array(
			'value' => 'zh-cn',
			'text' => 'Chinese (People\'s Republic of China)'
		);

		$data['locales'][] = array(
			'value' => 'zh-hk',
			'text' => 'Chinese (Hong Kong)',
		);

		$data['locales'][] = array(
			'value' => 'zh-tw',
			'text' => 'Chinese (Taiwan)'
		);

		$data['locales'][] = array(
			'value' => 'zh-xc',
			'text' => 'Chinese (US)'
		);

		$data['locales'][] = array(
			'value' => 'da-dk',
			'text' => 'Danish'
		);

		$data['locales'][] = array(
			'value' => 'nl-nl',
			'text' => 'Dutch'
		);

		$data['locales'][] = array(
			'value' => 'en-au',
			'text' => 'English (Australia)'
		);

		$data['locales'][] = array(
			'value' => 'en-us',
			'text' => 'English (US)',
		);

		$data['locales'][] = array(
			'value' => 'fr-fr',
			'text' => 'French'
		);

		$data['locales'][] = array(
			'value' => 'fr-ca',
			'text' => 'French (Canada)'
		);

		$data['locales'][] = array(
			'value' => 'fr-xc',
			'text' => 'French (international)'
		);

		$data['locales'][] = array(
			'value' => 'de-de',
			'text' => 'German'
		);

		$data['locales'][] = array(
			'value' => 'he-il',
			'text' => 'Hebrew (Israel)'
		);

		$data['locales'][] = array(
			'value' => 'id-id',
			'text' => 'Indonesian'
		);

		$data['locales'][] = array(
			'value' => 'it-il',
			'text' => 'Italian'
		);

		$data['locales'][] = array(
			'value' => 'ja-jp' ,
			'text' => 'Japanese'
		);

		$data['locales'][] = array(
			'value' => 'no-no',
			'text' => 'Norwegian'
		);

		$data['locales'][] = array(
			'value' => 'pl-pl',
			'text' => 'Polish');

		$data['locales'][] = array(
			'value' => 'pt-pt',
			'text' => 'Portuguese'
		);

		$data['locales'][] = array(
			'value' => 'pt-br',
			'text' => 'Portuguese (Brazil)'
		);

		$data['locales'][] = array(
			'value' => 'ru-ru',
			'text' => 'Russian'
		);

		$data['locales'][] = array(
			'value' => 'es-es',
			'text'  => 'Spanish'
		);

		$data['locales'][] = array(
			'value' => 'es-xc',
			'text'  => 'Spanish (Mexico)'
		);

		$data['locales'][] = array(
			'value' => 'sv-se',
			'text'  => 'Swedish'
		);

		$data['locales'][] = array(
			'value' => 'th-th',
			'text'  => 'Thai'
		);

		$data['locales'][] = array(
			'value' => 'tr-tr',
			'text'  => 'Turkish'
		);

		if (isset($this->request->post['add_shirt_locale'])) {
			$data['add_shirt_locale'] = $this->request->post['add_shirt_locale'];
		} else {
			$data['add_shirt_locale'] = $this->config->get('add_shirt_locale');
		}

		$data['return_url'] = HTTPS_CATALOG . 'index.php?route=module/add_shirt/login';

		if (isset($this->request->post['add_shirt_status'])) {
			$data['add_shirt_status'] = $this->request->post['add_shirt_status'];
		} else {
			$data['add_shirt_status'] = $this->config->get('add_shirt_status');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('front/add_shirt.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'front/add_shirt')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['type']) {
			$this->error['type'] = $this->language->get('error_type');
		}

		
		return !$this->error;
	}

	public function install() {
		$this->load->model('extension/event');

		$this->model_extension_event->addEvent('add_shirt', 'post.customer.logout', 'front/add_shirt/logout');
	}

	public function uninstall() {
		$this->load->model('extension/event');

		$this->model_extension_event->deleteEvent('');
	}
}