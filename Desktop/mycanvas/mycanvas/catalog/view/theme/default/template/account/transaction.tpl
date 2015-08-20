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
          <h1><img alt="" src="catalog/view/theme/default/image/icons/Your_Transactions.png"> <?php echo $heading_title; ?></h1>
            <div class="form_next account">
                 <p><?php echo $text_total; ?> <b><?php echo $total; ?></b>.</p>
                 <div class="row">
                      <div class="col-lg-12">
                    <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <td class="text-left"><?php echo $column_date_added; ?></td>
                        <td class="text-left"><?php echo $column_description; ?></td>
                        <td class="text-right"><?php echo $column_amount; ?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php if ($transactions) { ?>
                      <?php foreach ($transactions  as $transaction) { ?>
                      <tr>
                        <td class="text-left"><?php echo $transaction['date_added']; ?></td>
                        <td class="text-left"><?php echo $transaction['description']; ?></td>
                        <td class="text-right"><?php echo $transaction['amount']; ?></td>
                      </tr>
                      <?php } ?>
                      <?php } else { ?>
                      <tr>
                        <td class="text-center" colspan="5"><?php echo $text_empty; ?></td>
                      </tr>
                      <?php } ?>
                    </tbody>
                </table>
                </div>
                 </div>
                 </div>
                <div class="row">
                  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
                <div class="buttons clearfix">
                  <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                </div>
            </div>
    </div>
</div>
</div>
</div>


<?php echo $footer; ?>