<?php
/*******************************************************************************
 * The following code will
 * Store Receive entry data.
 * There are 4 table to keet track on receive data. The are following:
 * 1. inv_receive (Store single row)      
 * 2. inv_receivedetail (Store Multiple row)
 * 3. inv_materialbalance (Store Multiple row)
 * 4. inv_supplierbalance (Store single row)
 * *****************************************************************************
 */  
if (isset($_POST['order_submit']) && !empty($_POST['order_submit'])) {
	
	// check duplicate:
	$sl_no	= $_POST['sl_no'];
    $table		= 'orders';
    $where		= "sl_no='$sl_no'";
    if(isset($_POST['order_update_submit']) && !empty($_POST['order_update_submit'])){
        $notWhere   =   "id!=".$_POST['order_update_submit'];
        $duplicatedata = isDuplicateData($table, $where, $notWhere);
    }else{
        $duplicatedata = isDuplicateData($table, $where);
    }
	if ($duplicatedata) {
		$status     =   'error';
		$_SESSION['warning']    =   "Operation faild. Duplicate data found..!";
    }else{	    
	$order_date         = $_POST['order_date'];
	$sl_no           	= $_POST['sl_no'];
	$customer_name      = $_POST['customer_name'];
	$customer_contact_no= $_POST['customer_contact_no'];
	$frame           	= $_POST['frame'];
	$frame_no           = $_POST['frame_no'];
	$colour           	= $_POST['colour'];
	$size           	= $_POST['size'];
	$quality           	= $_POST['quality'];
	$lens           	= $_POST['lens'];
	$qty           		= $_POST['qty'];
	$receive_date       = $_POST['receive_date'];
	$delivery_date      = $_POST['delivery_date'];
	$right_sph          = $_POST['right_sph'];
	$right_cyl          = $_POST['right_cyl'];
	$right_axis         = $_POST['right_axis'];
	$left_sph           = $_POST['left_sph'];
	$left_cyl           = $_POST['left_cyl'];
	$left_axis          = $_POST['left_axis'];
	$amount           	= $_POST['amount'];
	$advance           	= $_POST['advance'];
	$due           		= $_POST['due'];
	$remarks            = $_POST['remarks'];
	//$issued_by          = $_SESSION['logged']['user_id'];
	/*
	*  Insert Data Into orders Table:
	*/
	$query2 = "INSERT INTO `orders` (`sl_no`, `customer_name`, `customer_contact_no`, `frame`, `frame_no`, `colour`, `size`, `quality`, `lens`, `qty`, `receive_date`, `delivery_date`, `right_sph`, `right_cyl`, `right_axis`, `left_sph`, `left_cyl`, `left_axis`, `amount`, `advance`, `due`) VALUES ('$sl_no','$customer_name','$customer_contact_no','$frame','$frame_no','$colour','$size','$quality','$lens','$qty', '$receive_date', '$delivery_date', '$right_sph', '$right_cyl', '$right_axis', '$left_sph', '$left_cyl', '$left_axis', '$amount', '$advance', '$due')";
	$result2 = $conn->query($query2);
	
	$_SESSION['success']    =   "Order process have been successfully completed.";
	header("location: order_entry.php");
	exit();
	}
	
}

function getorderDataDetailsById($id){
    global $conn;
    $issues      =   "";
    $issueDetails =   "";
    
    // get receive data
    $sql1           = "SELECT * FROM inv_issue where id=".$id;
    $result1        = $conn->query($sql1);

    if ($result1->num_rows > 0) {
        $issues = $result1->fetch_object();
        // get receive details data
        $table                  =   'inv_issuedetail where issue_id='."'$issues->issue_id'";
        $order                  =   'DESC';
        $column                 =   'issue_qty';
        $dataType               =   'obj';
        $issueDetailsData     = getTableDataByTableName($table, $order, $column, $dataType);
        if(isset($issueDetailsData) && !empty($issueDetailsData)){
            $issueDetails     =   $issueDetailsData;
        }
    }
    $feedbackData   =   [
        'issueData'           =>  $issues,
        'issueDetailsData'    =>  $issueDetails
    ];
    
    return $feedbackData;
}




if(isset($_GET['process_type']) && $_GET['process_type'] == 'get_building_by_package'){
    include '../connection/connect.php';
    include '../helper/utilities.php';
    $package_id      =    $_POST['package_id'];
    $tableName      =    'buildings where package_id='.$package_id;
    $tableData      = getTableDataByTableName($tableName, '', 'building_id');
    if (isset($tableData) && !empty($tableData)) {
        echo "<option value=''>Please Select</option>";
        foreach ($tableData as $data) { ?>
            <option value="<?php echo $data['id']; ?>"><?php echo $data['building_id'].'('.$data['id'].')'; ?></option>
            <?php
        }
    }
}
/*******************************************************************************
 * The following code will
 * Update Receive entry data.
 * There are 4 table to keet track on receive data. The are following:
 * 1. inv_receive (Update single row)      
 * 2. inv_receivedetail (First Delete all rows then Store Multiple row)
 * 3. inv_materialbalance (First Delete all rows then Store Multiple row)
 * 4. inv_supplierbalance (Update single row)
 * *****************************************************************************
 */

if(isset($_POST['order_update_submit']) && !empty($_POST['order_update_submit'])){


    $edit_id            =   $_POST['edit_id'];
    $issue_no             =   $_POST['issue_no'];
    
    // first delete all from inv_receivedetail; 
    $delsql    = "DELETE FROM `inv_issuedetail` WHERE `issue_id`='$issue_no'";
    $conn->query($delsql);
    // first delete all from inv_materialbalance; 
    $delsq2    = "DELETE FROM `inv_materialbalance` WHERE `mb_ref_id`='$issue_no'";
    $conn->query($delsq2);
    
    for ($count = 0; $count < count($_POST['quantity']); $count++) {
        /*
         *  Insert Data Into inv_issuedetail Table:
        */       
        
				$issue_date         = $_POST['issue_date'];
				$issue_id           = $_POST['issue_id'];
				$project_id         = $_POST['project_id'];
				$warehouse_id   	= $_POST['warehouse_id'];
				$material_name      = $_POST['material_name'][$count];
				$material_id        = $_POST['material_id'][$count];
				$unit               = $_POST['unit'][$count];
				$part_no            = $_POST['part_no'][$count];
				$unit_price         = $_POST['unit_price'][$count];
				$quantity           = $_POST['quantity'][$count];
				$use_in          	= $_POST['use_in'];
				$total_amount       = $_POST['sub_total_amount'];
				$remarks            = $_POST['remarks'];     
				
				
				if (is_uploaded_file($_FILES['file']['tmp_name'])) 
				{
					$temp_file=$_FILES['file']['tmp_name'];
					$issue_image=time().$_FILES['file']['name'];
					$q = move_uploaded_file($temp_file,"images/".$issue_image);
				} 
        
				$query = "INSERT INTO `inv_issuedetail` (`issue_id`,`issue_date`,`material_id`,`material_name`,`unit`,`issue_qty`,`issue_price`,`part_no`,`use_in`,`project_id`,`warehouse_id`,`approval_status`) VALUES ('$issue_id','$issue_date','$material_id','$material_name','$unit','$quantity','$unit_price','$part_no','$use_in','$project_id','$warehouse_id','0')";
				$conn->query($query);
				
				/*
				 *  Insert Data Into inv_materialbalance Table:
				*/
				$mb_ref_id      = $issue_id;
				$mb_materialid  = $material_id;
				$mb_date        = (isset($issue_date) && !empty($issue_date) ? date('Y-m-d h:i:s', strtotime($issue_date)) : date('Y-m-d h:i:s'));
				$mbin_qty       = 0;
				$mbin_val       = 0;
				$mbout_qty      = $quantity;
				$mbout_val      = $mbout_qty * $unit_price;
				$mbprice        = $unit_price;
				$mbtype         = 'Issue';
				$mbserial       = '1.1';
				$mbunit_id      = $project_id;
				$mbserial_id    = 0;
				$jvno           = $issue_id;             
				
				$query_inmb = "INSERT INTO `inv_materialbalance` (`mb_ref_id`,`mb_materialid`,`mb_date`,`mbin_qty`,`mbin_val`,`mbout_qty`,`mbout_val`,`mbprice`,`mbtype`,`mbserial`,`mbserial_id`,`mbunit_id`,`jvno`,`part_no`,`project_id`,`warehouse_id`) VALUES ('$mb_ref_id','$mb_materialid','$mb_date','$mbin_qty','$mbin_val','$mbout_qty','$mbout_val','$mbprice','$mbtype','$mbserial','$mbunit_id','$unit','$jvno','$part_no','$project_id','$warehouse_id')";
				$conn->query($query_inmb);
    }
    /*
        *  Update Data Into inv_receive Table:
    */
			

    $query2    = "UPDATE inv_issue SET issue_id='$issue_id',issue_date='$issue_date',use_in='$use_in',total_amount='$total_amount',remarks='$remarks',project_id='$project_id',warehouse_id='$warehouse_id',issue_image='$issue_image' WHERE id=$edit_id";
    $result2 = $conn->query($query2);
    
    $_SESSION['success']    =   "Issue process have been successfully updated.";
    header("location: issue_edit.php?edit_id=".$edit_id);
    exit();
}


if (isset($_POST['order_approve_submit']) && !empty($_POST['order_approve_submit'])) {
 
        /*
         *  Update Data Into inv_receive Table:
        */ 
       
        $issue_id				= $_POST['issue_id']; 
        $approval_status		= $_POST['approval_status'];       
        $approved_by            = $_SESSION['logged']['user_id'];       
        $approved_at            = $_POST['approved_at'];        
        $approval_remarks		= $_POST['approval_remarks'];       
               
        $query = "UPDATE `inv_issue` SET `approval_status`='$approval_status',`approved_by`='$approved_by',`approved_at`='$approved_at',`approval_remarks`='$approval_remarks' WHERE `issue_id`='$issue_id'";
        $conn->query($query);
		
		
		/*
         *  Update Data Into inv_receivedetail Table:
        */      
        $query2 = "UPDATE `inv_issuedetail` SET `approval_status`='$approval_status' WHERE `issue_id`='$issue_id'";
        $conn->query($query2);
		
		/*
         *  Update Data Into inv_materialbalance Table:
        */      
        $query3 = "UPDATE `inv_materialbalance` SET `approval_status`='$approval_status' WHERE `mb_ref_id`='$issue_id'";
        $conn->query($query3);
		
		/*
         *  Update Data Into inv_supplierbalance Table:
        */      
        $query3 = "UPDATE `inv_supplierbalance` SET `approval_status`='$approval_status' WHERE `sb_ref_id`='$issue_id'";
        $conn->query($query3);
		
		

    $_SESSION['success']    =   "ISSUE Approval process successfully completed.";
    header("location: issue-list.php");
    exit();
}

?>