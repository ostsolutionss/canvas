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
        <h1> <img alt="" src="catalog/view/theme/default/image/icons/Product_Returns.png"><?php echo $heading_title; ?></h1>
            <div class="form_next account">
                <?php if ($returns) { ?>
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-right"><?php echo $column_return_id; ?></td>
                      <td class="text-left"><?php echo $column_status; ?></td>
                      <td class="text-left"><?php echo $column_date_added; ?></td>
                      <td class="text-right"><?php echo $column_order_id; ?></td>
                      <td class="text-left"><?php echo $column_customer; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($returns as $return) { ?>
                    <tr>
                      <td class="text-right">#<?php echo $return['return_id']; ?></td>
                      <td class="text-left"><?php echo $return['status']; ?></td>
                      <td class="text-left"><?php echo $return['date_added']; ?></td>
                      <td class="text-right"><?php echo $return['order_id']; ?></td>
                      <td class="text-left"><?php echo $return['name']; ?></td>
                      <td><a href="<?php echo $return['href']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
                <div class="text-right"><?php echo $pagination; ?></div>
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