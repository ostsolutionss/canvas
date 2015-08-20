<?php echo $header; ?>

<div class="work_next">
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
        <div class="newsletter">
          <h1><img alt="" src="catalog/view/theme/default/image/icons/Newsletter_Subscription.png"> <?php echo $heading_title; ?></h1>
            <div class="form account">
                  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" >
                     <ul> 
                    
                      <li>
                         <?php if ($newsletter) { ?>
                         <input type="radio" name="newsletter" value="1" checked="checked" />
                          <label class="radio-inline"> <?php echo $text_yes; ?> </label>
                          <input type="radio" name="newsletter" value="0" /><label class="radio-inline"><?php echo $text_no; ?></label>
                          <?php } else { ?>
                          <input type="radio" name="newsletter" value="1" /><label class="radio-inline"><?php echo $text_yes; ?> </label>
                          <input type="radio" name="newsletter" value="0" checked="checked" /><label class="radio-inline"><?php echo $text_no; ?></label>
                          <?php } ?>
                      </li>
                    <li>
                      <a href="<?php echo $back; ?>" class="btnlogin btnlogin_back"><?php echo $button_back; ?></a>
                       <input type="submit" value="<?php echo $button_continue; ?>" class="btnlogin btnlogin_submit" />
                    </li>
                      </ul>
                  </form>
            </div>
          </div>
    </div>
</div>
</div>
</div>


<?php echo $footer; ?>