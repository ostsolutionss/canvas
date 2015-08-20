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
            <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
            <?php } ?>
            <div class="reasons_midd">
                <h1> <font> $ </font> <?php echo $heading_title; ?>  </h1>
            </div>
            <div class="form_next">
                <h5> <?php echo $text_email; ?></h5>
                
                 <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" >
                    <ul>
                        <li>  
                            <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email"  />
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
</div>

<?php echo $footer; ?>