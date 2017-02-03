<script type="text/javascript" src="{{ home }}/lib/ajax.js"></script>
<script type="text/javascript" src="{{ home }}/lib/libsuggest.js"></script>
<script type="text/javascript">
//
// Global variable: ID of current active input area
{% if (flags.edit_split) %}var currentInputAreaID = 'ng_news_content_short';{% else %}var currentInputAreaID = 'ng_news_content';{% endif %}
function ChangeOption(optn) {
	document.getElementById('maincontent').style.display	= (optn == 'maincontent')?"block":"none";
	document.getElementById('additional').style.display	= (optn == 'additional')?"block":"none";
	document.getElementById('attaches').style.display	= (optn == 'attaches')?"block":"none";
}

function approveMode(mode) {
	document.getElementById('approve').value = mode;
	return true;
}

function preview(){
 var form = document.getElementById("postForm");
 if (form.ng_news_content{% if (flags.edit_split) %}_short{% endif %}.value == '' || form.title.value == '') {
  alert('{{ lang.addnews['msge_preview'] }}');
  return false;
 }

 form['mod'].value = "preview";
 form.target = "_blank";
 form.submit();

 form['mod'].value = "news";
 form.target = "_self";
 return true;
}

function changeActive(name) {
 if (name == 'full') {
	document.getElementById('container.content.full').className  = 'contentActive';
	document.getElementById('container.content.short').className = 'contentInactive';
	currentInputAreaID = 'ng_news_content_full';
 } else {
	document.getElementById('container.content.short').className = 'contentActive';
	document.getElementById('container.content.full').className  = 'contentInactive';
	currentInputAreaID = 'ng_news_content_short';
 }
}
</script> 

<form name="DATA_tmp_storage" action="" id="DATA_tmp_storage">
<input type="hidden" name="area" value="" />
</form>
<div class="row breadcrumb">
	<ol class="breadcrumb-entry">
		<li><a href="admin.php">{{ lang['home'] }}</a></li>
		<li><a href="?mod=news">{{ lang.addnews['news_title'] }}</a> </li>
		<li class="active"> {{ lang.addnews['addnews_title'] }}</li>
	</ol>
</div>
<!-- /breadcrumb -->
<!-- Main content form -->
<form id="postForm" name="form" ENCTYPE="multipart/form-data" method="post" action="{{ php_self }}" target="_self">
<input type="hidden" name="token" value="{{ token }}"/>

<div class="row">
	<div class="col-md-8" id="maincontent">
		<div class="panel panel-default">
			<div class="panel-heading">
				<ul class="nav nav-pills nav-justified">
					<li class="active"><a href="#tab1" data-toggle="tab">{{ lang.addnews['bar.maincontent'] }}</a></li>
					<li><a href="#tab2" data-toggle="tab">{{ lang.addnews['bar.additional'] }}</a></li>
					<li><a href="#tab3" data-toggle="tab">{{ lang.addnews['bar.attaches'] }}</a></li>
				</ul>
			</div>
			<div class="tab-content">
				<div class="tab-pane fade in active" id="tab1">
					<div class="panel-body">
						<div style="margin: 10px 0;">
                            <input type="text" class="form-control" size="79" id="newsTitle" placeholder="{{ lang.addnews['title'] }}" name="title" value="" tabindex="1" />                                 
                        </div>
{% if not flags['altname.disabled'] %}
                        <div style="margin: 10px 0;">
                            <input type="text" class="form-control" placeholder="{{ lang.addnews['alt_name'] }}" name="alt_name" value="" size="60" tabindex="3" />
                        </div>
						<div style="margin: 10px 0;">
						    {{ mastercat }} 
{% if (flags.mondatory_cat) %}&nbsp; 
                            <span style="font-size: 16px; color: red;"><b>*</b></span>
{% endif %}
                        </div>
{% endif %}
{% if (not isBBCode) %}
                        <div style="margin: 10px 0;">
						    {{ quicktags }}
						</div>
						<div style="margin: 10px 0;">
 						    {{ smilies }}
						</div>
{% else %}
{% endif %}
                        <div style="margin: 10px 0;">
{% if (flags.edit_split) %}
	                        <div id="container.content.short" class="contentActive">
						        <textarea class="form-control" onclick="changeActive('short');" onfocus="changeActive('short');" name="ng_news_content_short" {% if (isBBCode) %}class="{{ attributBB }}"{% else %}id="ng_news_content_short"{% endif %} rows="10" tabindex="2"></textarea>
					        </div>
{% if (flags.extended_more) %}
                            <table>
						        <tr>
							        <td nowrap>{{ lang.addnews['editor.divider'] }}: &nbsp;</td>
								    <td style="width: 90%"><input tabindex="2" type="text" name="content_delimiter" style="width: 99%;" value=""/></td>
							    </tr>
						    </table>
{% endif %}
	                        <div id="container.content.full" class="contentInactive">
						        <textarea class="form-control" onclick="changeActive('full');" onfocus="changeActive('full');" name="ng_news_content_full" {% if (isBBCode) %}class="{{ attributBB }}"{% else %}id="ng_news_content_full"{% endif %} rows="10" tabindex="2"></textarea>
						    </div>
{% else %}
	                        <div id="container.content" class="contentActive">
						        <textarea class="form-control" name="ng_news_content" {% if (isBBCode) %}class="{{ attributBB }}"{% else %}id="ng_news_content"{% endif %} rows="10" tabindex="2"></textarea>
						    </div>
{% endif %}
                        </div>

{% if (flags.meta) %}
                        <div style="margin: 10px 0;">
                            <textarea name="description" class="form-control" placeholder="{{ lang.addnews['description'] }}"  cols="80"></textarea>
                        </div>
                        <div style="margin: 10px 0;">
                            <textarea id="newsKeywords" class="form-control" placeholder="{{ lang.addnews['keywords'] }}" name="keywords" cols="80"></textarea>
                        </div>
{% endif %}
{% if (pluginIsActive('xfields')) %}
                        <div style="margin: 10px 0;">
{{ plugin.xfields[1] }}
                        </div>
{% endif %}
                    </div>
				</div>
				<div class="tab-pane fade" id="tab2">
					<div class="panel-body" id="additional">
{% if not flags['customdate.disabled'] %}
						<div style="margin: 10px 0;">
							<div class="input-group">
								<span class="input-group-addon">
                                    <input type="checkbox"  name="customdate" id="customdate" value="customdate" class="check" />
                                    <label for="customdate"></label>
                                </span>
                                    <input type="text" class="form-control" placeholder="{{ lang.addnews['custom_date'] }}" id="cdate" name="cdate">

							</div>
						</div>

{% endif %}
{% if (pluginIsActive('xfields')) %}
                        <div style="margin: 10px 0;">
                            {{ plugin.xfields[0] }}
                        </div>
{% endif %}
{% if (pluginIsActive('nsched')) %}<div style="margin: 10px 0;">{{ plugin.nsched }}</div>{% endif %}
{% if (pluginIsActive('finance')) %}<div style="margin: 10px 0;">{{ plugin.finance }}</div>{% endif %}
{% if (pluginIsActive('tags')) %}<div style="margin: 10px 0;">{{ plugin.tags }}</div>{% endif %}
{% if (pluginIsActive('tracker')) %}<div style="margin: 10px 0;">{{ plugin.tracker }}</div>{% endif %}
                    </div>
                </div>
<!-- ATTACHES -->
                <div class="tab-pane fade" id="tab3">
                    <table class="table" id="attachFilelist">
						<tr>
							<th width="5%">#</th>
							<th width="15%">{{ lang.editnews['attach.date'] }}</th>
							<th width="50%">{{ lang.editnews['attach.filename'] }}</th>
							<th width="25%">{{ lang.editnews['attach.size'] }}</th>
							<th width="5%">DEL</th>
						</tr>
						<tr>
							<td>0</td>
							<td>00.00.0000</td>
							<td><a href="#">Adminpanel.rar</a></td>
							<td>0 Mb</td>
							<td><input type="checkbox" /></td>
						</tr>
						<tr>
							<td colspan="5"><input type="button" value="{{ lang.editnews['attach.more_rows'] }}" class="button" style="width: 100%;" onclick="attachAddRow();" /></td>
						</tr>
					</table>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        
{% if flags['multicat.show'] %}
            <div class="panel panel-default">
				<div class="panel-body">
				    {{ lang['editor.extcat'] }}
				</div>
				<div class="panel-footer">
                    <div style="overflow: auto; height: 150px;" class="list">
				       {{ extcat }}
				    </div>
                </div>
		    </div>
{% endif %}
            <div class="panel panel-default">
				<div class="panel-body">
				    {{ lang['editor.configuration'] }}
				</div>
				<div class="panel-footer">
                    <div class="list">
                        <input type="checkbox" name="mainpage" value="1" class="check" id="mainpage" {% if (flags.mainpage) %}checked="checked" {% endif %}{% if flags['mainpage.disabled'] %}disabled {% endif %}  />
						<label for="mainpage"></label> {{ lang.addnews['mainpage'] }}<br />
                        <input type="checkbox" name="pinned" value="1" class="check" id="pinned" {% if (flags.pinned) %}checked="checked" {% endif %}{% if flags['pinned.disabled'] %}disabled {% endif %}  />
						<label for="pinned"></label>{{ lang.addnews['add_pinned'] }}<br />
                        <input type="checkbox" name="catpinned" value="1" class="check" id="catpinned" {% if (flags.catpinned) %}checked="checked" {% endif %}{% if flags['catpinned.disabled'] %}disabled {% endif %}  />
						<label for="catpinned"></label>{{ lang.addnews['add_catpinned'] }}<br />
                        <input type="checkbox" name="favorite" value="1" class="check" id="favorite" {% if (flags.favorite) %}checked="checked" {% endif %}{% if flags['favorite.disabled'] %}disabled {% endif %}  />
						<label for="favorite"></label>{{ lang.addnews['add_favorite'] }}<br />
                        <input name="flag_HTML" type="checkbox" class="check" id="flag_HTML" value="1" {% if (flags['html.disabled']) %}disabled {% endif %} {% if (flags['html']) %}checked="checked"{% endif %}/> 
						<label for="flag_HTML"></label>{{ lang.addnews['flag_html'] }}<br />
                        <input type="checkbox" name="flag_RAW" value="1" class="check" id="flag_RAW" {% if (flags['html.disabled']) %}disabled {% endif %} {% if (flags['raw']) %}checked="checked"{% endif %}/>
						<label for="flag_RAW"></label>{{ lang.addnews['flag_raw'] }}<br />
{% if (pluginIsActive('comments')) %}<hr/>{{ lang['comments:mode.header'] }}:
                        <select name="allow_com">
   	                        <option value="0"{{ plugin.comments['acom:0'] }}>{{ lang['comments:mode.disallow'] }}
   	                        <option value="1"{{ plugin.comments['acom:1'] }}>{{ lang['comments:mode.allow'] }}
   	                        <option value="2"{{ plugin.comments['acom:2'] }}>{{ lang['comments:mode.default'] }}
                        </select>
 {% endif %}
                    </div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
<input type="hidden" name="mod" value="news" />
<input type="hidden" name="action" value="add" />
<input type="hidden" name="subaction" value="submit" />
<input type="hidden" name="approve" id="approve" value="0"/>
                    <button type="button" onclick="return preview();" class="btn btn-primary">{{ lang.addnews['preview'] }}</button> 
                    <button type="submit" class="btn btn-info" onclick="return approveMode(-1);">{{ lang.addnews['save_draft'] }}</button> 
                    <button type="submit" class="btn btn-warning" onclick="return approveMode(0);">{{ lang.addnews['send_moderation'] }}</button> 
{% if flags['can_publish'] %}
                    <button type="submit" class="btn btn-success" onclick="return approveMode(1);">{{ lang.addnews['publish'] }}</button>
{% else %} &nbsp; {% endif %}

{% if (pluginIsActive('xfields')) %}
<!-- XFields [GENERAL] -->
{{ plugin.xfields.general }}
<!-- /XFields [GENERAL] -->
{% endif %}
                </div>
            </div>
		</div>
	</div>
</form>			
			<!-- /main content -->
<script>
$("#cdate").datetimepicker( { currentText: "DD.MM.YYYY HH:MM", dateFormat: "dd.mm.yy", timeFormat: 'HH:mm' });
</script>
<script language="javascript" type="text/javascript">
// Restore variables if needed
var jev = {{ JEV }};
var form = document.getElementById('postForm');
for (i in jev) {
 //try { alert(i+' ('+form[i].type+')'); } catch (err) {;}
 if (typeof(jev[i]) == 'object') {
 	for (j in jev[i]) {
 		//alert(i+'['+j+'] = '+ jev[i][j]);
 		try { form[i+'['+j+']'].value = jev[i][j]; } catch (err) {;}
 	}
 } else {
  try {
   if ((form[i].type == 'text')||(form[i].type == 'textarea')||(form[i].type == 'select-one')) {
    form[i].value = jev[i];
   } else if (form[i].type == 'checkbox') {
    form[i].checked = (jev[i]?true:false);
   }
  } catch(err) {;}
 }
}
</script>

<script language="javascript" type="text/javascript">
<!--
function attachAddRow() {
	var tbl = document.getElementById('attachFilelist');
	var lastRow = tbl.rows.length;
	var row = tbl.insertRow(lastRow - 1);

	// Add cells
	row.insertCell(0).innerHTML = '*';
	row.insertCell(1).innerHTML = '{{ lang.editnews['attach.new_file'] }}';

	// Add file input
	var el = document.createElement('input');
	el.setAttribute('type', 'file');
	el.setAttribute('name', 'userfile[' + (++attachAbsoluteRowID) + ']');
	el.setAttribute('size', '80');

	var xCell = row.insertCell(2);
	xCell.colSpan = 2;
	xCell.appendChild(el);


	el = document.createElement('input');
	el.setAttribute('type', 'button');
	el.setAttribute('onclick', 'document.getElementById("attachFilelist").deleteRow(this.parentNode.parentNode.rowIndex);');
	el.setAttribute('value', '-');
	row.insertCell(3).appendChild(el);
}
// Add first row
var attachAbsoluteRowID = 0;
attachAddRow();
-->
</script>

{{ includ_bb }}
