<?php 
include 'header.php';
?>
<?php /* if(!cheque_permission('user-list')){ 
        include("404.php");
        exit();
 } */ ?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> Rent Invoice Collection</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Rent Invoice Entry Form
            <a href="invoice_list.php" style="float:right"><i class="fas fa-plus"></i> Invoice List<a>
        </div>
        <div class="card-body">
			<form class="form-horizontal" action="" id="warehouse_stock_search_form" method="GET">
				<div class="table-responsive">          
					<table class="table table-borderless search-table">
						<tbody>
							<tr>  
								<td width="30%">
									<div class="form-group">
										<label for="id">Client name</label>
										<select name="client_name" id="client" class="form-control material_select_2" required >
											<option value="">Select Client</option>
											<?php 
											$sql	= "SELECT t1.client_name,t2.id,t2.name FROM `rents` AS t1
												INNER JOIN clients AS t2 ON t1.client_name=t2.id
												WHERE 1=1 AND t1.client_name = t2.id GROUP BY t1.client_name";
											$result = mysqli_query($conn, $sql);
											while($row=mysqli_fetch_array($result))
												{
												if($_GET['client_name'] == $row['id']){
												$selected	= 'selected';
												}else{
												$selected	= '';
												}
											?>
											<option value="<?php echo $row['id'] ?>" <?php echo $selected; ?>><?php echo $row['name'] ?></option>
											<?php } ?>
										</select>
									</div>
								</td>
								
								<td width="10%">
									<div class="form-group">
										<label for="todate">.</label>
										<button type="submit" name="submit" class="form-control btn btn-primary">Create Invoice</button>
									</div>
								</td>
								<td width="30%">
									<div class="form-group">
										<label for="id">To Date</label>
										<input type="text" class="form-control" name="to_date" id="rlpdate" value="<?php if(isset($_GET['to_date'])){ echo $_GET['to_date']; } ?>" />
									</div>
								</td>
								
								<td width="10%">
									<div class="form-group">
										<label for="todate">.</label>
										<button type="submit" name="ledgersubmit" class="form-control btn btn-success">Client Ledger</button>
									</div>
								</td>
								<td width="30%"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			<?php
			if(isset($_GET['submit'])){
				$client_name = $_GET['client_name'];
				$sqlch = "select * FROM `rents` WHERE `client_name`='$client_name'";
				$resultch = mysqli_query($conn, $sqlch);
				$rowch = mysqli_fetch_array($resultch);
			?>
			<form action="#" method="post" name="add_name" id="add_name">  
				<div class="row">
					<?php
					$mr_id=$rowch['id'];
					$sql = "SELECT t1.date,t1.client_name,t2.id,t2.name,t2.address,SUM(t1.grandtotal) as total,SUM(t3.amount) as invoiced FROM `rents` AS t1
						INNER JOIN clients AS t2 ON t1.client_name=t2.id
						INNER JOIN rent_invoice AS t3 ON t1.client_name=t3.client_name
						WHERE 1=1 AND t1.client_name = $client_name";
					$result = mysqli_query($conn, $sql);
					$row = mysqli_fetch_array($result);
					?>
					
					<div class="col-sm-5">
						<span><b>Client Name : <?php echo getNameByIdAndTable('clients',$row['client_name']); ?></b></span></br>
						<span>Client Address : <?php echo $row['address']; ?></span>
					</div>
					<div class="col-sm-7" style="border:1px solid gray;border-radius:5px;padding:20px;">
						<h3>Client Invoice</h3>
						<div class="row">
							<input type="hidden" name="client_id" value="<?php echo $row['client_name']; ?>"/>
						</div>
					</div>
					
					<input type="hidden" name="client_id" value="<?php echo $row['client_name']; ?>"/>
						
				</div>
				<div class="row" style="">
					<?php $mrrno    =   get_invoice_no(); ?>
					<div class="col-xs-2">
						<div class="form-group">
							<label for="id">Invoice No</label>
							<input type="text" name="invoice_no" class="form-control" value="<?php echo $mrrno; ?>" readonly >
						</div>
					</div>
					<div class="col-xs-2">
						<div class="form-group">
							<label for="id">Invoice Date</label>
							<input name="invoice_date" type="text" class="form-control" id="fromdate" value="<?php echo date("Y-m-d"); ?>" size="" autocomplete="off" required />
						</div>
					</div>
					
					<div class="col-xs-2">
						<div class="form-group">
							<label for="id">Invoiceable Amount</label>
							<?php $invoiceable = $row['total'] - $row['invoiced']; ?>
							<input type="text" id="id-1" name="invoiceable_amount" value="<?php echo $invoiceable; ?>"  class="form-control" readonly >
						</div>
					</div>
							<input type="hidden" name="id" value="<?php echo $row['id']; ?>" >
					<div class="col-xs-3">
						<div class="form-group">
							<label for="id">Invoice Amount<span class="reqr"> ***</span></label>
							<input type="number" step=".01" min="1.0" max="<?php echo $invoiceable; ?>" autocomplete="off" name="amount" id="id-2" class="form-control" required>
						</div>
					</div>
					<div class="col-xs-3">
						<div class="form-group">
							<label for="id">Net Invoiceable</label>
							<input type="text" autocomplete="off" id="id-3" class="form-control" readonly >
						</div>
					</div>
					<div class="col-xs-12">
						<div class="form-group">
							<label>Remarks</label>
							<textarea name="remarks" class="form-control"></textarea>
						</div>
					</div>
					<div class="col-xs-12">
						<div class="form-group">
							<input type="submit" name="invoice_create" id="submit" class="btn btn-block btn-info" style="width:100%;" value="Generate Client Invoice" />  
						</div>
					</div>
					</div>
				</div>
			</form>
			<?php 
			} else if(isset($_GET['ledgersubmit'])){
				$client_id = $_GET['client_name'];
				$to_date = $_GET['to_date'];
				$sqlch = "select * FROM `rents` WHERE `client_name`='$client_id'";
				$resultch = mysqli_query($conn, $sqlch);
				$rowch = mysqli_fetch_array($resultch);
			?>
		
				<center>
	
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10" id="printableArea">
			<div class="row">
				<div class="col-sm-12">	
					<center>
						<p>
							<img src="images/Saif_Engineering_Logo_165X72.png" height="100px;"/><br>
							<span>Client Ledger Report</span><br>
							<span><?php echo getNameByIdAndTable('clients',$client_id); ?></span><br>
							Till  <span class="dtext"><?php echo date("jS F Y", strtotime($to_date));?> </span><br>
						</p>
					</center>
				</div>
			</div>
				<table id="" class="table table-bordered">
					<thead>
						<tr>
							<th>Date</th>
							<th>Ref no</th>
							<th>Payment Type</th>
							<th>Debit</th>
							<th>Credit</th>
							<th>Balance</th>
						</tr>
					</thead>
					<tbody>
						<?php 
							$sqlpreinqty = "SELECT SUM(`cb_cr_amount`)- SUM(`cb_dr_amount`) AS due FROM `client_balance` WHERE `client_id` = '$client_id' AND `cb_date` <= '$to_date'";
							$resultpreinqty = mysqli_query($conn, $sqlpreinqty);
							$rowpreinqty = mysqli_fetch_object($resultpreinqty);
							
							
							$sql	=	"SELECT * FROM `client_balance` WHERE `client_id`='$client_id' AND `cb_date` <= '$to_date';";
							$result = mysqli_query($conn, $sql);
							$totaldebit = 0;
							$totalcredit = 0;
							while($row=mysqli_fetch_array($result))
							{
								$debit = $row['cb_dr_amount'];
								$totaldebit += $row['cb_dr_amount'];
								
								$credit = $row['cb_cr_amount'];
								$totalcredit += $row['cb_cr_amount'];
									
								$balance = $totalcredit - $totaldebit;
						?>
						<tr style="background-color:#E9ECEF;">
							<td><?php echo date("jS F Y", strtotime($row['cb_date']));?></td>
							<td><?php echo $row['ref_id']; ?></td>
							<td><?php echo $row['cb_remarks']; ?></td>
							<td><?php echo $row['cb_dr_amount']; ?></td>
							<td><?php echo $row['cb_cr_amount']; ?></td>
							
							<?php 
							$adate			=	$row['cb_date'];
							$sqlcredit 		=	"SELECT SUM(`cb_cr_amount`) AS tcredit FROM `client_balance` WHERE `client_id` = '$client_id' AND `cb_date` <= '$to_date'";
							$resultcredit 	= 	mysqli_query($conn, $sqlcredit);
							$rowcredit 		=	mysqli_fetch_object($resultcredit);
							$creditamount	=	$rowcredit->tcredit;
							?>
							<td><?php echo $balance; ?></td>
						</tr>
						<?php } ?>
					</tbody>
				</table>
				<center><div class="row">
					<div class="col-sm-6"></br></br>--------------------</br>Receiver Signature</div>
					<div class="col-sm-6"></br></br>--------------------</br>Authorised Signature</div>
				</div></center></br>
				<div class="row">
					<div class="col-sm-12" style="border:1px solid gray;border-radius:5px;padding:10px;color:#f26522;">
						<center><h5>Notice***</br><span style="font-size:14px;color:#000000;">Please Check Everything Before Signature</span></h5></center>
						
					</div>
				</div>
			</div>			
		</div>
		<center><button class="btn btn-default" onclick="printDiv('printableArea')"><i class="fa fa-print" aria-hidden="true" style="    font-size: 17px;"> Print</i></button></center>
		<div class="col-md-1"></div>
</center>
				<?php } ?>
			</div>
		</div>
    </div>

</div>
<script>
$(document).ready(function() {
			$("#client").on('change', function() {
				var clientid = $(this).val();

				$.ajax({
					method: "POST",
					url: "response2.php",
					data: {
						id: clientid
					},
					datatype: "html",
					success: function(data) {
						$("#project").html(data);
					}
				});
			});
		});
</script>
<script>
$(function () {
  $("#id-1, #id-2").keyup(function () {
    $("#id-3").val(+$("#id-1").val() - +$("#id-2").val());
  });
});
</script>
<script>
					$("#switch").change(function () {
					  switch($("#switch").val()) {
						case "cheque":
						  $("#name-input").css("display", "none")
						  $("#cheque-dropdown").css("display", "inline")
						  break
						default:
						  $("#cheque-dropdown").css("display", "none")
						  $("#name-input").css("display", "none")
					  }
					})
					</script>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>
