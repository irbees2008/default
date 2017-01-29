<!-- breadcrumb -->
				<div class="row breadcrumb">
					<ol class="breadcrumb-entry">
						<li><a href="admin.php">{{ lang['home'] }}</a></li>
						<li class="active"><a href="admin.php?mod=templates">{{ lang.templates['title'] }}</a></li>
					</ol>
				</div>
<!-- /breadcrumb -->
<div class="row">
	<div class="col-md-12">
	<div class="panel panel-default">					
<form name="selectForm" id="selectForm">

	<div class="panel-footer">
		<div style="margin: 10px 0;">
			<div class="input-group">
					<span class="input-group-addon">
					<input id="selectTypeTemplate" type="radio" name="selectType" value="template" checked="checked" /> {{ lang.templates['tplsite'] }} 
					</span>
					<select class="form-control" name="selectTemplate" id="selectTemplate">
{% for st in siteTemplates %}
                    <option value="{{ st.name }}">{{ st.name }} ({{ st.title }})</option>
{% endfor %}
                    </select>
        

					<span class="input-group-addon"><input id="selectTypePlugin" type="radio" name="selectType" value="plugin" /> {{ lang.templates['tplmodules'] }}</span>
		
	    									
                    <span class="input-group-btn">
                          <button type="button" class="btn btn-success"  onclick="submitTemplateSelector();">{{ lang.templates['select'] }}</button>
                    </span>
        </div>
		</div>
		</div>
		
</form>


<!-- BLOCK TEMPLATES -->
<table class="table">
<tr><td colspan="2" style="background-color: #E0E0A0; padding: 3px;">{{ lang.templates['tpl.edit'] }} [ <b><span id="templateNameArea">default</span> </b>]</td></tr>
<tr>
 <td width="230" valign="top">
  <div id="fileTreeSelector" style="overflow: auto; width: 99%; height: 578px; background-color: #ABCDEF; float: left; ">TEST CONTENT</div>
  <div style="width: 100%; background-color: #E0E0E0; padding: 3px; ">
  <!-- <input style="width: 150px;" type="button" class="navbutton" value="Create template.."/> -->
  </div>
 </td>
 <td valign="top">
  <div id="fileEditorInfo" style="width: 100%; padding: 3px; background-color: #E0E0E0; height: 26px;">&nbsp;</div>
  <div id="fileEditorContainer" style="width: 100%; padding: 0px; margin: 0px; height: 540px;">
  <textarea id="fileEditorSelector" wrap="off" style="width: 100%; height: 100%; float: left; background-color: #EEEEEE; white-space: nowrap; font-family: monospace; font-size: 10pt;">*** EDITOR ***</textarea>
  <div id="imageViewContainer" style="display: none; height: 100%; width: 100%; vertical-align: middle;"></div>
  </div>

 </td>
</tr>
</table>
       </div>
</div> 
</div>	   
<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
								   
	     <div id="fileEditorButtonLine" class="panel-body">
  <button type="button" class="btn btn-success"  onclick="submitTemplateEdit();">сохранить</button>
  <button type="button" class="btn btn-success" >удалить файл</button>
         </div>
                        </div>
                   </div> 
 </div>		 

<link rel="stylesheet" href="{{ home }}/lib/codemirror/codemirror.css">
<script type="text/javascript" src="{{ home }}/lib/codemirror/codemirror.js"></script>

<script type="text/javascript" src="{{ home_url }}/lib/ngFileTree.js"></script>
<link rel="stylesheet" href="{{ home_url }}/lib/ngFileTree.css" type="text/css" media="screen" />
<script type="text/javascript" language="javascript">
var ngTemplateName = 'default';
var ngFileName = '';
var ngFileType = '';
var ngFileContent = '';
var ngFileTreeParams = { root: '/', script: '/engine/rpc.php', securityToken : '{{ token }}', templateName : ngTemplateName };

var ngFileTreeFunc = function(file) {
        ngFileName = file;
        ngShowLoading();
		$.post('/engine/rpc.php', { json : 1, methodName : 'admin.templates.getFile', rndval: new Date().getTime(), params : json_encode({ template : ngTemplateName, 'file' : file, token : '{{ token }}' }) }, function(data) {
			ngHideLoading();
			// Try to decode incoming data
			try {
				resTX = eval('('+data+')');
			} catch (err) { alert('Error parsing JSON output (mod=templates). Result: '+resTX.response); }
			if (!resTX['status']) {
				ngNotifyWindow('Error ['+resTX['errorCode']+']: '+resTX['errorText'], 'ERROR');
			}

			ngFileContent = '';
			ngFileType = resTX['type'];

			$('#fileEditorInfo').html(((ngFileType == 'image')?'Image':'File')+' name: <b>'+ngFileName+'</b> ('+resTX['size']+' bytes)<br/>Last change time: '+resTX['lastChange']);

			if (resTX['type'] == 'image') {
				document.getElementById('imageViewContainer').style.display = 'block';
				document.getElementById('fileEditorSelector').style.display = 'none';
				$('#imageViewContainer').html(resTX['content']);
			} else {
				document.getElementById('imageViewContainer').style.display = 'none';
				document.getElementById('fileEditorSelector').style.display = 'block';
				$('#fileEditorSelector').val(resTX['content']);

				// Remove previous codemirror (if installed)
				$(".CodeMirror").remove();

				// Install codemirror
				var edField = $('#fileEditorSelector');
				var eW = edField.width();
				var eH = edField.height();
				var cm = CodeMirror.fromTextArea(
					document.getElementById('fileEditorSelector'), {
				                lineNumbers: true,
				                //mode: i,
				       //         lineWrapping: true,
				                styleActiveLine: true,
				                tabMode: "indent",
				                extraKeys: {
				                	"F11": function(cm) {cm.setOption("fullScreen", !cm.getOption("fullScreen"));},
				                	"Esc": function(cm) {if (cm.getOption("fullScreen")) cm.setOption("fullScreen", false);}
				                }

				});
				cm.setSize(eW, eH);
				cm.on("change", function(cm) {
					$("#fileEditorSelector").val(cm.getValue());
				});

				ngFileContent = resTX['content'];
			}
		}, "text").error(function() { ngHideLoading(); ngNotifyWindow('HTTP error during request', 'ERROR'); });
}

function submitTemplateSelector() {
	var selectMode		= $('input[name=selectType]:checked', '#selectForm').val();
	var selectTemplate	= $('[name=selectTemplate]', '#selectForm').val();

	$('#fileEditorInfo').html('');
	$('#imageViewContainer').html('');
	$('#fileEditorSelector').val('');

	ngFileName = '';

	if (selectMode == 'template') {
		ngTemplateName = selectTemplate;
		ngFileTreeParams['templateName'] = ngTemplateName;

		$('#fileTreeSelector').ngFileTree(ngFileTreeParams, ngFileTreeFunc);
		$('#templateNameArea').html(ngTemplateName);
	} else {
		ngTemplateName = '#plugins';
		ngFileTreeParams['templateName'] = ngTemplateName;
		$('#fileTreeSelector').ngFileTree(ngFileTreeParams, ngFileTreeFunc);
		$('#templateNameArea').html(' PLUGIN TEMPLATES ');
	}
}

function submitTemplateEdit() {
	var editedContent = $('#fileEditorSelector').val();

	ngShowLoading();
	$.post('/engine/rpc.php', { json : 1, methodName : 'admin.templates.updateFile', rndval: new Date().getTime(), params : json_encode({ template : ngTemplateName, 'file' : ngFileName, token : '{{ token }}', 'content' : editedContent }) }, function(data) {
		ngHideLoading();
		// Try to decode incoming data
		try {
			resTX = eval('('+data+')');
		} catch (err) { alert('Error parsing JSON output. Result: '+linkTX.response); }
		if (!resTX['status']) {
			ngNotifyWindow('Error ['+resTX['errorCode']+']: '+resTX['errorText'], 'ERROR');
		} else {
			ngNotifyWindow(resTX['content'], 'RESULT');
		}
	}, "text").error(function() { ngHideLoading(); ngNotifyWindow('HTTP error during request', 'ERROR'); });


//	ngNotifyWindow('Test MSG', 'Test Title');
}

$(document).ready( function() {
    $('#fileTreeSelector').ngFileTree(ngFileTreeParams, ngFileTreeFunc);
});

</script>