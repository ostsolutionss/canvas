<?php echo $header; ?>

<div class="work_next">
<div class="container">
<div class="row">
    <div class="col-lg-12">
        <div class="menu_work">
            <ul>
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a> > </li>
                <?php } ?>
            </ul>
         </div>
    </div>
 </div>
    
<div class="row">
    <div class="col-lg-12">
             <h1> <img alt="" src="catalog/view/theme/default/image/icons/order_history.png"> <?php echo $heading_title; ?> </h1>
            <div class="form contactpage">
                <h3> <?php echo $text_location; ?></h3>
                <div class="row">
                     <?php if ($image) { ?>
                            <div class="col-sm-3">
                                <div class="contact_box contact_box_img">
                                <img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" title="<?php echo $store; ?>" />
                                </div>
                                </div>
                            <?php } ?>
                            <div class="col-sm-3">
                            <div class="contact_box">
                                
                                <strong><?php echo $store; ?></strong>
                              <address>
                              <?php echo $address; ?>
                              </address>
                              <?php if ($geocode) { ?>
                              <a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=en&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                              <?php } ?>
                            </div>
                            </div>
                            <div class="col-sm-3">
                            <div class="contact_box">
                                <strong><?php echo $text_telephone; ?></strong><br>
                              <?php echo $telephone; ?><br />
                              <br />
                              <?php if ($fax) { ?>
                              <strong><?php echo $text_fax; ?></strong><br>
                              <?php echo $fax; ?>
                              <?php } ?>
                            </div>
                            </div>
                            <div class="col-sm-3">
                            <div class="contact_box">
                              <?php if ($open) { ?>
                              <strong><?php echo $text_open; ?></strong><br />
                              <?php echo $open; ?><br />
                              <br />
                              <?php } ?>
                              <?php if ($comment) { ?>
                              <strong><?php echo $text_comment; ?></strong><br />
                              <?php echo $comment; ?>
                              <?php } ?>
                            </div>
                            </div>
                         
                      
                      <?php if ($locations) { ?>
                      <h3><?php echo $text_store; ?></h3>
                      <div class="panel-group" id="accordion">
                        <?php foreach ($locations as $location) { ?>
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
                          </div>
                          <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
                            <div class="panel-body">
                              <div class="row">
                                <?php if ($location['image']) { ?>
                                <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                                <?php } ?>
                                <div class="col-sm-3"><strong><?php echo $location['name']; ?></strong><br />
                                  <address>
                                  <?php echo $location['address']; ?>
                                  </address>
                                  <?php if ($location['geocode']) { ?>
                                  <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=en&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                                  <?php } ?>
                                </div>
                                <div class="col-sm-3"> <strong><?php echo $text_telephone; ?></strong><br>
                                  <?php echo $location['telephone']; ?><br />
                                  <br />
                                  <?php if ($location['fax']) { ?>
                                  <strong><?php echo $text_fax; ?></strong><br>
                                  <?php echo $location['fax']; ?>
                                  <?php } ?>
                                </div>
                                <div class="col-sm-3">
                                  <?php if ($location['open']) { ?>
                                  <strong><?php echo $text_open; ?></strong><br />
                                  <?php echo $location['open']; ?><br />
                                  <br />
                                  <?php } ?>
                                  <?php if ($location['comment']) { ?>
                                  <strong><?php echo $text_comment; ?></strong><br />
                                  <?php echo $location['comment']; ?>
                                  <?php } ?>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <?php } ?>
                      </div>
                      <?php } ?>
               
                </div>
                <h3><?php echo $text_contact; ?></h3>
                <div class="row">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="contact_form" >
                    <div class="col-sm-7">
                    <div class="required required-field">
                            <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" />
                            <?php if ($error_name) { ?>
                            <div class="text-danger"><?php echo $error_name; ?></div>
                            <?php } ?>
                    </div> 
                        
                        <div class="required required-field">
                           <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" />
                            <?php if ($error_email) { ?>
                            <div class="text-danger"><?php echo $error_email; ?></div>
                            <?php } ?>
                        </div>
                        
                         <div class="required required-field">
                             <textarea name="enquiry" rows="7" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
                          
                                 <?php if ($error_enquiry) { ?>
                            <div class="text-danger"><?php echo $error_enquiry; ?></div>
                            <?php } ?>         
                      </div> 
                        
                         <?php if ($site_key) { ?>
                        <div class="required-field"><div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                            <?php if ($error_captcha) { ?>
                              <div class="text-danger"><?php echo $error_captcha; ?></div>
                            <?php } ?>
                         </div>
                      <?php } ?>
                         
                        <input class="btnlogin" type="submit" value="<?php echo $button_submit; ?>" />
                    </div>
                    
                    <div class="col-sm-5">
                    
                    </div>
                   
                </form>
               </div>
            </div>
    </div>
</div>
</div>
</div>


<?php echo $footer; ?>
