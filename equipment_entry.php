<?php 
include 'header.php';

 if(!check_permission('equipment-list')){ 
        include("404.php");
        exit();
 } ?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Equipment Entry</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Equipment Entry Form
		</div>
        <div class="card-body">
                        <?php include 'partial/equipment_entry_form.php'; ?>
                   </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>