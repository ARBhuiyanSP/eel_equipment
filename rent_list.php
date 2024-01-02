<?php 
include 'header.php';
?>
<?php /* if(!check_permission('user-list')){ 
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
        <li class="breadcrumb-item active"> Rent List</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Rent List
            <a href="rent.php" style="float:right"><i class="fas fa-plus"></i> Create New<a>
        </div>
        <div class="card-body">
                       <?php include 'partial/rent_list.php'; ?>
                    </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>

<script>
$(function () {    
  get_rent_data_table();
})

function get_rent_data_table(){

  let project_id   = '';
  let sub_project_id   = '';
    //getDataTablelogsheetList call from  grid_management.php
    var url       =   baseUrl + "function/grid_management.php?process_type=getDataTableRentList";
//logsheet_list_table  reference logsheet-list.php
    var userListDataTable   =   $('#rent_list_table').DataTable({
            "processing": true,
            "serverSide": true,
            "ajax": {
                url:url,
                type:'POST',
                dataType:'json',
                data: {
                    project_id		: project_id,
                    sub_project_id	: sub_project_id
                }
            },
            "aoColumnDefs": [
                { "bSortable": false, "aTargets": [ -1, 2, 3 ] }
            ],
            "lengthMenu": [[10, 100, 250, -1], [10,100, 250,"All"]]
        });


}
</script>
