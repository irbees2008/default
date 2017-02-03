<script type="text/javascript" src="{{ home }}/lib/ajax.js"></script>
<script type="text/javascript" src="{{ home }}/lib/libsuggest.js"></script>
<script language="javascript" type="text/javascript">
//
// Global variable: ID of current active input area
{% if (flags.edit_split) %}var currentInputAreaID = 'ng_news_content_short';{% else %}var currentInputAreaID = 'ng_news_content';{% endif %}


function preview(){
 var form = document.getElementById("postForm");
 if (form.ng_news_content{% if (flags.edit_split) %}_short{% endif %}.value == '' || form.title.value == '') {
  alert('{{ lang.editnews['msge_preview'] }}');
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

<!-- breadcrumb -->
<div class="row breadcrumb">
	<ol class="breadcrumb-entry">
		<li><a href="admin.php">{{ lang['home'] }}</a</li>
		<li><a href="?mod=news">{{ lang.editnews['news_title'] }}</a></li>
		<li> {{ title }}  {% if (approve == -1) %}{{ lang['state.draft'] }}{% elseif (approve == 0) %} {% else %} {% endif %}</li>
	</ol>
</div>
<!-- /breadcrumb -->
				
<!-- Main content form -->
<form id="postForm" name="form" ENCTYPE="multipart/form-data" method="post" action="{{ php_self }}" target="_self">
<input type="hidden" name="token" value="{{ token }}"/>
<input type="hidden" name="mod" value="news"/>
<input type="hidden" name="action" value="edit"/>
<input type="hidden" name="subaction" value="submit"/>

<div class="row">
	<div class="col-md-8" >
		<div class="panel panel-default">
			<div class="panel-heading">
				<ul class="nav nav-pills nav-justified">
                    <li class="active"><a href="#tab1" data-toggle="tab">{{ lang.editnews['bar.maincontent'] }}</a></li>
					<li><a href="#tab2" data-toggle="tab">{{ lang.editnews['bar.additional'] }}</a></li>
					<li><a href="#tab3" data-toggle="tab">{{ lang.editnews['bar.attaches'] }} ({% if (attachCount>0) %}{{ attachCount }}{% else %}{{ lang['noa'] }}{% endif %})</a></li>
{% if (pluginIsActive('comments')) %}
                    <li><a href="#tab4" data-toggle="tab">{{ lang.editnews['bar.comments'] }} ({{ plugin.comments.count }})</a></li> 
{% endif %}
                </ul>
			</div>
			<div class="tab-content">
				<div class="tab-pane fade in active" id="tab1">
					<div class="panel-body" id="maincontent">
<!-- MAIN CONTENT -->
                        <div style="margin: 10px 0;">
                            <input type="text" class="form-control" size="79" id="newsTitle"  name="title" value="{{ title }}" tabindex="1" title="{{ lang.addnews['title'] }}"/>                                 
                        </div>
 {% if not flags['altname.disabled'] %}
                        <div style="margin: 10px 0;">
                            <input type="text" class="form-control"  name="alt_name" value="{{ alt_name }}" size="60" tabindex="3" title="{{ lang.addnews['alt_name'] }}"/>
                        </div>
{% endif %}             
                        <div style="margin: 10px 0;">
                            <div class="input-group">
                                <input type="text" class="form-control" size="79" name="title" value="{{ link }}" title="Ссылка на новость" disabled/>  
                                <span class="input-group-addon">
									<a href="{{ link }}" target="_blank"><i class="fa fa-external-link"></i></a>
								</span>  
                            </div>
						</div>
						<div style="margin: 10px 0;">
						    {{ mastercat }} {% if (flags.mondatory_cat) %}&nbsp; <span style="font-size: 16px; color: red;"><b>*</b></span>{% endif %}
						</div>
{% if (not isBBCode) %}
                        <div style="margin: 10px 0;">
						    {{ quicktags }}
						</div>
						<div style="margin: 10px 0;">
 						    {{ smilies }}
						</div>
{% else %}
{% endif %}
                        <div style="margin: 10px 0;" >
{% if (flags.edit_split) %}
	                        <div id="container.content.short" class="contentActive">
							    <textarea style="width: 99%; padding: 1px; margin: 1px;" onclick="changeActive('short');" onfocus="changeActive('short');" name="ng_news_content_short" {% if (isBBCode) %}class="{{ attributBB }}"{% else %}id="ng_news_content_short"{% endif %} rows="10" tabindex="2">{{ content.short }}</textarea>
							</div>
{% if (flags.extended_more) %}    
                            <table cellspacing="2" >
							    <tr>
								    <td nowrap>{{ lang.addnews['editor.divider'] }}: &nbsp;</td>
									<td style="width: 90%"><input tabindex="2" type="text" name="content_delimiter" style="width: 99%;" value=""/></td>
								</tr>
							</table>
{% endif %}
	                        <div id="container.content.full" class="contentInactive">
							    <textarea style="width: 99%; padding: 1px; margin: 1px;" onclick="changeActive('full');" onfocus="changeActive('full');" name="ng_news_content_full" {% if (isBBCode) %}class="{{ attributBB }}"{% else %}id="ng_news_content_full"{% endif %} rows="10" tabindex="2">{{ content.full }}</textarea>
							</div>
{% else %}
	                        <div id="container.content" class="contentActive">
							    <textarea style="width: 99%; padding: 1px; margin: 1px;" name="ng_news_content" {% if (isBBCode) %}class="{{ attributBB }}"{% else %}id="ng_news_content"{% endif %} rows="10" tabindex="2">{{ content.short }}</textarea>
							</div>
{% endif %}
	                    </div>
{% if (flags.meta) %}
                        <div style="margin: 10px 0;">
                            <textarea name="description" class="form-control" cols="80" placeholder="{{ description }}" title="{{ lang.addnews['description'] }}">{{ description }}</textarea>
						</div>
                        <div style="margin: 10px 0;">
                            <textarea class="form-control" placeholder="{{ keywords }}" name="keywords" id="newsKeywords" cols="80" title="{{ lang.addnews['keywords'] }}">{{ keywords }}</textarea>  
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
<!-- ADDITIONAL -->
{% if not flags['customdate.disabled'] %}
                        <div style="margin: 10px 0;">
							<div class="input-group">
								<span class="input-group-addon">
                                    <input type="checkbox" name="setdate_custom" id="setdate_custom" value="1" class="check" onclick="document.getElementById('setdate_current').checked=false;" />
                                    <label for="setdate_custom"></label>
								</span>
                                <input type="text" class="form-control" placeholder="{{ lang.editnews['date.setdate'] }}" id="cdate" name="cdate" value="{{ cdate }}"/>
                            </div>
						</div>
                        <div style="margin: 10px 0;">
							<div class="input-group">
                                <span class="input-group-addon">
								    <input type="checkbox" name="setdate_current" id="setdate_current" value="1" class="check" onclick="document.getElementById('setdate_custom').checked=false;" />
								</span>
                                <input type="text" class="form-control" placeholder="{{ lang.editnews['date.setcurrent'] }}" />
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

<script language="javascript" type="text/javascript">
$("#cdate").datetimepicker( { currentText: "{{ cdate }}", dateFormat: "dd.mm.yy", timeFormat: 'HH:mm' });
</script>

                <div class="tab-pane fade" id="tab3">
                    <div class="panel-body" id="attaches">
<!-- ATTACHES -->
                        <table class="table" id="attachFilelist">
                            <tr>
								<th width="5%">#</th>
								<th width="15%">{{ lang.editnews['attach.date'] }}</th>
								<th width="50%">{{ lang.editnews['attach.filename'] }}</th>
								<th width="25%">{{ lang.editnews['attach.size'] }}</th>
								<th width="5%">DEL</th>
							</tr>
<!-- <tr><td colspan="5">No data</td></tr> -->
{% for entry in attachEntries %}
                            <tr>
                                <td>{{ entry.id }}</td>
                                <td>{{ entry.date }}</td>
                                <td><a href="#" onclick="$('.nav-pills a:first').tab('show');insertext('[attach#{{ entry.id }}]{{ entry.orig_name }}[/attach]','', currentInputAreaID);return false;" title="{{ lang['tags.file'] }}"><i class="fa fa-paperclip"></i></a></td>
                                <td><a href="{{ entry.url }}">{{ entry.orig_name }}</a></td>
                                <td>{{ entry.filesize }}</td>
                                <td><input id="delfile_{{ entry.id }}" type="checkbox" name="delfile_{{ entry.id }}" value="1" />
                                <label for="delfile_{{ entry.id }}"></label></td>
                            </tr>
{% else %}
                            <tr>
							    <td colspan="6">{{ lang.editnews['attach.no_files_attached'] }}</td>
							</tr>
{% endfor %}
<!-- <tr><td>*</td><td>New file</td><td colspan="2"><input type="file"/></td><td><input type="button" size="40" value="-"/></td></tr> -->
                            <tr>
							    <td colspan="3">&nbsp;</td>
                                <td colspan="2"><input type="button" class="button" value="{{ lang.editnews['attach.more_rows'] }}" style="width: 100%;" onclick="attachAddRow();" /></td>
							</tr>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="tab4">
					<div class="panel-body" id="additional">
<!-- COMMENTS -->
                        <table class="table" form="commentsForm">
                            <tr align="center">
                                <td>{{ lang.editnews['author'] }}</td>
                                <td>{{ lang.editnews['date'] }}</td>
                                <td>{{ lang.editnews['comment'] }}</td>
                                <td>{{ lang.editnews['edit_comm'] }}</td>
                                <td>{{ lang.editnews['block_ip'] }}</td>
                                <td><input id="master_box"  form="commentsForm" type="checkbox" name="master_box" value="all" onclick="javascript:check_uncheck_all(commentsForm)" class="check" />
                                      <label for="master_box"></label></td>
                            </tr>
                                {{ plugin.comments.list }}
                            <tr>
                                <td colspan="5">&nbsp;</td>
                            </tr>
                            <tr align="center">
                                <td width="100%" colspan="6" class="contentEdit" align="center" valign="top">
                                    <button type="submit" form="commentsForm" class="btn btn-primary" onClick="if (!confirm('{{ lang.editnews['sure_del_com'] }}')) {return false;}">{{ lang.editnews['comdelete'] }}</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="panel panel-default">
			<div class="panel-body">{{ lang['editor.comminfo'] }}</div>
			<div class="panel-footer">
                {{ lang['editor.author'] }}: <a href="{{ php_self }}?mod=users&amp;action=editForm&amp;id={{ authorid }}"><b>{{ author }}</b></a> 
{% if (pluginIsActive('uprofile')) %} <a href="{{ author_page }}" target="_blank" title="{{ lang.editnews['site.viewuser'] }}"><img src="{{ skins_url }}/images/open_new.png" alt="{{ lang.editnews['newpage'] }}"/></a>
{% endif %}<br />
                {{ lang['editor.dcreate'] }}: <b>{{ createdate }}</b><br />
                {{ lang['editor.dedit'] }}: <b>{{ editdate }}</b>
            </div>
		</div>
        <div class="panel panel-default">
			<div class="panel-body">{{ lang['editor.extcat'] }}</div>
			<div class="panel-footer">
               <div style="overflow: auto; height: 150px;" class="list">{{ extcat }}</div>
            </div>
	    </div>
        <div class="panel panel-default">
		    <div class="panel-body">{{ lang['editor.configuration'] }}</div>
		    <div class="panel-footer">
                <div class="list">
                    <input type="checkbox" name="mainpage" value="1" {% if (flags.mainpage) %}checked="checked"{% endif %} class="check" id="mainpage" {% if (flags['mainpage.disabled']) %}disabled{% endif %} />
				    <label for="mainpage"></label>{{ lang.editnews['mainpage'] }}<br />
                    <input type="checkbox" name="pinned" value="1" {% if (flags.pinned) %}checked="checked"{% endif %} class="check" id="pinned" {% if (flags['pinned.disabled']) %}disabled{% endif %} />
				    <label for="pinned"></label>{{ lang.editnews['add_pinned'] }}<br />
                    <input type="checkbox" name="catpinned" value="1" {% if (flags.catpinned) %}checked="checked"{% endif %} class="check" id="catpinned" {% if (flags['catpinned.disabled']) %}disabled{% endif %} />
                    <label for="catpinned"></label>{{ lang.editnews['add_catpinned'] }}<br />
                    <input type="checkbox" name="favorite" value="1" {% if (flags.favorite) %}checked="checked"{% endif %} class="check" id="favorite"  {% if (flags['favorite.disabled']) %}disabled{% endif %} />
                    <label for="favorite"></label>{{ lang.editnews['add_favorite'] }}<br />
                    <input type="checkbox" name="setViews" value="1" class="check" id="setViews" {% if (flags['setviews.disabled']) %}disabled{% endif %} />
                    <label for="setViews"></label> {{ lang.editnews['set_views'] }}: <input type="text" size="4" name="views" value="{{ views }}"  {% if (flags['setviews.disabled']) %}disabled{% endif %}/><br />
                    <input name="flag_HTML" type="checkbox" class="check" id="flag_HTML" value="1" {% if (flags.html) %}checked="checked"{% endif %} {% if (flags['html.disabled']) %}disabled{% endif %} />
				    <label for="flag_HTML"></label>{{ lang.editnews['flag_html'] }}<br />
                    <input type="checkbox" name="flag_RAW" value="1" {% if (flags.raw) %}checked="checked"{% endif %} class="check" id="flag_RAW" {% if (flags['html.disabled']) %}disabled{% endif %} />
				    <label for="flag_RAW"></label> {{ lang.editnews['flag_raw'] }} {% if (flags['raw.disabled']) %}[<font color=red>{{ lang.editnews['flags_lost'] }}</font>]{% endif %}
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
{% if flags['params.lost'] %}
                <div style="margin: 10px 0;">
обратите внимание - у вас недостаточно прав для полноценного редактирования новости.<br/>
при сохранении будут произведены следующие изменения:<br/><br/>
{% if flags['publish.lost'] %}<div class="errMessage">&#8594; новость будет сн¤та с публикации</div>{% endif %}
{% if flags['html.lost'] %}<div class="errMessage">&#8594; в новости будет запрещено использование HTML тегов и автоформатирование</div>{% endif %}
{% if flags['mainpage.lost'] %}<div class="errMessage">&#8594; новость будет убрана с главной страницы</div>{% endif %}
{% if flags['pinned.lost'] %}<div class="errMessage">&#8594; в новости будет снято прикрепление на главной</div>{% endif %}
{% if flags['catpinned.lost'] %}<div class="errMessage">&#8594; в новости будет снято прикрепление в категории</div>{% endif %}
{% if flags['favorite.lost'] %}<div class="errMessage">&#8594; новость будет удалена из закладок администратора</div>{% endif %}
{% if flags['multicat.lost'] %}<div class="errMessage">&#8594; из новости будут удалены все дополнительные категории</div>{% endif %}
                </div>
{% endif %}

<input type="hidden" name="id" value="{{ id }}" />
{% if flags.editable %}
                <div style="margin: 10px 0;">
                    {{ lang['news_status'] }}:
                    <select  size="1" disabled>
	                    <option>{% if (approve == -1) %}{{ lang['state.draft'] }}{% elseif (approve == 0) %}{{ lang['state.unpublished'] }}{% else %}{{ lang['state.published'] }}{% endif %}</option>
                    </select> &#8594;
                    <select  size="1" name="approve" id="approve">
{% if flags.can_draft %}<option value="-1" {% if (approve == -1) %}selected="selected"{% endif %}>{{ lang['state.draft'] }}</option>{% endif %}
{% if flags.can_unpublish %}<option value="0" {% if (approve == 0) %}selected="selected"{% endif %}>{{ lang['state.unpublished'] }}</option>{% endif %}
{% if flags.can_publish %}<option value="1" {% if (approve == 1) %}selected="selected"{% endif %}>{{ lang['state.published'] }}</option>{% endif %}
                   </select>
                </div>
                <button type="submit" class="btn btn-info" accesskey="s">{{ lang.editnews['do_editnews'] }}</button> {% endif %}
{% if flags.deleteable %}
                <button type="submit" class="btn btn-success" onClick="confirmit('{{ php_self }}?mod=news&amp;action=manage&amp;subaction=mass_delete&amp;selected_news[]={{ id }}&amp;token={{ token }}', '{{ lang.editnews['sure_del'] }}')">{{ lang.editnews['delete'] }}</button>
{% endif %}
                <button type="button" onClick="preview()" class="btn btn-primary">{{ lang.editnews['preview'] }}</button> 

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

<form method="post" name="commentsForm" id="commentsForm" action="{{ php_self }}?mod=news">
<input type="hidden" name="token" value="{{ token }}" />
<input type="hidden" name="mod" value="news" />
<input type="hidden" name="action" value="edit" />
<input type="hidden" name="subaction" value="mass_com_delete" />
<input type="hidden" name="id" value="{{ id }}" />
</form>

<script language="javascript" type="text/javascript">
<!--
function attachAddRow() {
	var tbl = document.getElementById('attachFilelist');
	var lastRow = tbl.rows.length;
	var row = tbl.insertRow(lastRow - 1);

	// Add cells
	row.insertCell(-1).innerHTML = '*';
	row.insertCell(-1).innerHTML = '{{ lang.editnews['attach.new_file'] }}';
	row.insertCell(-1).innerHTML = '';

	// Add file input
	var el = document.createElement('input');
	el.setAttribute('type', 'file');
	el.setAttribute('name', 'userfile[' + (++attachAbsoluteRowID) + ']');
	el.setAttribute('size', '80');

	var xCell = row.insertCell(-1);
	xCell.colSpan = 2;
	xCell.appendChild(el);


	el = document.createElement('button');
	el.setAttribute('type', 'button');
	el.setAttribute('class','btn btn-primary')
	el.setAttribute('onclick', 'document.getElementById("attachFilelist").deleteRow(this.parentNode.parentNode.rowIndex);');
	el.setAttribute('value', 'DEL');
	el.innerHTML = '<i class="fa fa-minus-square-o" aria-hidden="true"></i>';
	row.insertCell(-1).appendChild(el);
}
// Add first row
var attachAbsoluteRowID = 0;
attachAddRow();
-->
</script>

{{ includ_bb }}
