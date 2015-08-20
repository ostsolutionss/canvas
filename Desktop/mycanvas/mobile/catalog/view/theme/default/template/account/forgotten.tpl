<?php echo $header; ?>

<div class="work">

<div class="container">
    

    
<div class="row">
    <div class="col-lg-12">
        <div class="reasons">
            <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
            <?php } ?>
            <div class="reasons_midd">
                <h2><?php echo $heading_title; ?>  </h2>
            </div>
            <div class="form_next">
               
                
                 <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" >
                    <ul>
                        <li>  
                            <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email"  />
                        </li>
                        
                        <li> 
                            <!-- <a href="<?php echo $back; ?>" class="btnlogin btnlogin_back"><?php echo $button_back; ?></a> -->
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

<?php //echo $footer; ?>