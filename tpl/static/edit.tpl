<script language="javascript" type="text/javascript">
var currentInputAreaID = 'content';
</script>

<div class="row breadcrumb">
					<ol class="breadcrumb-entry">
<<<<<<< HEAD
						<li><a href="admin.php">{{ lang['home'] }}</a></li>
=======
						<li><a href="{{ admin_url }}">Главная</a></li>
>>>>>>> refs/remotes/origin/master
						<li><a href="?mod=static">{{ lang['static_title'] }}</a> </li>
						<li class="active"> {% if (flags.editMode) %}{{ lang['static_title_edit'] }} "{{ data.title }}"{% else %}{{ lang['static_title_add'] }}{% endif %}</li>
					</ol>
				</div>
				<!-- /breadcrumb -->
<form name="DATA_tmp_storage" action="" id="DATA_tmp_storage">
<input type=hidden name="area" value="" />
</form>

<form name="form" id="postForm" method="post" action="{{ php_self }}?mod=static" target="_self">
<input type="hidden" name="token" value="{{ token }}"/>

<div class="row">
					<div class="col-md-8" id="maincontent">
						<div class="panel panel-default">
							<div class="panel-heading">
<!-- MAIN CONTENT -->
									<div class="panel-body">
										<div style="margin: 10px 0;">
  <input type="text" class="form-control" size="79" id="newsTitle" placeholder="{{ lang['title'] }}" name="title" value="{{ data.title }}" tabindex="1" />
  
                                        </div>
  <div style="margin: 10px 0;">
  <input type="text" class="form-control" placeholder="{{ lang['alt_name'] }}" name="alt_name" value="{{ data.alt_name }}" size="60" tabindex="3" />
                                        </div>

  <div style="margin: 10px 0;">
{% if (flags.isPublished) %}
  <div style="margin: 10px 0;">
  <input type="text" class="form-control" placeholder="{{ lang['url_static_page'] }}" name="url" readonly="readonly" value="{{ data.url }}" size="60" tabindex="1" />[ <a target="_blank" href="{{ data.url }}">{{ lang['open'] }}</a> ]
                                        </div>
  {% endif %}
 
  <div style="margin: 10px 0;">{% if (not isBBCode) %}{{ quicktags }}<br /> {{ smilies }}<br />{% else %}<br />{% endif %}</div>
   <div style="margin: 10px 0;"> <textarea style="margin-left: 0px; margin-right: 0px; margin-top: 1px; width: 99%;" name="content" {% if (isBBCode) %}class="{{ attributBB }}"{% else %}id="content"{% endif %} rows="16" tabindex="2">{{ data.content }}</textarea></div>

{% if (flags.meta) %}
  <div style="margin: 10px 0;">
 <input type="text" class="form-control" placeholder="{{ lang['description'] }}" name="description" value="{{ data.description }}" size="60" tabindex="4" />
  </div>
  <div style="margin: 10px 0;">
 <input type="text" class="form-control" placeholder="{{ lang['keywords'] }}" name="keywords" value="{{ data.keywords }}" size="60" tabindex="5" />
  </div>
  <div style="margin: 10px 0;">
<input type="text" placeholder="{{ lang['postdate'] }}" class="form-control" id="cdate" name="cdate" value="{{ data.cdate }}"/> 
   <input name="set_postdate" type="checkbox" value="1"/> {{ lang['set_postdate'] }}
   <script language="javascript" type="text/javascript">
   $("#cdate").datetimepicker( { currentText: "{{ data.cdate }}", dateFormat: "dd.mm.yy", timeFormat: 'HH:mm' } );
   </script>
  </div>
{% endif %}
</div>
</div>
</div>
</div>
</div>
<div class="col-md-4">
<div class="panel panel-default">
							<div class="panel-body">{{ lang['editor.configuration'] }}</div>
							<div class="panel-footer">
<<<<<<< HEAD
  <input type="checkbox" name="flag_published" value="1" id="1" {% if (not flags.canPublish) or (not flags.canUnpublish) %}disabled="disabled" {% endif %} {% if (data.flag_published) %}checked="checked" {% endif %}class="check"/><label for="1"></label> {{ lang['approve'] }}<br/>
  <input type="checkbox" name="flag_html" value="1" id="2" class="check" {% if (data.flag_html) %}checked="checked" {% endif %}/><label for="2"></label>  {{ lang['flag_html'] }}<br/>
 <input type="checkbox" name="flag_raw" value="1" id="3" class="check" {% if (data.flag_raw) %}checked="checked" {% endif %}/><label for="3"></label>  {{ lang['flag_raw'] }}
=======
  <label><input type="checkbox" name="flag_published" value="1" {% if (not flags.canPublish) or (not flags.canUnpublish) %}disabled="disabled" {% endif %} {% if (data.flag_published) %}checked="checked" {% endif %}class="check"/> {{ lang['approve'] }}</label><br/>
  <label><input type="checkbox" name="flag_html" value="1" class="check" {% if (data.flag_html) %}checked="checked" {% endif %}/> {{ lang['flag_html'] }}</label><br/>
  <label><input type="checkbox" name="flag_raw" value="1" class="check" {% if (data.flag_raw) %}checked="checked" {% endif %}/> {{ lang['flag_raw'] }}</label>
>>>>>>> refs/remotes/origin/master
  </div>
  </div>
<div class="panel panel-default">
							<div class="panel-body">{{ lang['editor.template'] }}</div>
							<div class="panel-footer">
	<select name="template" style="width: 200px;">
	{% for t in templateList %}<option value="{{ t }}" {% if (data.template == t) %}selected="selected"{% endif %}>{{ t }}{% endfor %}</select>
<<<<<<< HEAD
	<input type="checkbox" name="flag_template_main" id="4" value="1" {% if (data.flag_template_main) %}checked="checked" {% endif %} class="check"/> <label for="4"></label> {{ lang['flag_main'] }}
=======
	<label><input type="checkbox" name="flag_template_main" value="1" {% if (data.flag_template_main) %}checked="checked" {% endif %} class="check"/> {{ lang['flag_main'] }}</label>
>>>>>>> refs/remotes/origin/master
	</div>
  </div>
</div>
</div>
<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
{% if (flags.editMode) %}
<input type="hidden" name="id" value="{{ data.id }}" />
<input type="hidden" name="action" value="edit" />
{% if (flags.canModify) %}<button type="submit" class="btn btn-primary">{{ lang['do_editnews'] }}</button> 
<button type="button" class="btn btn-info" onClick="confirmit('{{ php_self }}?mod=static&token={{ token }}&action=do_mass_delete&selected[]={{ data.id }}', '{{ lang['sure_del'] }}')">{{ lang['delete'] }}</button> 
{% endif %}{% else %}
<input type="hidden" name="action" value="add" />
{% if (flags.canAdd) %}<button type="submit" class="btn btn-primary">{{ lang['addstatic'] }}</button> 
{% endif %}
{% endif %}

</div>
</div>
</div>
</form>

{{ includ_bb }}
