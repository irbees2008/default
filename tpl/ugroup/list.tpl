

<div class="row breadcrumb">
					<ol class="breadcrumb-entry">
						<li><a href="admin.php">{{ lang['home'] }}</a></li>
						<li class="active"><a href="?mod=ugroup">{{ lang['user_groups'] }}</a></li>
					</ol>
				</div>
				<!-- /breadcrumb -->


				
<div class="row">
<div class="col-md-12">	
<div class="panel panel-default">
<table class="table">
<thead>
<tr align="left" class="contHead">
<td width="5%">#</td>
<td>{{ lang['identifier'] }}</td>
<td>{{ lang['name'] }}</td>
<td>{{ lang['users_in_group'] }}</td>
<td>{{ lang['action'] }}</td>
</tr>
</thead>
<tbody id="admCatList">

{% for entry in entries %}
<tr align="center" class="contRow1">
<td>{{ entry.id }}</td>
<td>{{ entry.identity }}</td>
<td>{{ entry.name }}</td>
<td>{{ entry.count }}</td>
<td>{% if (entry.flags.canEdit) %} <button onclick="location.href='?mod=ugroup&action=editForm&id={{entry.id}}'" class="btn btn-success" type="button"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>{% endif %}{% if (entry.flags.canDelete) %}<button onclick="location.href='?mod=ugroup&action=delete&id={{entry.id}}&token={{ token }}'" class="btn btn-success" type="button"><i class="fa fa-times" aria-hidden="true"></i></button>{% endif %}</td>
</tr>
{% endfor %}


</tbody>
<tfoot>
<tr><td colspan="8" class="contentEdit" align="left">&nbsp; {% if (flags.canAdd) %}
<form method="get" action="">
<input type="hidden" name="mod" value="ugroup"/>
<input type="hidden" name="action" value="addForm"/>
<button class="btn btn-success" type="submit">{{ lang['add_group'] }}</button>
</form>{% endif %}
</td></tr>
</tfoot>
</table>
