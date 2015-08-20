<?php echo $header; ?>
<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="catalog/view/theme/default/js/lightbox/jquery.fancybox.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/js/lightbox/jquery.fancybox.css?v=2.1.5" media="screen" />

        <script type="text/javascript">
		$(document).ready(function() {
			$('.fancybox').fancybox();
                });
	</script>
<style>
.bottom-wrapper {
  background: rgba(0, 0, 0, 0.45) none repeat scroll 0 0;
  bottom: 0;
  height: 145px;
  left: 0;
  overflow: hidden;
  position: absolute;
  z-index: 100;
  width: 100%;
}
.bottom-wrapper .progress {
  height: 145px;
  position: relative;
  width: 100%;
  overflow-x :scroll;
  margin-bottom: 0;
}
.progress ul {
  min-width: 100%;
  position: relative;
  text-align: center;
  white-space: nowrap;
  padding: 0 0 0 8px;
}
.progress ul li {
  background-color: white;
  box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.15);
  cursor: pointer;
  display: inline-block;
  float: none;
  font-size: 0.9em;
  font-weight: 300;
  height: 110px;
  margin: 10px 5px;
  overflow: hidden;
  position: relative;
  vertical-align: top;
  white-space: normal;
  width: 110px;
}
.progress ul li span {
  background-color: rgba(255, 255, 255, 0.7);
  bottom: 5px;
  clear: both;
  display: block;
  padding: 0 5px;
  position: absolute;
  text-align: center;
  width: 100%;
  z-index: 99;
}
.progress ul li img {
  left: 15px;
  max-width: 80px;
  position: absolute;
  top: 5px;
}
.mainsize_wrapper {
  background: rgba(0, 0, 0, 0) url("catalog/view/theme/default/image/sizeimages/neck.jpg") no-repeat scroll center top / 1136px 500px;
  float: left;
  height: 455px;
  width: 100%;
}
.fancybox-overlay {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
 
}
.fancybox-skin {
 opacity: 0.8;
}
.fancybox-lock .fancybox-overlay {
  border: 1px solid red;
  height: 230px !important;
  left: 28%;
  overflow: hidden;
  top: 38% !important;
  width: 575px !important;
}
.fancybox-wrap.fancybox-desktop.fancybox-type-inline.fancybox-opened {
  height: auto !important;
  width: 519px !important;
}
.fancybox-inner {
  height: auto !important;
  width: auto !important;
}
</style>

<div class="about">
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
         &nbsp;
         </div>
</div>
<div class="row abt">
    <div class="col-lg-12">
    <div class="mainsize_wrapper" >
            
        </div>
            
        <div class="msg" id="msg"></div>
            
                    <div id="neckdiv" class="aman" style="display:none; width:auto; "> 
                        <h2>Neck</h2>
                        <p>The neck measurement is taken around the neck with the tape resting on your shoulders. You should put one finger between the tape and the neck if you want to allow for some extra room.</p>
                        <input type="text" name="neckfront" class="size" value="" id="neckfront" /> cm
                    </div>
                    <div id="neckbackdiv" class="aman" style="display:none; width:auto; ">
                    <h2>Neck</h2>
                        <p>The neck measurement is taken around the neck with the tape resting on your shoulders. You should put one finger between the tape and the neck if you want to allow for some extra room.</p>
                        <input type="text" name="neckback" class="size" value="" id="neckback"/> cm
                    </div>
                    <div id="chestdiv" class="aman" style="display:none; width:auto;  ">
                        <h2>Chest</h2>
                        <p>The chest measurement is taken as a circumference measurement around your chest at the widest point. Stand in a relaxed posture and breathe out.</p>
                        <input type="text" name="chest" class="size" value="" id="chest"/> cm
                    </div>
                    <div id="waistdiv" class="aman" style="display:none; width:auto;  ">
                        <h2>Waist</h2>
                        <p>The waist measurement is taken as a circumference measurement around your waist just above your belly button. Stand in a relaxed posture and breathe out.</p>
                        <input type="text" name="waist" class="size" value="" id="waist" /> cm
                    </div>
                    <div id="hipdiv" class="aman" style="display:none; width:auto;  "> 
                        <h2>Hip</h2>
                        <p>The hip measurement is taken as a circumference measurement around your hips at the widest part.</p>
                        <input type="text" name="hip" class="size" value="" id="hip" /> cm
                    </div>
                    <div id="lengthdiv" class="aman" style="display:none; width:auto; "  >
                        <h2> length</h2>
                        <p>The shirt length measurement is taken from the top of the shoulder, close to the mid side of your neck, following your body down to the point where you want your shirt to end.</p>
                        <input type="text" name="length" class="size" value="" id="length"/> cm
                    </div>
                    <!--<div id="bottomdiv" style="display:none; width:auto;   ">
                        <h2> Bottom</h2>
                        <p>The shirt length measurement is taken from the top of the shoulder, close to the mid side of your neck, following your body down to the point where you want your shirt to end.</p>
                        <input type="text" name="bottom" class="size" value="" id="bottom"/> cm
                    </div> -->
                    <div id="sholderlengthdiv" class="aman" style="display:none; width:auto;  ">
                        <h2> Shoulder width</h2>
                        <p>Think of a line going from your armpit straight upwards to your shoulder. Measure between those two points and hold the tape measure straight.</p>
                        <input type="text" name="shoulderl" class="size" value="" id="shoulderl"/> cm
                    </div>
                    <div id="armlengthdiv" class="aman" style="display:none; width:auto;  ">
                        <h2> Arm length</h2>
                        <p>The sleeve length measurement is taken from the point of your shoulder (where you took the shoulder width measurement), following your bent arm down to where you want the sleeve to end. NOTE 1! Bend your arm slightly when taking this measurement. NOTE 2! This measurement is always the full length of the arm. For short sleeve and 3/4 sleeve you should still measure the full length of the arm. </p>
                        <input type="text" name="arml" value="" class="size" id="arml"/> cm
                    </div>
                    <div id="wristdiv" class="aman" style="display:none; width:auto;  ">
                        <h2>Wrist</h2>
                        <p>The wrist measurement is taken as a circumference measurement around your wrist. NOTE ! We will add movement ease according to the cuff you select.</p>
                        <input type="text" name="wrist" value="" class="size" id="wrist"/> cm
                    </div>
                    <div id="bicepsdiv" class="aman" style="display:none; width:auto;  ">
                        <h2>Biceps</h2>
                        <p>The biceps measurement is taken as a circumference measurement around your biceps. Relax the muscle and measure at the widest part of your upper arm.</p>
                        <input type="text" name="biceps" value="" class="size" id="biceps"/> cm
                    </div>
               
            <form action="" method="post" id="bodymeasure">    
                <input id="customproid" type="hidden" value="<?php echo $custmproid; ?>" name="customproid">
                <input id="ksize" type="hidden" value="" name="ksize">
                <input id="ksesize" type="hidden" value="bodymeasure" name="selectsize">
            </form>

            <div class="bottom-wrapper">
               
                    <div class="progress" id="progress-bar">
                            <ul style="transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);">
                                <li id="neck-icon" data-id='neck' class="progress-item active">
                                    <span class="name">Neck</span>
                                    <a class="fancybox" href="#neckdiv"><img src="catalog/view/theme/default/image/sizeimages/neck.svg"></a>

                                </li>
                                <li id="chest-icon" data-id="chest1" class="progress-item">
                                    <span class="name">Chest</span>
                                    <a class="fancybox" href="#chestdiv"><img src="catalog/view/theme/default/image/sizeimages/chest.svg"></a>

                                </li>
                                <li id="waist-icon" data-id="waist1" class="progress-item">
                                    <span class="name">Waist</span>
                                    <a class="fancybox" href="#waistdiv"><img src="catalog/view/theme/default/image/sizeimages/waist.svg"></a>

                                </li>
                                <li id="hip-icon" data-id="hip1" class="progress-item">
                                    <span class="name">Hip</span>
                                    <a class="fancybox" href="#hipdiv"><img src="catalog/view/theme/default/image/sizeimages/realhip.svg"></a>

                                </li>

                                <li id="length-icon" data-id="length1" class="progress-item">
                                    <span class="name">Shirt length</span>
                                     <a class="fancybox" href="#lengthdiv"><img src="catalog/view/theme/default/image/sizeimages/shirtl.svg"></a>

                                </li>
                                <!-- <li id="bottom-icon" data-id="bottom1" class="progress-item">
                                    <span class="name">Bottom</span>
                                      <a class="fancybox" href="#bottomdiv"><img src="catalog/view/theme/default/image/sizeimages/pique_length.svg"></a>

                                </li> -->
                                <li id="sholder-icon" data-id="sholderlength1" class="progress-item">
                                    <span class="name">Shoulder width</span>
                                   <a class="fancybox" href="#sholderlengthdiv"> <img src="catalog/view/theme/default/image/sizeimages/back.svg"></a>

                                </li>
                                <li id="arm-icon" data-id="armlength1" class="progress-item">
                                    <span class="name">Arm length</span>
                                    <a class="fancybox" href="#armlengthdiv"><img src="catalog/view/theme/default/image/sizeimages/arm.svg"></a>

                                </li>
                                <li id="wrist-icon" data-id="wrist1" class="progress-item">
                                    <span class="name">Wrist</span>
                                    <a class="fancybox" href="#wristdiv"><img src="catalog/view/theme/default/image/sizeimages/cuff.svg"></a>

                                </li>
                                <li id="biceps-icon" data-id="biceps1" class="progress-item">
                                    <span class="name">Biceps</span>
                                    <a class="fancybox" href="#bicepsdiv"><img src="catalog/view/theme/default/image/sizeimages/bicep.svg"></a>

                                </li>
                                <li id="save-icon">
                                    <span class="name">Save</span>
                                    <img src="catalog/view/theme/default/image/sizeimages/save.png">

                                </li>
                                <li id="delete-icon" >
                                    <span class="name">Reset</span>
                                    <img src="catalog/view/theme/default/image/sizeimages/delete.png" id="restall">
                                </li>
                            </ul>
                    </div>

            </div>
     
   </div> 
</div>
</div>
</div>  


<script>

$(document).ready(function(){
    $(".size").blur(function(){
    var id = $(this).attr("id");
    
   var measure =  $("#"+id).val();
   //alert(neckf);
  var ksize = $("#ksize").val();
  //alert(ksize);
  if(ksize == '')
      {
              $("#ksize").val(id+" :"+measure);
      }
   else
       {
           $("#ksize").val(ksize+","+id+" :"+measure);
       }
  
  });
  
    
    $("#save-icon").click(function(){
       $.ajax({
		url: 'index.php?route=customkurta/body_measurements/addmeasure',
		type: 'post',
		data: $('#bodymeasure input[type=\'hidden\']'),
		dataType: 'json',
		success: function(json) 
                {
                        $('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');
                        if (json['success'] == 'text_success') 
                        {
                                $("#msg").html("<div class='msgtxt'> Your Profile Measurements are added successfully!! </div>");
                                setTimeout(function() {
                                    $('#msg').fadeOut('slow');
                                     window.location.replace("<?php echo $base; ?>index.php?route=checkout/cart");
                                }, 2000); 
                                
                        }
		}
	});
    });
 

    $("#restall").click(function(){
        $(".aman input[type='text']").val("");
        $("#ksize").val("");
       
    });

   });
</script>        
        
        
<style>
a:hover {
  color: #fff;
}

#sizeoption
{
    padding : 5px 10px 5px 20px;
}

.proimgdiv {
  float: left;
  padding: 5px 5px 15px;
  width: 20%;
}
.proimgdiv .img-responsive
{
float: left;
height: 200px;
margin-left: 38px;
vertical-align: middle;
}
.proinfodiv {
  float: left;
  margin-left: 18px;
  padding: 7%;
  width: 35%;
}
.proname {
  font-size: 23px;
  font-style: italic;
  font-weight: bold;
  line-height: 22px;
}
.proprice {
  font-size: 18px;
  font-style: italic;
  font-weight: bold;
  line-height: 26px;
}
.quantity {
  font-size: 15px;
  font-style: italic;
  font-weight: bold;
}
.measure {
  float: left;
  margin-left: 12px;
  padding: 8.7% 5%;
  width: 25%;
}
.measure > a {
  background: #1f90bb none repeat scroll 0 0;
  border: medium none;
  border-radius: 5px;
  color: #fff;
  font-size: 13px;
  height: 40px;
  padding: 11px;
  width: 170px;
}
.bodymeasure{
    background: #1f90bb none repeat scroll 0 0;
  border: medium none;
  border-radius: 5px;
  color: #fff;
  font-size: 13px;
  height: 40px;
  padding: 11px;
  width: 170px;
  }
  select {
  border: 1px solid #1f90bb;
  border-radius: 5px;
  height: 28px;
  width: 126px;
}
 .usesize{   
  background: rgb(73, 178, 83) none repeat scroll 0 0;
border: medium none;
border-radius: 3px;
color: #fff;
font-size: 14px;
padding:5px 20px;
}
.size {
  font-size: 16px;
  line-height: 22px;
}

.checkoutdiv {
  float: left;
  width: 100%;
 
}
.checkout {
  background: #1f90bb none repeat scroll 0 0;
  border: medium none;
  border-radius: 3px;
  color: #fff;
  float: right;
  font-size: 16px;
  padding: 19px;
}
.msgtxt
{
  background: green none repeat scroll 0 0;
  color: #fff;
  float: left;
  font-size: 25px;
  left: 18px;
  padding: 14px;
  position: absolute;
  text-align: center;
  top: 33%;
  width: 1135px;
  z-index: 9999;
}
</style>

<?php  echo $footer; ?>
