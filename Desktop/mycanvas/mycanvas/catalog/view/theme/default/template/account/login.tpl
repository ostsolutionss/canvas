<?php echo $header; ?>
<div class="work">
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
        <div class="reasons">
            <?php if ($success) { ?>
            <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
            <?php } ?>
            <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
            <?php } ?>
            <div class="reasons_midd">
                <h1> <font> $ </font> <?php echo $text_returning_customer; ?>  </h1>
            </div>
            <div class="form_next">
                <h5> <?php echo $text_i_am_returning_customer; ?> </h5>
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <ul>
                        <li>  
                            <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="" />
                        </li>
                        <li>
                            <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="" /> 
                        </li>
                        <li> 
                            <input type="submit" value="<?php echo $button_login; ?>" class="btnlogin" /> 
                            <?php if ($redirect) { ?>
                            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                            <?php } ?>
                        </li>
                        <li class="one"> <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?> </a> </li>

                    </ul>
                </form>
            </div>
            <div class="reasons_bottom">
                <h1> <img src="catalog/view/theme/default/image/images/icon_img39.png" alt=""/> <?php echo $social_login; ?> </h1>
                <ul>
                    <li><a href="#"> <img src="catalog/view/theme/default/image/images/facebook_btn.jpg" alt=""/> </a></li>
                    <li><a href="#"> <img src="catalog/view/theme/default/image/images/google_btn.jpg" alt=""/> </a></li>
                </ul>
                <a href="index.php?route=account/register"><button type="button"> <?php echo $create_account; ?> </button></a>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<?php echo $footer; ?>