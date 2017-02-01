<!-- breadcrumb -->
<div class="row breadcrumb">
	<ol class="breadcrumb-entry">
		<li><a href="admin.php">{{ lang['home'] }}</a</li>
		<li><a href="?mod=configuration">{{ lang['extras'] }}</a> </li>
		<li class="active">{{ lang['manage_vars'] }}</li>
	</ol>
</div>
<!-- /breadcrumb -->
<div class="row">
    <div class="col-md-12">	
        <div class="panel panel-default">
<form method="post" action="?mod=extras&manageConfig=1">
<input type="hidden" name="token" value="{{ token }}"/>
<input type="hidden" name="mod" value="extras"/>
<input type="hidden" name="manageConfig" value="1"/>
<input type="hidden" name="action" value="commit"/>

            <div id="configAreaX"></div>
                <textarea name="config" id="configArea" cols="120" rows="40" style="width: 99%; font: normal 11px/14px Courier,Tahoma,sans-serif;"></textarea>
<!--  <button type="submit" class="btn btn-primary">Commit changes</button>--> &nbsp; 
                <button type="button" class="btn btn-primary" onclick="loadData(); return false;">Load data</button>
                <button type="button" class="btn btn-primary" onclick="showContent(); return false;">Show content</button>
</form>
        </div>
    </div>
</div>
<script type="text/javascript" language="javascript">
function loadData() {
$.post('/engine/rpc.php', { json : 1, methodName : 'admin.extras.getPluginConfig', rndval: new Date().getTime(), params : json_encode({ token : '{{ token }}' }) }, function(data) {
	ngHideLoading();
	// Try to decode incoming data
	try {
		resTX = eval('('+data+')');
	} catch (err) { alert('Error parsing JSON output. Result: '+linkTX.response); }
	if (!resTX['status']) {
		ngNotifyWindow('Error ['+resTX['errorCode']+']: '+resTX['errorText'], 'ERROR');
	}
	var line = resTX['content'];
	var newline = line.replace(/\\u/g, "%u");
	//$('#configAreaX').html(newline);
	$('#configArea').val(unescape(newline));
	//$('#configArea').val("\u0420"+"\u0415\u041a\u041b\u0410\u041c\u0410_\u041d\u0410_\u041c\u041e\u0420\u0414\u0415");
}, "text").error(function() { ngHideLoading(); ngNotifyWindow('HTTP error during request', 'ERROR'); });
}

function showContent() {
   alert($('#configArea').val());
}


</script>
