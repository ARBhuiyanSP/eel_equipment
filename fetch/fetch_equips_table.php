
<?php
//fetch.php
session_start();
include('../connection/connect.php');
include('../helper/utilities.php');
$column = array("equipments.id", "equipments.name", "equipments.eel_code", "equipments.present_location", "equipments.makeby");
$query = "
 SELECT *,equipments.id as voucher_id FROM equipments 
";
$query .= " WHERE 1=1 AND  ";
if(isset($_POST["is_present_location"]))
{
 $query .= "equipments.present_location = '".$_POST["is_present_location"]."' AND ";
}
if(isset($_POST["search"]["value"]))
{
 $query .= '(equipments.id LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR equipments.name LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR equipments.eel_code LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR equipments.present_location LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR equipments.makeby LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR equipments.model LIKE "%'.$_POST["search"]["value"].'%") ';
}

if(isset($_POST["order"]))
{
 $query .= 'ORDER BY '.$column[$_POST['order']['0']['column']].' '.$_POST['order']['0']['dir'].' ';
}
else
{
 $query .= 'ORDER BY equipments.id DESC ';
}

$query1 = '';

if($_POST["length"] != 1)
{
 $query1 .= 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
}

$number_filter_row = mysqli_num_rows(mysqli_query($conn, $query));

$result = mysqli_query($conn, $query . $query1);

$data = array();

while($row = mysqli_fetch_array($result))
{

	$actionData     =   get_equipments_list_action_data($row);
 $sub_array = array();

 $sub_array[] = $row["name"];
 $sub_array[] = $row["eel_code"];
 $sub_array[] = $row["present_location"];
 $sub_array[] = $row["makeby"];
 $sub_array[] = $row["model"];
 $sub_array[] = $row["capacity"];
 $sub_array[] = $actionData;
 $data[] = $sub_array;
}

function get_equipments_list_action_data($row){
	//$edit_url = 'receive_edit.php?edit_id='.$row["name"];
    
		  $edit_url = 'equipment_edit.php?id='.$row["voucher_id"];
	   
    $view_url = 'equipment_view.php?id='.$row["voucher_id"];
    $shifting_url = 'equipment_shifting.php?id='.$row["voucher_id"];
    $history_url = 'history.php?id='.$row["eel_code"];
    $approve_url = 'receive_approve.php?no='.$row["name"];
    $action = "";
	
if(check_permission('material-receive-edit')){
    $action.='<span><a class="action-icons c-delete" href="'.$edit_url.'" title="edit"><i class="fa fa-edit bg-info text-white mborder"> Edit</i></a></span>';
}

						
	$action.='<span><a class="action-icons c-approve" href="'.$view_url.'" title="View"><i class="fas fa-eye bg-success text-white mborder"> Details</i></a></span>';
	
	$action.='<span><a class="action-icons c-approve" href="'.$shifting_url.'" title="View"><i class="fas fa-edit bg-danger text-white mborder"> Shifting</i></a></span>';
	
	$action.='<span><a class="action-icons c-approve" href="'.$history_url.'" title="View"><i class="fas fa-edit bg-success text-white mborder"> History</i></a></span>';

if(check_permission('material-receive-approve')){
    $action.='<span><a class="action-icons c-delete" href="'.$approve_url.'" title="edit"><i class="fa fa-check bg-info text-white mborder"></i></a></span>';
}
							
							
	
											
    

    return $action;

}

function get_all_data($conn)
{
 $query = "SELECT * FROM equipments";
 $result = mysqli_query($conn, $query);
 return mysqli_num_rows($result);
}

$output = array(
 "draw"    => intval($_POST["draw"]),
 "recordsTotal"  =>  get_all_data($conn),
 "recordsFiltered" => $number_filter_row,
 "data"    => $data
);

echo json_encode($output);

?>