<div class="col-md-4">
    <h5>Remarks History<hr></h5>
    <div id="remarks_history_section">        
        <!-- /.box-comment -->
        <div class="box-footer box-comments">
        <?php
        $table = "notesheet_remarks_history WHERE notesheet_id=$notesheet_id";
        $order = 'DESC';
        $column = 'remarks_date';
        $allRemarksHistory = getTableDataByTableNameRlp($table, $order, $column);
        if (isset($allRemarksHistory) && !empty($allRemarksHistory)) {
            foreach ($allRemarksHistory as $dat) {
                ?>
                <div class="box-comment">
                  <div class="comment-text" style="margin-left: 0;">
                      <span class="username">
                        By <?php echo getUserNameByUserId($dat->user_id); ?>
                        <span class="text-muted pull-right"> at <?php echo human_format_date($dat->remarks_date) ?></span>
                      </span><!-- /.username -->
                  <?php echo $dat->remarks ?>
                </div>
                <!-- /.comment-text -->
              </div>
              <!-- /.box-comment -->
                <?php
            } // foreach
        }
            ?>
            
        </div>
    </div>
</div>
<div class="col-md-4">
    <h4>Acknowledgement History<hr></h4>
    <div id="remarks_history_section">
        <?php
        $table = "notesheet_acknowledgement WHERE notesheet_id=$notesheet_id";
        $order = 'DESC';
        $column = 'ack_request_date';
        $allRemarksHistory = getTableDataByTableName2($table, $order, $column);
        if (isset($allRemarksHistory) && !empty($allRemarksHistory)) {
            foreach ($allRemarksHistory as $dat) {
                ?>
        <div class="box box-widget widget-user-2" style="padding: 2px;">
                    <!-- Add the bg color to the header using any of the bg-* classes -->
                    <div class="widget-user-header bg-yellow" style="padding: 5px;">
                        <!-- /.widget-user-image -->
                        <h3 class="widget-user-username" style="margin-left: 5px;"><?php echo getUserNameByUserId($dat->user_id) ?></h3>
                        <h5 class="widget-user-desc" style="margin-left: 5px;"><?php echo getDesignationByUserId($dat->user_id) ?></h5>
                    </div>
                    <div class="box-footer no-padding">
                        <ul class="nav nav-stacked">
                            <li><a href="#">Status <span class="pull-right badge" style="background-color: <?php echo get_status_color($dat->ack_status) ?>"><?php echo get_status_name($dat->ack_status) ?></span></a></li>
                            <li><a href="#">Update at <span class="pull-right badge bg-aqua"><?php echo (isset($dat->ack_updated_date) && !empty($dat->ack_updated_date) ? human_format_date($dat->ack_updated_date) : ""); ?></span></a></li>
                        </ul>
                    </div>
                </div>
                <?php
            }
        }else{
        ?>
        <div class="alert alert-info">
            <strong>No data found.!</strong> 
        </div>
        <?php } ?>
    </div>
</div>