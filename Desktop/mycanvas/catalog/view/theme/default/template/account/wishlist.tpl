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
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
</div>  
<div class="row">
    <div class="col-lg-12">
        <h1><img alt="" src="catalog/view/theme/default/image/icons/wish_list.png">  <?php echo $heading_title; ?> </h1>
    </div>
</div>    
<div class="item wishlist_items">
    <div class="container">
         <?php if ($products) { ?>
          <?php foreach ($products as $product) { ?>
        <div class="row check-out">
            <div class="col-md-2 col-sm-2">
                <div class="item_left  item_border">
                    <?php if ($product['thumb']) { ?>
                          <img class="item_img" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                    <?php } ?>
                   
                </div>
            </div>
            <div class="col-md-4 col-sm-4">
                <div class="item_left">
                    <h1> <?php echo $product['name']; ?>   </h1>
                   <?php echo $column_model; ?> : <?php echo $product['model']; ?><br />
                   <?php echo $column_stock; ?> : <?php echo $product['stock']; ?>
                </div>
            </div>
            <div class="col-md-3 col-sm-3">
                <div class="item_right">
                     <h3> <?php if ($product['price']) { ?>
                        
                          <?php if (!$product['special']) { ?>
                          <?php echo $product['price']; ?>
                          <?php } else { ?>
                          <b><?php echo $product['special']; ?></b> <s><?php echo $product['price']; ?></s>
                          <?php } ?>
                       
                        <?php } ?>
                     </h3>
                </div>
            </div>
            <div class="col-md-3 col-sm-3">
                <div class="item_right">
                    <?php $product_id = $product['product_id']; ?>
                   <button type="button" onclick="cart.add('<?php echo $product_id; ?>');" data-toggle="tooltip" title="<?php echo $button_cart; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i></button>
              <a href="<?php echo $product['remove']; ?>" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-primary"><i class="fa fa-times"></i></a>
                </div>
            </div>
        </div>
        <?php } ?>
        <?php } 
         else { ?>
      <?php echo $text_empty; ?>
      <div class="buttons">
        <div class="pull-right"><a class="btn btn-primary" href="<?php echo $continue; ?>"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
    </div>
</div>    
 
</div>
</div>
<?php echo $footer; ?>