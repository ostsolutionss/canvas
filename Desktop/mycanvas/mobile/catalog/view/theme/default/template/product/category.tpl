<?php echo $header; ?>
<?php
$category_id = $_GET['path'];
$site_url = "http://".$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME'];

$user_id = $userid['userid'];
?>
<main>
      
      <!-- Carousel
      ================================================== -->
      <div class="container">
        <!-- /.carousel -->
          
          <!-- ================================================= -->
          <!-- Swiper -->
           <?php //echo "<pre>";print_r($slider_images);?>
          <div class="swiper-container">
            <div class="swiper-wrapper">
              <?php foreach($slider_images as $slider){ ?>
                     <div class="swiper-slide">
              <img class="second-slide" src="image/<?php echo $slider['href'];?>" alt="Second slide">
                
              </div>
             <?php  }?>
           
              <!-- <div class="swiper-slide">
              <img class="second-slide" src="catalog/view/theme/default/images/u35.jpg" alt="Second slide">

              </div>
              <div class="swiper-slide">
              <img class="third-slide" src="catalog/view/theme/default/images/u37.jpg" alt="Third slide">
              </div> -->
            </div>
            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
          </div>
          <!-- ================================== -->
          <?php
                    $i = 1;
                    if($i%2 == 0 || $i==1){
                      echo '<div class="ui-grid-a product-row">';

                    }
                      foreach ($products as $product) { 
                          if($i%2 == 0) { ?>
                             <div class="ui-block-b"><div class="ui-bar ui-bar-a">
                              <a class ="customlink" href="index.php?route=customdesign/customdesign&path=<?php echo $category_id; ?>&pro_id=<?php echo $product['product_id']; ?>">
                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"  />
                                <div class="price">
                                  <h3><?php if (!$product['special']) { ?>
                                    <?php echo $product['price']; ?>
                                    <?php }?></h3>
                                </div>
                              </a>
                            </div></div>
                            <?php  }
                          else{ ?>
                            <div class="ui-block-a"><div class="ui-bar ui-bar-a">
                                    <a  class ="customlink" href="index.php?route=customdesign/customdesign&path=<?php echo $category_id; ?>&pro_id=<?php echo $product['product_id']; ?>" >
                                  <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"  />
                                  </a>
                                  <div class="price">
                                    <h3><?php if (!$product['special']) { ?>
                                    <?php echo $product['price']; ?>
                                    <?php }?></h3>
                                  </div>
                                
                              </div></div>
                                         <?php   }
                          $i++;
                   }
                   if($i%2 == 0 || $i==1){
                      echo '</div>';

                    }
          ?>
   
              </div>
              
              </main>

</div>


<?php echo $footer; ?>
