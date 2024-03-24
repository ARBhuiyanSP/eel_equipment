<?php 
include 'header.php';
?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> Reports List</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <style>
        	h5{
        		color:red;
        		font-weight: bold;
        	}
        </style>
        <div class="card-body">
            <!--here your code will go-->
           <div class="row">
		                   <div class="col-sm-4">
								<h5>RLP Reports</h5>
								<ul>
									<a href="rlp_report.php"><li><b>Project & Datewise RLP Report</b></li></a>
								</ul>
								
								<h5>Notesheet Reports</h5>
								<ul>
									<a href="notesheet_report.php"><li><b>Project & Datewise Notesheet Report</b></li></a>
									<a href="ns_report.php"><li><b>Notesheet Details Report</b></li></a>
									<a href="ns_sm_report.php"><li><b>Notesheet Summary Report</b></li></a>
								</ul>
								
								<h5>Workorders Reports</h5>
								<ul>
									<a href="wo_report.php"><li><b>Project & Datewise Workorder Report</b></li></a>
								</ul>

								<h5>Material Stock Reports</h5>
								<ul>
									<a href="material_list_report.php"><li><b>Material List</b></li></a>
									<a href="stock_report.php"><li><b>Stock Reports</b></li></a>
									<a href="movement_report.php"><li><b>Movement Reports</b></li></a>
									<a href="material-history.php"><li><b>Materialwise Movement Report</b></li></a>
								</ul>
							</div>

							

							<div class="col-sm-4">
								
								
								<h5>Material Receive Reports</h5>
								<ul>
									<a href="receive_report.php"><li><b>Date to Date wise Material Receive Report</b></li></a>
									<a href="materialwise_receive_report.php"><li><b>Individul Material Receive Report</b></li></a>
									<a href="receive_report_by_category.php"><li><b>Category Wise Material Receive Report  </b></li></a>
									<a href="supplier_receive.php"><li><b>Supplier wise Receive Report</b></li></a>
									<a href="supplier_ledger.php"><li><b>Supplier Ledger Report</b></li></a>
								</ul>

								<h5>Transfer Reports</h5>
								<ul>
									<a href="transfer_report.php"><li><b>Project to Project wise Material Transfer</b></li></a>
								</ul>

								<h5>Consumption Reports</h5>
								<ul>
									<a href="consumption_report.php"><li><b>All Materialwise Consumption Report</b></li></a>
									<a href="materialwise_consumption_report.php"><li><b>Materialwise Consumption Report</b></li></a>
									<a href="date_wise_material_issue_report.php"><li><b>Date to date wise Material issue report</b></li></a>
									<a href="equipments-history.php"><li><b>Equipments Material issue Report</b></li></a>
								</ul>
							</div>
							
							<div class="col-sm-4">
								<h5>Equipment Reports</h5>
								<ul>
									<!-- <a href="equipment_list_report.php"><li><b>Equipment List</b></li></a> -->
									<a href="typewise_equipment_list_report.php"><li><b>Typewise Equipment List</b></li></a>
									<a href="rental_site_equipment_list_report.php"><li><b>Rental Site Equipment List</b></li></a>
									<a href="statuswise_equipment_list_report.php"><li><b> Statuswise Equipment List</b></li></a>
									<a href="equipment_history_report.php"><li><b>Equipment Shifting Report</b></li></a>
									<a href="datewise_logsheet_report.php"><li><b>Equipment Logsheet Report</b></li></a>
									<a href="datewise_maintenance_report.php"><li><b>Schedule Maintenance Cost Report</b></li></a>
									<a href="datewise_maintenance_cost_report.php"><li><b>Maintenance Cost Report</b></li></a>
									<a href="equipments-history.php"><li><b>Equipments Cost History Report</b></li></a>
									<a href="inspection-history.php"><li><b>Equipments Inspection History Report</b></li></a>
								</ul>
								<h5>Rent Reports</h5>
								<ul>
									<a href="client-history.php"><li><b>Party/Client Ledger Report</b></li></a>
									<a href="allsupplierbalance_report_search.php"><li><b>All Party/Client Account Status Report</b></li></a>
								</ul>
								<h5>Task Reports</h5>
								<ul>
									<a href="user_wise_task_report.php"><li><b>Userwise task Report</b></li></a>
								</ul>
							</div>
						</div>
            <!--here your code will go-->
        </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>