<!-- breadcrumb -->
				<div class="row breadcrumb">
					<ol class="breadcrumb-entry">
<<<<<<< HEAD
						<li><a href="admin.php">{{ lang['home'] }}</a></li>
=======
						<li><a href="{{ home_url }}/engine/">Р“Р»Р°РІРЅР°СЏ</a></li>
>>>>>>> refs/remotes/origin/master
						<li class="active"><a href="?mod=static">{{ lang['static_title'] }}</a></li>
					</ol>
				</div>
				<!-- /breadcrumb -->
<!-- Info content -->
<div class="row">
					<div class="col-md-8">
						<div class="panel panel-default">
							
<form action="{{ php_self }}?mod=static" method="post" name="static">
<input type="hidden" name="token" value="{{ token }}"/>
<table class="table table-hover">
							<thead>
									<tr>
										<th width="5%">{{ lang['state'] }}</th>
										<th width="50%">{{ lang['title'] }}</th>
										<th width="10%">{{ lang['list.date'] }}</th>
										<th width="20%">{{ lang['list.altname'] }}</th>
										<th width="10%">{{ lang['list.template'] }}</th>
<<<<<<< HEAD
										<th width="5%">{% if (perm.modify) %}<input id="master_box" class="check" type="checkbox" name="master_box" title="{{ lang['select_all'] }}" onclick="javascript:check_uncheck_all(static)" /> <label for="master_box"></label>
{% endif %}</th>
=======
										<th width="5%">{% if (perm.modify) %}<input class="check" type="checkbox" name="master_box" title="{{ lang['select_all'] }}" onclick="javascript:check_uncheck_all(static)" />{% endif %}</th>
>>>>>>> refs/remotes/origin/master
									</tr>
								</thead>
								<tbody>

{% for entry in entries %}
<tr>
<<<<<<< HEAD
										<td>{% if (entry.url) %}<i class="fa fa-check" aria-hidden="true" title="опубликовано" style="color: #3fc636;"></i>{% else %}<i class="fa fa-times" aria-hidden="true" title="Не опубликовано" style="color: #f11a16;"></i>{% endif %}</td>
=======
										<td>{{ entry.status }}</td>
>>>>>>> refs/remotes/origin/master
										<td>
	{% if (perm.details) %}<a title="ID: {{ entry.id }}" href="{{ php_self }}?mod=static&amp;action=editForm&amp;id={{ entry.id }}">{% endif %}{{ entry.title }}{% if (perm.details) %}</a>{% endif %}<br/><small>{{ entry.url }}</small>&nbsp;
</td>
										<td >{{ entry.date }}</td>
										<td>{{ entry.alt_name }}</td>
										<td>{{ entry.template }}</td>

<<<<<<< HEAD
										<td>{% if (perm.modify) %}<input id="{{ entry.id }}" name="selected[]" value="{{ entry.id }}" class="check" type="checkbox" /><label for="{{ entry.id }}"></label>{% endif %}</td>
=======
										<td>{% if (perm.modify) %}<input name="selected[]" value="{{ entry.id }}" class="check" type="checkbox" />{% endif %}</td>
>>>>>>> refs/remotes/origin/master
</tr>
{% else %}
<tr><td ><p>- {{ lang['not_found'] }} -</p></td></tr>
{% endfor %}
</tbody>
</table>


</div>
					</div>
					<div class="col-md-4">
						<div class="panel panel-default">
							<div class="panel-body">
<<<<<<< HEAD
								Управление
=======
								РЈРїСЂР°РІР»РµРЅРёРµ
>>>>>>> refs/remotes/origin/master
							</div>
							<div class="panel-footer">
								<div style="margin: 10px 0;">
									<div class="input-group" id="submit">
{% if (perm.modify) %}
										<select class="form-control" name="action">
<option value="">-- {{ lang['action'] }} --</option>
<option value="do_mass_delete">{{ lang['delete'] }}</option>
<option value="do_mass_approve">{{ lang['approve'] }}</option>
<option value="do_mass_forbidden">{{ lang['forbidden'] }}</option>
										</select>

										<span class="input-group-btn">
<<<<<<< HEAD
											<button type="submit" class="btn btn-success">Выполнить</button>
=======
											<button type="submit" class="btn btn-success">Р’С‹РїРѕР»РЅРёС‚СЊ</button>
>>>>>>> refs/remotes/origin/master
										</span>
									</div>{% endif %}</form>
								</div>
								<div style="margin: 10px 0;">
									
										<form action="{{ php_self }}" method="get" name="options_bar">
										<input type="hidden" name="mod" value="static" />
<div class="input-group">
										<span class="input-group-addon">{{ lang['per_page'] }} </span>
										<input type="text" class="form-control" name="per_page" value="{{ per_page }}">
										<span class="input-group-btn">
											<button type="submit" value="{{ lang['do_show'] }}" class="btn btn-success">GO</button>
										</span>
										</div>
										</form>
									</div>
								
							

								<div style="margin: 10px 0;">
									{% if (perm.modify) %}<button type="button" class="btn btn-success" onclick="document.location='?mod=static&action=addForm'; return false;">{{ lang['addstatic'] }}</button>
									{% endif %}
								</div>
							</div>
						</div>
					</div>
				</div>
				<td colspan="2">{{ pagesss }}</td>
			</div>
