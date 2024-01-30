<?php include 'header.php';
$id = $_GET['id'];
 $query = "SELECT * FROM rent_details ORDER BY id DESC";  
 $result = mysqli_query($conn, $query); 
 ?>
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Supplier Filters</a>
        </li>
        <li class="breadcrumb-item active">List</li>
    </ol>
    <!-- receive search start here -->
	<div class="row">
		<?php 
		$queryDetails = "SELECT * FROM `rents` WHERE `id`='$id'";  
		$resultDetails = mysqli_query($conn, $queryDetails);
		$rowDetails = mysqli_fetch_array($resultDetails);
		?>
		<div class="col-sm-6">	
			<img src="images/spl.png" height="60px;"/>
			<p>
			<span>Khawaja Tower (5th Floor) </br>95, Mohakhali, C/A Bir Uttam AK Khandakar Rd</br> Dhaka - 1212</span></p></div>
		<div class="col-sm-6">
			<table class="table table-bordered">
			  <tr>
				<th>Internal Memo No:</th>
				<td><?php echo $rowDetails["challan_no"]; ?></td>
			  </tr>
			  <tr>
					<th>Date:</th>
					<td><?php echo $rowDetails["date"]; ?></td>
				</tr>
			</table>
		</div>
	</div>
	<center><h5>Rented Equipment List</h5></center>
    <div id="employee_table">  
		<table class="table table-bordered">  
		   <tr>  
				<th>EEL Code</th>  
				<th style="width:10%;">Rent Date</th>  
				<th style="width:10%;">Return Date</th>  
				<th style="width:20%;text-align:right;">Action</th>  
		   </tr>  
		   <?php  
		   while($row = mysqli_fetch_array($result))  
		   {  
		   ?>  
		   <tr>  
				<td><?php echo $row["eel_code"]; ?></td>  
				<td><?php echo $row["rent_date"]; ?></td>  
				<td><?php echo $row["return_date"]; ?></td>  
				<td style="text-align:right;">
					<input type="button" name="edit" value="Extend date" id="<?php echo $row["id"]; ?>" class="btn btn-danger btn-sm edit_data" />
					<input type="button" name="view" value="Return" id="<?php echo $row["id"]; ?>" class="btn btn-success btn-sm rent_data" />
				</td>  
		   </tr>  
		   <?php  
		   }  
		   ?>  
	  </table>  
 </div>
    <!-- end receive search -->


</div>
 <div id="add_rentdata_Modal" class="modal fade">  
      <div class="modal-dialog">  
           <div class="modal-content">  
                <div class="modal-header">    
                     <h4 class="modal-title">Equipments Return to Own project</h4>  
                </div>  
                <div class="modal-body">
					<form method="post" id="rent_form">   
						<div class="row">
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label>Return Date</label>  
									<input type="text" name="rent_date" id="rent_date" class="form-control" />  
								</div>
							</div>
							<div class="col-md-8 col-sm-8">
								<div class="form-group">
									<label for="division/company">In Project:</label>
									<select class="form-control select2" id="in_project" name="in_project" required >
										<option value="">Select Project</option>
										<?php
										$tableName = 'projects';
										$column = 'project_name';
										$order = 'asc';
										$dataType = 'obj';
										$projectsData = getTableDataByTableName($tableName, $order, $column, $dataType);
										if (isset($projectsData) && !empty($projectsData)) {
											foreach ($projectsData as $data) {
												?>
												<option value="<?php echo $data->id; ?>"><?php echo $data->project_name; ?></option>
												<?php
											}
										}
										?>
									</select>
								</div>
							</div>
							<input type="hidden" name="rentid" id="rentid" />
							<div class="col-sm-12">
								<div class="form-group">
									<input type="submit" name="rent" id="rent" value="Rent" class="btn btn-block btn-success" />  
								</div>
							</div>	
                        </div>	
                    </form>				
                </div>  
                <div class="modal-footer">  
                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>  
                </div>  
           </div>  
      </div>  
 </div>  
 <div id="add_data_Modal" class="modal fade">  
      <div class="modal-dialog">  
           <div class="modal-content">  
                <div class="modal-header">  
                     <button type="button" class="close" data-dismiss="modal">&times;</button>  
                </div>  
                <div class="modal-body">  
                     <form method="post" id="insert_form">   
                          <label>return_date</label>  
                          <input type="text" name="return_date" id="return_date" class="form-control" />  
                          <br />  
                          <input type="hidden" name="id" id="id" />  
                          <input type="submit" name="insert" id="insert" value="Insert" class="btn btn-success" />  
                     </form>  
                </div>  
                <div class="modal-footer">  
                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>  
                </div>  
           </div>  
      </div>  
 </div>  
 <script>  
 $(document).ready(function(){  
      $('#add').click(function(){  
           $('#insert').val("Insert");  
           $('#insert_form')[0].reset(); 
           $('#rent').val("Rent");  
           $('#rent_form')[0].reset(); 
      });  
      $(document).on('click', '.edit_data', function(){  
           var id = $(this).attr("id");  
           $.ajax({  
                url:"extend/fetch.php",  
                method:"POST",  
                data:{id:id},  
                dataType:"json",  
                success:function(data){    
                     $('#return_date').val(data.return_date);  
                     $('#id').val(data.id);  
                     $('#insert').val("Update");  
                     $('#add_data_Modal').modal('show');  
                }  
           });  
      }); 
      $('#insert_form').on("submit", function(event){  
           event.preventDefault();  
           if($('#return_date').val() == "")  
           {  
                alert("return_date is required");  
           }   
           else  
           {  
                $.ajax({  
                     url:"extend/insert.php",  
                     method:"POST",  
                     data:$('#insert_form').serialize(),  
                     beforeSend:function(){  
                          $('#insert').val("Inserting");  
                     },  
                     success:function(data){  
                          $('#insert_form')[0].reset();  
                          $('#add_data_Modal').modal('hide');  
                          $('#employee_table').html(data);  
                     }  
                });  
           }  
      }); 
	  
	  $(document).on('click', '.rent_data', function(){  
           var rentid = $(this).attr("id");  
           $.ajax({  
                url:"extend/fetchrent.php",  
                method:"POST",  
                data:{rentid:rentid},  
                dataType:"json",  
                success:function(data){    
                     $('#rent_date').val(data.rent_date);  
                     $('#rentid').val(data.id);  
                     $('#rent').val("RentUpdate");  
                     $('#add_rentdata_Modal').modal('show');  
                }  
           });  
      });
	  $('#rent_form').on("submit", function(event){  
           event.preventDefault();  
           if($('#rent_date').val() == "")  
           {  
                alert("rent_date is required");  
           }   
           else  
           {  
                $.ajax({  
                     url:"extend/rent.php",  
                     method:"POST",  
                     data:$('#rent_form').serialize(),  
                     beforeSend:function(){  
                          $('#rent').val("Rent");  
                     },  
                     success:function(data){  
                          $('#rent_form')[0].reset();  
                          $('#add_rentdata_Modal').modal('hide');  
                          $('#employee_table').html(data);  
                     }  
                });  
           }  
      });
  
      $(document).on('click', '.view_data', function(){  
           var id = $(this).attr("id");  
           if(id != '')  
           {  
                $.ajax({  
                     url:"extend/select.php",  
                     method:"POST",  
                     data:{id:id},  
                     success:function(data){  
                          $('#employee_detail').html(data);  
                          $('#dataModal').modal('show');  
                     }  
                });  
           }            
      });  
 });  
 </script>
 <script>
    $(function () {
        $("#return_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>

 <script>
    $(function () {
        $("#rent_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>