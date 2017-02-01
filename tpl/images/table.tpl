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
		<li><a href="admin.php">{{ lang['home'] }}</a></li>
		<li class="active"><a href="?mod=images">{l_images_title}</a></li>
	</ol>
</div>
<!-- /breadcrumb -->
<div class="row">
    <div class="col-md-12">	
        <div class="panel panel-default">
<form action="{php_self}" method="get" name="options_bar">
<input type="hidden" name="mod" value="images" />
<input type="hidden" name="action" value="list" />
<input type="hidden" name="area" value="{area}" />
            <div class="panel-body">
				<button type="button" class="btn btn-primary" onmousedown="javascript:ChangeOption('list')">{l_list}</button>
				[status]
				<button type="button" class="btn btn-info" onmousedown="javascript:ChangeOption('categories')">{l_categories}</button>
				[/status]
				<button type="button" class="btn btn-warning" onmousedown="javascript:ChangeOption('uploadnew')">{l_uploadnew}</button>
			</div>
			<div class="panel-footer" id="list">
				<div style="margin: 10px 0;">
					<div class="input-group">
                        <span class="input-group-addon">
						    {l_show_preview} 
							<input type="checkbox" onclick="setCookie('img_preview',this.checked?1:0); document.location=document.location;" {box_preview}/>
						</span>
                        <span class="input-group-addon">{l_per_page}</span> 
						    <input class="form-control" name="npp" value="{npp}" type="text" size="3" />
						<span class="input-group-btn">
						    <button type="submit" class="btn btn-success">{l_show}</button>
						</span>
                    </div>
				</div>
                <div style="margin: 10px 0;">
					<div class="input-group">
                        <span class="input-group-addon">{l_month}</span> 
	                        <select class="form-control" name="postdate">
							    <option selected value="">- {l_all} -</option>
								{dateslist}
							</select>
					   [status]
					   <span class="input-group-addon">{l_author}</span>  
			                <select class="form-control" name="author">
							    <option value="">- {l_all} -</option>
							    {authorlist}
							</select>
					    [/status]
					</div>
				</div>
				<div style="margin: 10px 0;">
					<div class="input-group">
						<span class="input-group-addon">{l_category}</span>
						{dirlistcat}
					</div>
				</div>
			</div>

</form>
    <br />
<form action="{php_self}?mod=images" method="post" name="imagedelete" id="delform">
<input type="hidden" name="subaction" value="" />
<input type="hidden" name="area" value="{area}" />
            <div id="entries">
                <table class="table">
                    <tr>
                        <td colspan="3" width="80">{l_header.insert}</td>
                        [preview]
						<td>{l_show_preview}</td>
						[/preview]
                        <td>{l_name}</td>
                        <td colspan="2">{l_header.view}</td>
 <!-- <td>{l_action}</td> -->
                        <td colspan="2">{l_size}</td>
                        <td>{l_category}</td>
                        <td>{l_author}</td>
                        <td>{l_action}</td>
                        <td><input class="check" type="checkbox" name="master_box" title="{l_select_all}" onclick="javascript:check_uncheck_all(imagedelete)" /></td>
                    </tr>
                        {entries}
                    <tr>
                        <td colspan="12">{pagesss}</td>
                    </tr>
                </table>
                <div class="row">
                    <div class="col-md-8">
					    <div class="panel-body">
							<div class="input-group">
								[status]
								<span class="input-group-addon">
									{l_move}:
								</span>
									{dirlist}
								<span class="input-group-btn">
									<button type="submit" onclick="setStatus('move');" class="btn btn-success">OK</button>
								</span>
								[/status]
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="panel-body">
							[status]
							    <button class="btn btn-success" type="submit" onclick="setStatus('delete');">{l_delete}</button>
							[/status]
						</div>
					</div>
				</div>
			</div>
</form>

[status]
            <div class="row" id="categories" style="margin-top: -20px; display: none;" >
                <div class="col-md-6">
					<div class="panel-body">{l_addnewcat}</div>
<form action="{php_self}?mod=images" method="post" name="newcat">
<input type="hidden" name="subaction" value="newcat" />
<input type="hidden" name="area" value="{area}" />
                    <div style="margin: 10px ;">
						<div class="input-group">
                            <input type="text" class="form-control" name="newfolder" size="30" />
							    <span class="input-group-btn">
									<button type="submit" class="btn btn-success">OK</button>
								</span>
						</div>
					</div>
				</div>
</form>
                <div class="col-md-6">
                    <div class="panel-body">{l_delcat}</div>
<form action='{php_self}?mod=images' method='post' name='delcat'>
<input type="hidden" name="subaction" value="delcat" />
<input type="hidden" name="area" value="{area}" />
                    <div style="margin: 10px ;">
                        <div class="input-group">
                            {dirlist}
							<span class="input-group-btn">
                                <button type="submit" class="btn btn-success">OK</button>
							</span>
						</div>
					</div>
				</div>
</form>
            </div>
[/status]

            <div class="row" id="uploadnew" style="margin-top: -20px; display: none;" >
                <div class="col-md-6">
                    <div class="panel-body">{l_upload_img}</div>

<form action="{php_self}?mod=images" method="post" enctype="multipart/form-data" name="sn">
<input type="hidden" name="subaction" value="upload" />
<input type="hidden" name="area" value="{area}" />
                    <div style="margin: 10px ;">
						<div class="input-group" id="showRemoveAddButtoms">
							<span class="input-group-btn">
								<button type="button" class="btn btn-success" onClick="RemoveImages();return false;">{l_delone}</button>
							</span>
								{dirlistS}
							<span class="input-group-btn">
								<button type="button" class="btn btn-success" onClick="AddImages();return false;">{l_onemore}</button>
							</span>
						</div>
					</div>	
<script language="javascript" type="text/javascript">
function AddImages() {
	var tbl = document.getElementById('imageup');
	var lastRow = tbl.rows.length;
	var iteration = lastRow+1;
	var row = tbl.insertRow(lastRow);
	var cellRight = row.insertCell(0);
	cellRight.innerHTML = '<span>'+iteration+': <'+'/'+'span>';
	cellRight = row.insertCell(1);

	var el = document.createElement('input');
	el.setAttribute('type', 'file');
	el.setAttribute('name', 'userfile[' + iteration + ']');
	el.setAttribute('size', '60');
	el.setAttribute('value', iteration);
	cellRight.appendChild(el);
}
function RemoveImages() {
	var tbl = document.getElementById('imageup');
	var lastRow = tbl.rows.length;
	if (lastRow > 1){
		tbl.deleteRow(lastRow - 1);
	}
}
</script>
                    <table id="imageup" class="table">
                        <tr id="row">
                            <td>1: </td>
							<td>
							    <input type="file" size="60" id="fileUploadInput" name="userfile[0]" />
							</td>
                        </tr>
                    </table>
                    <div class="list" style="margin: 10px">
                        <input type="checkbox" name="replace" value="1" id="flagReplace" class='check' />
						<label for="flagReplace">{l_do_replace}</label><br />
                        <input type="checkbox" name="rand" value="1" id="flagRand" class='check' />	
						<label for="flagRand">{l_do_rand}</label><br />
                        <input type="checkbox" name="thumb" value="1" id="flagThumb" class='check' {thumb_mode}{thumb_checked}/>
						<label for="flagThumb">{l_do_preview}</label><br />
                        <input type="checkbox" name="shadow" value="1" id="flagShadow" class='check' {shadow_mode}{shadow_checked} />
						<label for="flagShadow">{l_do_shadow}</label><br />
                        <input type="checkbox" name="stamp" value="1" id="flagStamp" class='check' {stamp_mode}{stamp_checked} />
						<label for="flagStamp">{l_do_wmimage}</label>
                    </div>
                    <div style="margin: 10px">
                        <button type="submit" onclick="uploadifyDoUpload(); return false;" class="btn btn-success">{l_upload}</button>
                    </div>
                </div>
</form>

<!-- BEGIN: Init UPLOADIFY engine -->
<script type="text/javascript">
$(document).ready(function() );

function uploadifyDoUpload() {
	// Prepare script data

	var scriptData = new Array();
	scriptData['ngAuthCookie']	= '{authcookie}';
	scriptData['uploadType']	= 'image';
	scriptData['category']		= document.getElementById('categorySelect').value;
	scriptData['rand']			= document.getElementById('flagRand').checked?1:0;
	scriptData['replace']		= document.getElementById('flagReplace').checked?1:0;
	scriptData['thumb']			= document.getElementById('flagThumb').checked?1:0;
	scriptData['stamp']			= document.getElementById('flagStamp').checked?1:0;
	scriptData['shadow']		= document.getElementById('flagShadow').checked?1:0;

  	$('#fileUploadInput').uploadifySettings('scriptData',scriptData,true);
	$('#fileUploadInput').uploadifyUpload();
}
</script>
<!-- END: Init UPLOADIFY engine -->

<form action="{php_self}?mod=images" method="post" name="snup">
                <div class="col-md-6">
 					<div class="panel-body">{l_upload_img_url}</div>
<input type="hidden" name="subaction" value="uploadurl" />
<input type="hidden" name="area" value="{area}" />
                        <div style="margin: 10px ;">
							<div class="input-group" id="showRemoveAddButtoms">
								<span class="input-group-btn">
									<button type="button" class="btn btn-success" onClick="RemoveImages2();return false;">{l_delone}</button>
								</span>
									{dirlist}
								<span class="input-group-btn">
									<button type="button" class="btn btn-success" onClick="AddImages2();return false;">{l_onemore}</button>
								</span>
							</div>
						</div>
<script language="javascript" type="text/javascript">
function AddImages2() {
	var tbl = document.getElementById('imageup2');
	var lastRow = tbl.rows.length;
	var iteration = lastRow+1;
	var row = tbl.insertRow(lastRow);

	var cellRight = row.insertCell(0);
	cellRight.innerHTML = '<span">'+iteration+': <'+'/'+'span>';

	cellRight = row.insertCell(1);

	var el = document.createElement('input');
	el.setAttribute('type', 'text');
	el.setAttribute('name', 'userurl[' + iteration + ']');
	el.setAttribute('size', '60');
	cellRight.appendChild(el);
}
function RemoveImages2() {
	var tbl = document.getElementById('imageup2');
	var lastRow = tbl.rows.length;
	if (lastRow > 1){
		tbl.deleteRow(lastRow - 1);
	}
}
</script>
                        <table id="imageup2" class="table">
                            <tr id="row">
                                <td>1: </td>
								<td><input type="text" size="60" name="userurl[0]" /></td>
                            </tr>
                        </table>
                        <div class="list" style="margin: 10px">
                            <input type="checkbox" name="replace" value='replace' id=replace2 class='check' />
                            <label for=replace2>{l_do_replace}</label><br />
                            <input type="checkbox" name="rand" value='rand' id=rand2 class='check' />
                            <label for=rand2>{l_do_rand}</label><br />
                            <input type="checkbox" name="thumb" value='thumb' id=thumb2 class='check'  {thumb_mode}{thumb_checked} />
                            <label for=thumb2>{l_do_preview}</label><br />
                            <input type="checkbox" name="shadow" value='shadow' id=shadow2 class='check' {shadow_mode}{shadow_checked} />
							<label for=shadow2>{l_do_shadow}</label><br />
                            <input type="checkbox" name="stamp" value='stamp' id=stamp2 class='check' {stamp_mode}{stamp_checked} />
							<label for=stamp2>{l_do_wmimage}</label>
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
