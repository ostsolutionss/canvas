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
          <h1> <img alt="" src="catalog/view/theme/default/image/icons/change_password.png"> <?php echo $heading_title; ?> </h1>
            <div class="form_next account">
                <h5> <?php echo $text_password; ?> </h5>
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <ul>
                        <li class='required'>  
                            <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password"/>
                            <?php if ($error_password) { ?>
                            <div class="text-danger"><?php echo $error_password; ?></div>
                            <?php } ?>
                        </li>
                        <li class='required'>
                            <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm"  />
                            <?php if ($error_confirm) { ?>
                            <div class="text-danger"><?php echo $error_confirm; ?></div>
                            <?php } ?>
                        </li>
                        <li> 
                            <a href="<?php echo $back; ?>" class="btnlogin btnlogin_back"><?php echo $button_back; ?></a>
                            <input type="submit" value="<?php echo $button_continue; ?>" class="btnlogin btnlogin_submit" />
                        </li>
                    </ul>
                </form>
          </div>
    </div>
</div>
</div>
</div>

<?php echo $footer; ?>