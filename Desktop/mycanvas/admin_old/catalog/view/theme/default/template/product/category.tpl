<?php echo $header; ?>
<?php
$category_id = $_GET['path'];
$site_url = "http://".$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME'];

$user_id = $userid['userid'];
?>
<div class="middle">
<div class="container categorypage">
    
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
        <?php echo $column_left; ?>
   
    <div class="col-sm-9 fabric_view_right" >
        <div class="fabrics">
            <h1> <img src="catalog/view/theme/default/image/images/icon_img16.png"  alt=""/> <?php echo $heading_title; ?> </h1>
            <?php if ($products) { ?>
            <div class="fabrics_top">
                <div class="sort">
                    <p> <?php echo $text_sort; ?> </p>
                    <div class="select-sec">
                        <select id="input-sort" class="form-control" onchange="location = this.value;">
                            <?php foreach ($sorts as $sorts) { ?>
                            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="sort_icon">
                    <img id="grid-view" class="sort_view" data-toggle="tooltip" title="<?php echo $button_grid; ?>" src="catalog/view/theme/default/image/images/icon_img17.jpg" alt=""/> 
                    <img id="list-view" class="sort_view" data-toggle="tooltip" title="<?php echo $button_list; ?>"  src="catalog/view/theme/default/image/images/icon_img18.jpg" alt=""/> 
                </div>
            </div>
           <div id="content">
            <?php
                        $i = 0;
                        foreach ($products as $product) { 
                          if($i%3 == 0) {
                            echo $i > 0 ? "</div>" : ""; // close div if it's not the first
                            echo " <div class='row base_row' >";
                          }
                          ?>
                                  <div class="col-sm-4 layput_product product-grid col-xs-12">
                        <div class="fabrics_left">
                            <div class="fabrics_img">
                                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"  />
                                 <div class="fabrics_div">
                                    <div class="fabrics_icon">
                                        <?php $productid = $product['product_id']; ?>
                                         <?php if($category_id == 72){ ?>
                                         <a href="<?php echo $product['href']; ?>" >
                                            <img src="catalog/view/theme/default/image/images/custom_icon.png" alt="Add to Cart" title="<?php echo $button_cart; ?>"/> 
                                        </a>
                                         <?php } else { ?>
                                        <a href="<?php echo $site_url; ?>?route=customkurta/customkurta&path=<?php echo $category_id; ?>&pro_id=<?php echo $product['product_id']; ?>&link=<?php echo $user_id; ?>" >
                                            <img src="catalog/view/theme/default/image/images/custom_icon.png" alt="Customize Product" title="<?php echo $button_custom; ?>"/> 
                                        </a> <?php } ?>
                                        <img class="wishlistimg" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $productid; ?>');" src="catalog/view/theme/default/image/images/icon_img41.png" alt="Wishlist"/> 
                                    </div>
                                    <div class="fabrics_star grid-rating">
                                        <?php if ($product['rating']) { ?>
                                        <div class="rating">
                                          <?php for ($i = 1; $i <= 5; $i++) { ?>
                                          <?php if ($product['rating'] < $i) { ?>
                                          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                          <?php } else { ?>
                                          <span class="fa fa-stack"><img src="catalog/view/theme/default/image/images/star_img4.png" alt=""/></span>
                                          <?php } ?>
                                          <?php } ?>
                                        </div>
                                        <?php } ?>
                                        <img src="catalog/view/theme/default/image/images/star_img4.png" alt=""/>
                                    </div>
                                </div>
                            </div>
                            <div class="grid-view-titles" style="display:block;">
                                 <?php if($category_id == 72){ ?>
                                 <h2>   
                                       <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                 </h2>
                                 
                                 <?php } else { ?>
                                    <h2>   
                                            <a href="<?php echo $site_url; ?>?route=customkurta/customkurta&path=<?php echo $category_id; ?>&pro_id=<?php echo $product['product_id']; ?>&link=<?php echo $user_id; ?>"><?php echo $product['name']; ?></a>
                                    </h2>
                                 <?php } ?>
                            <?php if ($product['price']) { ?>
                            <h5> Price : 
                                <font> 
                                    <?php if (!$product['special']) { ?>
                                    <?php echo $product['price']; ?>
                                    <?php } /* else { ?>
                                    <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                                    <?php } ?>
                                    <?php if ($product['tax']) { ?>
                                    <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                    <?php } */ ?>
                                </font> 
                            </h5>
                            <?php } ?>
                            </div>
                            <div class="list-view-titles" style="display:none;">
                            <h2>    <a href="<?php echo $site_url; ?>?route=customkurta/customkurta&path=<?php echo $category_id; ?>&pro_id=<?php echo $product['product_id']; ?>&link=<?php echo $user_id; ?>"><?php echo $product['name']; ?></a>
                                 
                            </h2>
                            <?php if ($product['price']) { ?>
                            <h5> Price : 
                                <font> 
                                    <?php if (!$product['special']) { ?>
                                    <?php echo $product['price']; ?>
                                    <?php } /* else { ?>
                                    <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                                    <?php } ?>
                                    <?php if ($product['tax']) { ?>
                                    <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                    <?php } */ ?>
                                </font> 
                            </h5>
                            <?php } ?>
                            
                            <div class="fabrics_star list-rating">
                                        <?php if ($product['rating']) { ?>
                                        <div class="rating">
                                          <?php for ($i = 1; $i <= 5; $i++) { ?>
                                          <?php if ($product['rating'] < $i) { ?>
                                          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                          <?php } else { ?>
                                          <span class="fa fa-stack"><img src="catalog/view/theme/default/image/images/star_img4.png" alt=""/></span>
                                          <?php } ?>
                                          <?php } ?>
                                        </div>
                                        <?php } ?>
                                        <img src="catalog/view/theme/default/image/images/star_img4.png" alt=""/>
                                    </div>
                            </div>
                            
                        </div>
                    </div>             
                        <?php
                        $i++;
                        }
                        ?>
                        </div> <!-- close last container div -->
                        </div>
                        
            <div class="row search_pagination">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
            <?php } ?>
            <?php if (!$categories && !$products) { ?>
            <div class="fabrics_top"></div>
            <div class="row base_row" id="content">
                <p><?php echo $text_empty; ?></p>
                <div class="buttons">
                  <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
</div>
</div>
</div>

<script>

$(document).ready(function(){
     $(".sort_view").click(function(){
        var id = $(this).attr("id");
        if(id == 'grid-view')
            {
                  $("#content .layput_product").removeClass( "product-list" ).addClass( "product-grid" );
                  $(".list-view-titles").hide();
                  $(".grid-view-titles").show();
                  $(".grid-rating").show();
            }
        if(id == 'list-view')
            {
                  $("#content .layput_product").removeClass( "product-grid " ).addClass( "product-list" );
                  $(".list-view-titles").show();
                  $(".grid-view-titles").hide();
                  $(".grid-rating").hide();
            }
    
    });
});


$(window).load(function(){

    var windowwidth = $( window ).width();
    if(windowwidth == '767') 
    {
           $("#content .layput_product").removeClass( "product-list" ).addClass( "product-grid" );
           $(".list-view-titles").hide();
           $(".grid-view-titles").show();
           $(".grid-rating").show();
    }

});

</script>

<?php echo $footer; ?>
