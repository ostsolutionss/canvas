<?php echo $header; ?><?php echo $column_left; 
 $servername = DB_HOSTNAME;
                        $username =  DB_USERNAME;
                        $password = DB_PASSWORD;
                        $dbname = DB_DATABASE;
                        $db_driver = DB_DRIVER;

// Create connection
                $conn = new $db_driver($servername, $username, $password, $dbname);
?>
 <div id="content">
    <div class="panel panel-default">
        <div class="page-header">
            <table border="1" cellpadding="5" cellspacing="5">
              <th> Image name </th>
              <th> Action </th>
            <?php 
                  $name_search = "SELECT * FROM ".DB_PREFIX."customfinial_product";
                  $name_search1 = $conn->query($name_search); 
                  while($name_search12 = $name_search1->fetch_assoc()) { 
                     echo "<tr>";
                     echo "<td>";
                     echo "<img src='http://localhost/mycanvas/";
                     echo $name_search12['frontimage'];
                     echo "' height='200' width='200'></td>";
                     echo "<td>";
                     echo "<a href='http://localhost/mycanvas/";
                     echo $name_search12['frontimage'];
                     echo "' download='filename'>Download</a>";
                     echo "</td>";
                     echo "</tr>";
           }
           ?>
       </table>
        </div>
    </div>
</div> 
<?php echo $footer; ?>

