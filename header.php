<?php session_start(); 
if(!isset($_SESSION['logged']['status'])){
    header("location: index.php");
    exit();
}
include 'connection/connect.php';
include 'helper/utilities.php';
include 'includes/item_process.php';
include 'includes/receive_process.php';
include 'includes/transfer_process.php';
//include 'includes/rlp_process.php';
include 'includes/issue_process.php';
include 'includes/search_process.php';
include 'includes/warehouse_search_process.php';
include 'includes/project_process.php';
include 'includes/unit_process.php';
include 'includes/package_process.php';
include 'includes/building_process.php';
include 'includes/warehouse_process.php';
include 'includes/suppliers_process.php';
include 'includes/format_process.php';
include 'includes/return_process.php';
include 'includes/payment_process.php';
//include 'includes/equipment_process.php';
include 'function/rlp_process.php';
include 'function/rlp_chain_process.php';
include 'function/notesheet_processing.php';
include 'function/notesheet_chain_process.php';
include 'function/workorder_processing.php';
include 'function/user_management.php';
include 'function/equipment_processing.php';
include 'function/maintenance_cost_processing.php';
include 'function/rent_processing.php';
include 'includes/user_process.php';
include 'includes/order_process.php';
include 'includes/role_process.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="images/fav.png">
  <title>88i Inventory</title>
  <!-- Custom fonts for this template-->
  <link href="css/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
  <link href="css/sweetalert.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link href="css/jquery-ui.css" rel="stylesheet">
  <link href="css/site_style.css" rel="stylesheet">
  <link href="css/form-entry.css" rel="stylesheet">
  <link href="css/select2.min.css" rel="stylesheet">
  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="js/select2.min.js"></script>
</head>
<style>
/* body {
  background-image: url("images/bg2.jpg");
  background-color: #cccccc;
} */

.mborder{
	padding:3px;
	border:1px solid #808080;
}
.authimg{
	position: absolute;
    top: 50%;
    left: 50%;
    transform: translateX(-50%) translateY(-50%);
    max-width: 100%;
    max-height: 100%;
}

.reqfield{
	color:red;
	font-style: italic;
	font-size:10px;
	font-weight:bold;
}
.table th, .table td {
  padding:3px !important;
}
.navbar{
	padding : 0px 15px;
}
.form-control{
	border:1px solid #000 !important;
	font-size:12px;
}
label{
	font-weight:bold;
	font-size:12px;
}
footer.sticky-footer{
	width: calc(100% - 0px);
	height:30px;
}
</style>
<body id="page-top">
  <nav class="navbar navbar-expand navbar-light bg-light fixed-top">
    <a class="navbar-brand mr-1" href="index.php"><img src="images/logo-wide.png" height="30px;"/></a>

	<!-- Menu -->
    <ul class="navbar-nav ml-auto ml-md-0">
	  <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-cog"></i> Master Setup
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
            <?php if(check_permission('category-list')){ ?>
                    <a class="dropdown-item" href="category.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Material Category</span>
            </a>
             <?php    } ?>
            
			
			<?php
            
                if(check_permission('material-list')){ ?>
                    <a class="dropdown-item" href="material.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Material</span>
            </a>
             <?php    } ?>
			 
             <?php
            
                if(check_permission('unit-list')){ ?>
                    <a class="dropdown-item" href="unit_entry.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> UOM</span>
            </a>
             <?php    } ?>
			    <?php
            
                if(check_permission('project-list')){ ?>
                    <a class="dropdown-item" href="clients.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Clients</span>
            </a>
             <?php    } ?>
			 
			 <?php
            
                if(check_permission('project-list')){ ?>
                    <a class="dropdown-item" href="supplier_entry.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Suppliers</span>
            </a>
             <?php    } ?>
			 
        <?php
            
                if(check_permission('project-list')){ ?>
                    <a class="dropdown-item" href="project_entry.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Projects</span>
            </a>
             <?php    } ?>
            
            <?php
            
                if(check_permission('warehouse-list')){ ?>
                    <a class="dropdown-item" href="warehouse_entry.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Warehouse</span>
            </a>
             <?php    } ?>
           
        
         
			 
			 
			   <?php
            
                if(check_permission('role-list')){ ?>
                    <a class="dropdown-item" href="role-list.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Role</span>
            </a>
             <?php    } ?>
			 
			 
            <?php
            
                if(check_permission('role-list')){ ?>
                    <a class="dropdown-item" href="rlp_approve_chain_list.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> RLP Approval Chain</span>
            </a>
             <?php    } ?>
			 
			  
            <?php
            
                if(check_permission('role-list')){ ?>
                    <a class="dropdown-item" href="notesheet_approve_chain_list.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Notesheet Approval Chain</span>
            </a>
             <?php    } ?>
		   
          <!--<a class="dropdown-item" href="#">Settings</a>-->
          <!--<a class="dropdown-item" href="#">Activity Log</a>-->
        </div>
      </li>
	  <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-tachometer-alt"></i> Settings
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
               <?php if(check_permission('user-list')){ ?>
				
					<a class="nav-link" href="user-list.php">
						<i class="fa fa-users" aria-hidden="true" style="color: #000;"></i>
						<span style="color: #000;">Users</span></a>
				
			<?php } ?>
			
			<?php if(check_permission('data-backup')){ ?>
				
					<a class="nav-link" href="data_backup.php" style="color: #000;">
						<i class="fa fa-database" aria-hidden="true" style=""></i>
						<span>Data Backup</span></a>
				
			<?php } ?>

			<?php if(check_permission('log-history')){ ?>
				
					<a class="nav-link" href="log-history.php" style="color: #000;">
						<i class="fa fa-key" aria-hidden="true" style=""></i>
						<span>Log History</span></a>
				
			<?php } ?>
			 
			<?php if(check_permission('opening-stock-list')){ ?>
				
					<a class="nav-link" href="opening_balance.php" style="color: #000;">
						<i class="fa fa-key" aria-hidden="true" style=""></i>
						<span>OP Entry</span></a>
				
			<?php } ?>
		   
          <!--<a class="dropdown-item" href="#">Settings</a>-->
          <!--<a class="dropdown-item" href="#">Activity Log</a>-->
        </div>
      </li>
	  <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-truck"></i> Receive
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
               <?php if(check_permission('material-receive-add')){ ?>
			<a class="dropdown-item" href="receive_entry.php"><i class="fa fa-plus" aria-hidden="true" style="color: #007BFF;"></i><span class="sub_menu_text_design">Receive Entry</span></a>
			<?php } ?>
			<a class="dropdown-item" href="receive-list.php"><i class="fa fa-list" aria-hidden="true" style="color: #007BFF;"></i><span class="sub_menu_text_design">Receive List</span></a>
		   
          <!--<a class="dropdown-item" href="#">Settings</a>-->
          <!--<a class="dropdown-item" href="#">Activity Log</a>-->
        </div>
      </li>
	  <!-- <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-server"></i> issue
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
               <?php //if(check_permission('material-receive-add')){ ?>
			<a class="dropdown-item" href="issue_entry.php"><i class="fa fa-plus" aria-hidden="true" style="color: #007BFF;"></i><span class="sub_menu_text_design">Material issue</span></a>
			<?php //} ?>
			<a class="dropdown-item" href="issue-list.php"><i class="fa fa-list" aria-hidden="true" style="color: #007BFF;"></i><span class="sub_menu_text_design">Issue List</span></a>
		   
         <a class="dropdown-item" href="#">Settings</a>
         <a class="dropdown-item" href="#">Activity Log</a>
        </div>
      </li> -->
	  <li class="nav-item dropdown no-arrow">
        <?php //if(check_permission('material-issue-list')){ ?>
		<a class="nav-link" href="transfer_list.php" id="userDropdown">
          <i class="fa fa-server"></i> Transfer
        </a>
		<?php //} ?>
		</li>
	  <li class="nav-item dropdown no-arrow">
        <?php //if(check_permission('material-issue-list')){ ?>
		<a class="nav-link" href="rlp_list.php" id="userDropdown">
          <i class="fa fa-server"></i> RLP
        </a>
		<?php //} ?>
		</li>
      <li class="nav-item dropdown no-arrow">
        <?php //if(check_permission('material-issue-list')){ ?>
        <a class="nav-link" href="notesheets_list.php" id="userDropdown">
          <i class="fa fa-server"></i> Notesheet
        </a>
        <?php //} ?>
        </li>
		 <li class="nav-item dropdown no-arrow">
        <?php //if(check_permission('material-issue-list')){ ?>
        <a class="nav-link" href="workorders_list.php" id="userDropdown">
          <i class="fa fa-server"></i> Workorder
        </a>
        <?php //} ?>
        </li>
		 
		
		  <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-server"></i> Equipments
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
			<a class="dropdown-item" href="equipment_entry.php"><i class="fa fa-plus" aria-hidden="true" style="color: #007BFF;"></i><span class="sub_menu_text_design"> Equipments Entry</span></a>            
			<a class="dropdown-item" href="equipments-list.php"><i class="fa fa-plus" aria-hidden="true" style="color: #007BFF;"></i><span class="sub_menu_text_design"> Equipments List</span></a>  
			<a class="dropdown-item" href="shifting-list.php"><i class="fa fa-plus" aria-hidden="true" style="color: #007BFF;"></i><span class="sub_menu_text_design"> Equipments Shifting</span></a>  
			<a class="dropdown-item" href="history-list.php"><i class="fa fa-plus" aria-hidden="true" style="color: #007BFF;"></i><span class="sub_menu_text_design"> Equipments History</span></a>  
		   
          <!--<a class="dropdown-item" href="#">Settings</a>-->
          <!--<a class="dropdown-item" href="#">Activity Log</a>-->
        </div>
      </li>
		
		
	  <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-server"></i> Maintenance
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
			<a class="dropdown-item" href="logsheet_list.php"><i class="fa fa-plus" aria-hidden="true" style="color: #007BFF;"></i><span class="sub_menu_text_design"> Logsheet</span></a>            
			<?php //if(check_permission('material-receive-add')){ ?>
			<a class="dropdown-item" href="schedulemaintenance_list.php"><i class="fa fa-plus" aria-hidden="true" style="color: #007BFF;"></i><span class="sub_menu_text_design"> Schedule Maintenance</span></a>
			<?php //} ?>
			<a class="dropdown-item" href="maintenancecost_list.php"><i class="fa fa-plus" aria-hidden="true" style="color: #007BFF;"></i><span class="sub_menu_text_design"> Maintenance Cost</span></a>
		   
          <!--<a class="dropdown-item" href="#">Settings</a>-->
          <!--<a class="dropdown-item" href="#">Activity Log</a>-->
        </div>
      </li>

       <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="rentDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-server"></i> Rent
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="rentDropdown">
            <a class="dropdown-item" href="rent.php"><i class="fa fa-plus" aria-hidden="true" style="color: #007BFF;"></i><span class="sub_menu_text_design"> Rent/Bill Entry</span></a>
            <a class="dropdown-item" href="rent_list.php">
                <i class="fa fa-list" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Rent/Bill List</span>
            </a> 
                
            <a class="dropdown-item" href="rent_list.php">
                <i class="fa fa-list" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Rent/Bill Collection</span>
            </a>            
            
            
            
        </div>
      </li>
		
		
	  <li class="nav-item dropdown no-arrow">
        
		<a class="nav-link" href="reports.php" id="userDropdown">
          <i class="fas fa-user-circle fa-fw"></i> Reports
        </a>
		
		</li>
    </ul>
	
	
	<div class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" style="color: white;"><?php echo $_SESSION['logged']['user_name']; ?>-[<?php echo $_SESSION['logged']['user_name']; ?>]</div>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
           <a class="dropdown-item" href="profile.php">Profile</a>
          <a class="dropdown-item" href="includes/logout.php">Logout</a>
          <!--<a class="dropdown-item" href="#">Settings</a>-->
          <!--<a class="dropdown-item" href="#">Activity Log</a>-->
        </div>
      </li>
    </ul>
  </nav>

  <div id="wrapper" style="padding-top:30px;">

    <!-- Sidebar -->
    <?php //include 'sidebar.php' ?>

    <div id="content-wrapper" style="">    
        <!-- Sidebar -->
    <?php include 'operation_message.php'; ?>