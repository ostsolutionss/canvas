<footer id="footer">
	<?php //echo $this->session->data['token'];?>
	<?php if(!empty($footer_sesion)){$ss=  $footer_sesion;}?>
 <script type="text/javascript">
      $(function(){
          $('li#tools').append('<li><a href="index.php?route=custom/customdesign/mycanvas&token=<?php echo $ss;?>">Custom Products</a></li>'); 
      });
 </script>

	<?php echo $text_footer; ?><br /><?php echo $text_version; ?></footer></div>
</body></html>