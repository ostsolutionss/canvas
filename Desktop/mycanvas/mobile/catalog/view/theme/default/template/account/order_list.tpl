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
          <h1><img alt="" src="catalog/view/theme/default/image/icons/order_history.png"> <?php echo $heading_title; ?></h1>
            <div class="form_next account">
               <?php if ($orders) { ?>
            <div class="table-responsive">
              <table class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <td class="text-left"><?php echo $column_order_id; ?></td>
                    <td class="text-left"><?php echo $column_status; ?></td>
                    <td class="text-left"><?php echo $column_date_added; ?></td>
                    <td class="text-left"><?php echo $column_product; ?></td>
                    <td class="text-left"><?php echo $column_customer; ?></td>
                    <td class="text-left"><?php echo $column_total; ?></td>
                    <td></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($orders as $order) { ?>
                  <tr>
                    <td class="text-left">#<?php echo $order['order_id']; ?></td>
                    <td class="text-left"><?php echo $order['status']; ?></td>
                    <td class="text-left"><?php echo $order['date_added']; ?></td>
                    <td class="text-left"><?php echo $order['products']; ?></td>
                    <td class="text-left"><?php echo $order['name']; ?></td>
                    <td class="text-left"><?php echo $order['total']; ?></td>
                    <td class="text-left"><a href="<?php echo $order['href']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
            <div class="text-right"><?php echo $pagination; ?></div>
            <?php } else { ?>
            <p><?php echo $text_empty; ?></p>
            <?php } ?>
            <div class="buttons clearfix">
              <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
                </div>
    </div>
</div>
</div>
</div>

<?php echo $footer; ?>