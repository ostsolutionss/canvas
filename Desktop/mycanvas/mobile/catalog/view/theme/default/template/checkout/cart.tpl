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
    <?php if ($attention) { ?>
      <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
      <?php if ($success) { ?>
      <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
      <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
    <?php } ?>
</div> 
<div class="row">
    <div class="col-lg-12">
        <h1> <img src="catalog/view/theme/default/image/icons/cart.png" alt=""/> <?php echo $text_checkout_title; ?> </h1>
        <p> <?php echo $text_checkout; ?> </p>
    </div>
</div>
<div class="item">
    <div class="container">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <?php foreach ($products as $product) {  ?>
                        <div class="row check-out">
                            <div class="col-md-2 col-sm-2">
                                <div class="item_left  item_border">
                                    <?php if ($product['thumb']) { ?>
                                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"  class="item_img" />
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <div class="item_left">
                                   <!--  <h1><?php echo $product['name']; ?> <img src="catalog/view/theme/default/image/images/icon_img32.png" alt=""/> </h1> -->
                                    <h2> <?php echo $product['name']; ?> </h2>
                                    <?php if (!$product['stock']) { ?>
                                          <span class="text-danger">***</span>
                                          <?php } ?>
                                          <?php if ($product['option']) { ?>
                                          <?php foreach ($product['option'] as $option) { ?>
                                          <br />
                                          <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                                          <?php } ?>
                                          <?php } ?>
                                          <?php if ($product['reward']) { ?>
                                          <br />
                                          <small><?php echo $product['reward']; ?></small>
                                          <?php } ?>
                                          <?php if ($product['recurring']) { ?>
                                          <br />
                                          <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                                          <?php } ?>
                                          <br />
                                          <?php if ($product['size']) { ?>
                                          <small>Size  : <?php echo $product['size']; ?></small>
                                          <?php } ?>
                                          <br />
                                          <?php if ($product['optionname']) { ?>
                                          <!-- <small>Fabric & Color  : <?php echo $product['optionname']; ?></small> -->
                                          <?php } ?>
                                    <div class="left_itm cart_quantity">
                                       <label> Quantity :</label> <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                                    </div>
                                    <ul>
                                        <li><button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-primary updatebtn"><i class="fa fa-refresh"></i></button> | </li>
                                        <li><?php $productkey = $product['key'];  ?>
                                        <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="cart.remove('<?php echo $productkey; ?>');"><i class="fa fa-times-circle"></i></button> </li>
                                        <!--<li><a href="#"> Copy to designer </a> </li>-->
                                    </ul>
                                </div>
                            </div>
                         <!--    <div class="col-md-3 col-sm-3">
                                <div class="item_right">
                                    <h1> <?php echo $text_specifymeasurement; ?> </h1>
                                    <h2> <a href="index.php?route=customkurta/measurements&customproid=<?php echo $product['customproid']; ?>"> <?php echo $text_measuresize; ?> </a> </h2>
                                </div>
                            </div> -->
                            <div class="col-md-3 col-sm-3">
                                <div class="item_right">
                                    <h3> <?php echo $product['total']; ?> </h3>
                                </div>
                            </div>
                        </div>
                        <p> </p>
             <?php } ?>
        <div class="row">
            <div class="col-md-4 pricetotal pull-right">
                <div class="payment_right">
                    <ul>
                        <?php foreach ($totals as $total) { ?>
                        <li> <font> <?php echo $total['title']; ?> </font> <b> <?php echo $total['text']; ?> </b> </li>
                        <?php } ?>
                    </ul>
                </div>
            </div>
        </div>
        
        </form>
        
        <div class="payment">
            <div class="row">
                <div class="col-md-12">
                    <div class="payment_left">
                        <?php if ($coupon || $voucher || $reward || $shipping) { ?>
                        <h1> <font> $ </font> <?php echo $text_next; ?></h1>
                        <p><?php echo $text_next_choice; ?></p>
                        <div class="panel-group" id="accordion"><?php echo $coupon; ?><?php echo $voucher; ?><?php echo $reward; ?><?php echo $shipping; ?></div>
                        <?php } ?>

                        <div class="payment_visa">
                            <div class="create">
                                <font> <a href="<?php echo $checkout; ?>"><button type="button">  Order Now </button> </a></font>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<?php echo $footer; ?>