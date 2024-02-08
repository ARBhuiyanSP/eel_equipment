<?php 
include 'header.php';
?>
<?php if(!check_permission('user-list')){ 
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
        <li class="breadcrumb-item active"> Equipment RLP</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Equipment RLP Create
            <a href="equips_rlp_list.php" style="float:right"><i class="fas fa-list"></i> List<a>
        </div>
        <div class="card-body">
			<?php include 'partial/equips_rlp_create_form.php'; ?>
		</div>
    </div>
</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>