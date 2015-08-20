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
          <h1><img alt="" src="catalog/view/theme/default/image/icons/Recurring_Payments.png"> <?php echo $heading_title; ?></h1>
            <div class="form_next account">
                 <?php if ($recurrings) { ?>
                 <div class="row">
                 <div class="col-lg-12">
                <div class="table-responsive">
                  <table class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <td class="text-left"><?php echo $column_recurring_id; ?></td>
                        <td class="text-left"><?php echo $column_date_added; ?></td>
                        <td class="text-left"><?php echo $column_status; ?></td>
                        <td class="text-left"><?php echo $column_product; ?></td>
                        <td class="text-right"><?php echo $column_action; ?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php foreach ($recurrings as $recurring) { ?>
                        <tr>
                          <td class="text-left">#<?php echo $recurring['id']; ?></td>
                          <td class="text-left"><?php echo $recurring['date_added']; ?></td>
                          <td class="text-left"><?php echo $status_types[$recurring['status']]; ?></td>
                          <td class="text-left"><?php echo $recurring['name']; ?></td>
                          <td class="text-right"><a href="<?php echo $recurring['href']; ?>" class="btn btn-info"><?php echo $button_view; ?></a></td>
                        </tr>
                      <?php } ?>
                    </tbody>
                  </table>
                </div>
                     </div>
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