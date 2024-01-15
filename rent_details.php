<?php include 'header.php';
//$return_id=$_GET['no']; ?>
<div class="container-fluid">
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            Invoice View</div>
			<div class="card-body" id="printableArea">
				<div class="row" style="padding-top:20px;">
					<div class="col-sm-1"></div>
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-6">	
								<img src="images/spl.png" height="60px;"/>
								<p>
								<span>Khawaja Tower (5th Floor) </br>95, Mohakhali, C/A Bir Uttam AK Khandakar Rd</br> Dhaka - 1212</span></p></div>
							<div class="col-sm-6">
								<table class="table table-bordered">
								  <tr>
									<th>Internal Memo No:</th>
									<td>INV-001</td>
								  </tr>
								  <tr>
										<th>Date:</th>
										<td>1st August 2020</td>
									</tr>
								</table>
							</div>
						</div>
						<center><h5>Rented Equipment List</h5></center>
						<div class="row">
							<div class="col-md-12">
								<table class="table table-bordered"> 
									<thead>
										<tr style="background-color:#E9ECEF;">
											<th style="width:5%;">SL</th>
											<th style="width:45%;">Equipment Name</th>
											<th style="width:10%;">EEL Code</th>
											<th style="width:10%;">Rent Date</th>
											<th style="width:10%;">Return Date</th>
											<th style="width:20%;text-align:right;">Action</th>
										</tr>
									</thead>
									<tbody id="material_receive_list_body">
										<tr>
											<td>1</td>
											<td>Air Compressure</td>
											<td>AC-0001</td>
											<td>25-12-2023</td>
											<td>25-01-2024</td>
											<td style="text-align:right;">
												<a title="Details View" class="btn btn-sm btn-danger" href="#">
													<span class="fa fa-calendar"><b> Extend Date</b></span>
												</a>
												<a title="Details View" class="btn btn-sm btn-success" href="#">
													<span class="fa fa-undo"><b> Return</b></span>
												</a>
												
												
												
												
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
					</div>
					
					<div class="col-sm-1"></div>
				</div>
				
			</div>
		
								
			<script>
			function printDiv(divName) {
				 var printContents = document.getElementById(divName).innerHTML;
				 var originalContents = document.body.innerHTML;

				 document.body.innerHTML = printContents;

				 window.print();

				 document.body.innerHTML = originalContents;
			}
			</script>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>







