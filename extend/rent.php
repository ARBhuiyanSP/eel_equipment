<?php  
 $conn = mysqli_connect("localhost", "root", "", "eel_equipment");  
 if(!empty($_POST))  
 {  
      $output = '';  
      $message = '';  
      $rent_date = mysqli_real_escape_string($conn, $_POST["rent_date"]);  
      if($_POST["rentid"] != '')  
      {  
           $query = "  
           UPDATE `rent_details`   
           SET `rent_date`='$rent_date'   
           WHERE `id`='".$_POST["rentid"]."'";  
           $message = 'Data Updated';  
      }  
      else  
      {  
            
           $message = 'Data Inserted';  
      }  
      if(mysqli_query($conn, $query))  
      {  
           $output .= '<center><h5 class="text-success">' . $message . '</h5></center>';  
           $select_query = "SELECT * FROM `rent_details` WHERE `id`='".$_POST["rentid"]."'";  
           $result = mysqli_query($conn, $select_query);  
           $output .= '  
                <table class="table table-bordered">  
                     <tr>  
                          <th>EEL Code</th>  
                          <th style="width:10%;">Rent Date</th>  
                          <th style="width:10%;">Return Date</th>  
                          <th style="width:20%;text-align:right;">Action</th>  
                     </tr>  
           ';  
           while($row = mysqli_fetch_array($result))  
           {  
                $output .= '  
                     <tr>  
                          <td>' . $row["eel_code"] . '</td>  
                          <td>' . $row["rent_date"] . '</td>  
                          <td>' . $row["rent_date"] . '</td>  
                          <td style="text-align:right;">
							<input type="button" name="edit" value="Extend Date" id="'.$row["id"] .'" class="btn btn-danger btn-sm edit_data" />
							<input type="button" name="view" value="Return" id="' . $row["id"] . '" class="btn btn-success btn-sm view_data" />
							</td>  
                     </tr>  
                ';  
           }  
           $output .= '</table>';  
      }  
      echo $output;  
 }  
 ?>