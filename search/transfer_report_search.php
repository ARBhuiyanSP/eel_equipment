<style>
.dtext{
	text-decoration:underline;
}
</style>
<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-search"></i>
        Transfer Report Search</div>
    <div class="card-body">
        <form class="form-horizontal" action="" id="warehouse_stock_search_form" method="GET">
            <div class="table-responsive">          
                <table class="table table-borderless search-table">
                    <tbody>
                        <tr>  
							<td>
                                <div class="form-group">
                                    <label for="FromProject"> From Project</label>
                                    <select class="form-control material_select_2" id="project_id" name="project_id">
										<option value="all">All Project</option>
										<?php $results = mysqli_query($conn, "SELECT * FROM `projects`"); 
										while ($row = mysqli_fetch_array($results)) {
											if($_GET['project_id'] == $row['id']){
											$selected	= 'selected';
											}else{
											$selected	= '';
											}
											?>
										<option value="<?php echo $row['id']; ?>" <?php echo $selected; ?>><?php echo $row['project_name']; ?></option>
										<?php } ?>
									</select>
                                </div>
                            </td>
							<td>
                                <div class="form-group">
                                    <label for="todate">From Date</label>
                                    <input type="text" class="form-control" id="from_date" name="from_date" value="<?php if(isset($_GET['from_date'])){ echo $_GET['from_date']; } ?>" autocomplete="off" required >
                                </div>
                            </td>
							<td>
                                <div class="form-group">
                                    <label for="todate">To Date</label>
                                    <input type="text" class="form-control" id="to_date" name="to_date" value="<?php if(isset($_GET['to_date'])){ echo $_GET['to_date']; } ?>" autocomplete="off" required >
                                </div>
                            </td>
							
							<td>
                                <div class="form-group">
                                    <label for="todate">.</label>
									<button type="submit" name="submit" class="form-control btn btn-primary">Search</button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</div>
<?php
if(isset($_GET['submit'])){
	
	$project_id		= $_GET['project_id'];
	$from_date		=	$_GET['from_date'];
	$to_date		=	$_GET['to_date'];
	$warehouse_id	=	$_SESSION['logged']['warehouse_id'];
	$grand_total_qty=0;
    $grand_total_amount=0;
	
?>
<center>
	
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10" id="printableArea">
			<div class="row">
				<div class="col-sm-12">	
					<center>
						<p>
							<img src="images/Saif_Engineering_Logo_165X72.png" height="50px;"/><br>
							<h5>E-Engineering Ltd</h5> 
							<span>Material Transfer List Report</span></br>
							From <span class="dtext"><?php echo date("jS F Y", strtotime($from_date));?></span> To  <span class="dtext"><?php echo date("jS F Y", strtotime($to_date));?> </span><br>
						</p>
					</center>
				</div>
			</div>
            <table id="" class="table table-bordered">
					<thead>
						<tr>
							<th>Material ID</th>
							<th>Material Name</th>
							<th>Unit</th>
							<th>Transfer QTY</th>
							<th>Unit Price</th>
							 <th>Total Amount</th>
						</tr>
					</thead>
					<tbody>
						<?php
							$sql	=	"SELECT * FROM `inv_transfermaster` where 1=1 ".($project_id!='all'?" AND `from_project` = '$project_id'":'')." AND `transfer_date` BETWEEN '$from_date' AND '$to_date';";
							$result = mysqli_query($conn, $sql);
							while($row=mysqli_fetch_array($result))
							{
						?>
						<tr style="background-color:#E9ECEF;">
							<td>Trans. No : <?php echo $row['transfer_id']; ?></td>
							<td>Date : <?php echo date("jS F Y", strtotime($row['transfer_date']));?></td>
							<td>From : <?php echo getProjectNameByID($row['from_project']);?></td>
							<td>To : <?php echo getProjectNameByID($row['to_project']);?></td>
							
							
						</tr>
						<?php
							$totalQty = 0;
							$totalAmount = 0;
							$transfer_id = $row['transfer_id'];
							$sqlall	=	"SELECT material_id,transfer_id,unit,transfer_qty,unit_price,transfer_qty*unit_price total_amount FROM `inv_tranferdetail` WHERE `transfer_id` = '$transfer_id';";
							$resultall = mysqli_query($conn, $sqlall);
							while($rowall=mysqli_fetch_array($resultall))
							{
								$totalQty += $rowall['transfer_qty'];
								$totalAmount += $rowall['total_amount'];
                                $GLOBALS["grand_total_qty"]+=$rowall['transfer_qty'];
                                $GLOBALS["grand_total_amount"]+=$rowall['total_amount'];
                                
						?>
						<tr>
							<td><?php echo $rowall['material_id']; ?></td>
							<td><?php 
								$mb_materialid = $rowall['material_id'];
								$sqlname	=	"SELECT * FROM `inv_material` WHERE `material_id_code` = '$mb_materialid' ";
								$resultname = mysqli_query($conn, $sqlname);
								$rowname=mysqli_fetch_array($resultname);
								echo $rowname['material_description'];
							?>
							</td>
							<td><?php echo getDataRowByTableAndId('inv_item_unit', $rowall['unit'])->unit_name; ?></td>
							<td><?php echo $rowall['transfer_qty']; ?></td>
							<td><?php echo $rowall['unit_price']; ?></td>
							<td><?php echo $rowall['total_amount']; ?></td>
						</tr>
						<?php } ?>
						<tr>
							<td colspan="3" class="grand_total" style="text-align:right">Sub Total:</td>
							<td><?php echo $totalQty; ?></td>
							<td></td>
							 <td><?php echo $totalAmount; ?></td>
						</tr>
						<?php } ?>
					</tbody>
                    <tfoot>
						<tr>
							<th colspan="3"><b style='float:right'>GRAND TOTAL</b></th>
							<th><?php echo $grand_total_qty; ?></th>
                            <td></td>
                             <th><?php echo $grand_total_amount; ?></th>
						</tr>
					</tfoot>
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
<?php }?>
<script>
function printDiv(divName) {
	 var printContents = document.getElementById(divName).innerHTML;
	 var originalContents = document.body.innerHTML;

	 document.body.innerHTML = printContents;

	 window.print();

	 document.body.innerHTML = originalContents;
}
</script>
<script>
    $(function () {
        $("#from_date").datepicker({
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
        $("#to_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>


