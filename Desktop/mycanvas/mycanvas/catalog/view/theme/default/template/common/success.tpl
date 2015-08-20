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
    </div>
</div>
  <div class="row">
    <div id="content" >
       <div class=""> 
      <h1><?php echo $heading_title; ?></h1>
     
      <?php echo $text_message; ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btnsuccess"><?php echo $button_continue; ?></a></div>
      </div>
       </div>
   </div>
   </div>
</div>
</div>
<?php echo $footer; ?>