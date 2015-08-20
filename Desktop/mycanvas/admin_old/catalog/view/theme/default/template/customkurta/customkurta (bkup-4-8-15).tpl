<?php echo $header; ?>
<?php
if(isset($_GET['pro_id']))
{
    $proiopt = $prooption[0]['image'];
    $optionid = $prooption[0]['option_value_id'];
}
else
{
    $proiopt = '';
    $optionid = '';
}
?>
 
<style>
.slider8 h4 {
  color: #fff;
  text-align: center;
  width: auto !important;
}
.frontcanvascontainer {
  margin: 0 auto;
  position: relative;
}
</style>
 <input type="hidden" name="selectedoptionid" id="selectedoptionid" value="<?php echo $optionid; ?>" />
 <input type="hidden" name="selectedoptionimg" id="selectedoptionimg" value="<?php echo $proiopt; ?>" />

<div class="middle">
<div class="container">
    <div class="container">
    
        <div class="row">
    <div class="col-lg-12">
        <form method="POST" enctype="multipart/form-data" action="" id="myForm">
                <input type="hidden" name="frnt_img_val" id="frnt_img_val" value="" />
                <input type="hidden" name="back_img_val" id="back_img_val" value="" />
                <input type="hidden" name="product_id" id="product_id" value="<?php echo $_GET['pro_id']; ?>" />
                <input id="input-quantity" class="form-control" type="hidden" size="2" value="1" name="quantity">
                <input type="hidden" name="pro_option" id="pro_option" value="" />
                <input type="hidden" name="userid" id="userid" value="<?php echo $_GET['link']; ?>" />
                <input type="hidden" name="categoryid" id="categoryid" value="<?php echo $_GET['path']; ?>" />
                <input type="hidden" name="product_price" id="proprice" value="" />
        </form>
        <div class="menu_top">
            <div class="row">
                <div class="col-md-3 footer-disp"><p class="active-cont" >Fabric</p></div>
                <div class="col-md-7 footer-disp">
                    <div class="slider4" id="carousel-menu">
                        <div class="slide" id="fabric">Fabric</div>
                        <div class="slide" id="front">Front</div>
                        <div class="slide" id="neck">Neck</div>
                        <div class="slide" id="sleeves">Sleeves</div>
                        <div class="slide" id="back">Back</div>
                        <div class="slide" id="bottom">Bottom</div>
                    </div>
                </div>

                <div class="col-md-2">
                    <div class="back">
                        <a href="javascript:void(0);"> <img src="catalog/view/theme/default/image/images/icon_img33.png" alt=""/> Back View </a>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
  </div>  
        <div class="row">
        <div class="col-lg-12">
            
            <div class="front_top">
                                
                <input type="hidden" name="selectedpattern" id="selectedpattern" value="" />
                <div class="front fabriccontainer"  id="left-bar">
                    <div class="fabric_section" >
                        <div class="item active">
                            <div class="slider8">
                                <?php 
                                foreach($option_values as $option_valuess)
                                {
                                ?>
                                <div class="slide">
                                    <img src="image/<?php echo $option_valuess['image']; ?>"  class="img1 img-responsive" alt="<?php echo $option_valuess['option_value_id']; ?>" />
                                    <font class="fabprice"><?php echo $option_valuess['name']; ?>,<?php echo $currencysymbol; ?><b id="fabprice<?php echo $option_valuess['option_value_id']; ?>"><?php echo $option_valuess['price']; ?> </b> </font>
                                </div>
                                <?php
                                } ?>
                            </div>
                        </div>
                    </div>
                </div>  <!--  /* Fabric Section ends here -->
                
                
                <div class="front frontcontainer" id="left-bar" style="display:none;">
                    <div class="front_left">
                        <ul>
                            
                            <li class="current_item_li" id="frontdigital">
                                <a class="active" href="javascript:void(0);">
                                    <img src="catalog/view/theme/default/image/images/icon_img28.png" alt=""/>
                                    <p> Digital </p>
                                </a>
                            </li>
                            <li id="frontemb">
                                <a href="javascript:void(0);"> 
                                    <img src="catalog/view/theme/default/image/images/icon_img29.png" alt=""/> 
                                    <p> Embroidery </p> 
                                </a>
                            </li>
                            <li id="frontblock">
                                <a href="javascript:void(0);">
                                    <img src="catalog/view/theme/default/image/images/icon_img30.png" alt=""/> 
                                    <p> Block print </p> 
                                </a>
                            </li>
                            <li id="frontscreenprint">
                                <a href="javascript:void(0);">
                                    <img src="catalog/view/theme/default/image/images/icon_img30.png" alt=""/> 
                                    <p> Screen Print </p> 
                                </a>
                            </li>
                            <!--<li  id="frontarea">
                                <a href="javascript:void(0);"> 
                                    <img src="catalog/view/theme/default/image/images/icon_img27.png" alt=""/> 
                                    <p> Area </p> 
                                </a>
                            </li> -->
                        </ul>
                    </div>
                    
                    <!-- /* Hidden Fields For Kurta Front Section  -->
                    <input type="hidden" name="sarea" id="sarea" value=""/>
                 <!--   <input type="hidden" name="digitalarea" id="digitalarea" value=""/>
                    <input type="hidden" name="embarea" id="embarea" value=""/>
                    <input type="hidden" name="blockparea" id="blockparea" value=""/>  -->     <!-- /* 4 hidden fields for area selection -->
                    
                    <input type="hidden" name="areapattrn" id="areapattrn" value="" />
                  <!--  <input type="hidden" name="digipattrn" id="digipattrn" value="" />
                    <input type="hidden" name="blockpattrn" id="blockpattrn" value="" />
                    <input type="hidden" name="embpattrn" id="embpattrn" value="" />
                    <input type="hidden" name="screenpattrn" id="screenpattrn" value="" />-->    <!-- /*  4 hidden fields for pattern areas -->
                    
                    
                    <input type="hidden" name="designsections" value="" id="designsections" />
                    
                    
                    <div class="front_right" id="frontarea">
                        <div class="item active">
                            
                             <div class="embsection" style="display:none;">
                                 <div class="slider8">
                                     <div id="embfull" style="display:none">
                                        <?php
                                        if($fembfull != '')
                                        {
                                            foreach($fembfull as $fembrodry)
                                            {          ?>
                                            <div class="slide">
                                                <img class="embimg img-responsive" alt="<?php echo $fembrodry['design']; ?>" src="<?php echo $fembrodry['attached_image']; ?>"  id="<?php echo $fembrodry['id']; ?>"/>
                                                <font class="embprice"><?php echo $currencysymbol; ?><b id="fabembprice<?php echo $fembrodry['id']; ?>"><?php echo $fembrodry['price'];?> </b> </font>
                                            </div>
                                      <?php } ?>
                                            <img class="embimg img-responsive" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png" id="fab0" />
                                            <font class="embprice" style="display:none;"><?php echo $currencysymbol; ?><b id="fabembpricefab0"><?php echo "0";?> </b>  </font>
                                   <?php } ?>
                                 </div>
                                     <div id="embmidle"  style="display:none">
                                        <?php
                                        if($fembmiddle != '')
                                        {
                                            foreach($fembmiddle as $fembrodry)
                                            {          ?>
                                            <div class="slide">
                                                <img class="embimg img-responsive" alt="<?php echo $fembrodry['design']; ?>" src="<?php echo $fembrodry['attached_image']; ?>"  id="<?php echo $fembrodry['id']; ?>"/>
                                                <font class="embprice"><?php echo $currencysymbol; ?><b id="fabembprice<?php echo $fembrodry['id']; ?>"><?php echo $fembrodry['price'];?> </b> </font>
                                            </div>
                                      <?php } ?>
                                            <img class="embimg img-responsive" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png" id="fab0" />
                                            <font class="embprice" style="display:none;"><?php echo $currencysymbol; ?><b id="fabembpricefab0"><?php echo "0";?> </b>  </font>
                                   <?php } ?>
                                 </div>
                                     <div id="embbody"  style="display:none">
                                        <?php
                                        if($fembbody != '')
                                        {
                                            foreach($fembbody as $fembrodry)
                                            {          ?>
                                            <div class="slide">
                                                <img class="embimg img-responsive" alt="<?php echo $fembrodry['design']; ?>" src="<?php echo $fembrodry['attached_image']; ?>"  id="<?php echo $fembrodry['id']; ?>"/>
                                                <font class="embprice"><?php echo $currencysymbol; ?><b id="fabembprice<?php echo $fembrodry['id']; ?>"><?php echo $fembrodry['price'];?> </b> </font>
                                            </div>
                                      <?php } ?>
                                            <img class="embimg img-responsive" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png" id="fab0" />
                                            <font class="embprice" style="display:none;"><?php echo $currencysymbol; ?><b id="fabembpricefab0"><?php echo "0";?> </b>  </font>
                                   <?php } ?>
                                 </div>
                                     <div id="embneck"  style="display:none">
                                        <?php
                                        if($fembneck != '')
                                        {
                                            foreach($fembneck as $fembrodry)
                                            {          ?>
                                            <div class="slide">
                                                <img class="embimg img-responsive" alt="<?php echo $fembrodry['design']; ?>" src="<?php echo $fembrodry['attached_image']; ?>"  id="<?php echo $fembrodry['id']; ?>"/>
                                                <font class="embprice"><?php echo $currencysymbol; ?><b id="fabembprice<?php echo $fembrodry['id']; ?>"><?php echo $fembrodry['price'];?> </b> </font>
                                            </div>
                                      <?php } ?>
                                            <img class="embimg img-responsive" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png" id="fab0" />
                                            <font class="embprice" style="display:none;"><?php echo $currencysymbol; ?><b id="fabembpricefab0"><?php echo "0";?> </b>  </font>
                                   <?php } ?>
                                 </div>
                                    </div>
                             </div>  <!--  /* Embordiory Section Ends Here -->
                            
                             <div class="digitalsection" style="display:none;">
                                 <div class="slider8">
                                     <div id="dfull" style="display:none;">
                                            <?php
                                            if($fdigital != '')
                                            {
                                                foreach($fdigital as $fdigital1)
                                                {
                                            ?>
                                            <div class="slide">
                                                <img class="digitalimg img-responsive" id="<?php echo $fdigital1['id']; ?>" alt="<?php echo $fdigital1['design']; ?>" src="<?php echo $fdigital1['attached_image']; ?>"  /> 
                                                <font class="digiprice"> <?php echo $currencysymbol; ?><b id="fabdigiprice<?php echo $fdigital1['id']; ?>"><?php echo   $fdigital1['price'];?> </b>  </font>
                                            </div>
                                            <?php } ?>
                                                <img class="digitalimg img-responsive" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png" id="digi0" />
                                                <font class="digiprice" style="display:none;"><?php echo $currencysymbol; ?><b id="fabdigipricedigi0"><?php echo "0";?> </b> </font>
                                            <?php } ?>
                                        </div>
                                        <div id="dmidl" style="display:none;">
                                               <?php
                                               if($midledigital != '')
                                               {
                                                   foreach($midledigital as $fdigital1)
                                                   {
                                               ?>
                                               <div class="slide">
                                                   <img class="digitalimg img-responsive" id="<?php echo $fdigital1['id']; ?>" alt="<?php echo $fdigital1['design']; ?>" src="<?php echo $fdigital1['attached_image']; ?>"  /> 
                                                   <font class="digiprice"> <?php echo $currencysymbol; ?><b id="fabdigiprice<?php echo $fdigital1['id']; ?>"><?php echo   $fdigital1['price'];?> </b>  </font>
                                               </div>
                                               <?php } ?>
                                                   <img class="digitalimg img-responsive" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png" id="digi0" />
                                                   <font class="digiprice" style="display:none;"><?php echo $currencysymbol; ?><b id="fabdigipricedigi0"><?php echo "0";?> </b> </font>
                                               <?php } ?>
                                        </div>
                                        <div id="dneck" style="display:none;">
                                               <?php
                                               if($neckdigital != '')
                                               {
                                                   foreach($neckdigital as $fdigital1)
                                                   {
                                               ?>
                                               <div class="slide">
                                                   <img class="digitalimg img-responsive" id="<?php echo $fdigital1['id']; ?>" alt="<?php echo $fdigital1['design']; ?>" src="<?php echo $fdigital1['attached_image']; ?>"  /> 
                                                   <font class="digiprice"> <?php echo $currencysymbol; ?><b id="fabdigiprice<?php echo $fdigital1['id']; ?>"><?php echo   $fdigital1['price'];?> </b>  </font>
                                               </div>
                                               <?php } ?>
                                                   <img class="digitalimg img-responsive" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png" id="digi0" />
                                                   <font class="digiprice" style="display:none;"><?php echo $currencysymbol; ?><b id="fabdigipricedigi0"><?php echo "0";?> </b> </font>
                                               <?php } ?>
                                           </div>
                                            <div id="dbody" style="display:none;">
                                                   <?php
                                                   if($bodydigital != '')
                                                   {
                                                       foreach($bodydigital as $fdigital1)
                                                       {
                                                   ?>
                                                   <div class="slide">
                                                       <img class="digitalimg img-responsive" id="<?php echo $fdigital1['id']; ?>" alt="<?php echo $fdigital1['design']; ?>" src="<?php echo $fdigital1['attached_image']; ?>"  /> 
                                                       <font class="digiprice"> <?php echo $currencysymbol; ?><b id="fabdigiprice<?php echo $fdigital1['id']; ?>"><?php echo   $fdigital1['price'];?> </b>  </font>
                                                   </div>
                                                   <?php } ?>
                                                       <img class="digitalimg img-responsive" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png" id="digi0" />
                                                       <font class="digiprice" style="display:none;"><?php echo $currencysymbol; ?><b id="fabdigipricedigi0"><?php echo "0";?> </b> </font>
                                                   <?php } ?>
                                               </div>
                                 </div>
                             </div>   <!-- /* Digital Design Section Ends Here -->
                            
                             <div class="blocksection" style="display:none;">
                                <div class="slider8">
                                    <div id="blockfull" style="display:none;">
                                        <?php
                                        if($fblock != '')
                                        {
                                            foreach($fblock as $fblockp)
                                            {
                                        ?>
                                        <div class="slide">
                                            <img class="block img-responsive" alt="<?php echo $fblockp['design']; ?>" id="<?php echo $fblockp['id']; ?>" src="<?php echo $fblockp['attached_image']; ?>" />
                                            <font class="blockprice">
                                           <?php echo $currencysymbol; ?><b id="fabblockprice<?php echo $fblockp['id']; ?>"><?php echo  $fblockp['price'];?> </b>
                                            </font>
                                        </div>
                                        <?php } ?>
                                            <img class="block img-responsive" style="border:1px soild #ccc;" id="block0" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                            <font class="blockprice" style="display:none;"> <?php echo $currencysymbol; ?><b id="fabblockpriceblock0"><?php echo "0"?> </b> </font>
                                        <?php } ?>
                                        </div>
                                    <div id="blockmidle" style="display:none;">
                                        <?php
                                        if($midleblock != '')
                                        {
                                            foreach($midleblock as $fblockp)
                                            {
                                        ?>
                                        <div class="slide">
                                            <img class="block img-responsive" alt="<?php echo $fblockp['design']; ?>" id="<?php echo $fblockp['id']; ?>" src="<?php echo $fblockp['attached_image']; ?>" />
                                            <font class="blockprice">
                                           <?php echo $currencysymbol; ?><b id="fabblockprice<?php echo $fblockp['id']; ?>"><?php echo  $fblockp['price'];?> </b>
                                            </font>
                                        </div>
                                        <?php } ?>
                                            <img class="block img-responsive" style="border:1px soild #ccc;" id="block0" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                            <font class="blockprice" style="display:none;"> <?php echo $currencysymbol; ?><b id="fabblockpriceblock0"><?php echo "0"?> </b> </font>
                                        <?php } ?>
                                        </div>
                                    <div id="blockbody" style="display:none;">
                                        <?php
                                        if($bodyblock != '')
                                        {
                                            foreach($bodyblock as $fblockp)
                                            {
                                        ?>
                                        <div class="slide">
                                            <img class="block img-responsive" alt="<?php echo $fblockp['design']; ?>" id="<?php echo $fblockp['id']; ?>" src="<?php echo $fblockp['attached_image']; ?>" />
                                            <font class="blockprice">
                                           <?php echo $currencysymbol; ?><b id="fabblockprice<?php echo $fblockp['id']; ?>"><?php echo  $fblockp['price'];?> </b>
                                            </font>
                                        </div>
                                        <?php } ?>
                                            <img class="block img-responsive" style="border:1px soild #ccc;" id="block0" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                            <font class="blockprice" style="display:none;"> <?php echo $currencysymbol; ?><b id="fabblockpriceblock0"><?php echo "0"?> </b> </font>
                                        <?php } ?>
                                        </div>
                                    <div id="blockneck" style="display:none;">
                                        <?php
                                        if($neckblock != '')
                                        {
                                            foreach($neckblock as $fblockp)
                                            {
                                        ?>
                                        <div class="slide">
                                            <img class="block img-responsive" alt="<?php echo $fblockp['design']; ?>" id="<?php echo $fblockp['id']; ?>" src="<?php echo $fblockp['attached_image']; ?>" />
                                            <font class="blockprice">
                                           <?php echo $currencysymbol; ?><b id="fabblockprice<?php echo $fblockp['id']; ?>"><?php echo  $fblockp['price'];?> </b>
                                            </font>
                                        </div>
                                        <?php } ?>
                                            <img class="block img-responsive" style="border:1px soild #ccc;" id="block0" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                            <font class="blockprice" style="display:none;"> <?php echo $currencysymbol; ?><b id="fabblockpriceblock0"><?php echo "0"?> </b> </font>
                                        <?php } ?>
                                        </div>
                                </div>
                             </div>     <!-- /* Block Design Section Ends Here -->
                             
                             <div class="screensection" style="display:none;">
                                <div class="slider8">
                                    <div id="screenfull" style="display:none;">
                                        <?php
                                        if($fscreenprint != '')
                                        {
                                            foreach($fscreenprint as $fscreenp)
                                            {
                                        ?>
                                        <div class="slide">
                                            <img class="screenp img-responsive" alt="<?php echo $fscreenp['design']; ?>" id="<?php echo $fscreenp['id']; ?>" src="<?php echo $fscreenp['attached_image']; ?>" />
                                            <font class="screenprice">
                                            <?php echo $currencysymbol; ?><b id="fabscreenprice<?php echo $fscreenp['id']; ?>"><?php echo $fscreenp['price'];?> </b>
                                            </font>
                                        </div>
                                        <?php } ?>
                                            <img class="screenp img-responsive" style="border:1px soild #ccc;" id="screen0" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                            <font class="screenprice" style="display:none;"> <?php echo $currencysymbol; ?><b id="fabscreenpricescreen0"><?php echo "0"?> </b> </font>
                                        <?php } ?>
                                    </div>
                                    <div id="screenneck" style="display:none;">
                                        <?php
                                        if($necksprint != '')
                                        {
                                            foreach($necksprint as $fscreenp)
                                            {
                                        ?>
                                        <div class="slide">
                                            <img class="screenp img-responsive" alt="<?php echo $fscreenp['design']; ?>" id="<?php echo $fscreenp['id']; ?>" src="<?php echo $fscreenp['attached_image']; ?>" />
                                            <font class="screenprice">
                                            <?php echo $currencysymbol; ?><b id="fabscreenprice<?php echo $fscreenp['id']; ?>"><?php echo $fscreenp['price'];?> </b>
                                            </font>
                                        </div>
                                        <?php } ?>
                                            <img class="screenp img-responsive" style="border:1px soild #ccc;" id="screen0" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                            <font class="screenprice" style="display:none;"> <?php echo $currencysymbol; ?><b id="fabscreenpricescreen0"><?php echo "0"?> </b> </font>
                                        <?php } ?>
                                    </div>
                                    <div id="screenmidle" style="display:none;">
                                        <?php
                                        if($midlesprint != '')
                                        {
                                            foreach($midlesprint as $fscreenp)
                                            {
                                        ?>
                                        <div class="slide">
                                            <img class="screenp img-responsive" alt="<?php echo $fscreenp['design']; ?>" id="<?php echo $fscreenp['id']; ?>" src="<?php echo $fscreenp['attached_image']; ?>" />
                                            <font class="screenprice">
                                            <?php echo $currencysymbol; ?><b id="fabscreenprice<?php echo $fscreenp['id']; ?>"><?php echo $fscreenp['price'];?> </b>
                                            </font>
                                        </div>
                                        <?php } ?>
                                            <img class="screenp img-responsive" style="border:1px soild #ccc;" id="screen0" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                            <font class="screenprice" style="display:none;"> <?php echo $currencysymbol; ?><b id="fabscreenpricescreen0"><?php echo "0"?> </b> </font>
                                        <?php } ?>
                                    </div>
                                    <div id="screenbody" style="display:none;">
                                        <?php
                                        if($bodysprint != '')
                                        {
                                            foreach($bodysprint as $fscreenp)
                                            {
                                        ?>
                                        <div class="slide">
                                            <img class="screenp img-responsive" alt="<?php echo $fscreenp['design']; ?>" id="<?php echo $fscreenp['id']; ?>" src="<?php echo $fscreenp['attached_image']; ?>" />
                                            <font class="screenprice">
                                            <?php echo $currencysymbol; ?><b id="fabscreenprice<?php echo $fscreenp['id']; ?>"><?php echo $fscreenp['price'];?> </b>
                                            </font>
                                        </div>
                                        <?php } ?>
                                            <img class="screenp img-responsive" style="border:1px soild #ccc;" id="screen0" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                            <font class="screenprice" style="display:none;"> <?php echo $currencysymbol; ?><b id="fabscreenpricescreen0"><?php echo "0"?> </b> </font>
                                        <?php } ?>
                                    </div>
                                </div>
                             </div>     <!-- /* Screen print Design Section Ends Here -->
                                    
                              <div id="shirtareas">
                                    <div class="slider8">
                                         <h4>Choose Area </h4>
                                        <?php foreach($frontarea as $frontarea1){ 
                                        ?>
                                        <div class="slide">
                                            <img src="image/<?php echo $frontarea1['image']; ?>" alt="<?php echo $frontarea1['name']; ?>" id="<?php echo $frontarea1['name']; ?>" class="sel-area sel-area1 img-responsive digiarea" />
                                            <font>
                                                <?php echo $frontarea1['name']; ?>
                                            </font>
                                        </div>
                                        <?php } ?>
                                    </div>
                             </div>  <!-- /* Shirt Area Section Ends Here -->
                             
                        </div>
                        
                    </div>
                </div>  <!-- /* Front Section Ends Here -->
                
                
                <div class="front neckcontainer" id="left-bar" style="display:none;">
                    <div class="front_left">
                        <ul>
                            <li class="current_item_li" id="neckstyle">
                                <a href="javascript:void(0);"> 
                                    <img src="catalog/view/theme/default/image/images/icon_img27.png" alt=""/> 
                                    <p> Style </p> 
                                </a>
                            </li>
                            <li id="neckpipping">
                                <a class="active" href="javascript:void(0);"> 
                                    <img src="catalog/view/theme/default/image/images/icon_img28.png" alt=""/> 
                                    <p> Pipping </p> 
                                </a>
                            </li>
                            <li id="neckborder">
                                <a href="javascript:void(0);"> 
                                    <img src="catalog/view/theme/default/image/images/icon_img29.png" alt=""/> 
                                    <p> Border </p> 
                                </a>
                            </li>
                            <li id="neckbuttons">
                                <a href="javascript:void(0);"> 
                                    <img src="catalog/view/theme/default/image/images/icon_img30.png" alt=""/> 
                                    <p> Buttons </p> 
                                </a>
                            </li>
                        </ul>
                    </div>
                    
                    <div class="front_right">
                        <div class="item active">
                            
                            <!-- /* Hidden Fields of Neck Section -->
                            
                            <input type="hidden" name="neckstyle" id="neckstyle" value=""/>
                            <input type="hidden" name="npippingcolor" id="npippingcolor" value="" />
                            <input type="hidden" name="nbcolour" value="" id="nbcolour" />
                            <input type="hidden" name="nbutns" value="" id="nbutns" />
                            
                            
                            <div class="nstylesection">
                                <div class="slider8">
                                 <?php
                                        if($neckstyle != '')
                                        {
                                            foreach($neckstyle as $neckstyle1){ ?>
                                            <div class="slide">
                                                <img src="<?php echo $neckstyle1['design_icon']; ?>" alt="<?php echo $neckstyle1['design_name']; ?>" id="<?php echo $neckstyle1['design_name']; ?>" itemid="<?php echo $neckstyle1['design_canvas_base']; ?>" itemtype="<?php echo $neckstyle1['design_canvs_outline']; ?>" class="neck-sec img-responsive" />
                                                <font><?php echo $neckstyle1['design_name']; ?></font>
                                            </div>
                                            <?php } ?>
                                 <?php  } ?>
                                </div>
                            </div>  <!-- /* Neck Style Section Ends Here -->
                             
                            <div class="npippingsection" style="display:none;">
                                <div class="slider8">
                                    <?php
                                    if($neckpipping != '')
                                    {
                                        foreach($neckpipping as $neckpipping1)
                                        {
                                        $npcolour = $neckpipping1['neck_pipping_color'];
                                    ?>
                                    <div class="slide">
                                        <p class="npcolor colorblock" id="" alt="" style="background-color:<?php echo $npcolour ?>;"></p>
                                    </div>
                                    <?php } ?>
                                    <p class="npcolor colorblock" id="" alt="" style="background-color:transparent;"></p>
                                    <?php } ?>
                                </div>
                            </div>  <!-- /* Neck Piping Section Ends Here -->
                            
                            <div class="nbordersection" style="display:none; ">
                                <div class="slider8">
                                    <?php
                                    if($neckborder != '')
                                    {
                                        foreach($neckborder as $neckborder1)
                                        {
                                        $nbcolour = $neckborder1['neck_border_color'];
                                    ?>
                                    <div class="slide">
                                        <p class="npbcolor colorblock" id="" alt="" style="background-color:<?php echo $nbcolour ?>;"></p>
                                    </div>
                                    <?php } ?>
                                    <p class="npbcolor colorblock" id="" alt="" style="background-color:transparent;"></p>
                                    <?php } ?>
                                </div>
                            </div>  <!-- Neck Border Section Ends Here -->
                            
                            <div class="nbuttonsection" style="display:none;">
                                <div class="slider8">
                                    <?php
                                    if($neckbuttons != '')
                                    {
                                        foreach($neckbuttons as $neckbuttons1)
                                        {
                                    ?>
                                            <div class="slide">
                                                <img class="nbtns img-responsive" src="<?php echo $neckbuttons1['neck_btnmain_img']; ?>" style="width:50px;" />
                                            </div>
                                    <?php } ?>
                                            <img class="nbtns img-responsive" src="upload/neck/buttons/no-btn33.png" style="width:50px;border:1px solid #ccc; " />
                                    <?php } ?>
                                </div>
                            </div>  <!-- Neck Buttons Section Ends Here -->
                            
                        </div>
                    </div>
                </div>  <!-- /* Neck Section Ends Here -->
                
                
                <div class="front sleevescontainer" id="left-bar" style="display:none;">
                    <div class="front_left">
                        <ul>
                            <li class="current_item_li" id="sleevlength">
                                <a href="javascript:void(0);"> 
                                    <img src="catalog/view/theme/default/image/images/icon_img27.png" alt=""/> 
                                    <p> Length </p> 
                                </a>
                            </li>
                            <li id="sleevfabric">
                                <a class="active" href="javascript:void(0);"> 
                                    <img src="catalog/view/theme/default/image/images/icon_img28.png" alt=""/> 
                                    <p> Fabric </p> 
                                </a>
                            </li>
                            <li id="sleevborder">
                                <a href="javascript:void(0);"> 
                                    <img src="catalog/view/theme/default/image/images/icon_img29.png" alt=""/> 
                                    <p> Border </p> 
                                </a>
                            </li>
                            <li id="sleevemb">
                                <a href="javascript:void(0);"> 
                                    <img src="catalog/view/theme/default/image/images/icon_img30.png" alt=""/> 
                                    <p> Embroidery </p> 
                                </a>
                            </li>
                            <li id="sleevpiping">
                                <a href="javascript:void(0);"> 
                                    <img src="catalog/view/theme/default/image/images/icon_img30.png" alt=""/> 
                                    <p> Pipping </p> 
                                </a>
                            </li>
                            <li id="sleevbuttons">
                                <a href="javascript:void(0);"> 
                                    <img src="catalog/view/theme/default/image/images/icon_img30.png" alt=""/> 
                                    <p> Buttons </p> 
                                </a>
                            </li>
                        </ul>
                    </div>
                    
                    <div class="front_right">
                        <div class="item active">
                            
                            <!-- /* Sleeves Hidden Fields -->
                            
                            <input type="hidden" name="sleevelnth" id="sleevelnth" value=""/>
                            <input type="hidden" name="slevfab" value="" id="slevfab" />
                            <input type="hidden" name="semb" value="" id="semb" />
                            <input type="hidden" name= "scolorarea" id="scolorarea" value="" />
                            <input type="hidden" name="sbcolour" value="" id="sbcolour" />
                            <input type="hidden" name="slepipecolor" id="slepipecolor" value="" />
                            <input type="hidden" name="sbutns" value="" id="sbutns" />
                            
                            <div id="shirtsstyle" >
                                <div class="slider8">
                                    <?php 
                                    if($sleevelength != '')
                                    {
                                    foreach($sleevelength as $sleevelength1){ ?>
                                    <div class="slide">
                                        <img src="<?php echo $sleevelength1['sleve_icon']; ?>" alt="<?php echo $sleevelength1['length']; ?>" id="<?php echo $sleevelength1['length']; ?>" itemid="<?php echo $sleevelength1['sleve_can_base']; ?>" itemtype="<?php echo $sleevelength1['sleve_can_outline']; ?>" class="sleeves-sec img-responsive"/>
                                        <font><?php echo $sleevelength1['length']; ?></font>
                                    </div>
                                    <?php } } ?>
                                </div>
                            </div>
                            
                            <div class="slvfabric" style="display:none;">
                                <div class="slider8">
                                    <?php 
                                    if($option_values != '')
                                    {
                                    foreach($option_values as $option_valuess)
                                    { ?>
                                        <div class="slide">
                                            <img src="image/<?php echo $option_valuess['image']; ?>" class="slevfab img-responsive" style="height: 115px; width : 130px" />
                                        </div>
                                    <?php
                                    } 
                                    } ?>
                               </div>
                            </div>
                            
                            <div class="sbordersection" style="display:none;">
                                <div class="slider8">
                                    <?php
                                    if($sleevebcolour != '')
                                    {
                                        foreach($sleevebcolour as $sleevebcolour1)
                                        {
                                        $sbcolour = $sleevebcolour1['border_color'];
                                    ?>
                                            <div class="slide">
                                            <p class="spbcolor colorblock" id="<?php echo $sbcolour ?>"  style="background-color:<?php echo $sbcolour ?>;"></p>
                                            </div>
                                    <?php } ?>
                                            <p class="spbcolor colorblock" id="transparent"  style="background-color: transparent;"></p>
                              <?php } ?>
                                </div>
                            </div>
                            
                            <div class="sembsection" style="display:none;">
                                <div class="slider8">
                                    <?php
                                    if($sleevebutonsemb != '')
                                    {
                                        foreach($sleevebutonsemb as $sleevebutonsemb1)
                                        {
                                        $slevemb = $sleevebutonsemb1['sleeve_emb_image'];
                                    ?>
                                        <div class="slide">
                                        <img class="slevemb img-responsive" src="<?php echo $slevemb; ?>" style="width : 100px;"/>
                                        </div>
                                    <?php } ?>
                                        <img style="width:50px; height: 50px;border:1px solid #ccc; " class="slevemb img-responsive" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                    <?php } ?>
                                </div>          
                            </div>
                            
                            
                            <div class="spippingsection" style="display:none; ">
                                <div class="slider8">
                                    <?php
                                    if($sleevepcolour != '')
                                    {
                                        foreach($sleevepcolour as $sleevepcolour1)
                                        {
                                        $spcolour = $sleevepcolour1['pipping_color'];
                                    ?>
                                          <div class="slide">
                                            <p class="spcolor colorblock" id="<?php echo $spcolour ?>" style="background-color:<?php echo $spcolour ?>;"></p>
                                          </div>
                                    <?php } ?>
                                            <p class="spcolor colorblock" id="transparent" style="background-color:transparent;"></p>
                                    <?php } ?>
                                </div>
                            </div>
                            
                            <div class="sbuttonsection" style="display:none;">
                                <div class="slider8">
                                    <?php
                                    if($sleevebutons != '')
                                    {
                                        foreach($sleevebutons as $sleevebutons1)
                                        {
                                    ?>
                                            <div class="slide">
                                                <img class="sbtns img-responsive" src="<?php echo $sleevebutons1['attached_image']; ?>" style="width : 25px;"/>
                                            </div> 
                                   <?php } ?>
                                            <img class="sbtns img-responsive" src="upload/neck/buttons/no-btn33.png" style="width:25px;border:1px solid #ccc; " />
                                    <?php } ?>
                                </div>
                            </div>      <!-- -->
                            
                        </div>
                        
                    </div>
                </div>  <!-- /* Sleeves Section Ends Here -->
                
                
                <div class="front backcontainer" id="left-bar" style="display:none;">
                    <div class="front_left">
                        <ul>
                            <li class="current_item_li"><a href="javascript:void(0);"> <img src="catalog/view/theme/default/image/images/icon_img27.png" alt=""/> <p> Area </p> </a></li>
                            <li><a class="active" href="javascript:void(0);"> <img src="catalog/view/theme/default/image/images/icon_img28.png" alt="" /> <p> Digital </p> </a></li>
                            <li><a href="javascript:void(0);"> <img src="catalog/view/theme/default/image/images/icon_img29.png" alt="" /> <p> Embroidery </p> </a></li>
                            <li><a href="javascript:void(0);"> <img src="catalog/view/theme/default/image/images/icon_img30.png" alt="" /> <p> Block print </p> </a></li>
                        </ul>
                    </div>
                    
                    <div class="front_right">
                        <div class="item active">
                            <div class="slider8">
                                <div class="slide"><img src="catalog/view/theme/default/image/images/grup_img26.jpg" class="img-responsive" /></div>
                                <div class="slide"><img src="catalog/view/theme/default/image/images/grup_img27.jpg" class="img-responsive" /></div>
                                <div class="slide"><img src="catalog/view/theme/default/image/images/grup_img28.jpg" class="img-responsive" /></div>
                                <div class="slide"><img src="catalog/view/theme/default/image/images/grup_img29.jpg" class="img-responsive" /></div>
                                <div class="slide"><img src="catalog/view/theme/default/image/images/grup_img26.jpg" class="img-responsive" /></div>
                                <div class="slide"><img src="catalog/view/theme/default/image/images/grup_img27.jpg" class="img-responsive" /></div>
                                <div class="slide"><img src="catalog/view/theme/default/image/images/grup_img28.jpg" class="img-responsive" /></div>
                                <div class="slide"><img src="catalog/view/theme/default/image/images/grup_img29.jpg" class="img-responsive" /></div>
                            </div>
                        </div>
                        
                    </div>
                </div>  <!-- /* Back Section Ends Here -->
                
                
                <div class="front bottomcontainer" id="left-bar" style="display:none;">
                    <div class="front_left">
                        <ul>
                            <li class="current_item_li"><a href="javascript:void(0);"> <img src="catalog/view/theme/default/image/images/icon_img27.png" alt="" /> <p> Area </p> </a></li>
                            <li><a class="active" href="javascript:void(0);"> <img src="catalog/view/theme/default/image/images/icon_img28.png" alt="" /> <p> Digital </p> </a></li>
                            <li><a href="javascript:void(0);"> <img src="catalog/view/theme/default/image/images/icon_img29.png" alt=""/> <p> Embroidery </p> </a></li>
                            <li><a href="javascript:void(0);"> <img src="catalog/view/theme/default/image/images/icon_img30.png" alt=""/> <p> Block print </p> </a></li>
                        </ul>
                    </div>
                    
                    <div class="front_right">
                        <div class="item active">
                            <div class="slider8">
                                <div class="slide"><img src="catalog/view/theme/default/image/images/grup_img26.jpg" class="img-responsive" /></div>
                                <div class="slide"><img src="catalog/view/theme/default/image/images/grup_img27.jpg" class="img-responsive" /></div>
                                <div class="slide"><img src="catalog/view/theme/default/image/images/grup_img28.jpg" class="img-responsive" /></div>
                                <div class="slide"><img src="catalog/view/theme/default/image/images/grup_img29.jpg" class="img-responsive" /></div>
                                <div class="slide"><img src="catalog/view/theme/default/image/images/grup_img26.jpg" class="img-responsive" /></div>
                                <div class="slide"><img src="catalog/view/theme/default/image/images/grup_img27.jpg" class="img-responsive" /></div>
                                <div class="slide"><img src="catalog/view/theme/default/image/images/grup_img28.jpg" class="img-responsive" /></div>
                                <div class="slide"><img src="catalog/view/theme/default/image/images/grup_img29.jpg" class="img-responsive" /></div>
                            </div>
                        </div>
                        
                    </div>
                </div>  <!-- /* Bottom Section Ends Here -->
                
                
                <div class="view">
                    <div class="view_top">
                        <!--<img class="view_image" alt="" src="catalog/view/theme/default/image/images/icon_img34.png"> -->
                              <div class="frontcanvascontainer" id="frontcanvascontainer">
                                <!--  CANVAS   -->
                                <canvas id="canvas" width=295 height=470 style="background:url(catalog/view/theme/default/image/Kurta_new.png); position: absolute; z-index: 9;">
                                </canvas>
                                <canvas id="neckcanvas" width=295 height=470 style="position: absolute; z-index: 11;"></canvas>
                                <canvas id="bodycanvas" width=295 height=470 style="position: absolute; z-index: 10;"></canvas>
                                <canvas id="middlecanvas" width=295 height=470 style="position: absolute; z-index: 9;"></canvas>
                                <canvas id="frontcanvas" width=295 height=470 style="z-index: 99;">
                                </canvas>
                                <!--     CANVAS    -->
                            </div> 
                           <div class="backcanvas" id="backcanvas" style="display:none;">
                                   CANVAS   
                                <canvas id="backside" width=190 height=365 style="background:url(catalog/view/theme/default/image/back/back.png); position: absolute; z-index: 9;">
                                </canvas>
                                <canvas id="backside1" width=190 height=365 style="z-index: 99;">
                                </canvas>
                                <!--     CANVAS  -->
                            </div> 
                        
                        <div class="zoom">
                            <ul>
                                <li><a href="javascript:void(0);"> <img src="catalog/view/theme/default/image/images/icon_img35.jpg" width="50" alt=""/> </a></li>
                                <li><a href="javascript:void(0);"> <img src="catalog/view/theme/default/image/images/icon_img36.jpg" width="50" alt=""/> </a></li>
                                <li><a href="javascript:void(0);"> <img src="catalog/view/theme/default/image/images/icon_img37.jpg" width="50" alt=""/> </a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="view_bottom">
                        <font> <a href="javascript:void(0);" > <img src="catalog/view/theme/default/image/images/reset_btn.jpg" alt="" align="" /> </a></font>
                        <p> <?php 
                    if(isset($_GET['pro_id']))
                    {
                    foreach($proinfo as $proinformation)
                    {
                    ?>
                        <?php echo $currencysymbol; ?><input type="text" name="totalprice" id="totalprice" value="<?php echo $proinformation['original_price']; ?>" style="border: medium none; background: none repeat scroll 0% 0% transparent; box-shadow: none; width: 155px;" />
                        <input type="hidden" name="fabtotal" id="fabtotal" value="" />
                        <input type="hidden" name="fabembtotal" id="fabembtotal" value="" />
                        <input type="hidden" name="originalprice" id="originalprice" value="<?php echo $proinformation['original_price']; ?>" />
                   <?php } }
                   else
                   {
                   ?>
                    <?php echo $currencysymbol; ?><input type="text" name="totalprice" id="totalprice" value="200" style="border: medium none; background: none repeat scroll 0% 0% transparent; box-shadow: none; width: 155px;" />
                   <input type="hidden" name="fabtotal" id="fabtotal" value="" />
                   <input type="hidden" name="fabembtotal" id="fabembtotal" value="" />
                        <input type="hidden" name="originalprice" id="originalprice" value="200" />
                   <?php    
                   }
                   ?></p>
                        <span> <a href="javascript:void(0);" id="button-cart" data-loading-text="Loading..."> <img src="catalog/view/theme/default/image/images/add_btn.jpg" alt="" align=""/> </a> </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>
  



<div class="col-md-7 footer-pos">
        <div class="slider4" id="carousel-menu">
            <div class="slide" data-toggle="modal" data-target="#fabricModal">Fabric</div>
            <div class="slide" data-toggle="modal" data-target="#frontmodel">Front</div>
            <div class="slide" data-toggle="modal" data-target="#neckModal">Neck</div>
            <div class="slide" data-toggle="modal" data-target="#sleevesModal">Sleeves</div>
            <div class="slide" data-toggle="modal" data-target="#backModal">Back</div>
            <div class="slide" data-toggle="modal" data-target="#bottomModal">Bottom</div>
        </div>
</div>


<div class="modal fade" id="fabricModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-12">
               <div class="front_left fabriclist">
                   <ul>
                        <?php 
                        foreach($option_values as $option_valuess)
                        {
                        ?>
                        <li>
                            <img src="image/<?php echo $option_valuess['image']; ?>"  class="img1 img-responsive" alt="<?php echo $option_valuess['option_value_id']; ?>" style="width:100px;" data-dismiss="modal" />
                            <font class="fabprice"><?php echo $option_valuess['name']; ?>,<?php echo $currencysymbol; ?><b id="fabprice<?php echo $option_valuess['option_value_id']; ?>"><?php echo $option_valuess['price']; ?> </b> </font>
                        </li>
                        <?php
                        } ?>
                  </ul>
               </div>
              </div>
            </div>
          </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>  
</div><!-- /. FABRIC modal -->


<div class="modal fade" id="frontmodel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-12">
               <div class="front_left">
                         <ul>
                            
                            <li class="current_item_li" id="frontdigital">
                                <a class="active" href="javascript:void(0);">
                                    <img src="catalog/view/theme/default/image/images/icon_img28.png" alt=""/>
                                    <p> Digital </p>
                                </a>
                            </li>
                            <li id="frontemb">
                                <a href="javascript:void(0);"> 
                                    <img src="catalog/view/theme/default/image/images/icon_img29.png" alt=""/> 
                                    <p> Embroidery </p> 
                                </a>
                            </li>
                            <li id="frontblock">
                                <a href="javascript:void(0);">
                                    <img src="catalog/view/theme/default/image/images/icon_img30.png" alt=""/> 
                                    <p> Block print </p> 
                                </a>
                            </li>
                            <li id="frontscreenprint">
                                <a href="javascript:void(0);">
                                    <img src="catalog/view/theme/default/image/images/icon_img30.png" alt=""/> 
                                    <p> Screen Print </p> 
                                </a>
                            </li>
                        </ul>
               </div>
                  
                <div class="front_right" id="frontarea">
                        <div class="item active">
                            
                             <div class="embsection" style="display:none;">
                                 <div class="slider8">
                                     <div id="embfull" style="display:none">
                                        <?php
                                        if($fembfull != '')
                                        {
                                            foreach($fembfull as $fembrodry)
                                            {          ?>
                                            <div class="slide">
                                                <img class="embimg img-responsive" alt="<?php echo $fembrodry['design']; ?>" src="<?php echo $fembrodry['attached_image']; ?>"  id="<?php echo $fembrodry['id']; ?>"/>
                                                <font class="embprice"><?php echo $currencysymbol; ?><b id="fabembprice<?php echo $fembrodry['id']; ?>"><?php echo $fembrodry['price'];?> </b> </font>
                                            </div>
                                      <?php } ?>
                                            <img class="embimg img-responsive" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png" id="fab0" />
                                            <font class="embprice" style="display:none;"><?php echo $currencysymbol; ?><b id="fabembpricefab0"><?php echo "0";?> </b>  </font>
                                   <?php } ?>
                                 </div>
                                     <div id="embmidle"  style="display:none">
                                        <?php
                                        if($fembmiddle != '')
                                        {
                                            foreach($fembmiddle as $fembrodry)
                                            {          ?>
                                            <div class="slide">
                                                <img class="embimg img-responsive" alt="<?php echo $fembrodry['design']; ?>" src="<?php echo $fembrodry['attached_image']; ?>"  id="<?php echo $fembrodry['id']; ?>"/>
                                                <font class="embprice"><?php echo $currencysymbol; ?><b id="fabembprice<?php echo $fembrodry['id']; ?>"><?php echo $fembrodry['price'];?> </b> </font>
                                            </div>
                                      <?php } ?>
                                            <img class="embimg img-responsive" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png" id="fab0" />
                                            <font class="embprice" style="display:none;"><?php echo $currencysymbol; ?><b id="fabembpricefab0"><?php echo "0";?> </b>  </font>
                                   <?php } ?>
                                 </div>
                                     <div id="embbody"  style="display:none">
                                        <?php
                                        if($fembbody != '')
                                        {
                                            foreach($fembbody as $fembrodry)
                                            {          ?>
                                            <div class="slide">
                                                <img class="embimg img-responsive" alt="<?php echo $fembrodry['design']; ?>" src="<?php echo $fembrodry['attached_image']; ?>"  id="<?php echo $fembrodry['id']; ?>"/>
                                                <font class="embprice"><?php echo $currencysymbol; ?><b id="fabembprice<?php echo $fembrodry['id']; ?>"><?php echo $fembrodry['price'];?> </b> </font>
                                            </div>
                                      <?php } ?>
                                            <img class="embimg img-responsive" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png" id="fab0" />
                                            <font class="embprice" style="display:none;"><?php echo $currencysymbol; ?><b id="fabembpricefab0"><?php echo "0";?> </b>  </font>
                                   <?php } ?>
                                 </div>
                                     <div id="embneck"  style="display:none">
                                        <?php
                                        if($fembneck != '')
                                        {
                                            foreach($fembneck as $fembrodry)
                                            {          ?>
                                            <div class="slide">
                                                <img class="embimg img-responsive" alt="<?php echo $fembrodry['design']; ?>" src="<?php echo $fembrodry['attached_image']; ?>"  id="<?php echo $fembrodry['id']; ?>"/>
                                                <font class="embprice"><?php echo $currencysymbol; ?><b id="fabembprice<?php echo $fembrodry['id']; ?>"><?php echo $fembrodry['price'];?> </b> </font>
                                            </div>
                                      <?php } ?>
                                            <img class="embimg img-responsive" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png" id="fab0" />
                                            <font class="embprice" style="display:none;"><?php echo $currencysymbol; ?><b id="fabembpricefab0"><?php echo "0";?> </b>  </font>
                                   <?php } ?>
                                 </div>
                                    </div>
                             </div>  <!--  /* Embordiory Section Ends Here -->
                            
                             <div class="digitalsection" style="display:none;">
                                 <div class="slider8">
                                     <div id="dfull" style="display:none;">
                                            <?php
                                            if($fdigital != '')
                                            {
                                                foreach($fdigital as $fdigital1)
                                                {
                                            ?>
                                            <div class="slide">
                                                <img class="digitalimg img-responsive" id="<?php echo $fdigital1['id']; ?>" alt="<?php echo $fdigital1['design']; ?>" src="<?php echo $fdigital1['attached_image']; ?>"  /> 
                                                <font class="digiprice"> <?php echo $currencysymbol; ?><b id="fabdigiprice<?php echo $fdigital1['id']; ?>"><?php echo   $fdigital1['price'];?> </b>  </font>
                                            </div>
                                            <?php } ?>
                                                <img class="digitalimg img-responsive" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png" id="digi0" />
                                                <font class="digiprice" style="display:none;"><?php echo $currencysymbol; ?><b id="fabdigipricedigi0"><?php echo "0";?> </b> </font>
                                            <?php } ?>
                                        </div>
                                        <div id="dmidl" style="display:none;">
                                               <?php
                                               if($midledigital != '')
                                               {
                                                   foreach($midledigital as $fdigital1)
                                                   {
                                               ?>
                                               <div class="slide">
                                                   <img class="digitalimg img-responsive" id="<?php echo $fdigital1['id']; ?>" alt="<?php echo $fdigital1['design']; ?>" src="<?php echo $fdigital1['attached_image']; ?>"  /> 
                                                   <font class="digiprice"> <?php echo $currencysymbol; ?><b id="fabdigiprice<?php echo $fdigital1['id']; ?>"><?php echo   $fdigital1['price'];?> </b>  </font>
                                               </div>
                                               <?php } ?>
                                                   <img class="digitalimg img-responsive" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png" id="digi0" />
                                                   <font class="digiprice" style="display:none;"><?php echo $currencysymbol; ?><b id="fabdigipricedigi0"><?php echo "0";?> </b> </font>
                                               <?php } ?>
                                        </div>
                                        <div id="dneck" style="display:none;">
                                               <?php
                                               if($neckdigital != '')
                                               {
                                                   foreach($neckdigital as $fdigital1)
                                                   {
                                               ?>
                                               <div class="slide">
                                                   <img class="digitalimg img-responsive" id="<?php echo $fdigital1['id']; ?>" alt="<?php echo $fdigital1['design']; ?>" src="<?php echo $fdigital1['attached_image']; ?>"  /> 
                                                   <font class="digiprice"> <?php echo $currencysymbol; ?><b id="fabdigiprice<?php echo $fdigital1['id']; ?>"><?php echo   $fdigital1['price'];?> </b>  </font>
                                               </div>
                                               <?php } ?>
                                                   <img class="digitalimg img-responsive" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png" id="digi0" />
                                                   <font class="digiprice" style="display:none;"><?php echo $currencysymbol; ?><b id="fabdigipricedigi0"><?php echo "0";?> </b> </font>
                                               <?php } ?>
                                           </div>
                                            <div id="dbody" style="display:none;">
                                                   <?php
                                                   if($bodydigital != '')
                                                   {
                                                       foreach($bodydigital as $fdigital1)
                                                       {
                                                   ?>
                                                   <div class="slide">
                                                       <img class="digitalimg img-responsive" id="<?php echo $fdigital1['id']; ?>" alt="<?php echo $fdigital1['design']; ?>" src="<?php echo $fdigital1['attached_image']; ?>"  /> 
                                                       <font class="digiprice"> <?php echo $currencysymbol; ?><b id="fabdigiprice<?php echo $fdigital1['id']; ?>"><?php echo   $fdigital1['price'];?> </b>  </font>
                                                   </div>
                                                   <?php } ?>
                                                       <img class="digitalimg img-responsive" style="border:1px soild #ccc;" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png" id="digi0" />
                                                       <font class="digiprice" style="display:none;"><?php echo $currencysymbol; ?><b id="fabdigipricedigi0"><?php echo "0";?> </b> </font>
                                                   <?php } ?>
                                               </div>
                                 </div>
                             </div>   <!-- /* Digital Design Section Ends Here -->
                            
                             <div class="blocksection" style="display:none;">
                                <div class="slider8">
                                    <div id="blockfull" style="display:none;">
                                        <?php
                                        if($fblock != '')
                                        {
                                            foreach($fblock as $fblockp)
                                            {
                                        ?>
                                        <div class="slide">
                                            <img class="block img-responsive" alt="<?php echo $fblockp['design']; ?>" id="<?php echo $fblockp['id']; ?>" src="<?php echo $fblockp['attached_image']; ?>" />
                                            <font class="blockprice">
                                           <?php echo $currencysymbol; ?><b id="fabblockprice<?php echo $fblockp['id']; ?>"><?php echo  $fblockp['price'];?> </b>
                                            </font>
                                        </div>
                                        <?php } ?>
                                            <img class="block img-responsive" style="border:1px soild #ccc;" id="block0" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                            <font class="blockprice" style="display:none;"> <?php echo $currencysymbol; ?><b id="fabblockpriceblock0"><?php echo "0"?> </b> </font>
                                        <?php } ?>
                                        </div>
                                    <div id="blockmidle" style="display:none;">
                                        <?php
                                        if($midleblock != '')
                                        {
                                            foreach($midleblock as $fblockp)
                                            {
                                        ?>
                                        <div class="slide">
                                            <img class="block img-responsive" alt="<?php echo $fblockp['design']; ?>" id="<?php echo $fblockp['id']; ?>" src="<?php echo $fblockp['attached_image']; ?>" />
                                            <font class="blockprice">
                                           <?php echo $currencysymbol; ?><b id="fabblockprice<?php echo $fblockp['id']; ?>"><?php echo  $fblockp['price'];?> </b>
                                            </font>
                                        </div>
                                        <?php } ?>
                                            <img class="block img-responsive" style="border:1px soild #ccc;" id="block0" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                            <font class="blockprice" style="display:none;"> <?php echo $currencysymbol; ?><b id="fabblockpriceblock0"><?php echo "0"?> </b> </font>
                                        <?php } ?>
                                        </div>
                                    <div id="blockbody" style="display:none;">
                                        <?php
                                        if($bodyblock != '')
                                        {
                                            foreach($bodyblock as $fblockp)
                                            {
                                        ?>
                                        <div class="slide">
                                            <img class="block img-responsive" alt="<?php echo $fblockp['design']; ?>" id="<?php echo $fblockp['id']; ?>" src="<?php echo $fblockp['attached_image']; ?>" />
                                            <font class="blockprice">
                                           <?php echo $currencysymbol; ?><b id="fabblockprice<?php echo $fblockp['id']; ?>"><?php echo  $fblockp['price'];?> </b>
                                            </font>
                                        </div>
                                        <?php } ?>
                                            <img class="block img-responsive" style="border:1px soild #ccc;" id="block0" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                            <font class="blockprice" style="display:none;"> <?php echo $currencysymbol; ?><b id="fabblockpriceblock0"><?php echo "0"?> </b> </font>
                                        <?php } ?>
                                        </div>
                                    <div id="blockneck" style="display:none;">
                                        <?php
                                        if($neckblock != '')
                                        {
                                            foreach($neckblock as $fblockp)
                                            {
                                        ?>
                                        <div class="slide">
                                            <img class="block img-responsive" alt="<?php echo $fblockp['design']; ?>" id="<?php echo $fblockp['id']; ?>" src="<?php echo $fblockp['attached_image']; ?>" />
                                            <font class="blockprice">
                                           <?php echo $currencysymbol; ?><b id="fabblockprice<?php echo $fblockp['id']; ?>"><?php echo  $fblockp['price'];?> </b>
                                            </font>
                                        </div>
                                        <?php } ?>
                                            <img class="block img-responsive" style="border:1px soild #ccc;" id="block0" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                            <font class="blockprice" style="display:none;"> <?php echo $currencysymbol; ?><b id="fabblockpriceblock0"><?php echo "0"?> </b> </font>
                                        <?php } ?>
                                        </div>
                                </div>
                             </div>     <!-- /* Block Design Section Ends Here -->
                             
                             <div class="screensection" style="display:none;">
                                <div class="slider8">
                                    <div id="screenfull" style="display:none;">
                                        <?php
                                        if($fscreenprint != '')
                                        {
                                            foreach($fscreenprint as $fscreenp)
                                            {
                                        ?>
                                        <div class="slide">
                                            <img class="screenp img-responsive" alt="<?php echo $fscreenp['design']; ?>" id="<?php echo $fscreenp['id']; ?>" src="<?php echo $fscreenp['attached_image']; ?>" />
                                            <font class="screenprice">
                                            <?php echo $currencysymbol; ?><b id="fabscreenprice<?php echo $fscreenp['id']; ?>"><?php echo $fscreenp['price'];?> </b>
                                            </font>
                                        </div>
                                        <?php } ?>
                                            <img class="screenp img-responsive" style="border:1px soild #ccc;" id="screen0" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                            <font class="screenprice" style="display:none;"> <?php echo $currencysymbol; ?><b id="fabscreenpricescreen0"><?php echo "0"?> </b> </font>
                                        <?php } ?>
                                    </div>
                                    <div id="screenneck" style="display:none;">
                                        <?php
                                        if($necksprint != '')
                                        {
                                            foreach($necksprint as $fscreenp)
                                            {
                                        ?>
                                        <div class="slide">
                                            <img class="screenp img-responsive" alt="<?php echo $fscreenp['design']; ?>" id="<?php echo $fscreenp['id']; ?>" src="<?php echo $fscreenp['attached_image']; ?>" />
                                            <font class="screenprice">
                                            <?php echo $currencysymbol; ?><b id="fabscreenprice<?php echo $fscreenp['id']; ?>"><?php echo $fscreenp['price'];?> </b>
                                            </font>
                                        </div>
                                        <?php } ?>
                                            <img class="screenp img-responsive" style="border:1px soild #ccc;" id="screen0" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                            <font class="screenprice" style="display:none;"> <?php echo $currencysymbol; ?><b id="fabscreenpricescreen0"><?php echo "0"?> </b> </font>
                                        <?php } ?>
                                    </div>
                                    <div id="screenmidle" style="display:none;">
                                        <?php
                                        if($midlesprint != '')
                                        {
                                            foreach($midlesprint as $fscreenp)
                                            {
                                        ?>
                                        <div class="slide">
                                            <img class="screenp img-responsive" alt="<?php echo $fscreenp['design']; ?>" id="<?php echo $fscreenp['id']; ?>" src="<?php echo $fscreenp['attached_image']; ?>" />
                                            <font class="screenprice">
                                            <?php echo $currencysymbol; ?><b id="fabscreenprice<?php echo $fscreenp['id']; ?>"><?php echo $fscreenp['price'];?> </b>
                                            </font>
                                        </div>
                                        <?php } ?>
                                            <img class="screenp img-responsive" style="border:1px soild #ccc;" id="screen0" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                            <font class="screenprice" style="display:none;"> <?php echo $currencysymbol; ?><b id="fabscreenpricescreen0"><?php echo "0"?> </b> </font>
                                        <?php } ?>
                                    </div>
                                    <div id="screenbody" style="display:none;">
                                        <?php
                                        if($bodysprint != '')
                                        {
                                            foreach($bodysprint as $fscreenp)
                                            {
                                        ?>
                                        <div class="slide">
                                            <img class="screenp img-responsive" alt="<?php echo $fscreenp['design']; ?>" id="<?php echo $fscreenp['id']; ?>" src="<?php echo $fscreenp['attached_image']; ?>" />
                                            <font class="screenprice">
                                            <?php echo $currencysymbol; ?><b id="fabscreenprice<?php echo $fscreenp['id']; ?>"><?php echo $fscreenp['price'];?> </b>
                                            </font>
                                        </div>
                                        <?php } ?>
                                            <img class="screenp img-responsive" style="border:1px soild #ccc;" id="screen0" alt="no-fill-patrn" src="upload/no-fill/no-fill-patrn.png"  />
                                            <font class="screenprice" style="display:none;"> <?php echo $currencysymbol; ?><b id="fabscreenpricescreen0"><?php echo "0"?> </b> </font>
                                        <?php } ?>
                                    </div>
                                </div>
                             </div>     <!-- /* Screen print Design Section Ends Here -->
                                    
                             <div id="shirtareas">
                                    <div class="slider8">
                                         <h4>Choose Area </h4>
                                        <?php foreach($frontarea as $frontarea1){ 
                                        ?>
                                        <div class="slide">
                                            <img src="image/<?php echo $frontarea1['image']; ?>" alt="<?php echo $frontarea1['name']; ?>" id="<?php echo $frontarea1['name']; ?>" class="sel-area sel-area1 img-responsive digiarea" />
                                            <font>
                                                <?php echo $frontarea1['name']; ?>
                                            </font>
                                        </div>
                                        <?php } ?>
                                    </div>
                             </div>  <!-- /* Shirt Area Section Ends Here -->
                             
                        </div>
                        
                    </div>   
                  
              </div>
            </div>
          </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>  </div><!-- /. FRONT modal -->


<div class="modal fade" id="neckModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-12">
               <div class="front_left">
                        <ul>
                            <li class="current_item_li"><a href="#"> <img src="catalog/view/theme/default/image/images/icon_img27.png" alt=""/> <p> Area </p> </a></li>
                            <li><a class="active" href="#"> <img src="catalog/view/theme/default/image/images/icon_img28.png" alt=""/> <p> Digital </p> </a></li>
                            <li><a href="#"> <img src="catalog/view/theme/default/image/images/icon_img29.png" alt=""/> <p> Embroidery </p> </a></li>
                            <li><a href="#"> <img src="catalog/view/theme/default/image/images/icon_img30.png" alt=""/> <p> Block print </p> </a></li>
                        </ul>
                    </div>
              </div>
            </div>
          </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>  </div><!-- /. NECK modal -->


<div class="modal fade" id="sleevesModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-12">
               <div class="front_left">
                        <ul>
                            <li class="current_item_li"><a href="#"> <img src="catalog/view/theme/default/image/images/icon_img27.png" alt=""/> <p> Area </p> </a></li>
                            <li><a class="active" href="#"> <img src="catalog/view/theme/default/image/images/icon_img28.png" alt=""/> <p> Digital </p> </a></li>
                            <li><a href="#"> <img src="catalog/view/theme/default/image/images/icon_img29.png" alt=""/> <p> Embroidery </p> </a></li>
                            <li><a href="#"> <img src="catalog/view/theme/default/image/images/icon_img30.png" alt=""/> <p> Block print </p> </a></li>
                        </ul>
                    </div>
              </div>
            </div>
          </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>  </div><!-- /. SLEEVES modal -->


<div class="modal fade" id="backModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-12">
               <div class="front_left">
                        <ul>
                            <li class="current_item_li"><a href="#"> <img src="catalog/view/theme/default/image/images/icon_img27.png" alt=""/> <p> Area </p> </a></li>
                            <li><a class="active" href="#"> <img src="catalog/view/theme/default/image/images/icon_img28.png" alt=""/> <p> Digital </p> </a></li>
                            <li><a href="#"> <img src="catalog/view/theme/default/image/images/icon_img29.png" alt=""/> <p> Embroidery </p> </a></li>
                            <li><a href="#"> <img src="catalog/view/theme/default/image/images/icon_img30.png" alt=""/> <p> Block print </p> </a></li>
                        </ul>
                    </div>
              </div>
            </div>
          </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>  </div><!-- /. BACK modal -->


<div class="modal fade" id="bottomModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-12">
               <div class="front_left">
                        <ul>
                            <li class="current_item_li"><a href="#"> <img src="catalog/view/theme/default/image/images/icon_img27.png" alt=""/> <p> Area </p> </a></li>
                            <li><a class="active" href="#"> <img src="catalog/view/theme/default/image/images/icon_img28.png" alt=""/> <p> Digital </p> </a></li>
                            <li><a href="#"> <img src="catalog/view/theme/default/image/images/icon_img29.png" alt=""/> <p> Embroidery </p> </a></li>
                            <li><a href="#"> <img src="catalog/view/theme/default/image/images/icon_img30.png" alt=""/> <p> Block print </p> </a></li>
                        </ul>
                    </div>
              </div>
            </div>
          </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>  </div><!-- /. BOTTOM modal -->

</div>
<script type="text/javascript"><!--
$(document).ready(function(){
$('#button-cart').on('click', function() {

    $.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#myForm input[type=\'hidden\']'),
		dataType: 'json',
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');
                      //  alert(json);    
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
                      
                                window.location.replace("<?php echo $base; ?>index.php?route=customkurta/kurtaview");
                        }
		}
	});
     
});

});
//--></script>

<?php  echo $footer; ?>
