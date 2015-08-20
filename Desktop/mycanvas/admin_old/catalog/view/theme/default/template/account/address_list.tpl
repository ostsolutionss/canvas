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
        <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
        <?php } ?>
        <?php if ($error_warning) { ?>
        <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
        <?php } ?>
    </div>   
</div>   
    
<div class="row">
    <div class="col-lg-12">
       
                <h1><img alt="" src="catalog/view/theme/default/image/icons/address_book.png"> <?php echo $text_address_book; ?> </h1>
                <div class="form_next account">
                    <?php if ($addresses) { ?>
                    <table class="table table-bordered table-hover addressform">
                      <?php foreach ($addresses as $result) { ?>
                      <tr>
                        <td class="text-left"><?php echo $result['address']; ?></td>
                        <td class="text-right btn_editaddress"><a href="<?php echo $result['update']; ?>" class="btn btn-info"><?php echo $button_edit; ?></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="btn btn-danger"><?php echo $button_delete; ?></a></td>
                      </tr>
                      <?php } ?>
                    </table>
                    <?php } else { ?>
                    <p><?php echo $text_empty; ?></p>
                    <?php } ?>
                    <div class="buttons account_address">
                      <a href="<?php echo $back; ?>" class="btnlogin btnlogin_back"><?php echo $button_back; ?></a>
                      <a href="<?php echo $add; ?>" class="btnlogin btnlogin_submit"><?php echo $button_new_address; ?></a>
                    </div>

              </div>
        
    </div>
</div>
</div>
</div>

<?php echo $footer; ?>