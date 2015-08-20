<?php echo $header; ?>
<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="catalog/view/theme/default/js/lightbox/jquery.fancybox.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/js/lightbox/jquery.fancybox.css?v=2.1.5" media="screen" />

        <script type="text/javascript">
		$(document).ready(function() {
			$('.fancybox').fancybox();
                });
	</script>
        
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
        <div style="height : 500px; margin-top: 25px;">
    <?php
        foreach($productinfo as $product)
        {
    ?>
    <div class="proinfo">
        <div class="proimgdiv"><img src="<?php echo $base . $product['frontimage']; ?>" class="img-responsive" style="height: 200px;"/></div>
        <div class="proinfodiv">
        <div class="proname"><?php echo $product['proname'].",". $product['optionname']; ?> </div>
        <div class="proprice"><?php echo $product['price']." RS/-"; ?> </div>
        <div class="quantity"><?php echo "Quantity : ". $quantity;  ?> </div>
        <?php if($product['size'] == '' ){ ?>
        <div class="size" id="kurtasize"></div>
        <?php } else { ?>
        <div class="size" id="kurtasize">Measurement profile: <b><?php echo $product['size']; ?></b></div>
        
        <?php } ?>
        </div>
        <div class="measure"><a class="fancybox" href="#sizeoption" >Choose Your Measures</a> </div>
    </div>
    
    <form id="measure">
        <input type="hidden" name="customproid" value="<?php echo $product['id']; ?>" id="customproid"/>
        <input type="hidden" name="ksize" value="" id="ksize"/>
        <input type="hidden" name="selectsize" value="choosesize" id="ksize"/>
    </form>
    <?php } ?>
    <?php
        foreach($productinfo as $product)
        {
        if($product['size'] == '' ){
    ?>
    <div class="checkoutdiv" style="display:none;">
    <a href="?route=checkout/cart" class="checkout">Prceed To Checkout</a>
    </div>
    <?php } else { ?>
     <div class="checkoutdiv" >
    <a href="?route=checkout/cart" class="checkout">Prceed To Checkout</a>
    </div>
    
    <?php } } ?>
    <!--       POPUP FOR SIZE       -->
    
    <div id="sizeoption" style="width:500px;display: none;">
                <h1>I want to use previously added measurements</h1>
                
                <?php if($userid == 0){ ?>
                <h2>To use your profiles please log in</h2>
                 <a class="bodymeasure" href="index.php?route=account/login" >Log In</a>
		<?php } else { ?>
                <a class="bodymeasure" href="javascript:void(0);" id="mymeasures" >Use My Previous Measurements</a>
                <?php }  ?>
               
                
                <h1>Choose measurements / size</h1>
                <h2>Body measurements</h2>
                <p>Our measurement guide will help you to take your body measurements with illustrated instructions.</p>
               
                <a class="bodymeasure" href="index.php?route=customkurta/body_measurements" >Add your body measurements</a>
		
                <h2>Standard size</h2>
                <p>I want to order or adjust a standard size</p>
                <select name="size" id="chosesize">
                    <option value="">Choose Size</option>
                    <?php foreach($size as $psize){ ?>
                    <option value="<?php echo $psize['name']; ?>" ><?php echo $psize['name']; ?></option>
                    <?php } ?>
                </select>
                <a href="javascript:void(0);" class="usesize" style="display: none;" id="usesize">Use It</a>
	</div>
    
    <!--       POPUP FOR SIZE       -->
    
   </div>
   </div>
</div>
</div>
</div>        
        

<script>

$(document).ready(function(){

        
    $(".close").click(function(){
        alert(2);
    
        $(".text-danger").slideup();
    });


    $("#mymeasures").click(function(){ 
    var uid = '<?php echo $userid; ?>';
    var customproid = "<?php echo $product['id']; ?>";
    
        $.ajax({
		url: 'index.php?route=customkurta/measurements/getmeasures',
		type: 'post',
		data: { userid : uid, customproid: customproid},
		dataType: 'json',
		success: function(json) 
                {
                        $('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');
                        if (json['success']) 
                        {
                             var size = json['size'];   
                             
                             if(size != 0)
                             {
                                   $("#usesize").hide(); 
                                   $("#kurtasize").html("Measurement profile: <b>"+size + "</b>");
                                   $("#ksize").val(size);
                             }
                             else
                             {
                                     $("#usesize").hide(); 
                                     $(".checkoutdiv").hide();
                             }
                             $.fancybox.close();
                             $(".checkoutdiv").show();
                        }
                        
                        if(json['error'])
                        {
                            $(".proinfo").before('<div class="text-danger"><i class="fa fa-exclamation-circle"> </i>  ' +  json['error'] + '<button class="close" id="alertclose" data-dismiss="alert" type="button">×</button></div>');
                            $.fancybox.close();
                            $(".checkoutdiv").hide();
                            setTimeout(function(){ $(".text-danger").fadeOut( "slow"); }, 3000);
                        }
		}
	});
    
    
    });


    $("#chosesize").change(function(){
       
        var value = $( "#chosesize option:selected").val();
        if(value != '')
        {
               $("#usesize").show(); 
               $("#kurtasize").html("Measurement profile: <b>"+value + "</b>");
               $("#ksize").val(value);
        }
        else
        {
               $("#usesize").hide(); 
        }
    });
    
    $("#usesize").click(function(){
       $.ajax({
		url: 'index.php?route=customkurta/measurements/addmeasure',
		type: 'post',
		data: $('#measure input[type=\'hidden\']'),
		dataType: 'json',
		success: function(json) 
                {
                       // alert(json);
                
                        $('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');
                        if (json['success']) 
                        {
                             $.fancybox.close();
                             $(".checkoutdiv").show();
                        }
		}
	});
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

.text-danger {
  background-color: #fef1f1;
  border-color: #fcd9df;
  color: #f56b6b;
  border-radius: 3px;
  margin-bottom: 17px;
  padding: 10px;
}
.fa.fa-exclamation-circle {
  padding-right: 4px;
}
.close {
  margin-top: -3px;
}
</style>

<?php  echo $footer; ?>
