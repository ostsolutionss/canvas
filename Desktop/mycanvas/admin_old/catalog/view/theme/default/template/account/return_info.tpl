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
        <h1> <img alt="" src="catalog/view/theme/default/image/images/icon_img31.png"> <?php echo $heading_title; ?> </h1>
          <div class="form_next account">
                <table class="list table table-bordered table-hover">
                <thead>
                  <tr>
                    <td class="text-left" colspan="2"><?php echo $text_return_detail; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="text-left" style="width: 50%;"><b><?php echo $text_return_id; ?></b> #<?php echo $return_id; ?><br />
                      <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
                    <td class="text-left" style="width: 50%;"><b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
                      <b><?php echo $text_date_ordered; ?></b> <?php echo $date_ordered; ?></td>
                  </tr>
                </tbody>
              </table>
              <h2><?php echo $text_product; ?></h2>
              <table class="list table table-bordered table-hover">
                <thead>
                  <tr>
                    <td class="text-left" style="width: 33.3%;"><?php echo $column_product; ?></td>
                    <td class="text-left" style="width: 33.3%;"><?php echo $column_model; ?></td>
                    <td class="text-right" style="width: 33.3%;"><?php echo $column_quantity; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="text-left"><?php echo $product; ?></td>
                    <td class="text-left"><?php echo $model; ?></td>
                    <td class="text-right"><?php echo $quantity; ?></td>
                  </tr>
                </tbody>
              </table>
              <table class="list table table-bordered table-hover">
                <thead>
                  <tr>
                    <td class="text-left" style="width: 33.3%;"><?php echo $column_reason; ?></td>
                    <td class="text-left" style="width: 33.3%;"><?php echo $column_opened; ?></td>
                    <td class="text-left" style="width: 33.3%;"><?php echo $column_action; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="text-left"><?php echo $reason; ?></td>
                    <td class="text-left"><?php echo $opened; ?></td>
                    <td class="text-left"><?php echo $action; ?></td>
                  </tr>
                </tbody>
              </table>
              <?php if ($comment) { ?>
              <table class="list table table-bordered table-hover">
                <thead>
                  <tr>
                    <td class="text-left"><?php echo $text_comment; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="text-left"><?php echo $comment; ?></td>
                  </tr>
                </tbody>
              </table>
              <?php } ?>
              <?php if ($histories) { ?>
              <h2><?php echo $text_history; ?></h2>
              <table class="list table table-bordered table-hover">
                <thead>
                  <tr>
                    <td class="text-left" style="width: 33.3%;"><?php echo $column_date_added; ?></td>
                    <td class="text-left" style="width: 33.3%;"><?php echo $column_status; ?></td>
                    <td class="text-left" style="width: 33.3%;"><?php echo $column_comment; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($histories as $history) { ?>
                  <tr>
                    <td class="text-left"><?php echo $history['date_added']; ?></td>
                    <td class="text-left"><?php echo $history['status']; ?></td>
                    <td class="text-left"><?php echo $history['comment']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
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