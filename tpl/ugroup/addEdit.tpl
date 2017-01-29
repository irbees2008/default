<form action="{{ php_self }}?mod=ugroup" method="post">
<input type="hidden" name="token" value="{{ token }}"/>
<input type="hidden" name="id" value="{{ entry.id }}"/>
<input type="hidden" name="action" value="{% if (flags.editMode) %}edit{% else %}add{% endif %}" />
<div class="row breadcrumb">
					<ol class="breadcrumb-entry">
						<li><a href="admin.php">{{ lang['home'] }}</a></li>
						<li><a href="?mod=ugroup">{{ lang['user_groups'] }}</a> </li>
						<li class="active"> {% if flags.editMode %} {{ lang['edit_group'] }} "{{ entry.identity }}" [ {{ entry.id }} ]{% else %}{{ lang['add_group'] }}{% endif %}</li>
					</ol>
				</div>
				<!-- /breadcrumb -->
				<div class="row">
<div class="col-md-12">	
<div class="panel panel-default">
<table class="table">
<tr>
<td width=50% class=contentEntry1>ID:</td>
<td width=50% class=contentEntry2 valign=middle><b>{{ entry.id }}</b></td>
</tr>
<tr>
<td width=50% class=contentEntry1>{{ lang['identifier'] }}:</td>
<td width=50% class=contentEntry2 valign=middle><input type="text" name="identity" value="{{ entry.identity }}" /></td>
</tr>
<tr>
<td width=50% class=contentEntry1 colspan="2">{{ lang['name'] }}:</td><tr/>
{% for eLang,eLValue in entry.langName %}
<tr>
<td width=50% class=contentEntry1>** {{ lang['name_group_lang'] }} [{{ eLang }}]:</td>
<td width=50% class=contentEntry2 valign=middle><input type="text" name="langname[{{ eLang }}]" value="{{ eLValue }}"/></td>
</tr>
{% endfor %}
</table>
</td>
</tr>

</table>
<div class="panel-body">
{% if (flags.canModify) %}
<button class="btn btn-success" type="submit">{{ lang['save'] }}</button>
<button class="btn btn-success" type="button" onClick="history.back();">{{ lang['cancel'] }}</button>
{% endif %}&nbsp;
</div>
</div>
</div>
</div>
</form>
