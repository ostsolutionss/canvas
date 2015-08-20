<div class="clearfix"></div>
<div class="orders">
<div class="container">
<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12">
        <ul>
            <li><a href="javascript:void(0);"> <img class="one" src="catalog/view/theme/default/image/images/icon_img5.png" alt=""/> TAILORED CLOTHING </a></li>
            <li><a href="javascript:void(0);"> <img src="catalog/view/theme/default/image/images/icon_img6.png" alt=""/> FREE SHIPPING ON ORDERS ABOVE $150! </a></li>
            <li><a href="javascript:void(0);"> <img class="one" src="catalog/view/theme/default/image/images/icon_img7.png" alt=""/> GUARANTEED PERFECT FIT </a></li>
        </ul>
    </div>
</div>
</div>
</div>
<div class="clearfix"></div>
<footer class="footer">
<div class="container">
<div class="row">
    <div class="col-lg-6 col-md-6 col-sm-6">
        <p> <?php echo $powered; ?> </p>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-6">
        <ul>
            <li><a href="#"> <img src="catalog/view/theme/default/image/images/visa_icon.png" alt=""/> </a></li>
            <li><a href="#"> <img src="catalog/view/theme/default/image/images/visa_icon2.png" alt=""/> </a></li>
            <li><a href="#"> <img src="catalog/view/theme/default/image/images/visa_icon3.png" alt=""/> </a></li>
            <li><a href="#"> <img src="catalog/view/theme/default/image/images/visa_icon4.png" alt=""/> </a></li>
        </ul>
    </div>
</div>
</div>
</footer>



<div id="offcanvas" class="uk-offcanvas">
<div class="uk-offcanvas-bar">
     <ul class="uk-nav uk-nav-offcanvas">
         <?php if ($categories) { ?>
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="uk-parent" data-uk-dropdown>
            <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown">
                <?php echo $category['name']; ?><i class="uk-icon-caret-down"></i>
            </a>
          <div class="uk-dropdown uk-dropdown-navbar">
            <!--<div class="dropdown-inner">-->
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="uk-nav uk-nav-navbar">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            <!--</div> -->
            <!--<a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> -->
          </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
        <?php } ?>
        <li><a href="index.php?route=information/contact">CONTACT</a></li>
    </ul>
 
</div>
</div>

<script src="catalog/view/theme/default/js/classie.js"></script>
<script src="catalog/view/theme/default/js/uikit.min.js"></script>
<script src="catalog/view/theme/default/js/custom.js"></script>

<script type="text/javascript" src="catalog/view/theme/default/js/jquery.bxslider.min.js"></script>

<script type="text/javascript">
$(".front_left li").click(function(){
$('.front_left li').removeClass("current_item_li");
$(this).addClass("current_item_li");
});
</script>
<script type="text/javascript">
$( document ).ready(function() {
$('.slider4').bxSlider({
slideWidth: 115,
minSlides: 1,
maxSlides: 5,
moveSlides: 1,
slideMargin: 10,
infiniteLoop: false

});

$('.slider8').bxSlider({
mode: 'vertical',
slideWidth: 200,
moveSlides: 1,
minSlides: 3,
slideMargin: 10,
infiniteLoop: false,
height : 450
}); 



$('#down').click(function(){
$('.head2').css({
'margin-top':'0',
},1000);
$('#down').css({
'display':'none',
},1000);
$('#up').css({
'display':'inline-block',
},1000);
$('#up').click(function(){
$('.head2').css({
'margin-top':'-55px',
},1000);
$('#up').css({'display':'none'});
$('#down').css({'display':'inline-block'});
});
});
$(window).resize(function() {
var windowWidth = $(window).width();
if(windowWidth >768){
location.reload();
}
});
$( ".top-search" ).click(function() {
$( ".search-bar" ).toggle( "fast")
});
var active_item_first= $("#carousel-menu div:first").text();
$("#carousel-menu div:first").css({'display':'none'});
$(".active-cont").text(active_item_first);
$("#carousel-menu div").click(function(){
var active_item= $(this).text();
$("#carousel-menu div").css({'display':'inline-block'});
$(this).css({'display':'none'});
$(".active-cont").text(active_item);
});
});
</script>


<script>
function init() {
window.addEventListener('scroll', function(e){
var distanceY = window.pageYOffset || document.documentElement.scrollTop,
shrinkOn = 1,
header = document.querySelector("header");
if (distanceY > shrinkOn) {
classie.add(header,"smaller");
    $('body').css('padding-top', '40px'); 
} else {
if (classie.has(header,"smaller")) {
classie.remove(header,"smaller");
    $('body').css('padding-top', '0'); 
}
}
});
}
window.onload = init(); 
</script>

</body></html>