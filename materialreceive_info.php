<?php include 'header.php' ?>
<?php //if(!check_permission('category-wise-material-list')){ 
       // include("404.php");
       // exit();
 //} ?>
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Reports</a>
        </li>
        <li class="breadcrumb-item active"> material receive Info</li>
		
    </ol>
    <!-- receive search start here -->
    <?php include 'search/material_receive_search.php'; ?>
    <!-- end receive search -->


</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>