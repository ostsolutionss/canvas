<footer>
   <div data-role="navbar" data-grid="d">
        <ul class="footer-menu">
          <li><a href="#" class="ui-btn-active"><i class="fa fa-home"></i> Home</a></li>
          <li><a href="#"><i class="fa fa-trophy"></i> Brands</a></li>
          <li><a href="#"> <img src="catalog/view/theme/default/images/u773.png" alt=""> </a></li>
          <li><a href="#"><i class="fa fa-shopping-cart"></i> Cart</a></li>
          <li><a href="#"><i class="fa fa-user"></i> Me</a></li>
        </ul>
   </div><!-- /navbar -->
</footer>
</div>

<script type="text/javascript">
                                    $( document ).ready(function() {
                                    $( ".top-search" ).click(function() {
                                    $( ".search-bar" ).toggle( "fast")
                                    });
                                    var swiper = new Swiper('.swiper-container', {
                                pagination: '.swiper-pagination',
                                paginationClickable: true
                                });
                                    
                                    $(".customlink").click(function(){
                                        var ss =$(this).attr('href');
                                        //alert(ss);
                                        window.location=ss;

                                    });
                                    });

                                    
 </script>


</body></html>
