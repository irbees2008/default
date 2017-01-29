<!-- Main scripts -->
<script type="text/javascript">
var flagRequireReload = 0;
function ChangeOption(selectedOption) {
	document.getElementById('list').style.display = "none";
	[status]document.getElementById('categories').style.display = "none";[/status]
	document.getElementById('uploadnew').style.display = "none";

	if(selectedOption == 'list') {
		if (flagRequireReload) {
			document.location.href = document.location.href;
		}
		document.getElementById('list').style.display = "";
		document.getElementById('entries').style.display = "";
	}
	[status]if(selectedOption == 'categories') {
		document.getElementById('categories').style.display = "";
		document.getElementById('entries').style.display = "none";
	}[/status]

	if(selectedOption == 'uploadnew') {
		document.getElementById('uploadnew').style.display = "";
		document.getElementById('entries').style.display = "none";
	}
}

function setStatus(mode) {
 var st = document.getElementById('delform');
 st.subaction.value = mode;
}
</script>
<!-- breadcrumb -->
				<div class="row breadcrumb">
					<ol class="breadcrumb-entry">
						<li><a href="admin.php">{{ lang['home'] }}</a</li>
						<li class="active"><a href="?mod=files">{l_files_title}</a></li>
					</ol>
				</div>
				<!-- /breadcrumb -->
				
<div class="row">
<div class="col-md-12">	
<div class="panel panel-default">
<form action="{php_self}?mod=files&amp;action=list" method="post" name="options_bar">
<input type="hidden" name="area" value="{area}" />

<div class="panel-body">
<button class="btn btn-success" type="button" onmousedown="javascript:ChangeOption('list')">{l_list}</button>
[status]<button class="btn btn-success" type="button" onmousedown="javascript:ChangeOption('categories')">{l_categories}</button>[/status]
<button class="btn btn-success" type="button" onmousedown="javascript:ChangeOption('uploadnew')">{l_uploadnew}</button>
</div>


<div class="panel panel-default" id="list">
							<div class="panel-body">{l_sort}</div>
							<div class="panel-footer">
<div style="margin: 10px 0;">
									<div class="input-group">
										<span class="input-group-addon">
											{l_month}
										</span>
										<select class="form-control" name="postdate">
<option selected value="">- {l_all} -</option>{dateslist}</select>
									</div>
								</div>
<div style="margin: 10px 0;">
									<div class="input-group">
										<span class="input-group-addon">
											{l_category}
										</span>
										{dirlistcat}
									</div>
								</div>
<div style="margin: 10px 0;">
									<div class="input-group">
										<span class="input-group-addon">
											[status]{l_author}
										</span>
										<select class="form-control" name="author">
<option value="">- {l_all} -</option>{authorlist}</select>[/status]
									</div>
								</div>
<div style="margin: 10px 0;">
									<div class="input-group">
										<span class="input-group-addon">
											{l_per_page}
										</span>
										<input type="text" class="form-control" name="npp" value="{npp}">
										<span class="input-group-btn">
											<button type="submit" class="btn btn-success">{l_show}</button>
										</span>
									</div>
								</div>

				
					</div>
					
</form>
<br />
<form action="{php_self}?mod=files" method="post" name="delform" id="delform">
<input type="hidden" name="area" value="{area}" />
<input type="hidden" name="subaction" value="" />
<table id="entries" class="table">
<tr align="left" class="contHead">
<td width="5%">#</td>
<td width="25%">{l_name}</td>
<td width="20%">{l_action}</td>
<td width="20%">{l_size}</td>
<td width="15%">{l_category}</td>
<td width="10%" >{l_author}</td>
<td width="5%"><input class="check" type="checkbox" name="master_box" title="{l_select_all}" onclick="javascript:check_uncheck_all(delform)" /></td>
</tr>
{entries}
<tr>
<td colspan="10" class="contentEdit">{pagesss}</td>
</tr>

</table>
<div class="row">
<div class="col-md-8">
					<div class="panel-body">
									<div class="input-group">
								[status]<span class="input-group-addon">
											{l_move}:
										</span>
										{dirlist}
										<span class="input-group-btn">
											<button type="submit" onclick="setStatus('move');" class="btn btn-success">OK</button>
										</span>[/status]
										
									</div>
								  </div>
								</div>
								<div class="col-md-4">
								<div class="panel-body">
							[status]<button class="btn btn-success" type="submit" onclick="setStatus('delete');">{l_delete}</button>[/status]
								</div>
								</div>
								</div>
								</div>
</form>
[status]

<div class="row" id="categories" style="margin-top: -20px; display: none;">
					<div class="col-md-6">

							<div class="panel-body">{l_addnewcat}</div>

<form action="{php_self}?mod=files" method="post" name="newcat">
<input type="hidden" name="area" value="{area}" />
<input type="hidden" name="subaction" value="newcat" />
<div style="margin: 10px ;">
									<div class="input-group">
										<input type="text" name="newfolder" class="form-control" placeholder="{l_name}" />
										<span class="input-group-btn">
											<button type="submit" class="btn btn-success">OK</button>
										</span>
									</div>
								</div>
								
								</div>
</form>

<form action="{php_self}?mod=files" method="post" name="delcat">
<input type="hidden" name="area" value="{area}" />
<input type="hidden" name="subaction" value="delcat" />
<div class="col-md-6">

							<div class="panel-body">{l_delcat}</div>
<div style="margin: 10px 0;">
									<div class="input-group">
										{dirlist}
										<span class="input-group-btn">
											<button type="submit" class="btn btn-success">OK</button>
										</span>
									</div>
								</div>
								
								</div>
</div>

</form>

[/status]

<div class="row" id="uploadnew" style="margin-top: -20px; display: none;" >
<div class="col-md-6">

							<div class="panel-body">{l_upload_file}
</div>

<form action="{php_self}?mod=files" method="post" enctype="multipart/form-data" name="sn">
<input type="hidden" name="area" value="{area}" />
<input type="hidden" name="subaction" value="upload" />
<div style="margin: 10px ;">
									<div class="input-group" id="showRemoveAddButtoms">
										<span class="input-group-btn">
											<button type="button" class="btn btn-success" onClick="RemoveFiles();return false;">{l_delone}</button>
										</span>
										{dirlistS}
											<span class="input-group-btn">
											<button type="button" class="btn btn-success" onClick="AddFiles();return false;">{l_onemore}</button>
										</span>
										</div>
										</div>	

<script language="javascript" type="text/javascript">
function AddFiles() {
	var tbl = document.getElementById('fileup');
	var lastRow = tbl.rows.length;
	var iteration = lastRow+1;
	var row = tbl.insertRow(lastRow);
	var cellRight = row.insertCell(0);
	cellRight.innerHTML = '<span style="font-size: 12px;">'+iteration+': </span>';

	cellRight = row.insertCell(1);

	var el = document.createElement('input');
	el.setAttribute('type', 'file');
	el.setAttribute('name', 'userfile[' + iteration + ']');
	el.setAttribute('size', '30');
	el.setAttribute('value', iteration);
	cellRight.appendChild(el);
}
function RemoveFiles() {
	var tbl = document.getElementById('fileup');
	var lastRow = tbl.rows.length;
	if (lastRow > 1){
		tbl.deleteRow(lastRow - 1);
	}
}
</script>
<table id="fileup" class="table">
<tr id="row">
<td>1: </td><td><input type="file" id="fileUploadInput" size="30" name="userfile[0]" /></td>
</tr>
</table>

<div class="list" style="margin: 10px">
  <input type="checkbox" name="replace" value="replace" id="flagReplace" class="check" value="1"/>
  <label for="flagReplace">{l_do_replace}</label><br />
  <input type="checkbox" name="rand" value='rand' id="flagRand" class="check" value="1"/> <label for="flagRand">{l_do_rand}</label><br />
</div>
<div style="margin: 10px">
 <button class="btn btn-success" type="submit" onclick="uploadifyDoUpload(); return false;">{l_upload}</button>
</div>
</div>
</form>

<!-- BEGIN: Init UPLOADIFY engine -->
<script type="text/javascript">
$(document).ready(function() {
	$('#fileUploadInput').uploadify();

function uploadifyDoUpload() {
	// Prepare script data
	var scriptData = new Array();
	scriptData['ngAuthCookie']	= '{authcookie}';
	scriptData['uploadType']	= 'file';
	scriptData['category']		= document.getElementById('categorySelect').value;
	scriptData['rand']			= document.getElementById('flagRand').checked?1:0;
	scriptData['replace']		= document.getElementById('flagReplace').checked?1:0;

  	$('#fileUploadInput').uploadifySettings('scriptData',scriptData,true);
	$('#fileUploadInput').uploadifyUpload();
}
</script>
<!-- END: Init UPLOADIFY engine -->
<div class="col-md-6">

							<div class="panel-body">{l_upload_file_url}</div>

<form action="{php_self}?mod=files" method="post" name="snup">
<input type="hidden" name="subaction" value="uploadurl" />
<input type="hidden" name="area" value="{area}" />
<div style="margin: 10px ;">
									<div class="input-group" id="showRemoveAddButtoms">
										<span class="input-group-btn">
											<button type="button" class="btn btn-success" onClick="RemoveFiles2();return false;">{l_delone}</button>
										</span>
										{dirlist}
											<span class="input-group-btn">
											<button type="button" class="btn btn-success" onClick="AddFiles2();return false;">{l_onemore}</button>
										</span>
										</div>
										</div>
<script language="javascript" type="text/javascript">
function AddFiles2() {
	var tbl = document.getElementById('fileup2');
	var lastRow = tbl.rows.length;
	var iteration = lastRow+1;
	var row = tbl.insertRow(lastRow);
	var cellRight = row.insertCell(0);
	cellRight.innerHTML = '<span style="font-size: 12px;">'+iteration+': </span>';

	cellRight = row.insertCell(1);

	var el = document.createElement('input');
	el.setAttribute('type', 'text');
	el.setAttribute('name', 'userurl[' + iteration + ']');
	el.setAttribute('size', '30');
	cellRight.appendChild(el);
//	document.getElementById('files_number').value = iteration;
}
function RemoveFiles2() {
	var tbl = document.getElementById('fileup2');
	var lastRow = tbl.rows.length;
	if (lastRow > 1){
		tbl.deleteRow(lastRow - 1);
//		document.getElementById('files_number').value =  document.getElementById('files_number').value - 1;
	}
}
</script>
<table id="fileup2" class="table">
<tr id="row">
<td>1: </td><td><input type="text" size="30" name="userurl[0]" /></td>
</tr>
</table>

<div class="list" style="margin: 10px">
  <input type=checkbox name="replace" value='replace' id=replace class='check' />
  <label for=replace>{l_do_replace}</label><br />
  <input type=checkbox name="rand" value='rand' id=rand class='check' /> <label for=rand>{l_do_rand}</label><br />
</div>
<div style="margin: 10px">
  <button type="submit"  class="btn btn-success">{l_upload}</button>
</div>
</div>
</form>

</div>
</div>
</div>
</div>