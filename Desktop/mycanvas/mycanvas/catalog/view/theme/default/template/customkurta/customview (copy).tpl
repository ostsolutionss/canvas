<?php echo $header; ?>
<div class="add">
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
         <div id="">      
              <h1><?php echo $heading_title; ?></h1>
              <?php if(isset($_GET['msg']) && ( $_GET['msg'] == 'success')) 
         {
         ?>
            <p><?php echo $success_msg; ?></p>
            <div class="buttons">
              <div class="pull-right"><a class="btn btn-primary" href="index.php?route=common/home"><?php echo $continue_text; ?></a></div>
            </div>
             <?php } ?>
         </div>
        
         </div>
</div>    
    
<div class="row">
     <?php 
     if( $procount != 0)
     {
     foreach($productinfo as $product)
            { ?>
    <div class="col-md-6 col-lg-6 col-sm-6">
        <div class="add_left">
            <img src="<?php echo $product['frontimage']; ?>" alt=""  />
            <div class="add_left_icon">
                <img src="<?php echo $product['backimage']; ?>"  alt=""/>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-lg-6 col-sm-6">
        <div class="add_right">
            <p> <?php echo $cart_text; ?> </p>
           
            <h1> <?php echo $product['proname']; ?> </h1>
            <h2><?php echo $product['price']; ?> </h2>
            <?php $id = $product['id']; ?>
            <ul>
                <li><a href="javascript:void(0);" onclick="removeproduct('<?php echo $productkey; ?>','<?php echo $id; ?>')"> <?php echo $remove_text; ?> </a></li>
                <!--<li><a href="#"> Change </a></li>-->
                <!--<li><a href="#"> Copy to Designer </a></li>-->
            </ul>
           
            <div class="polo"> 
                <a href="index.php?route=checkout/cart" ><img src="catalog/view/theme/default/image/images/cart_icon3.png" alt=""/> <?php echo $product['proname']; ?></a>
            </div>
           
            <div class="add_btn">
                <a href="index.php?route=common/home" ><button type="button" > <img src="catalog/view/theme/default/image/images/arw_icon14.png" alt=""/> <?php echo $continue_text; ?> </button></a>
            </div>
        </div>
    </div>
             <?php } } ?>
</div>
</div>
</div>  
   
<script>

function removeproduct(key,id)
{
    cart.remove(key);
   
     var url = 'index.php?route=customkurta/kurtaview/removeproduct';
     url += '&id=' + id;
     location = url;
     
    
}

</script>

<?php  echo $footer; ?>
