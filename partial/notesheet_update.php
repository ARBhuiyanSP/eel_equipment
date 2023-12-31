<?php
    $currentUserId  	=   $_SESSION['logged']['user_id'];
    $notesheet_id  	 	=   $_GET['id'];    
    $notesheets    		=   getNotesheetDetailsData($notesheet_id);   
    $notesheets_master	=   $notesheets['notesheets_master'];
    $notesheets    		=   $notesheets['notesheets'];
?>
<!-- Main content -->
<section class="invoice">
    <!-- Info row -->
    <div class="row invoice-info">
        <div class="col-md-12">
			<center>
				<h5 align="center"><img src="images/spl.png" height="50"></h5>
				<h2>E-Engineering Limited</h2>
				<p>Khawaja Tower[13th Floor], 95 Bir Uttam A.K Khandokar Road, Mohakhali C/A, Dhaka-1212, Bangladesh</p>
				<h5><b>Note Sheet - [Req No: <?php echo $notesheets_master->notesheet_no ?>]</b></h5>
				<h5><b style="border:1px solid #000;padding:3px;border-radius:5px;">Project: <?php echo getProjectNameById($notesheets_master->request_project) ?></b></h5>
			</center>
			<h5><b>Subject : <?php echo $notesheets_master->subject ?></b></h5></br>
			<h5>
				<b>Supplier Name : <?php echo $notesheets_master->supplier_name ?></b></br>
				Address : <?php echo $notesheets_master->address ?></br>
				Concern person : <?php echo $notesheets_master->concern_person ?></br>
				Call : <?php echo $notesheets_master->cell_number ?>, E-Mail:  <?php echo $notesheets_master->email ?></br>
			</h5>
		</div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
    <!-- table row -->
	<div class="row">
			<div class="col-md-12 table-responsive">
                <p><?php echo $notesheets_master->ns_info ?></p>
				<table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>S/N</th>
                            <th>Item Description</th>
                            <th width="10%">Quantity</th>
                            <th width="10%">Unit Price</th>
                            <th width="10%">Total</th>
                        </tr>
                    </thead>
                    <tbody id="tbl_posts_body">
                        <?php
							$sl =   1;
							$total = 0;
							$totalQty = 0;
                            foreach($notesheets as $data){
								$total += $data->total;
								$totalQty += $data->quantity;
                        ?>
                        <tr id="rec-1">
                            <td><?php echo $sl++; ?></td>
							
                            <td><?php $dataresult =   getDataRowByTableAndId('inv_material', $data->item);
								echo (isset($dataresult) && !empty($dataresult) ? $dataresult->material_description : ''); ?></td>
                            
                            <td><?php echo $data->quantity; ?></td>
                            <td><?php echo $data->unit_price; ?></td>
                            <td><?php echo $data->total; ?></td>
                        </tr>                        
                            <?php } ?>
						<tr id="rec-1">
                            <td colspan="4" style="text-align:right">Sub Total: </td>
                            <td><?php echo $notesheets_master->sub_total; ?></td>
                        </tr>
						<tr id="rec-1">
                            <td colspan="4" style="text-align:right">AIT: </td>
                            <td><?php echo $notesheets_master->ait; ?></td>
                        </tr>
						<tr id="rec-1">
                            <td colspan="4" style="text-align:right">VAT: </td>
                            <td><?php echo $notesheets_master->vat; ?></td>
                        </tr>
						<tr id="rec-1">
                            <td colspan="4" style="text-align:right">Grand Total: </td>
                            <td><?php echo $notesheets_master->grand_total; ?></td>
                        </tr>
						<tr id="rec-1">
                            <td colspan="6" style="text-align:left"><b>In word: <?php echo convertNumberToWords($notesheets_master->grand_total); ?> Only</b></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- /.col -->
			<!---- Attachment View----->
			<div class="col-md-12">
				<button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModal">View Attachment</button>
				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Attachment</h4>
							</div>
							<div class="modal-body">
								
								<?php if($notesheets_master->attached_file){ ?>
								<object
									data='uploads/file/<?php echo $notesheets_master->attached_file; ?>'
									type="application/pdf"
									width="100%"
									height="500"
								  >

									<iframe
									  src='uploads/file/<?php echo $notesheets_master->attached_file; ?>'
									  width="100%"
									  height="500"
									>
									<p>Not Supported !</p>
									</iframe>
								  </object>
								<?php }else{ ?>
									No Attachment Found
								<?php }?>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!---- Attachment View----->
        </div>
    <!-- /.row -->
    <?php
    $role       =   get_notesheet_role_group_short_name();
    
    if(is_super_admin($currentUserId)){
        include 'notesheet_update_view_sa.php';
    }elseif($role    ==  "member"){
        include 'notesheet_update_view_member.php';
    }elseif($role    ==  "dh"){
        include 'notesheet_update_view_dh.php';
    }elseif($role    ==  "ab"){
        include 'notesheet_update_view_ab.php';
    }else{
        include 'notesheet_update_view_dh.php';
    }
    ?>
</section>
<!-- /.content -->
<div class="clearfix"></div>