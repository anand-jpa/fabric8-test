<style>
.modal-static { 
   position: fixed;
   top: 50% !important; 
   left: 50% !important; 
   margin-top: -100px;  
   margin-left: -100px; 
   overflow: visible !important;
}
.modal-static,
.modal-static .modal-dialog,
.modal-static .modal-content {
    width: 300px; 
    height: 300px; 
}
.modal-static .modal-dialog,
.modal-static .modal-content {
    padding: 0 !important; 
    margin: 0 !important;
}
.modal-static .modal-content .icon {
}
</style>
<div class="modal modal-static" id="processing-modal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content" >
        	<button type="button" class="close" style="float: right;" id="closeModal">×</button>
            <div class="modal-body" id="processing" style="display: none;">
                <div class="text-center">
                    <img src="<c:url value="/resources/images/loading.gif" />" class="icon" />
                    <h4>Processing...</h4>
                </div>
            </div>
		 </div>
	</div>
</div>
<div class="modal-backdrop" style="display: none;"></div>
<script>
	$('#closeModal').click(function(){
		$('.modal-backdrop').removeClass(' fade in');
		$('.modal-backdrop').hide();
		$('#processing-modal').hide();
		$('#processing').hide();
		$('#cartSuccess').hide();
	});
</script>
 