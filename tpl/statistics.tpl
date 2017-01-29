<style>
#modalmsgDialog { position: absolute; left: 0; top: 0; width: 100%; height: 100%; display: none;}
#modalmsgWindow { margin: 5px; padding: 5px; border: 1px solid #CCCCCC; background-color: #F0F0F0; width: 400px; position: absolute; left: 40%; top: 40%; }
#modalmsgWindowText { background-color: #FFFFFF; }
#modalmsgWindowButton { background-color: #FFFFFF; text-align: center; padding: 5px; }
</style>
<script>
function showModal(text) {
 document.getElementById('modalmsgDialog').style.display='block';
 document.getElementById('modalmsgWindowText').innerHTML = text;
}
function _modal_close() {
 document.getElementById('modalmsgDialog').style.display='none';
}
</script>
<div class="row breadcrumb">
<ol class="breadcrumb-entry">
						<li><a href="admin.php">{{ lang['home'] }}</a></li>
						<li class="active">{{ lang.templates['title'] }}</li>
					</ol>
				</div>
				<!-- /breadcrumb -->
<div class="row">
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-cog" aria-hidden="true"></i> {{ lang['server'] }}</div>
							<table class="table">
								<tbody>
									<tr>
										<td>{{ lang['os'] }}</td>
										<td>{{ php_os }}</td>
									</tr>
									<tr>
										<td>{{ lang['php_version'] }} / {{ lang['mysql_version'] }}</td>
										<td>{{ php_version }} / {{ mysql_version }}</td>
									</tr>
									<tr>
										<td>{{ lang['gd_version'] }}</td>
										<td>{{ gd_version }}</td>
									</tr>
									<tr>
										<td>{{ lang['pdo_support'] }}</td>
										<td>{{ pdo_support }}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-th-large" aria-hidden="true"></i> Next Generation CMS
							</div>
							<table class="table">
								<tbody>
									<tr>
										<td>{{ lang['current_version'] }}</td>
										<td><span class="label label-success">{{ currentVersion }}</span></td>
									</tr>
									<tr>
										<td>{{ lang['last_version'] }}</td>
										<td><span id="syncLastVersion" class="label label-info">loading..</span></td>
									</tr>
									<tr>
										<td>{{ lang['git_version'] }}</td>
										<td><span id="syncSVNVersion" class="label label-warning">loading..</span></td>
									</tr>
								</tbody>
							</table>
							<script type="text/javascript" language="JavaScript" src="{{versionNotifyURL }}"></script>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-floppy-o" aria-hidden="true"></i> {{ lang['size'] }}</div>
							<table class="table">
								<tbody>
									<tr>
										<td>{{ lang['group'] }}</td>
										<td>{{ lang['amount'] }}</td>
										<td>{{ lang['volume'] }}</td>
										<td>{{ lang['permissions'] }}</td>
									</tr>
									<tr>
										<td>{{ lang['group_images'] }}</td>
										<td>{{ image_amount }}</td>
										<td>{{ image_size }}</td>
										<td><span class="label label-success"> {{ image_perm }}</span></td>
									</tr>
									<tr>
										<td>{{ lang['group_files'] }}</td>
										<td>{{ file_amount }}</td>
										<td>{{ file_size }}</td>
										<td><span class="label label-success">{{ file_perm }}</span></td>
									</tr>
									<tr>
										<td>{{ lang['group_photos'] }}</td>
										<td>{{ photo_amount }}</td>
										<td>{{ photo_size }}</td>
										<td><span class="label label-success">{{ photo_perm }}</span></td>
									</tr>
									<tr>
										<td>{{ lang['group_avatars'] }}</td>
										<td>{{ avatar_amount }}</td>
										<td>{{ avatar_size }}</td>
										<td><span class="label label-success">{{ avatar_perm }}</span></td>
									</tr>
									<tr>
										<td>{{ lang['group_backup'] }}</td>
										<td>{{ backup_amount }}</td>
										<td>{{ backup_size }}</td>
										<td><span class="label label-success">{{ backup_perm }}</span></td>
									</tr>
									<tr>
										<td colspan="2">{{ lang['allowed_size'] }}</td>
										<td colspan="2">{{ allowed_size }}</td>
									</tr>
									<tr>
										<td colspan="2">{{ lang['mysql_size'] }}</td>
										<td colspan="2">{{ mysql_size }}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-file" aria-hidden="true"></i> {{ lang['system'] }}
							</div>
							<table class="table">
								<tbody>
									<tr>
										<td>{{ lang['all_cats'] }}</td>
										<td>{{ categories }}</td>
									</tr>
									<tr>
										<td>Количество групп пользователей:</td>
										<td>0</td>
									</tr>
									<tr>
										<td><span class="label label-default">Новостей черновики</span> <span class="label label-primary">на модерации</span> <span class="label label-success">опубликовано</span></td>
										<td><a href="?mod=news&status=1"><span class="label label-default">{{ news_draft }}</span></a> <a href="?mod=news&status=2"><span class="label label-primary">{{ news_unapp }}</span></a> <a href="?mod=news&status=3"><span class="label label-success">{{ news }}</span></a></td>
									</tr>
									<tr>
										<td>{{ lang['all_comments'] }}</td>
										<td>{{ comments }}</td>
									</tr>
									<tr>
										<td>{{ lang['all_users'] }}</td>
										<td>{{ users }}</td>
									</tr>
									<tr>        
										<td>{{ lang['all_users_unact'] }}</td>
										<td><span class="label label-danger">{{ users_unact }}</span></td>
									</tr>
									<tr>
										<td>{{ lang['all_images'] }}</td>
										<td>{{ images }}</td>
									</tr>
									<tr>
										<td>{{ lang['all_files'] }}</td>
										<td>{{ files }}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-comment" aria-hidden="true"></i> {{ lang['note'] }}
							</div>
							 <table class="table">
    <tbody>
   <td class="contentEntry1">
    <form method="post" action="{{ php_self }}?mod=statistics">
     <input type="hidden" name="action" value="save" />
    <tr><td> <textarea name="note" rows="5" cols="70" class="form-control" {% if (not admin_note) %}placeholder="{{ lang['no_notes'] }}"{% endif %}>{{ admin_note }}</textarea></td></tr>
   <tr> <td><button type="submit" class="btn btn-primary">{{ lang['save_note'] }}</button></td></tr>
    </form>
   </td>
  </tbody>
 </table>
							
							
						</div>
					</div>
				</div>

<div id="modalmsgDialog" onclick="_modal_close();"><span id="modalmsgWindow"><div id="modalmsgWindowText"></div><div id="modalmsgWindowButton"><input type="button" value="OK"/></div></span></div>





<!--
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr>
<td colspan="2" class="contentHead"><img src="{{ skins_url }}/images/nav.gif" hspace="8" alt="" />{{ lang['system'] }}</td>
</tr>
<tr>
</table>
-->

{% if (flags.confError) %}
<!-- Configuration errors -->
<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-file" aria-hidden="true"></i>{{ lang['pconfig.error'] }}	</div>
							<table class="table">
<thead><tr><td>{{ lang['perror.parameter'] }}</td><td>{{ lang['perror.shouldbe'] }}</td><td>{{ lang['perror.set'] }}</td></thead>
<tr><td>Register Globals</td><td>Отключено</td><td>{{ flags.register_globals }}</td></tr>
<tr><td>Magic Quotes GPC</td><td>Отключено</td><td>{{ flags.magic_quotes_gpc }}</td></tr>
<tr><td>Magic Quotes Runtime</td><td>Отключено</td><td>{{ flags.magic_quotes_runtime }}</td></tr>
<tr><td>Magic Quotes Sybase</td><td>Отключено</td><td>{{ flags.magic_quotes_sybase }}</td></tr>
</table>
<br/>
&nbsp;<a style="cursor: pointer; color: red;" onclick="document.getElementById('perror_resolve').style.display='block';">{{ lang['perror.howto'] }}</a><br/>
<div id="perror_resolve" style="display: none;">
{{ lang['perror.descr'] }}
</div>

						</div>
					</div>
{% endif %}
