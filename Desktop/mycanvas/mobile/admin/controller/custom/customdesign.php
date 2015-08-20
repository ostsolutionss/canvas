<?php 
class ControllerCustomCustomDesign extends Controller 
{
  private $error = array();

	public function index() 
        {
                $this->load->model('custom/customdesign');
                $this->document->setTitle($this->language->get('Custom Kurtas'));
                $data['breadcrumbs'] = array(); // Breadcrumbs for your website. 
		$data['breadcrumbs'][] = array(
			'text'	    => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),           
			'separator' => false
		);
		$data['breadcrumbs'][] = array(
			'text'	    => $this->language->get('Custom Kurtas'),
                        'href'      => $this->url->link('custom/customdesign', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => $this->language->get('text_separator')
		);   
                $data['heading_title'] = $this->language->get('heading_title');
                $data['result'] = $this->model_custom_customdesign->customdesign();
                $data['token'] = $this->session->data['token'];
    

                // Text from language file
		$data['heading_title']	= $this->language->get('heading_title'); // Get "heading title" from language file. $data['something'] will allow you to call for this variable from the template file.
		$data['text_content']	= $this->language->get('text_content');
                $data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

                if ($this->request->server['HTTPS']) 
                {
                    $server = $this->config->get('config_ssl');
                } 
                else 
                {
                    $server = $this->config->get('config_url');
                }
                $data['base'] = $server;
                $this->response->setOutput($this->load->view('custom/customdesign.tpl',$data));
       }
}
?>

