<script type="text/javascript">
function ChangeOption(selectedOption) {
	document.getElementById('list').style.display		= "none";
	document.getElementById('adduser').style.display	= "none";
	document.getElementById('addbutton').style.display	= "none";

	if (selectedOption == 'list') 	 {
		document.getElementById('list').style.display		= "";
		document.getElementById('addbutton').style.display	= "none";
	}
	if (selectedOption == 'adduser') {
		document.getElementById('adduser').style.display	= "";
		document.getElementById('addbutton').style.display	= "";
	}
}

var fInitStatus = false;

function updateAction() {
	mode = document.forms['form_users'].action.value;

	if (mode == 'massSetStatus') {
		if (!fInitStatus) {
			document.forms['form_users'].newstatus.value = '4';
			fInitStatus = true;
		}
		document.forms['form_users'].newstatus.disabled = false;
	} else {
		document.forms['form_users'].newstatus.disabled = true;
	}
}

function validateAction() {
	mode = document.forms['form_users'].action.value;

	if (mode == '') {
		alert('���������� ������� ��������!');
		return;
	}

	if ((mode == 'massSetStatus')&&(document.forms['form_users'].newstatus.value < 1)) {
		alert('{l_msge_setstatus}');
		return;
	}

	document.forms['form_users'].submit();
}
</script>


<div class="row breadcrumb">
					<ol class="breadcrumb-entry">
						<li><a href="admin.php">{{ lang['home'] }}</a></li>
						<li class="active"><a href="?mod=users">{{ lang['users_title'] }}</a></li>
					</ol>
				</div>
				<!-- /breadcrumb -->
<div class="row">
<div class="col-md-12">	
<div class="panel panel-default">				
{% if flags.canModify %}
<div class="panel-body">
<button type="button" class="btn btn-success" onmousedown="javascript:ChangeOption('list')">{{ lang['users'] }}</button>
<button type="button" class="btn btn-success" onmousedown="javascript:ChangeOption('adduser')">{{ lang['adduser'] }}</button>
</div>
{% endif %}
<table id="list" class="table">
<tr>
<td>
<div class="panel-body">

<!-- Filter form: BEGIN -->
<form method="GET" action="{{ php_self }}">
<input type="hidden" name="mod" value="users" />
<input type="hidden" name="action" value="list" />
								<div style="margin: 10px 0;">
									<div class="input-group">
<span class="input-group-addon"> {{ lang['name'] }}:</span>
	<input type="text" class="form-control" name="name" value="{{ name }}" value="20">

<span class="input-group-addon">{{ lang['group'] }}:</span> <select class="form-control" name="group"><option value="0">-- {{ lang['any'] }} --</option>{% for g in ugroup %}<option value="{{ g.id }}" {% if (group == g.id) %}selected="selected"{% endif %}>{{ g.name }}</option>{% endfor %}</select>
</div>
</div>
<div style="margin: 10px 0;">
									<div class="input-group">
<input class="form-control" style="text-align: center;" size=3 name="rpp" value="{{ rpp }}"/>
<span class="input-group-btn"><button type="submit" class="btn btn-success" >{{ lang['sortit'] }}</button></span>
</div>
</div>
</form>
<!-- Filter form: END -->

</div>
</td>
</tr>
<tr>
<td width="100%" valign="top">
<!-- Mass actions form: BEGIN -->
<form method="GET" name="form_users" id="form_users" action="{{ php_self }}">
<input type="hidden" name="mod" value="users" />
<input type="hidden" name="token" value="{{ token }}"/>
<input type="hidden" name="name" value="{{ name }}" />
<input type="hidden" name="how" value="{how_value}" />
<input type="hidden" name="sort" value="{sort_value}" />
<input type="hidden" name="page" value="{page_value}" />
<input type="hidden" name="per_page" value="{{ rpp }}" />
<table class="table">
<tr>
<td width="100%" colspan="8">&nbsp;</td>
</tr>
<tr align="left" class="contHead">
<td width="5%"><a href="{{ sortLink['i']['link'] }}">#</a> {{ sortLink['i']['sign'] }}</td>
<td width="20%"><a href="{{ sortLink['n']['link'] }}">{{ lang['name'] }}</a> {{ sortLink['n']['sign'] }}</td>
<td width="20%"><a href="{{ sortLink['r']['link'] }}">{{ lang['regdate'] }}</a> {{ sortLink['r']['sign'] }}</td>
<td width="20%"><a href="{{ sortLink['l']['link'] }}">{{ lang['last_login'] }}</a> {{ sortLink['l']['sign'] }}</td>
<td width="10%"><a href="{{ sortLink['p']['link'] }}">{{ lang['all_news2'] }}</a> {{ sortLink['p']['sign'] }}</td>
{% if flags.haveComments %}<td width="10%">{l_listhead.comments}</td>{% endif %}
<td width="15%"><a href="{{ sortLink['g']['link'] }}">{{ lang['groupName'] }}</a> {{ sortLink['g']['sign'] }}</td>
<td width="5%">&nbsp;</td>
<td width="5%">{% if flags.canModify %}<input class="check" type="checkbox" name="master_box" title="{l_select_all}" onclick="javascript:check_uncheck_all(form_users)" />{% endif %}</td>
</tr>
{% for entry in entries %}
<tr align="left">
<td  >{{ entry.id }}</td>
<td  >{% if flags.canView %}<a href="{{ php_self }}?mod=users&amp;action=editForm&amp;id={{ entry.id }}">{{ entry.name }}</a>{% else %}{{ entry.name }}{% endif %}</td>
<td  >{{ entry.regdate }}</td>
<td  >{{ entry.lastdate }}</td>
<td  >{% if entry.cntNews > 0 %}<a href="{{ php_self }}?mod=news&amp;aid={{ id }}">{{ entry.cntNews }}</a>{% else %}-{% endif %}</td>
{% if flags.haveComments %}<td width="10%"  >{% if entry.cntComments > 0 %}{{ entry.cntComments }}{% else %}-{% endif %}</td>{% endif %}
<td  >{{ entry.groupName }}</td>
<td  ><i class="fa fa-{% if entry.flags.isActive %}check{% else %}times{%endif %}" title="{% if entry.flags.isActive %}{{ lang['active'] }}{% else %}{{ lang['unactive'] }}{%endif %}" aria-hidden="true"> </i></td>
<td  >{% if flags.canModify %}{% if flags.canMassAction %}<input name="selected_users[]" value="{{ entry.id }}" class="check" type="checkbox" />{% endif %}{% endif %}</td>
</tr>
{% endfor %}
</table>


{% if flags.canModify %}
<div style="margin: 10px 0;">
<span class="input-group">
		<span class="input-group-addon">{{ lang['action'] }}:</span>
										
 <select name="action"  onchange="updateAction();" onclick="updateAction();" style="width :50%;" class="form-control">
 <option value="" style="background-color: #E0E0E0;">-- {{ lang['action'] }} --</option>
 <option value="massActivate">{{ lang['activate'] }}</option>
 <option value="massLock">{{ lang['lock'] }}</option>
 <option value="" style="background-color: #E0E0E0;" disabled="disabled">===================</option>
 <option value="massDel">{{ lang['delete'] }}</option>
 <option value="massDelInactive">{{ lang['delete_unact'] }}</option>
 <option value="" style="background-color: #E0E0E0;" disabled="disabled">===================</option>
 <option value="massSetStatus">{{ lang['setstatus'] }} &raquo;</option>
</select>

<select name="newstatus" disabled="disabled" style="width :50%;"  class="form-control">
<option value="0"></option>
{% for grp in ugroup %}
<option value="{{ grp.id }}">{{ grp.id }} ({{ grp.name }})</option>
{% endfor %}
</select>
<span class="input-group-btn"><button type="button" class="btn btn-success" onclick="validateAction();">{{ lang['submit'] }}</button></span>

</span>
</div>
{% endif %}



{{ pagination }}


</form>
<!-- Mass actions form: END -->
</td>
</tr>
</table>


{% if flags.canModify %}<form method="post" action="{{ php_self }}?mod=users">
<input type="hidden" name="action" value="add" />
<input type="hidden" name="token" value="{{ token }}"/>
<table id="adduser" style="display: none;" class="table">
<tr>
<td width="50%"  >{{ lang['name'] }}</td>
<td width="50%" class="contentEntry2"><input size="40" type="text" name="regusername" />
</td>
</tr>
<tr>
<td width="50%"  >{l_password}</td>
<td width="50%" class="contentEntry2"><input size="40" class="password" type="text" name="regpassword" />
</td>
</tr>
<tr>
<td width="50%"  >{l_email}</td>
<td width="50%" class="contentEntry2"><input size="40" class="email" type="text" name="regemail" />
</td>
</tr>
<tr>
<td width="50%"  >{l_status}</td>
<td width="50%" class="contentEntry2">
<select name="reglevel">
{% for grp in ugroup %}
<option value="{{ grp.id }}">{{ grp.id }} ({{ grp.name }})</option>
{% endfor %}
</select>
</tr>
</table>
<br />
<table id="addbutton" style="display: none;"  class="table">
<tr align="center">
<td width="100%" class="contentEdit" align="center" valign="top">
<input type="submit" value="{l_adduser}" class="button" />
</td>
</tr>
</table>
</form>
{% endif %}
</div>
</div>
</div>