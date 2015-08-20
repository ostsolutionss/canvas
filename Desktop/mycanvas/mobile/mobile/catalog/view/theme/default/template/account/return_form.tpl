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
         <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
        <?php } ?>
    </div>
</div>   
 
<div class="row">
    <div class="col-lg-12">
        <h1> <img src="catalog/view/theme/default/image/images/icon_img38.png" alt=""/><?php echo $new_customer_account_text; ?></h1>
    </div>
</div>
</div>
<div class="container">
<div class="row">
    <div class="col-lg-12">
            <h1><img alt="" src="catalog/view/theme/default/image/images/icon_img31.png"><?php echo $heading_title; ?> </h1>
            <p><?php echo $text_description; ?></p>
            <div class="form">
                <h5> <?php echo $text_order; ?> </h5>
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" >
                    <ul>
                    <li class="required">
                        <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                        <?php if ($error_firstname) { ?>
                        <div class="text-danger"><?php echo $error_firstname; ?></div>
                        <?php } ?>
                    </li>
                    <li class="required"> 
                        <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                        <?php if ($error_lastname) { ?>
                        <div class="text-danger"><?php echo $error_lastname; ?></div>
                        <?php } ?>
                    </li>
                    <li class="required"> 
                        <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                        <?php if ($error_email) { ?>
                        <div class="text-danger"><?php echo $error_email; ?></div>
                        <?php } ?>
                    </li>
                    <li class="required"> 
                        <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                        <?php if ($error_telephone) { ?>
                        <div class="text-danger"><?php echo $error_telephone; ?></div>
                        <?php } ?>
                    </li>
                    <li class="required">
                         <input type="text" name="order_id" value="<?php echo $order_id; ?>" placeholder="<?php echo $entry_order_id; ?>" id="input-order-id" class="form-control" />
                        <?php if ($error_order_id) { ?>
                        <div class="text-danger"><?php echo $error_order_id; ?></div>
                        <?php } ?>
                    </li>
                    <li></li>
                    <li><h5><?php echo $text_product; ?> </h5></li>
                        
                    <li class="required">
                        <input type="text" name="product" value="<?php echo $product; ?>" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
                        <?php if ($error_product) { ?>
                        <div class="text-danger"><?php echo $error_product; ?></div>
                        <?php } ?>
                    </li>
                    <li class="required">
                        <input type="text" name="model" value="<?php echo $model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
                        <?php if ($error_model) { ?>
                        <div class="text-danger"><?php echo $error_model; ?></div>
                        <?php } ?>
                    </li>
                    <li>
                        <input type="text" name="quantity" value="<?php echo $quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="form-control" />
                    </li>
                    <li class="required">
                        <?php foreach ($return_reasons as $return_reason) { ?>
                        <?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?>
                        <div class="radio">
                          <label>
                            <input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" checked="checked" />
                            <?php echo $return_reason['name']; ?></label>
                        </div>
                        <?php } else { ?>
                        <div class="radio">
                          <label>
                            <input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" />
                            <?php echo $return_reason['name']; ?></label>
                        </div>
                        <?php  } ?>
                        <?php  } ?>
                        <?php if ($error_reason) { ?>
                        <div class="text-danger"><?php echo $error_reason; ?></div>
                        <?php } ?>
                    </li>
                    <li class="required">
                        <label class="radio-inline">
                        <?php if ($opened) { ?>
                        <input type="radio" name="opened" value="1" checked="checked" />
                        <?php } else { ?>
                        <input type="radio" name="opened" value="1" />
                        <?php } ?>
                        <?php echo $text_yes; ?></label>
                      <label class="radio-inline">
                        <?php if (!$opened) { ?>
                        <input type="radio" name="opened" value="0" checked="checked" />
                        <?php } else { ?>
                        <input type="radio" name="opened" value="0" />
                        <?php } ?>
                        <?php echo $text_no; ?></label>
                    </li>
                    <li>
                         <textarea name="comment" rows="10" placeholder="<?php echo $entry_fault_detail; ?>" id="input-comment" class="form-control"><?php echo $comment; ?></textarea>
                    </li>
                    <?php if ($site_key) { ?>
                    <li>
                      <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                        <?php if ($error_captcha) { ?>
                          <div class="text-danger"><?php echo $error_captcha; ?></div>
                        <?php } ?>
                     </li>
                    <?php } ?>
                 </ul>
                 
                 <?php if ($text_agree) { ?>
                <div class="buttons clearfix">
                  <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-danger"><?php echo $button_back; ?></a></div>
                  <div class="pull-right"><?php echo $text_agree; ?>
                    <?php if ($agree) { ?>
                    <input type="checkbox" name="agree" value="1" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="agree" value="1" />
                    <?php } ?>
                    <input type="submit" value="<?php echo $button_submit; ?>" class="btn btn-primary" />
                  </div>
                </div>
                <?php } else { ?>
                <div class="buttons clearfix">
                  <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
                  <div class="pull-right">
                    <input type="submit" value="<?php echo $button_submit; ?>" class="btnregister" />
                  </div>
                </div>
                <?php } ?>   
                
                <!--<button type="button">  Create an account </button> -->
                </form>
            </div>
    </div>
</div>
</div>
</div>

<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script>
<?php echo $footer; ?>
