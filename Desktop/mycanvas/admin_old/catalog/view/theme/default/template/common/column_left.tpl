<div class="col-sm-3 fabric_view">
    <?php if ($modules) { ?>
        <div class="cate">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading headingone" role="tab" id="headingOne">
                        <div class="cate_head panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne"> <img src="catalog/view/theme/default/image/images/icon_img13.png" alt=""/> Categories </a>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
                                <div class="cate_list">
                                    <ul>
                                         <?php foreach ($modules as $module) { ?>
                                        <li><?php echo $module; ?></li>
                                        <!--<li><a href="#"> Category </a></li>
                                        <li><a href="#"> Category </a></li>
                                        <li><a href="#"> Category </a></li>
                                        <li><a href="#"> Category </a></li>
                                        <li><a href="#"> Category </a></li>
                                        <li><a href="#"> Category </a></li>
                                        <li><a href="#"> Category </a></li> -->
                                        <?php } ?>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>
       
    </div> 

<!--
<column id="column-left" class="col-sm-3 hidden-xs">
  <?php /* foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } */ ?> 
</column> -->
