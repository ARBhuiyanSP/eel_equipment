<?php include 'header.php';
include 'includes/opening_stock_process.php'; ?>
<?php if(!check_permission('opening-stock-list')){ 
        include("404.php");
        exit();
 } ?>
<style>
.comment {

display:none;

}
.table th, .table td {
	padding:3px;
}
</style>
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Overview</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            Opening Balance Maintenece</div>
        <div class="card-body">
				<table class="table table-condensed table-hover table-bordered">
					<thead>
						<tr style="background-color:#007BFF;color:#fff;">
							<th width="10%">Category</th>
							<th width="5%">Code</th>
							<th width="20%">Material Name</th>
							<th width="15%">Part No</th>
							<th width="15%">Spec</th>
							<th width="5%">Unit</th>
							<th width="10%">OP Stock</th>
							<th width="10%">OP Value</th>
						</tr>
					</thead>
					<tbody>
						<?php
							$sql	=	"SELECT * FROM inv_material  GROUP BY `material_id`";
							$result = mysqli_query($conn, $sql);
							while($row=mysqli_fetch_array($result))
							{
						?>
						<tr style="background-color:#b6d7fa;">
							<td>
								<?php 
								$dataresult =   getDataRowByTableAndId('inv_materialcategorysub', $row['material_id']);
								echo (isset($dataresult) && !empty($dataresult) ? $dataresult->category_description : '');
								$material_id = $row['material_id'];
								?>
							</td>
							<td colspan="7"></td>
						</tr>
						
						<?php 
							//$material_sub_id = $rowall['material_sub_id'];
							$material_id = $row['material_id'];
							$sqlmat	=	"SELECT * FROM inv_material WHERE `material_id` = '$material_id' GROUP BY `material_id_code`;";
							$resultmat = mysqli_query($conn, $sqlmat);
							while($rowmat=mysqli_fetch_array($resultmat))
							{ ?>
						
						<tr>
							<td></td>
							<td><input class="form-control" name="material_id_code[]" id="material_id_code" type="text" value="<?php echo $rowmat['material_id_code']; ?>" readonly /></td>
							
							<input class="form-control" name="material_name[]" id="material_name" type="hidden" value="<?php echo $rowmat['id']; ?>" readonly />
							
							<td><input class="form-control" name="material_description[]" id="material_description" type="text" value="<?php echo $rowmat['material_description']; ?>" readonly /></td>
							<td><input class="form-control" name="part_no" id="part_no" type="text" value="<?php echo $rowmat['part_no']; ?>" readonly /></td>
							<td><input class="form-control" name="spec" id="spec" type="text" value="<?php echo $rowmat['spec']; ?>" readonly /></td>
							<td><input class="form-control" name="material_description[]" id="material_description" type="text" value="<?php echo getDataRowByTableAndId('inv_item_unit', $rowmat['qty_unit'])->unit_name; ?>" readonly /></td>
							
							
							<?php
							$mb_materialid	=	$rowmat['material_id_code'];
							$warehouse_id	=	$_SESSION['logged']['warehouse_id'];
							$sqlop			=	"SELECT * FROM inv_materialbalance WHERE `mb_materialid` = '$mb_materialid' AND `mbtype`='OP' AND `warehouse_id`='$warehouse_id';";
							$resultop		=	mysqli_query($conn, $sqlop);
							$rowop			=	mysqli_fetch_array($resultop);
							$rowcount 		=	mysqli_num_rows($resultop);
							
							if($rowcount > 0){
								$mbin_qty 		= $rowop['mbin_qty'];
								$mbin_val 		= $rowop['mbin_val'];
								$submit_name	= 'op_edit';
								if($mbin_qty > 0){
									$validation 	= 'readonly';
									$submit			= 'disabled';
								}else{
									$validation 	= '';
									$submit			= '';
								}
							}else{
								$mbin_qty		= 0;
								$mbin_val 		= 0;
								$validation 	= '';
								$submit			= '';
								$submit_name	= 'op_submit';
							}
							?>
							
							<td><input class="form-control" name="op_balance_qty[]" id="op_balance_qty" type="text" value="<?php echo $mbin_qty; ?>" <?php echo $validation; ?> /></td>
							
							<td><input class="form-control" name="op_balance_val[]" id="op_balance_val" type="text" value="<?php echo $mbin_val; ?>" <?php echo $validation; ?> /></td>
						</tr>
						<?php }  }  ?>
					</tbody>
				</table>
				
			
        </div>
    </div>
</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>
<script>
    $(function () {
        $("#op_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>