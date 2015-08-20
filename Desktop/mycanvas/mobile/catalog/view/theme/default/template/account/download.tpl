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
         <h1> <img alt="" src="catalog/view/theme/default/image/icons/account_download.png"> <?php echo $heading_title; ?> </h1>
           <div class="form_next account">
                <?php if ($downloads) { ?>
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-right"><?php echo $column_order_id; ?></td>
                      <td class="text-left"><?php echo $column_name; ?></td>
                      <td class="text-left"><?php echo $column_size; ?></td>
                      <td class="text-left"><?php echo $column_date_added; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($downloads as $download) { ?>
                    <tr>
                      <td class="text-right"><?php echo $download['order_id']; ?></td>
                      <td class="text-left"><?php echo $download['name']; ?></td>
                      <td class="text-left"><?php echo $download['size']; ?></td>
                      <td class="text-left"><?php echo $download['date_added']; ?></td>
                      <td><a href="<?php echo $download['href']; ?>" data-toggle="tooltip" title="<?php echo $button_download; ?>" class="btn btn-primary"><i class="fa fa-cloud-download"></i></a></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
                <div class="row">
                  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
                <?php } else { ?>
                <p><?php echo $text_empty; ?></p>
                <?php } ?>
                <div class="buttons account_address">
                  <a href="<?php echo $continue; ?>" class="btnlogin btnlogin_submit"><?php echo $button_continue; ?></a>
                </div>
                
          </div>
    </div>
</div>
</div>
</div>

<?php echo $footer; ?>