<?php 
class Controllercustomdesigncustomdesign extends Controller {
  private $error = array();

	public function index() {
            
                $this->load->model('customkurta/customkurta');   /* CALL TO MODULE FILE  */
            
		$this->load->language('customkurta/customkurta');

		$this->document->setTitle($this->language->get('heading_title'));   /* SET THE PAGE TITLE */

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
                
                /* -------------------   CALL TO GET THE CODE FOR FABRIC OPTION STARTS HERE --------------  */
                
                $options = $this->model_customkurta_customkurta->getOptions();      
                $option_id = $options[0]['option_id'];
                $data['option_values'] = $this->model_customkurta_customkurta->getOptionValue($option_id);
                
               
                
                /* ------------------- CALL TO GET THE AREA OF FRONT END STARTS HERE  ------------------- */
                
                $data['frontarea']=$this->model_customkurta_customkurta->area();
                
                
                 /*   KURTA FRONT OPTIONS STARTS HERE   */
                
                 $data['karea']   = $this->model_customkurta_customkurta->karea();
                 $data['kdesign'] = $this->model_customkurta_customkurta->kdesign();
                
                           
                /* ------------------- CALL TO GET THE DIGITAL IMAGES FOR FULL AREA OF FRONT END STARTS HERE  ------------------- */
                
                $data['fdigital']     = $this->model_customkurta_customkurta->fdigital();
                $data['midledigital'] = $this->model_customkurta_customkurta->midledigital();
                $data['bodydigital']  = $this->model_customkurta_customkurta->bodydigital();
                $data['neckdigital']  = $this->model_customkurta_customkurta->neckdigital();
                
                
               /* ------------------- CALL TO GET THE EMB IMAGES FOR FULL AREA STARTS HERE  ------------------- */
                
                $data['fembfull']=$this->model_customkurta_customkurta->fembfull();
                $data['fembmiddle']=$this->model_customkurta_customkurta->fembmiddle();
                $data['fembneck']=$this->model_customkurta_customkurta->fembneck();
                $data['fembbody']=$this->model_customkurta_customkurta->fembbody();
                
                 
               /* ------------------- CALL TO GET THE BLOCK PRINT IMAGES FOR FULL AREA STARTS HERE  ------------------- */
                
                $data['fblock']=$this->model_customkurta_customkurta->fblock();
                $data['midleblock']=$this->model_customkurta_customkurta->midleblock();
                $data['bodyblock']=$this->model_customkurta_customkurta->bodyblock();
                $data['neckblock']=$this->model_customkurta_customkurta->neckblock();
                
               
               /* ------------------- CALL TO GET THE NECK STYLE IMAGES STARTS HERE  ------------------- */
                
                
                
                $data['fscreenprint'] = $this->model_customkurta_customkurta->fscreenprint();
                $data['midlesprint'] = $this->model_customkurta_customkurta->midlesprint();
                $data['bodysprint'] = $this->model_customkurta_customkurta->bodysprint();
                $data['necksprint'] = $this->model_customkurta_customkurta->necksprint();
                
                
                /*  NECK OPTIONS  */
                
                
                $data['neckoptions']=$this->model_customkurta_customkurta->neckoptions();
                
                
                /*  NECK OPTIONS */
                
                
                $data['neckstyle']=$this->model_customkurta_customkurta->neckstyle();
                
                
               /* ------------------- CALL TO GET THE NECK STYLE IMAGES STARTS HERE  ------------------- */
                
                $data['neckpipping']=$this->model_customkurta_customkurta->neckpippingcolor();
                
                
               /* ------------------- CALL TO GET THE NECK STYLE IMAGES STARTS HERE  ------------------- */
                
                $data['neckborder']=$this->model_customkurta_customkurta->neckbordercolor();
                
                
               /* ------------------- CALL TO GET THE NECK STYLE IMAGES STARTS HERE  ------------------- */
                
                $data['neckbuttons']=$this->model_customkurta_customkurta->neckbuttons();
                
               
                
                /*                      SLEEVES                 */
                
                
                /*   SLEEVES OPTIONS   */
                
                 $data['sleeveoptions']=$this->model_customkurta_customkurta->sleeveoptions();
                
                
                /*   SLEEVES OPTIONS   */
                
                
                $data['sleevelength']=$this->model_customkurta_customkurta->sleevelength();
                
                $data['sleevepcolour']=$this->model_customkurta_customkurta->sleevepcolour();
                
                $data['sleevebcolour']=$this->model_customkurta_customkurta->sleevebcolour();
                
                $data['sleevebutons']=$this->model_customkurta_customkurta->sleevebutons();
                
                $data['sleevebutonsemb']=$this->model_customkurta_customkurta->sleevebutonsemb();
                
                
                /* ---------------------  GET SITE BASE URL ----------------  */                
                
                if ($this->request->server['HTTPS']) {
			$data['base'] = HTTP_SERVER;
		} else {
			$data['base'] = HTTP_SERVER;
		}
                
                /* --------------- GET PRODUCT INFO -----------------------   */
                
                if(isset($_GET['pro_id']))
                {
                    $data['productid'] = $_GET['pro_id'];
                    $data['proinfo'] = $this->model_customkurta_customkurta->getproductinfo($data);
                    $data['prooption'] = $this->model_customkurta_customkurta->getprooption($data);
                }
                
                $data['currencysymbol']=$this->currency->getSymbolLeft($this->session->data['currency']) ;
                                
                
                
                /* ------------------- CALL TO COMMON FILES STARTS HERE --------------------------------- */
                
                // Text from language file
		$data['heading_title']	= $this->language->get('heading_title'); // Get "heading title" from language file. $data['something'] will allow you to call for this variable from the template file.
		$data['text_content']	= $this->language->get('text_content');
                $data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/custom_footer');
		$data['header'] = $this->load->controller('common/custom_header');
$this->load->model('catalog/product');
                     $data['product_info1'] = $this->model_catalog_product->getProduct($_GET['pro_id']);   
                                            
                
                /* -------------------- CALL TO  TPL FILES STARTS HERE -------------------------------  */

/*		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/customkurta/customkurta.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/customkurta/customkurta.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/customkurta/customkurta.tpl', $data));
		}*/

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/customkurta/customdesign.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/customkurta/customdesign.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/customkurta/customdesign.tpl', $data));
        }
                
               
                
	}
        
        
      
}
?>
