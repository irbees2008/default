<!-- breadcrumb -->
				<div class="row breadcrumb">
					<ol class="breadcrumb-entry">
						<li><a href="admin.php">{{ lang['home'] }}</a></li>
						<li class="active"><a href="?mod=perm">{{ lang['permissions'] }}</a></li>
					</ol>
				</div>
				<!-- /breadcrumb -->
<div class="row">
<div class="col-md-12">	
<div class="panel panel-default">
<div class="panel-body">
<div style="background-color: yellow; padding: 10px;">{{ lang['result'] }}: {% if (execResult) %}<b>{{ lang['success'] }}</b>{% else %}<font color="red"><b>{{ lang['error'] }}</b></font>{% endif %}</div>
</div>
<div class="panel-body">
{{ lang['list_changes_performed'] }}:
</div>
<div class="pconf">
<table class="table table-hover">
<tr><td>{{ lang['group'] }}</td><td>ID</td><td>{{ lang['name'] }}</td><td>{{ lang['old_value'] }}</td><td>{{ lang['new_value'] }}</td></tr>
{% for entry in updateList %}
<tr><td>{{ GRP[entry.group]['title'] }}</td><td>{{ entry.id }}</td><td>{{ entry.title }}</td><td>{{ entry.displayOld }}</td><td>{{ entry.displayNew }}</td></tr>
{% endfor %}
</table>


</div>
</div>
</div>
</div>

