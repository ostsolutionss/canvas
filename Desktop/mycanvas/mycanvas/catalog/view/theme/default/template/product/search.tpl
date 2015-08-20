<?php echo $header; ?>
<?php 
if(isset($_GET['path']))
{
$category_id = $_GET['path'];
}
else
{
$category_id = '';
}
$site_url = "http://".$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME'];
$user_id = $userid['userid'];
?>
<div class="middle">
<div class="container searchpage ">
    
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
   <div class="col-lg-12 fabric_view_right" >
        <div class="fabrics" id="content">
            <h1> <img src="catalog/view/theme/default/image/images/icon_img16.png"  alt=""/> <?php echo $heading_title; ?> </h1>
            <div class="row">
                  <div class="col-sm-3">
                    <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
                  </div>
                  <div class="col-sm-3">
                    <select name="category_id" class="form-control">
                      <option value="0"><?php echo $text_category; ?></option>
                      <?php foreach ($categories as $category_1) { ?>
                      <?php if ($category_1['category_id'] == $category_id) { ?>
                      <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                      <?php } ?>
                      <?php foreach ($category_1['children'] as $category_2) { ?>
                      <?php if ($category_2['category_id'] == $category_id) { ?>
                      <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                      <?php } ?>
                      <?php foreach ($category_2['children'] as $category_3) { ?>
                      <?php if ($category_3['category_id'] == $category_id) { ?>
                      <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                  <div class="col-sm-3">
                    <label class="checkbox-inline">
                      <?php if ($sub_category) { ?>
                      <input type="checkbox" name="sub_category" value="1" checked="checked" />
                      <?php } else { ?>
                      <input type="checkbox" name="sub_category" value="1" />
                      <?php } ?>
                      <?php echo $text_sub_category; ?></label>
                  </div>
                <div class="col-sm-3">
                  <label class="checkbox-inline">
                    <?php if ($description) { ?>
                    <input type="checkbox" name="description" value="1" id="description" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="description" value="1" id="description" />
                    <?php } ?>
                    <?php echo $entry_description; ?></label>
                </div>
                </div>
                
                <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
                <h2><?php echo $text_search; ?></h2>
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
               
                        <?php
                        $i = 0;
                        foreach ($products as $product) { 
                          if($i%4 == 0) {
                            echo $i > 0 ? "</div>" : ""; // close div if it's not the first
                            echo " <div class='row base_row' >";
                          }
                          ?>
                               <div class="col-sm-3 layput_product product-grid">
                            <div class="fabrics_left">
                                <div class="fabrics_img">
                                          <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"  />
                                    <div class="fabrics_div">
                                        <div class="fabrics_icon">
                                            <?php $productid = $product['product_id']; ?>
                                            <a href="<?php echo $site_url; ?>?route=customkurta/customkurta&path=<?php echo $category_id; ?>&pro_id=<?php echo $product['product_id']; ?>&link=<?php echo $user_id; ?>">
                                                <img data-toggle="tooltip" title="<?php echo $button_custom; ?>" src="catalog/view/theme/default/image/images/custom_icon.png" alt=""/> 
                                            </a>
                                            <img class="wishlistimg" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $productid; ?>');" src="catalog/view/theme/default/image/images/icon_img41.png" alt=""/> 
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
                                <h2>  
                                    <a href="<?php echo $site_url; ?>?route=customkurta/customkurta&path=<?php echo $category_id; ?>&pro_id=<?php echo $product['product_id']; ?>&link=<?php echo $user_id; ?>"><?php echo $product['name']; ?></a>
                                    
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
                                </div>
                                <div class="list-view-titles" style="display:none;">
                                <h2>   <a href="<?php echo $site_url; ?>?route=customkurta/customkurta&path=<?php echo $category_id; ?>&pro_id=<?php echo $product['product_id']; ?>&link=<?php echo $user_id; ?>"><?php echo $product['name']; ?></a>
                                      
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
                        
                        
                <div class="row search_pagination">
                        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                    </div>
                <?php } 
                else { ?>
                <p><?php echo $text_empty; ?></p>
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

<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--> 
</script>
<?php echo $footer; ?>