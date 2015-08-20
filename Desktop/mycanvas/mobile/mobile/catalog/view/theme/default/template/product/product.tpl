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
        <h1> <img src="catalog/view/theme/default/image/images/icon_img16.png" alt=""/> <?php echo $categoryname; ?> </h1>
    </div>
</div>
<div class="pro">
    <div class="row">
        <div class="col-md-5 col-lg-5 col-sm-5 col-xs-12">
            <div class="pro_left">
                <?php if ($thumb || $images) { ?>
                <?php if ($thumb) { ?>
                <div class="pro_img thumbnails">
                   <a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                    <div class="pro_zoom">
                       <img src="catalog/view/theme/default/image/images/zoom_icon2.jpg" alt=""/> 
                    </div>
                   </a>
                </div>
                <?php } ?>
                <?php if ($images) { ?>
                      <?php foreach ($images as $image) { ?>
                            <div class="slider thumbnails">
                                <ul>
                                    <?php foreach ($images as $image) { ?>
                                    <li class="image-additional">
                                        <a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> 
                                            <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                        </a>
                                    </li>
                                    <?php } ?>
                                </ul>

                            </div>
                      <?php } ?>
                      <?php } ?>
                      <?php } ?>
            </div>
        </div>
        <div class="col-md-7 col-lg-7 col-sm-7 col-xs-12">
            <div class="pro_right" id="product"> 
                <div class="pro_head">
                    <?php echo $heading_title; ?> <font> <?php echo $stock; ?> </font>
                </div>
                <?php echo substr($description,0,250); ?>
                <div class="pro_txt">
                    <?php if ($price) { ?>
                      <?php // if (!$special) { ?>
                      <b>  <?php echo $price; ?></b> 
                      <?php /* }  else { ?>
                      <b>  <?php echo $price; ?></b> 
                      <b> <?php echo $special; ?> </b>  
                      <?php } */ ?>
                      <?php /* if ($tax) { ?>
                      <?php echo $text_tax; ?> <?php echo $tax; ?>
                      <?php } ?>
                      <?php if ($points) { ?>
                      <?php echo $text_points; ?> <?php echo $points; ?>
                      <?php } ?>
                      <?php if ($discounts) { ?>
                     
                      <?php foreach ($discounts as $discount) { ?>
                      <?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?>
                      <?php } ?>
                      <?php } */ ?>
                    <?php } ?>
                    
                    <label> <?php echo $entry_qty; ?> 
                    <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="quentity_input"  />
                    <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                    </label>
                    <?php if ($options) { ?>
                        <hr>
                        <h1><?php echo $text_option; ?></h1>
                        <?php
                            $cur = 0;
                            $rowNum = 1; 
                        ?>
                           <?php foreach ($options as $option) { ?>
                           <?php if($cur == 0)
                            {
                                echo '<ul class="option_listing">';
                            } ?>
                          <li><?php if ($option['type'] == 'select') { ?>
                                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                  <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                                    <option value=""><?php echo $text_select; ?></option>
                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                    <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                    <?php if ($option_value['price']) { ?>
                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                    <?php } ?>
                                    </option>
                                    <?php } ?>
                                  </select>
                                </div>
                                <?php } ?>
                                <?php if ($option['type'] == 'radio') { ?>
                                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                  <label class="control-label"><?php echo $option['name']; ?></label>
                                  <div id="input-option<?php echo $option['product_option_id']; ?>">
                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                    <div class="radio">
                                      <label>
                                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                        <?php echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                        <?php } ?>
                                      </label>
                                    </div>
                                    <?php } ?>
                                  </div>
                                </div>
                                <?php } ?>
                                <?php if ($option['type'] == 'image') { ?>
                                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                  <label class="control-label"><?php echo $option['name']; ?></label>
                                  <div id="input-option<?php echo $option['product_option_id']; ?>">
                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                    <div class="radio">
                                      <label>
                                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                        <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                        <?php } ?>
                                      </label>
                                    </div>
                                    <?php } ?>
                                  </div>
                                </div>
                                <?php } ?>
                                <?php if ($option['type'] == 'text') { ?>
                                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                </div>
                                <?php } ?>
                                <?php if ($option['type'] == 'textarea') { ?>
                                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                  <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
                                </div>
                                <?php } ?>

                                <?php if ($option['type'] == 'file') { ?>
                                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                  <label class="control-label"><?php echo $option['name']; ?></label>
                                  <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block btn_upload"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                                  <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
                                </div>
                                <?php } ?>
                                <?php if ($option['type'] == 'date') { ?>
                                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                  <div class="input-group date">
                                    <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                    <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                    </span></div>
                                </div>
                                <?php } ?>
                                <?php if ($option['type'] == 'datetime') { ?>
                                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                  <div class="input-group datetime">
                                    <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                    <span class="input-group-btn">
                                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                    </span></div>
                                </div>
                                <?php } ?>

                                <?php if ($option['type'] == 'time') { ?>
                                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                  <div class="input-group time">
                                    <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                    <span class="input-group-btn">
                                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                    </span></div>
                                </div>
                                <?php } ?>
                                
                                 <?php if ($option['type'] == 'checkbox') { ?>
                                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                  <label class="control-label"><?php echo $option['name']; ?></label>
                                  <div id="input-option<?php echo $option['product_option_id']; ?>">
                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                    <div class="checkbox">
                                        <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                      <label class="checkbox_title">
                                        <?php echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                        <?php } ?>
                                      </label>
                                    </div>
                                    <?php } ?>
                                  </div>
                                </div>
                                <?php } ?>
                          </li>
                            <?php 
                              if($cur == 2)
                              {
                                  echo '</ul>';
                                  $cur = 0;
                                  $rowNum++;
                              }
                              else
                              {
                                  $cur++;
                              }
                          }
                          }
                          ?>
                </div>
                <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" ><img src="catalog/view/theme/default/image/images/cart_icon2.png" alt=""/> <?php echo $button_cart; ?></button>
                <div class="pro_bottom">
                    Rating
                    <?php if ($products) { ?>
                     <?php foreach ($products as $product) { ?>
                        <?php if ($product['rating']) { ?>
                            <div class="rating">
                              <?php for ($i = 1; $i <= 5; $i++) { ?>
                              <?php if ($product['rating'] < $i) { ?>
                              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                              <?php } else { ?>
                              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                              <?php } ?>
                              <?php } ?>
                            </div>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                 </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="detail">
            <h1> <?php echo $text_productdetail; ?> </h1>
            <?php echo $description; ?>
        </div>
    </div>
</div>
    
<div class="row">
    <div class="col-lg-12"> 
        <div class="related">
            <h1> <?php echo $text_relatedproduct; ?> 
                <font> <a href="javascript:void(0);"> <img src="catalog/view/theme/default/image/images/arw_icon8.png" alt="" /> </a> 
                    <a href="javascript:void(0);"> <img src="catalog/view/theme/default/image/images/arw_icon9.png" alt=""/> </a>
                </font>
            </h1>
            <?php if ($products) { ?>
            <div class="related_styl">
                <div id="carousel4" class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                       <?php for ($i = 0; $i < sizeof($products); $i = $i + count($products)) { ?>
                        <div class="item active">
                            <?php for ($j = $i; $j < count($products); $j++) { ?>
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                <h3> 
                                    <?php if ($products[$j]['thumb']) { ?>
                                    <div class="pro_img thumbnails">
                                       <a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $products[$j]['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />

                                       </a>
                                    </div>
                                    <?php } ?>
                                </h3>
                                <h2>  <?php echo $products[$j]['name']; ?> </h2>
                                <h4>  <?php echo $products[$j]['price']; ?> </h4>
                            </div>
                            <?php } ?>
                        </div> 
                        <?php } ?>
                    </div>
                </div>
            </div>
       <?php } else {  echo $text_no_related;  } ?>
    </div> 
</div>
</div>
</div>
</div>


<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
                        $('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.menu_work').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : ''),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<?php echo $footer; ?>