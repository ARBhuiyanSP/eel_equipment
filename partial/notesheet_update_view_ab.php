<div class="row">
    <div class="col-md-4">
        <form id="notesheet_ab_update_form">
        <div class="common_individual_section approval_body_section_style">
            <h4>Acknowledgement<hr></h4>
            <div class="radio">
                <label><input type="radio" name="acknowledgement" value="1">Approve</label>
            </div>
            <div class="radio">
                <label><input type="radio" name="acknowledgement" value="3">Reject</label>
            </div>
        </div>
        <div class="form-group">
            <label for="comment">Remarks:</label>
            <textarea class="form-control" rows="5" id="remarks" name="remarks"></textarea>
        </div>
            <input type="hidden" name="notesheet_id" value="<?php echo $notesheet_id; ?>">
            <input type="text" name="created_by" value="<?php echo $currentUserId; ?>">
            <button type="button" class="btn btn-primary btn-block" onclick="execute_notesheet_ab_update_form('notesheet_ab_update_form', 'notesheet_ab_update_execute');">Update</button>
        </form>
    </div>
    <?php include 'notesheet_remarks_and_acknowledgement_ingeneral.php'; ?>
</div>